#include "main.h"


void SetUp_GPIO(void)
{
		GPIO_Init(OUTPUT_PIN, GPIO_MODE_OUT_PP_HIGH_FAST);
}

void Init_NRF(void)
{
		uint8_t rxaddr[5] = {SOCKET_ADDRESS, SOCKET_ADDRESS, SOCKET_ADDRESS, SOCKET_ADDRESS, SOCKET_ADDRESS};
    uint8_t status;
		SPI_Init_NRF();
		delay(10);
    rx_init();
		SET_PPE0_ADDR(rxaddr, 5);
		delay(10);
		SET_PPE0_SIZE(SOCKET_PIPE_SIZE);
		delay(10);
		status = test_rx();
		if(status!= 0)
		{
			GPIO_WriteLow(GPIOB, GPIO_PIN_5);
			while(1);
	}
}

void process_data(uint8_t * data, uint8_t size)
{
	if(data[0]== CMD_SOCKET_ON)
	{
		GPIO_WriteLow(OUTPUT_PIN);		
	}
	else if(data[0]== CMD_SOCKET_OFF)
	{
		GPIO_WriteHigh(OUTPUT_PIN);		
	}

}


	
void main(void)
{
	uint8_t reg;
	uint8_t buf[3];
	SetUp_GPIO();
	Init_NRF();
    while (1)
    {
        reg = read_register(STATUS_REGISTER);
				delay(10);
        if (reg & (1 << 6))
        {
						GPIO_WriteLow(GPIOB, GPIO_PIN_5);
            rx_read(buf, 3);
						process_data(buf, 3);
            reset_status();
            delay(10);
						flush_rx();
						GPIO_WriteHigh(GPIOB, GPIO_PIN_5);
        }
    }
}



#ifdef USE_FULL_ASSERT
void assert_failed(uint8_t* file, uint32_t line) {
    while (1);
}
#endif