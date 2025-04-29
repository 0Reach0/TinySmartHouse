uint8_t* serializeDataPackage(struct dataPackage* package, uint8_t* out_size) {
    uint8_t total_size = 1 + 1 + package->d_size + 1 + 1 + package->data->size + 1;
    uint8_t *buffer = (uint8_t*)malloc(total_size);
    if (!buffer) return NULL;

    uint8_t pos = 0;
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
    return buffer;
}

struct dataPackage deserializeDataPackage(const uint8_t* buffer) {
    struct dataPackage package;
    uint8_t pos = 0;

    package.id = buffer[pos++];
    package.d_size = buffer[pos++];
    package.device = (uint8_t*)malloc(package.d_size);
    memcpy(package.device, &buffer[pos], package.d_size);
    pos += package.d_size;

    package.type = buffer[pos++];

    package.data = (struct eventData*)malloc(sizeof(struct eventData));
    package.data->size = buffer[pos++];
    package.data->data = (uint8_t*)malloc(package.data->size);
    memcpy(package.data->data, &buffer[pos], package.data->size);
    pos += package.data->size;

    package.e_flag = buffer[pos++];

    return package;
}



uint8_t* serializeAckPackage(struct ackPackage* ack, uint8_t* out_size) {
    uint8_t total_size = 3;  
    uint8_t *buffer = (uint8_t*)malloc(total_size);
    if (!buffer) return NULL;

    uint8_t pos = 0;
    buffer[pos++] = ack->id;
    buffer[pos++] = ack->g_flag;
    buffer[pos++] = ack->f_flag; 
    if (out_size) *out_size = total_size;
    return buffer;
}


int send_one_data_package(uint8_t id, uint8_t *device, uint8_t d_size, uint8_t type, struct eventData *partial_data, uint8_t e_flag) {
    struct dataPackage dPack;
    dPack.id = id;
    dPack.d_size = d_size;
    dPack.device = device;
    dPack.type = type;
    dPack.data = partial_data;
    dPack.e_flag = e_flag;

    uint8_t rSize;
    uint8_t *rData = serializeDataPackage(&dPack, &rSize);
    if (rData == NULL) return -1;

    tx_send(rData, rSize);
    free(rData);

    return 0;
}
int receive_ack(struct ackPackage *ack) {
    uint8_t buffer[3];

    if (rx_read(buffer, 3) != 0) return -1;

    ack->id = buffer[0];
    ack->g_flag = buffer[1];
    ack->f_flag = buffer[2];

    return 0;
}



uint8_t send_event(uint8_t *device, uint8_t d_size, uint8_t type, struct eventData *data, uint8_t max_pack_size) {
    if (device[0] != txaddr[0]) return -1;
    uint8_t packet_id = 0;
    uint16_t bytes_sent = 0;
    uint16_t data_total_size = data->size; 


    while (bytes_sent < data_total_size) {
        uint16_t remaining = data_total_size - bytes_sent;
        uint8_t overhead = 1 + 1 + d_size + 1 + 1 + 1;
        uint8_t available_space = (max_pack_size > overhead) ? (max_pack_size - overhead) : 0;

        if (available_space == 0) return -1; 

        uint8_t chunk_size = (remaining > available_space) ? available_space : remaining;
        uint8_t e_flag = (bytes_sent + chunk_size == data_total_size) ? 1 : 0; 


        struct eventData partial_data;
        partial_data.size = chunk_size;
        partial_data.data = &(data->data[bytes_sent]);


        if (send_one_data_package(packet_id++, device, d_size, type, &partial_data, e_flag) != 0) {
            return -1;
        }

        if (e_flag == 0) {
					struct ackPackage ack;
					uint8_t c = 0;
					for (; c < 5; c++) {
					if (receive_ack(&ack) == 0) {
						if (ack.f_flag == 1 && ack.id == packet_id - 1) {
                break;
            } else {
                c--;
                delay_ms(1000);
            }
						} else {
							delay_ms(1000);
						}
					}
					if (c == 5) {
						return -1;
				}
}

    }

    return 0; 
}
