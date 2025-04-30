#include "tinytp.h"
#include "nrf24.h"
#include <string.h>

#define MAX_DEVICE_SIZE 32
#define MAX_EVENT_DATA_SIZE 64
#define MAX_PACKAGE_SIZE 128

void delay_ms(uint32_t ms) {
    uint32_t cycles_per_ms = PROC_FREQ / 1000;
    volatile uint32_t cycles = cycles_per_ms * ms;
    while (cycles--) {
        __asm volatile("nop");
    }
}

uint8_t serializeDataPackage(struct dataPackage* package, uint8_t* buffer, uint8_t* out_size) {
    uint8_t pos = 0;

    uint8_t total_size = 1 + 1 + package->d_size + 1 + 1 + package->data->size + 1;
    if (total_size > MAX_PACKAGE_SIZE) return 0;

    buffer[pos++] = package->id;
    buffer[pos++] = package->d_size;
    memcpy(&buffer[pos], package->device, package->d_size);
    pos += package->d_size;
    buffer[pos++] = package->type;
    buffer[pos++] = package->data->size;
    memcpy(&buffer[pos], package->data->data, package->data->size);
    pos += package->data->size;
    buffer[pos++] = package->e_flag;

    if (out_size) *out_size = total_size;
    return 1;
}

uint8_t deserializeDataPackage(struct dataPackage* package, const uint8_t* buffer) {
    uint8_t pos = 0;

    package->id = buffer[pos++];
    package->d_size = buffer[pos++];
    if (package->d_size > MAX_DEVICE_SIZE) return 0;
    memcpy(package->device, &buffer[pos], package->d_size);
    pos += package->d_size;

    package->type = buffer[pos++];
    package->data->size = buffer[pos++];
    if (package->data->size > MAX_EVENT_DATA_SIZE) return 0;
    memcpy(package->data->data, &buffer[pos], package->data->size);
    pos += package->data->size;

    package->e_flag = buffer[pos++];
    return 1;
}

uint8_t serializeAckPackage(struct ackPackage* ack, uint8_t* buffer, uint8_t* out_size) {
    buffer[0] = ack->id;
    buffer[1] = ack->g_flag;
    buffer[2] = ack->f_flag;
    if (out_size) *out_size = 3;
    return 1;
}

int send_one_data_package(uint8_t id, uint8_t *device, uint8_t d_size, uint8_t type, struct eventData *partial_data, uint8_t e_flag) {
    struct dataPackage dPack;
    uint8_t buffer[MAX_PACKAGE_SIZE];
    uint8_t size;

    dPack.id = id;
    dPack.d_size = d_size;
    dPack.device = device;
    dPack.type = type;
    dPack.data = partial_data;
    dPack.e_flag = e_flag;

    if (!serializeDataPackage(&dPack, buffer, &size)) return -1;

    tx_send(buffer, size);
    return 0;
}

int receive_ack(struct ackPackage* ack) {
    uint8_t buffer[3];
    rx_read(buffer, 3);
    ack->id = buffer[0];
    ack->g_flag = buffer[1];
    ack->f_flag = buffer[2];
    return 0;
}

uint8_t send_event(uint8_t* device, uint8_t d_size, uint8_t type, struct eventData* data, uint8_t max_pack_size) {
    uint8_t packet_id = 0;
    uint16_t bytes_sent = 0;
    uint16_t data_total_size = data->size;

    if (device[0] != txaddr[0]) return -1;

    while (bytes_sent < data_total_size) {
        uint8_t chunk_size, e_flag, overhead, available_space;
        uint16_t remaining;
        struct eventData partial_data;
        struct ackPackage ack;
        uint8_t c;

        remaining = data_total_size - bytes_sent;
        overhead = 1 + 1 + d_size + 1 + 1 + 1;
        available_space = (max_pack_size > overhead) ? (max_pack_size - overhead) : 0;

        if (available_space == 0) return -1;

        chunk_size = (remaining > available_space) ? available_space : remaining;
        e_flag = (bytes_sent + chunk_size == data_total_size) ? 1 : 0;

        partial_data.size = chunk_size;
        memcpy(partial_data.data, &data->data[bytes_sent], chunk_size);

        if (send_one_data_package(packet_id++, device, d_size, type, &partial_data, e_flag) != 0) return -1;

        if (e_flag == 0) {
            for (c = 0; c < 5; c++) {
                if (receive_ack(&ack) == 0 && ack.f_flag == 1 && ack.id == packet_id - 1) {
                    break;
                }
                delay_ms(1000);
            }
            if (c == 5) return -1;
        }

        bytes_sent += chunk_size;
    }

    return 0;
}
