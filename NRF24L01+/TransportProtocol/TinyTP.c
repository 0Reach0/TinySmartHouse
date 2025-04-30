#include "tinytp.h"
#include "nrf24.h"
#include <string.h>

void delay_ms(uint32_t ms) {
    uint32_t cycles = (PROC_FREQ / 1000) * ms;
    while (cycles--) {
        __asm volatile("nop");
    }
}

uint8_t serializeDataPackage(const struct dataPackage* pkg, uint8_t* buffer, uint8_t* out_size) {
     uint8_t pos = 0;
		if (pkg->d_size > MAX_DEVICE_SIZE || pkg->data_size > MAX_DATA_SIZE) return 0;

    buffer[pos++] = pkg->id;
    buffer[pos++] = pkg->d_size;
    memcpy(&buffer[pos], pkg->device, pkg->d_size);
    pos += pkg->d_size;
    buffer[pos++] = pkg->data_size;
    memcpy(&buffer[pos], pkg->data, pkg->data_size);
    pos += pkg->data_size;
    buffer[pos++] = pkg->is_last;

    if (out_size) *out_size = pos;
    return 1;
}

uint8_t deserializeDataPackage(struct dataPackage* pkg, const uint8_t* buffer) {
    uint8_t pos = 0;
    pkg->id = buffer[pos++];
    pkg->d_size = buffer[pos++];
    if (pkg->d_size > MAX_DEVICE_SIZE) return 0;
    memcpy(pkg->device, &buffer[pos], pkg->d_size);
    pos += pkg->d_size;
    pkg->data_size = buffer[pos++];
    if (pkg->data_size > MAX_DATA_SIZE) return 0;
    memcpy(pkg->data, &buffer[pos], pkg->data_size);
    pos += pkg->data_size;
    pkg->is_last = buffer[pos++];
    return 1;
}

int send_one_data_package(uint8_t id, const uint8_t *device, uint8_t d_size,
                          const uint8_t *data, uint8_t data_size, uint8_t is_last) {
    struct dataPackage pkg;
    uint8_t buffer[MAX_PACKAGE_SIZE];
    uint8_t size;

    pkg.id = id;
    pkg.d_size = d_size;
    memcpy(pkg.device, device, d_size);
    memcpy(pkg.data, data, data_size);
    pkg.data_size = data_size;
    pkg.is_last = is_last;

    if (!serializeDataPackage(&pkg, buffer, &size)) return -1;

    tx_send(buffer, size);
    return 0;
}

int receive_ack(uint8_t* ack_value) {
    uint8_t buf[1];
    rx_read(buf, 1);
    *ack_value = buf[0];
    return 0;
}

uint8_t send_event(const uint8_t *device, uint8_t d_size,
                   const uint8_t *data, uint8_t data_size, uint8_t max_pack_size) {
    uint8_t packet_id = 0;
    uint16_t bytes_sent = 0;

    if (device[0] != txaddr[0]) return -1;

    while (bytes_sent < data_size) {
        uint8_t chunk_size, is_last, overhead, available, retry, ack;

        overhead = 1 + 1 + d_size + 1 + 1; // id + d_size + device + data_size + is_last
        available = (max_pack_size > overhead) ? max_pack_size - overhead : 0;

        if (available == 0) return -1;

        chunk_size = (data_size - bytes_sent > available) ? available : data_size - bytes_sent;
        is_last = (bytes_sent + chunk_size == data_size) ? 1 : 0;

        if (send_one_data_package(packet_id++, device, d_size,
                                  &data[bytes_sent], chunk_size, is_last) != 0) return -1;

        if (!is_last) {
            for (retry = 0; retry < WAITING_ACK_TIME; retry++) {
                if (receive_ack(&ack) == 0 && ack == ACK_ALLOW_NEXT)
                    break;
                delay_ms(1000);
            }
            if (retry == WAITING_ACK_TIME) return -1;
        }

        bytes_sent += chunk_size;
    }

    return 0;
}
