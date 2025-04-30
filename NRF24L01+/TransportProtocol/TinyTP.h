#ifndef _TINY_TP_H_
#define _TINY_TP_H_

#include "stm8s.h"

#define PROC_FREQ 16000000UL
#define WAITING_ACK_TIME 5

#define MAX_DEVICE_SIZE 8
#define MAX_DATA_SIZE   32
#define MAX_PACKAGE_SIZE 64

#define ACK_RECEIVED    0xAA
#define ACK_ALLOW_NEXT  0x55

struct dataPackage {
    uint8_t id;
    uint8_t d_size;
    uint8_t * device;
    uint8_t data[MAX_DATA_SIZE];
    uint8_t data_size;
    uint8_t is_last;
};

extern uint8_t* txaddr;
extern uint8_t * rxaddr;

void delay_ms(uint32_t ms);

uint8_t serializeDataPackage(const struct dataPackage* pkg, uint8_t* buffer, uint8_t* out_size);
uint8_t deserializeDataPackage(struct dataPackage* pkg, const uint8_t* buffer);

int send_one_data_package(uint8_t id, const uint8_t *device, uint8_t d_size,
                          const uint8_t *data, uint8_t data_size, uint8_t is_last);

int receive_ack(uint8_t* ack_value);

uint8_t send_event(const uint8_t *device, uint8_t d_size,
                   const uint8_t *data, uint8_t data_size, uint8_t max_pack_size);

#endif
