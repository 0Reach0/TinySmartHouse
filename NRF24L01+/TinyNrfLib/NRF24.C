#include "nrf24.h"



void delay(uint16_t n) {
    uint16_t i = 0;
    for (i = 0; i < n; i++) {
        __asm("nop");
    }
}



void cs_high(void) {
    GPIO_WriteHigh(CSN_PIN);
}

void cs_low(void) {
    GPIO_WriteLow(CSN_PIN);
}

void ce_high(void) {
    GPIO_WriteHigh(CE_PIN);
}

void ce_low(void) {
    GPIO_WriteLow(CE_PIN);
}

void reset_status(void) {
    write_register(STATUS_REGISTER, 0x70);
}

void flush_tx(void) {
    cs_low();
    SPI_SendData(FLUSH_TX);
    delay(10);
    cs_high();
}

void flush_rx(void) {
    cs_low();
    SPI_SendData(FLUSH_RX);
    delay(10);
    cs_high();
}




void SPI_Init_NRF(void) {
    SPI_Init(SPI_FIRSTBIT_MSB, SPI_BAUDRATEPRESCALER_8, SPI_MODE_MASTER,
             SPI_CLOCKPOLARITY_LOW, SPI_CLOCKPHASE_1EDGE, SPI_DATADIRECTION_2LINES_FULLDUPLEX,
             SPI_NSS_SOFT, 0x07);
    SPI_Cmd(ENABLE);
}






uint8_t read_register(uint8_t reg) {
    uint8_t command = R_REGISTER | reg;
    uint8_t data = 0;

    cs_low();
    SPI_SendData(command);
		delay(10);
    while (SPI_GetFlagStatus(SPI_FLAG_TXE) == RESET); // ???????? ???????? ???????
    while (SPI_GetFlagStatus(SPI_FLAG_RXNE) == RESET); // ???????? ????????? ??????
    data = SPI_ReceiveData();
		delay(10);
		SPI_SendData(0x0);
		delay(10);
		while (SPI_GetFlagStatus(SPI_FLAG_TXE) == RESET); 
		while (SPI_GetFlagStatus(SPI_FLAG_RXNE) == RESET); // ???????? ????????? ??????
		data = SPI_ReceiveData();

cs_high();

    return data;
}

void write_register(uint8_t reg, uint8_t value) {
    uint8_t command = W_REGISTER | reg;

    cs_low();
    SPI_SendData(command);
    while (SPI_GetFlagStatus(SPI_FLAG_TXE) == RESET);
    SPI_SendData(value);
    while (SPI_GetFlagStatus(SPI_FLAG_TXE) == RESET);
		delay(10);
    cs_high();
}





void read_registerN(uint8_t reg, uint8_t *buf, uint8_t len) {
    uint8_t command = R_REGISTER | reg;
    uint8_t i;

    cs_low();

    SPI_SendData(command);
    while (SPI_GetFlagStatus(SPI_FLAG_TXE) == RESET);
		delay(10);
    while (SPI_GetFlagStatus(SPI_FLAG_RXNE) == RESET);
    SPI_ReceiveData();
    for (i = 0; i < len; i++) {
        delay(10);
        SPI_SendData(0xFF);
        while (SPI_GetFlagStatus(SPI_FLAG_TXE) == RESET);
        while (SPI_GetFlagStatus(SPI_FLAG_RXNE) == RESET);
        buf[i] = SPI_ReceiveData();
    }
		delay(10);
    cs_high();
			delay(10);
}

void write_registerN(uint8_t reg, const uint8_t *buf, uint8_t len) {
    uint8_t command = W_REGISTER | reg;
    uint8_t i;

    cs_low();
    SPI_SendData(command);
    while (SPI_GetFlagStatus(SPI_FLAG_TXE) == RESET);
	
    for (i = 0; i < len; i++) {
        delay(10);
        SPI_SendData(buf[i]);
        while (SPI_GetFlagStatus(SPI_FLAG_TXE) == RESET);
    }
		delay(10);
    cs_high();
			delay(10);
}







void tx_send(const uint8_t *data, uint8_t len) {
    uint8_t i;
    uint8_t status;

    flush_tx();

    cs_low();
    SPI_SendData(W_TX_PAYLOAD);
				delay(10);
    while (SPI_GetFlagStatus(SPI_FLAG_TXE) == RESET);
    for (i = 0; i < len; i++) {
        delay(10);
        SPI_SendData(data[i]);
        while (SPI_GetFlagStatus(SPI_FLAG_TXE) == RESET);
    }
    delay(10);
    cs_high();
    
    //send data  
    ce_high();
    delay(10);
    ce_low();

    do {
        status = read_register(STATUS_REGISTER);
    } while (!(status & (1 << 5)) && !(status & (1 << 4)));

    write_register(STATUS_REGISTER, 0x70);
}

void rx_read(uint8_t *buf, uint8_t len) {
    uint8_t i;
    uint8_t status;

    cs_low();
    SPI_SendData(R_RX_PAYLOAD);
    delay(10);
    while (SPI_GetFlagStatus(SPI_FLAG_RXNE) == RESET);
    SPI_ReceiveData();
    while (SPI_GetFlagStatus(SPI_FLAG_TXE) == RESET);
    for (i = 0; i < len; i++) {
        delay(10);
        SPI_SendData(0x00);
        while (SPI_GetFlagStatus(SPI_FLAG_RXNE) == RESET);
        buf[i] = SPI_ReceiveData();
    }
    cs_high();

    write_register(STATUS_REGISTER, 0x70);
}





