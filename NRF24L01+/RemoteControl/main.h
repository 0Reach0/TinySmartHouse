#ifndef _MAIN__H_
#define _MAIN__H_

/**
 * @file main.h
 * @brief Main header for remote control hardware configuration and processing.
 *
 * This file defines hardware-specific pin configurations, operational modes,
 * and function prototypes for handling remote control input, LED strip control,
 * socket control, and power-saving operations.
 */



#include "NRF24.H" 
#include "ledstrip.h"

/* Remote Control Pins (modify these according to your hardware) */
#define RC_PIN1 GPIOD, GPIO_PIN_1  ///< Remote control pin 1
#define RC_PIN2 GPIOD, GPIO_PIN_2  ///< Remote control pin 2
#define RC_PIN3 GPIOD, GPIO_PIN_3  ///< Remote control pin 3
#define RC_PIN4 GPIOA, GPIO_PIN_2  ///< Remote control pin 4
#define RC_PIN5 GPIOA, GPIO_PIN_1  ///< Remote control pin 5
#define RC_PIN6 GPIOD, GPIO_PIN_6  ///< Remote control pin 6
#define RC_PIN7 GPIOD, GPIO_PIN_5  ///< Remote control pin 7
#define RC_PIN8 GPIOD, GPIO_PIN_4  ///< Remote control pin 8

/* Operational Mode Definitions (adjust as needed) */
#define POWER_SAVE_MODE           ///< Enable power save mode
#define POWER_SAVE_BUTTON (col == 1 && row == 4)  ///< Macro to detect power save button press

#define DEFAULT_MOD STRIP_MOD         ///< Default operating mode
#define DEFAULT_ADDRESS ledStripAddr      ///< Default device address


extern uint8_t *txaddr;


/**
 * @brief Waits for a button click on the remote control.
 *
 * This function waits for a button press and returns the row and column of the pressed button.
 *
 * @param row Pointer to store the row number of the pressed button.
 * @param col Pointer to store the column number of the pressed button.
 * @param t Timeout in milliseconds.
 * @return uint8_t Status code indicating success or timeout.
 */
uint8_t waiting_for_click(uint8_t * row, uint8_t * col, uint8_t t);


/**
 * @brief Swaps the current channel.
 *
 * This function changes the current communication channel.
 *
 * @param chanel The current channel.
 * @return uint8_t The new channel after swapping.
 */
uint8_t swap_chanel(uint8_t chanel);


uint8_t process_event();


uint8_t process_get_event(struct dataPackage * data);


uint8_t process_send_event(struct dataPackage * data);
/**
 * @brief Initializes the GPIO pins for the remote control.
 *
 * Configures the required pins based on the hardware setup.
 */
void Init_Pins(void);


/**
 * @brief Initializes the NRF24 radio module.
 *
 * Prepares the NRF24 module for communication.
 *
 * @return uint8_t Status code indicating success or failure.
 */
uint8_t Init_NRF(void);


#ifdef POWER_SAVE_MOD 
/**
 * @brief Activates power save mode.
 *
 * Reduces power consumption by putting the system into a low-power state.
 */
void POWERSAVE(void);


#endif // POWER_SAVE_MOD

#endif //_MAIN__H_
