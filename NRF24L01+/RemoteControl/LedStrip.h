/**
 * @file ledstrip.h
 * @brief Main header for LedStrip module
*/

#ifndef _LED_STRIP__H_
#define _LED_STRIP__H_

#define LED_STRIP                 									///< Enable LED strip functionality
#define STRIP_MOD  0x00           									///< LED strip operating mode
#define LED_STRIP_ADDRESS_SIZE 5     								///< Led strip addr width
#define STRIP_MOD_BUTTON    (col == 4 && row == 1)  ///< Macro for LED strip mode button
#define RED_COLOUR_BUTTON   (col == 1 && row == 1)  ///< Macro for red colour selection
#define GREEN_COLOUR_BUTTON (col == 1 && row == 2)  ///< Macro for green colour selection
#define BLUE_COLOUR_BUTTON  (col == 1 && row == 3)  ///< Macro for blue colour selection
#define LED_STRIP_DATA_SIZE 16

extern uint8_t ledStripAddr[LED_STRIP_ADDRESS_SIZE];


/**
 * @brief Creates a data package for controlling an LED strip.
 *
 * This function fills an array containing three bytes representing the red, green, and blue (RGB) color values.
 *
 * @param r Red color value (0-255).
 * @param g Green color value (0-255).
 * @param b Blue color value (0-255).
 * @param package Array to hold the color data (3 elements for RGB).
 */
void create_LEDStrip_package(uint8_t r, uint8_t g, uint8_t b, uint8_t *package);


/**
 * @brief Processes LED strip commands.
 *
 * Handles LED strip control based on the pressed button's row and column.
 *
 * @param row The row number of the pressed button.
 * @param col The column number of the pressed button.
 * @return uint8_t Status code indicating success or failure.
 */
uint8_t process_LEDStrip(uint8_t row, uint8_t col);


/**
 * @brief Switches to LED strip mode.
 *
 * Sets up the necessary parameters for communication with the LED strip.
 *
 * @return uint8_t Status code indicating success or failure.
 */
uint8_t SWITCH_TO_LEDSTRIP_MODE(void);

#endif // _LED_STRIP__H_