void rx_init(void) {
    //uint8_t rxaddr[] = {0x01, 0x01, 0x01, 0x01, 0x01};
    GPIO_Init(CSN_PIN, GPIO_MODE_OUT_PP_HIGH_FAST);
    GPIO_Init(CE_PIN, GPIO_MODE_OUT_PP_HIGH_FAST);
    
    
    write_register(CONFIG_REGISTER, DEFAULT_CONFIG_RX);
    delay(10);
    write_register(EN_AA_REGISTER, DEFAULT_EN_AA);
    delay(10);
    write_register(EN_RXADDR_REGISTER, DEFAULT_EN_RXADDR);
    delay(10);
    write_register(SETUP_AW_REGISTER, DEFAULT_SETUP_AW);
    delay(10);
    write_register(RF_CH_REGISTER, 120); 
    delay(10);
    write_register(RF_SETUP_REGISTER, DEFAULT_RF_SETUP);
    delay(10);
    write_register(STATUS_REGISTER, DEFAULT_STATUS);
    // nrf24l01p_write_registerN(0x0A, rxaddr, 5);
    // delay(10);
    // nrf24l01p_write_register(0x11, 0x01);
    // delay(10);
}


void tx_init(void) {
   // uint8_t txaddr[] = {0x01, 0x01, 0x01, 0x01, 0x01};
    GPIO_Init(CSN_PIN, GPIO_MODE_OUT_PP_HIGH_FAST);
    GPIO_Init(CE_PIN, GPIO_MODE_OUT_PP_HIGH_FAST);

    write_register(CONFIG_REGISTER, DEFAULT_CONFIG_TX); 
    delay(10);
    write_register(SETUP_AW_REGISTER, DEFAULT_SETUP_AW); 
    delay(10);
    write_register(SETUP_RETR_REGISTER, DEFAULT_SETUP_RETR); 
    delay(10);
    write_register(RF_CH_REGISTER, 120); 
    delay(10);
    write_register(RF_SETUP_REGISTER, DEFAULT_RF_SETUP); 
    delay(10);
    write_register(STATUS_REGISTER, DEFAULT_STATUS);
   // nrf24l01p_write_registerN(0x10, txaddr, 5);
   // delay(10);
}





uint8_t test_tx(void) {
    uint8_t reg;
    uint8_t regn[5];
    reg = read_register(STATUS_REGISTER);
		delay(10);
    delay(10);
    if (reg != 0x0e) {
        return 1;
    }

		reg = read_register(CONFIG_REGISTER);
    delay(10);
    if (reg != DEFAULT_CONFIG_TX) {
        return 1;
    }

    reg = read_register(SETUP_AW_REGISTER);
    delay(10);
    if (reg != DEFAULT_SETUP_AW) {
        return 1;
    }

    reg = read_register(SETUP_RETR_REGISTER);
    delay(10);
    if (reg != DEFAULT_SETUP_RETR) {
        return 1;
    }

    reg = read_register(RF_CH_REGISTER);
    delay(10);
    if (reg != 120) {
        return 1;
    }

    reg = read_register(RF_SETUP_REGISTER);
    delay(10);
    if (reg != DEFAULT_RF_SETUP) {
        return 1;
    }


    read_registerN(0x10, regn, 5);
    delay(10);
    if (regn[0] != 0x1) return 1;
    else if (regn[1] != 0x1) return 1;
    else if (regn[2] != 0x1) return 1;
    else if (regn[3] != 0x1) return 1;
    else if (regn[4] != 0x1) return 1;
    return 0;
}

uint8_t test_rx(void) {
    uint8_t reg;
    uint8_t regn[5];
    reg = read_register(CONFIG_REGISTER);
    delay(10);
    if (reg != DEFAULT_CONFIG_RX) {
        return 1;
    }

    reg = read_register(EN_AA_REGISTER);
    delay(10);
    if (reg != DEFAULT_EN_AA) {
        return 1;
    }

    reg = read_register(EN_RXADDR_REGISTER);
    if (reg != DEFAULT_EN_RXADDR) {
        return 1;
    }

    reg = read_register(SETUP_AW_REGISTER);
    delay(10);
    if (reg != DEFAULT_SETUP_AW) {
        return 1;
    }

    reg = read_register(RF_CH_REGISTER);
    delay(10);
    if (reg != 120) {
        return 1;
    }

    reg = read_register(RF_SETUP_REGISTER);
    delay(10);
    if (reg != DEFAULT_RF_SETUP) {
        return 1;
    }

    reg = read_register(STATUS_REGISTER);
    if (reg != 0x0e) {
        return 1;
    }
		read_registerN(0x0A, regn, 5);
    delay(100);
    if (regn[0] != 0x1) return 1;
    else if (regn[1] != 0x1) return 1;
    else if (regn[2] != 0x1) return 1;
    else if (regn[3] != 0x1) return 1;
    else if (regn[4] != 0x1) return 1;
	return 0;

}

