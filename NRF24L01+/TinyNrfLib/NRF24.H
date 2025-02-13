/**
 * @file nrf24.h
 * @brief Header file for NRF24 communication setup and control functions.
 * 
 * This file provides macros and functions to interface with the NRF24 wireless communication module.
 * It includes functions to send and receive data, configure the module, and perform basic operations like
 * flushing buffers and resetting registers.
 */

 #ifndef _NRF24__H_
 #define _NRF24__H_
 
 #include "stm8s.h" // Include STM8 header for your mc
 
 /**
  * @brief Pin definitions for NRF24 module on GPIO pins.
  * 
  * These macros define the GPIO pins connected to the NRF24 module's CE, CSN, SCK, MISO, and MOSI pins.
  * You may need to adjust these values depending on your hardware setup.
  */
 #define CE_PIN  GPIOC, GPIO_PIN_3  ///< Chip Enable pin (CE) connected to GPIOC, PIN 3
 #define CSN_PIN GPIOC, GPIO_PIN_4  ///< Chip Select Not pin (CSN) connected to GPIOC, PIN 4
 #define SCK_PIN  GPIOC, GPIO_PIN_5  ///< Serial Clock pin (SCK) connected to GPIOC, PIN 5
 #define MISO_PIN GPIOC, GPIO_PIN_7  ///< Master In Slave Out pin (MISO) connected to GPIOC, PIN 7
 #define MOSI_PIN GPIOC, GPIO_PIN_6  ///< Master Out Slave In pin (MOSI) connected to GPIOC, PIN 6
 
 /////////////////////////////////////////
 
 // Command definitions for NRF24 operations
 #define W_REGISTER   0x20 ///< Write register command
 #define R_REGISTER   0x00 ///< Read register command
 #define R_RX_PAYLOAD 0x61 ///< Read RX Payload command
 #define W_TX_PAYLOAD 0xA0 ///< Write TX Payload command
 #define FLUSH_TX     0xE1 ///< Flush TX FIFO command
 #define FLUSH_RX     0xE2 ///< Flush RX FIFO command
 
 // Register addresses for the NRF24 module
 #define CONFIG_REGISTER      0x00 ///< Configuration register address
 #define EN_AA_REGISTER       0x01 ///< Enable Auto Ack register address
 #define EN_RXADDR_REGISTER   0x02 ///< Enable RX address register address
 #define SETUP_AW_REGISTER    0x03 ///< Setup Address Width register address
 #define SETUP_RETR_REGISTER  0x04 ///< Setup Retransmission register address
 #define RF_CH_REGISTER       0x05 ///< RF Channel register address
 #define RF_SETUP_REGISTER    0x06 ///< RF Setup register address
 #define STATUS_REGISTER      0x07 ///< Status register address
 #define RX_ADDR_P0_REGISTER  0x0A ///< RX Address Pipe 0 register address
 #define TX_ADDR_REGISTER     0x10 ///< TX Address register address
 #define RX_PW_P0_REGISTER    0x11 ///< RX Payload Width Pipe 0 register address
 
 // Default configuration values for the NRF24 module
 #define DEFAULT_CONFIG_RX   0x0F ///< Default RX configuration value
 #define DEFAULT_CONFIG_TX   0x0E ///< Default TX configuration value
 #define DEFAULT_EN_AA       0x01 ///< Default Enable Auto Ack value
 #define DEFAULT_EN_RXADDR   0x01 ///< Default Enable RX Address value
 #define DEFAULT_SETUP_AW    0x03 ///< Default Address Width value
 #define DEFAULT_SETUP_RETR  0x01 ///< Default Retransmission Setup value
 #define DEFAULT_RF_CH       0x02 ///< Default RF Channel value
 #define DEFAULT_RF_SETUP    0x08 ///< Default RF Setup value
 #define DEFAULT_STATUS      0x70 ///< Default Status value
 #define DEFAULT_PW_P0       0x01 ///< Default RX Payload Width Pipe 0 value
 
 // Reset configuration values for NRF24 module
 #define RESET_CONFIG 			0x08 ///< Reset Configuration register value
 #define RESET_EN_AA 			0x00 ///< Reset Enable Auto Ack value
 #define RESET_RXADDR 			0x00 ///< Reset RX Address value
 #define RESET_SETUP_AW 		0x03 ///< Reset Address Width value
 #define RESET_SETUP_RETR 	0x03 ///< Reset Retransmission Setup value
 #define RESET_RF_CH 		  0x02 ///< Reset RF Channel value
 #define RESET_RF_SETUP	  0x0F ///< Reset RF Setup value
 #define RESET_STATUS 		  0x70 ///< Reset Status value
 #define RX_ADDR_P0 				0xE7 ///< RX Address Pipe 0 reset value
 #define TX_ADDR						0xE7 ///< TX Address reset value
 
 /**
  * @brief Macro to set the RX address for Pipe 0.
  * 
  * This macro writes an address of the specified size to the RX_ADDR_P0 register.
  * 
  * @param arr  Pointer to the address array.
  * @param size The size of the address array.
  */
 #define SET_PPE0_ADDR(arr, size) write_registerN(RX_ADDR_P0_REGISTER, arr, size)
 
 /**
  * @brief Macro to set the RX payload size for Pipe 0.
  * 
  * This macro writes the specified size to the RX_PW_P0 register.
  * 
  * @param size The size of the payload.
  */
 #define SET_PPE0_SIZE(size) write_register(RX_PW_P0_REGISTER, size)
 
 /**
  * @brief Macro to set the TX address.
  * 
  * This macro writes an address of the specified size to the TX_ADDR register.
  * 
  * @param arr  Pointer to the address array.
  * @param size The size of the address array.
  */
 #define SET_TX_ADDR(arr, size) write_registerN(TX_ADDR_REGISTER, arr, size)
 
 /**
  * @brief Macro to set the address width.
  * 
  * This macro writes the specified address width size to the SETUP_AW register.
  * 
  * @param size The address width size.
  */
 #define SET_AW(size) write_register(SETUP_AW_REGISTER, size)
 
 /**
  * @brief Delay function for NRF24 module.
  * 
  * This function provides a delay in microseconds used by the NRF24 module.
  * 
  * @param n Delay value.
  */
 void delay(uint16_t n);
 
 /**
  * @brief Set CSN pin high.
  * 
  * This function sets the CSN (Chip Select Not) pin high to disable the NRF24 module.
  */
 void cs_high(void);
 
 /**
  * @brief Set CSN pin low.
  * 
  * This function sets the CSN (Chip Select Not) pin low to enable the NRF24 module.
  */
 void cs_low(void);
 
 /**
  * @brief Set CE pin high.
  * 
  * This function sets the CE (Chip Enable) pin high to enable the transmission or reception of data.
  */
 void ce_high(void);
 
 /**
  * @brief Set CE pin low.
  * 
  * This function sets the CE (Chip Enable) pin low to disable the transmission or reception of data.
  */
 void ce_low(void);
 
 /**
  * @brief Flush RX FIFO.
  * 
  * This function flushes the RX FIFO buffer.
  */
 void flush_rx(void);
 
 /**
  * @brief Flush TX FIFO.
  * 
  * This function flushes the TX FIFO buffer.
  */
 void flush_tx(void);
 
 /**
  * @brief Reset status register.
  * 
  * This function resets the NRF24 module's status register.
  */
 void reset_status(void);
 
 /**
  * @brief Read from a register.
  * 
  * This function reads the value of a specified NRF24 register.
  * 
  * @param reg The register address to read from.
  * @return The value read from the register.
  */
 uint8_t read_register(uint8_t reg);
 
 /**
  * @brief Write to a register.
  * 
  * This function writes a value to a specified NRF24 register.
  * 
  * @param reg   The register address to write to.
  * @param value The value to write to the register.
  */
 void write_register(uint8_t reg, uint8_t value);
 
 /**
  * @brief Read multiple bytes from a register.
  * 
  * This function reads multiple bytes from a specified NRF24 register into a buffer.
  * 
  * @param reg  The register address to read from.
  * @param buf  The buffer to store the data read from the register.
  * @param len  The number of bytes to read.
  */
 void read_registerN(uint8_t reg, uint8_t *buf, uint8_t len);
 
 /**
  * @brief Write multiple bytes to a register.
  * 
  * This function writes multiple bytes to a specified NRF24 register from a buffer.
  * 
  * @param reg  The register address to write to.
  * @param buf  The buffer containing the data to write to the register.
  * @param len  The number of bytes to write.
  */
 void write_registerN(uint8_t reg, const uint8_t *buf, uint8_t len);
 
 /**
  * @brief Initialize NRF24 in TX mode.
  * 
  * This function initializes the NRF24 module in transmit mode.
  */
 void tx_init(void);
 
 /**
  * @brief Initialize NRF24 in RX mode.
  * 
  * This function initializes the NRF24 module in receive mode.
  */
 void rx_init(void);
 
 /**
  * @brief Deinitialize the NRF24 module.
  * 
  * This function resets the NRF24 module to its initial state.
  */
 void nrf_deinit(void);
 
 /**
  * @brief Send data via the NRF24 module.
  * 
  * This function sends data using the NRF24 module in TX mode.
  * 
  * @param data Pointer to the data to send.
  * @param len  The length of the data to send.
  */
 void tx_send(const uint8_t *data, uint8_t len);
 
 /**
  * @brief Read data from the NRF24 module.
  * 
  * This function reads data from the NRF24 module in RX mode.
  * 
  * @param buf Pointer to the buffer to store the received data.
  * @param len The length of the data to read.
  */
 void rx_read(uint8_t *buf, uint8_t len);
 
 /**
  * @brief Initialize SPI for NRF24 communication.
  * 
  * This function initializes the SPI peripheral to communicate with the NRF24 module.
  */
 void SPI_Init_NRF(void);
 
 /**
  * @brief Deinitialize SPI for NRF24 communication.
  * 
  * This function deinitializes the SPI peripheral used for communicating with the NRF24 module.
  */
 void SPI_DeInit_NRF(void);
 
 /**
  * @brief Test transmission functionality of the NRF24 module.
  * 
  * This function tests the transmission functionality of the NRF24 module.
  * 
  * @return A status byte indicating the result of the test.
  */
 uint8_t test_tx(void);
 
 /**
  * @brief Test reception functionality of the NRF24 module.
  * 
  * This function tests the reception functionality of the NRF24 module.
  * 
  * @return A status byte indicating the result of the test.
  */
 uint8_t test_rx(void);
 
 #endif //_NRF24__H_
 