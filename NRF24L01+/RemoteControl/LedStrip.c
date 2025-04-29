#ifdef LED_STRIP

#include "stm8s.h"
#include "ledstrip.h"
#include "tynitp.h"


uint8_t ledStripAddr[LED_STRIP_ADDRESS_SIZE] = {0x1, 0x1, 0x1, 0x1, 0x1};


uint8_t SWITCH_TO_LESDSTRIP_MODE(void) {
		txaddr = ledStripAddr;
		CURRENT_MODE = STRIP_MOD;
    SET_TX_ADDR(txaddr, 5);
    delay(10);
    return 1;
}


struct eventData *create_LEDStrip_package(uint8_t r, uint8_t g, uint8_t b) {
    struct eventData *package = (struct eventData *)malloc(sizeof(struct eventData));
    if (!package) return NULL;

    package->size = 3;
    package->data = (uint8_t *)malloc(package->size);
    if (!package->data) {
        free(package);
        return NULL;
    }

    package->data[0] = r;
    package->data[1] = g;
    package->data[2] = b;

    return package;
}


uint8_t procces_LEDStrip(uint8_t row, uint8_t col) {
    struct eventData *led_package = NULL;

    if (RED_COLOUR_BUTTON)
        led_package = create_LEDStrip_package(255, 0, 0);
    else if (GREEN_COLOUR_BUTTON)
        led_package = create_LEDStrip_package(0, 255, 0);
    else if (BLUE_COLOUR_BUTTON)
        led_package = create_LEDStrip_package(0, 0, 255);

    if (!led_package) return 0; 
    uint8_t result = send_event(ledStripAddr, LED_STRIP_ADDRESS_SIZE, DATA_EVENT, led_package, 32);

    free(led_package->data);
    free(led_package);

    return result;
}

#endif //LED_STRIP