#include "smartsocket.h"

#ifdef SOCKET

#include "stm8s.h"
#include "tinytp.h"


uint8_t smartSocketAddr[SOCKET_ADDRESS_SIZE] = {0x2, 0x2, 0x2, 0x2, 0x2};


uint8_t SWITCH_TO_SOCKET_MODE(void)
{
		txaddr = smartSocketAddr;
		CURRENT_MODE = SOCKET_MOD;
    SET_TX_ADDR(txaddr1, 5);
    delay(10);
    return 1;
}


uint8_t procces_socket(uint8_t row, uint8_t col) {
    uint8_t socket_package[1];

    if (SOCKET_ON_BUTTON)
        socket_packag[0] = 1;
    else if (SOCKET_OFF_BUTTON)
        socket_package[0] = 0;

    if (!socket_package) return 0;

		uint8_t result = send_event(smartSocketAddr, LED_STRIP_ADDRESS_SIZE,
                                socket_package, sizeof(socket_package), SMART_SOCKET_DATA_SIZE);

    return result;
}


#endif //SOCKET