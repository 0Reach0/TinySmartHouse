#ifdef SOCKET

#include "smartsocket.h"
#include "stm8s.h"
#include "tynitp.h"


uint8_t smartSocketAddr[SOCKET_ADDRESS_SIZE] = {0x2, 0x2, 0x2, 0x2, 0x2};


uint8_t SWITCH_TO_SOCKET_MODE(void)
{
		txaddr = smartSocketAddr;
		CURRENT_MODE = SOCKET_MOD;
    SET_TX_ADDR(txaddr1, 5);
    delay(10);
    return 1;
}


struct eventData *create_Socket_package(uint8_t state) {
    struct eventData *package = (struct eventData *)malloc(sizeof(struct eventData));
    if (!package) return NULL;

    package->size = 1;
    package->data = (uint8_t *)malloc(package->size);
    if (!package->data) {
        free(package);
        return NULL;
    }

    package->data[0] = state ? 1 : 0;

    return package;
}


uint8_t procces_socket(uint8_t row, uint8_t col) {
    struct eventData *socket_package = NULL;

    if (SOCKET_ON_BUTTON)
        socket_package = create_Socket_package(1);
    else if (SOCKET_OFF_BUTTON)
        socket_package = create_Socket_package(0);

    if (!socket_package) return 0;

    uint8_t result = send_event(socketAddr, SOCKET_ADDRESS_SIZE, DATA_EVENT, socket_package, 32);

    free(socket_package->data);
    free(socket_package);

    return result;
}


#endif //SOCKET