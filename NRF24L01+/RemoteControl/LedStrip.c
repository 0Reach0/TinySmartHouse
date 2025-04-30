#include "ledstrip.h"

#ifdef LED_STRIP

#include "stm8s.h"
#include "tinytp.h"

uint8_t ledStripAddr[LED_STRIP_ADDRESS_SIZE] = {0x1, 0x1, 0x1, 0x1, 0x1};


/**
 * @brief Switches to LED strip mode.
 *
 * Sets up the necessary parameters for communication with the LED strip.
 *
 * @return uint8_t Status code indicating success or failure.
 */
uint8_t SWITCH_TO_LEDSTRIP_MODE(void) {
    txaddr = ledStripAddr;
    CURRENT_MODE = STRIP_MOD;
    SET_TX_ADDR(txaddr, 5);
    delay(10);
    return 1;
}


/**
 * @brief Creates a data package for controlling an LED strip.
 *
 * Fills an array with RGB color values.
 *
 * @param r Red color value (0-255).
 * @param g Green color value (0-255).
 * @param b Blue color value (0-255).
 * @param package Array to hold the color data (3 elements for RGB).
 */
void create_LEDStrip_package(uint8_t r, uint8_t g, uint8_t b, uint8_t *package) {
    if (package) {
        package[0] = r;
        package[1] = g;
        package[2] = b;
    }
}


/**
 * @brief Processes LED strip commands.
 *
 * Handles LED strip control based on the pressed button's row and column.
 *
 * @param row The row number of the pressed button.
 * @param col The column number of the pressed button.
 * @return uint8_t Status code indicating success or failure.
 */
uint8_t process_LEDStrip(uint8_t row, uint8_t col) {
    uint8_t led_package[3];  // RGB-??????

    if (RED_COLOUR_BUTTON)
        create_LEDStrip_package(255, 0, 0, led_package);
    else if (GREEN_COLOUR_BUTTON)
        create_LEDStrip_package(0, 255, 0, led_package);
    else if (BLUE_COLOUR_BUTTON)
        create_LEDStrip_package(0, 0, 255, led_package);
    else
        return 0;

    uint8_t result = send_event(ledStripAddr, LED_STRIP_ADDRESS_SIZE, led_package, sizeof(led_package), LED_STRIP_DATA_SIZE);

    return result;
}


#endif //LED_STRIP
