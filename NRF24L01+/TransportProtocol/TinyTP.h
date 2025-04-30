#ifndef _TINY_TP__H_
#define _TINY_TP__H_

#define GET_EVENT  0x11 ///< Command code for getting an event
#define DATA_EVENT 0x22 ///< Command code for sending event data
#define WAITING_ACK_TIME 5 ///< Time to wait for ACK in seconds
#define PROC_FREQ 16000000UL

#include "stm8s.h"

#define MAX_DEVICE_SIZE 8
#define MAX_DATA_SIZE 32

struct eventData {
    uint8_t data[MAX_DATA_SIZE]; ///< Event data
    uint8_t size;                ///< Size of the event data
};

struct dataPackage {
    uint8_t id;                          ///< Packet ID
    uint8_t d_size;                      ///< Device address size
    uint8_t device[MAX_DEVICE_SIZE];    ///< Device address
    uint8_t type;                        ///< Event type
    struct eventData data;              ///< Event data
    uint8_t e_flag;                     ///< End flag
};

struct ackPackage {
    uint8_t id;      ///< ACK packet ID
    uint8_t g_flag;  ///< General flag
    uint8_t f_flag;  ///< Final ACK flag
};

extern uint8_t *txaddr;

void delay_ms(uint32_t ms);

uint8_t serializeDataPackage(const struct dataPackage* package, uint8_t* buffer);
uint8_t deserializeDataPackage(struct dataPackage* package, const uint8_t* buffer);

uint8_t serializeAckPackage(const struct ackPackage* ack, uint8_t* buffer);

int send_one_data_package(uint8_t id, const uint8_t *device, uint8_t d_size,
                          uint8_t type, const struct eventData *partial_data, uint8_t e_flag);

int receive_ack(struct ackPackage *ack);

uint8_t send_event(const uint8_t *device, uint8_t d_size, uint8_t type,
                   const struct eventData *data, uint8_t max_pack_size);

#endif //_TINY_TP__H_
