#ifndef _MAIN__H_
#define _MAIN__H_

/**
 * @file main.h
 * @brief Main header file for STM8-based NRF24 and LED control.
 *
 * This file defines hardware-related configurations and function prototypes
 * for initializing GPIO, NRF24 module, and PWM-based LED control.
 */

#include "stm8s_gpio.h"  
#include "nrf24.h"       
#include "stm8s.h"       
#include "stm8s_tim2.h"


extern uint8_t ledStripAddr[];


/** @brief Size of the LED control data pipe */
#define LED_PIPE_SIZE 32

/** @brief Address assigned to the LED control module */
#define LED_ADDRESS_SIZE 5


/**
 * @brief Configures the GPIO pins.
 *
 * Initializes the required GPIO pins for communication and LED control.
 */
void SetUp_GPIO(void);

/**
 * @brief Initializes the NRF24 module.
 *
 * Configures the NRF24 transceiver for wireless communication.
 */
void Init_NRF(void);

/**
 * @brief Sets up TIM2 for PWM output.
 *
 * Configures Timer 2 to generate PWM signals for LED control.
 */
void SetUp_TIM2_PWM(void);

/**
 * @brief Sets the RGB color of the LED.
 *
 * Sends PWM signals to control the LED color.
 *
 * @param r Red intensity (0-255)
 * @param g Green intensity (0-255)
 * @param b Blue intensity (0-255)
 */
void Set_Colour(uint8_t r, uint8_t g, uint8_t b);

#endif //_MAIN__H_
