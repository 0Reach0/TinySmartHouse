#include "stm8s.h"
#include "stm8s_tim2.h"
#ifndef _NRF24__H_
#define _NRF24__H_


//CHANGE THIS DEFINES DUE TO UR HARDWARE

#define CE_PIN  GPIOC,GPIO_PIN_3
#define CSN_PIN GPIOC,GPIO_PIN_4

#define SCK_PIN  GPIOC,GPIO_PIN_5
#define MISO_PIN GPIOC,GPIO_PIN_7
#define MOSI_PIN GPIOC,GPIO_PIN_6

/////////////////////////////////////////

#define W_REGISTER   0x20
#define R_REGISTER   0x00
#define R_RX_PAYLOAD 0x61
#define W_TX_PAYLOAD 0xA0
#define FLUSH_TX     0xE1
#define FLUSH_RX     0xE2



#define CONFIG_REGISTER      0x00
#define EN_AA_REGISTER       0x01
#define EN_RXADDR_REGISTER   0x02
#define SETUP_AW_REGISTER    0x03
#define SETUP_RETR_REGISTER  0x04
#define RF_CH_REGISTER       0x05
#define RF_SETUP_REGISTER    0x06
#define STATUS_REGISTER      0x07
#define RX_ADDR_P0_REGISTER  0x0A
#define TX_ADDR_REGISTER     0x10
#define RX_PW_P0_REGISTER    0x11



#define DEFAULT_CONFIG_RX   0x0F
#define DEFAULT_CONFIG_TX   0x0E
#define DEFAULT_EN_AA       0x01
#define DEFAULT_EN_RXADDR   0x01
#define DEFAULT_SETUP_AW    0x03
#define DEFAULT_SETUP_RETR  0x01
#define DEFAULT_RF_CH       0x02
#define DEFAULT_RF_SETUP    0x08
#define DEFAULT_STATUS      0x70
#define Default_PW_P0       0x01



#define SET_PPE0_ADDR(arr, size) write_registerN(RX_ADDR_P0_REGISTER, arr,size)
#define SET_PPE0_SIZE(size) write_register(RX_PW_P0_REGISTER, size)
#define SET_TX_ADDR(arr,size) write_registerN(TX_ADDR_REGISTER, arr, size)
#define SET_AW(size) write_register(SETUP_AW_REGISTER, size)



void delay(uint16_t n);


void cs_high(void);


void cs_low(void);


void ce_high(void);


void ce_low(void);


void flush_rx(void);


void flush_tx(void);


void reset_status(void);


uint8_t read_register(uint8_t reg);


void write_register(uint8_t reg, uint8_t value);


void read_registerN(uint8_t reg, uint8_t *buf, uint8_t len);


void write_registerN(uint8_t reg, const uint8_t *buf, uint8_t len);


void tx_init(void);


void rx_init(void);


void tx_send(const uint8_t *data, uint8_t len) ;


void rx_read(uint8_t *buf, uint8_t len);


void SPI_Init_NRF(void);


uint8_t test_tx(void);


uint8_t test_rx(void);


#endif //_NRF24__H_