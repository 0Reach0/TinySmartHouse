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


extern uint8_t ledStripAddr[LED_STRIP_ADDRESS_SIZE];


/**
 * @brief Creates a data package for controlling an LED strip.
 *
 * This function allocates memory and fills an eventData structure
 * containing three bytes representing the red, green, and blue (RGB) color values.
 *
 * @param r Red color value (0-255).
 * @param g Green color value (0-255).
 * @param b Blue color value (0-255).
 * @return Pointer to the created eventData structure, or NULL if memory allocation fails.
 *
 * @note You must free both the data field and the structure itself after use.
 */
struct eventData *create_LEDStrip_package(uint8_t r, uint8_t g, uint8_t b);


/**
 * @brief Processes LED strip commands.
 *
 * Handles LED strip control based on the pressed button's row and column.
 *
 * @param row The row number of the pressed button.
 * @param col The column number of the pressed button.
 * @return uint8_t Status code indicating success or failure.
 */
uint8_t procces_LEDStrip(uint8_t row, uint8_t col);


uint8_t SWITCH_TO_LESDSTRIP_MODE(void);

#endif