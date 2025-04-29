#ifndef _TINY_TP__H_
#define _TINY_TP__H_

#define GET_EVENT  0x11 ///< Command code for getting an event
#define DATA_EVENT 0x22 ///< Command code for sending event data
#define WAITING_ACK_TIME 5 ///< Time to wait for ACK in seconds

struct eventData {
    uint8_t *data; ///< Pointer to event data bytes
    uint8_t size; ///< Size of the event data
};

struct dataPackage {
    uint8_t id; ///< Unique identifier for the packet
    uint8_t d_size; ///< Size of the device address
    uint8_t *device; ///< Pointer to the device address bytes
    uint8_t type; ///< Event type identifier
    struct eventData *data; ///< Pointer to the event data
    uint8_t e_flag; ///< End-of-event flag (1 if last packet, 0 otherwise)
};

struct ackPackage {
    uint8_t id; ///< Identifier of the acknowledged packet
    uint8_t g_flag; ///< General flag (purpose defined by protocol)
    uint8_t f_flag; ///< Final ACK flag (1 if final ACK, 0 otherwise)
};


/**
 * @brief Serializes a dataPackage structure into a byte buffer.
 * 
 * @param package Pointer to the dataPackage structure to serialize.
 * @param out_size Pointer to a variable where the size of the serialized buffer will be stored.
 * @return Pointer to the allocated serialized buffer, or NULL on failure.
 */
uint8_t* serializeDataPackage(struct dataPackage* package, uint8_t* out_size);

/**
 * @brief Deserializes a byte buffer into a dataPackage structure.
 * 
 * @param buffer Pointer to the serialized byte buffer.
 * @return The deserialized dataPackage structure.
 */
struct dataPackage deserializeDataPackage(const uint8_t* buffer);

/**
 * @brief Serializes an ackPackage structure into a byte buffer.
 * 
 * @param ack Pointer to the ackPackage structure to serialize.
 * @param out_size Pointer to a variable where the size of the serialized buffer will be stored.
 * @return Pointer to the allocated serialized buffer, or NULL on failure.
 */
uint8_t* serializeAckPackage(struct ackPackage* ack, uint8_t* out_size);

/**
 * @brief Sends a single data package.
 * 
 * @param id Unique packet identifier.
 * @param device Pointer to the device address array.
 * @param d_size Size of the device address array.
 * @param type Event type identifier.
 * @param partial_data Pointer to the eventData structure containing part of the full data.
 * @param e_flag End-of-data flag (1 if this is the last packet, 0 otherwise).
 * @return 0 on success, -1 on failure.
 */
int send_one_data_package(uint8_t id, uint8_t *device, uint8_t d_size, uint8_t type, struct eventData *partial_data, uint8_t e_flag);

/**
 * @brief Receives an acknowledgment (ACK) from the receiver.
 * 
 * @param ack Pointer to the ackPackage structure where received data will be stored.
 * @return 0 on success, -1 on failure.
 */
int receive_ack(struct ackPackage *ack);

/**
 * @brief Sends an event by splitting it into multiple packets if necessary.
 * 
 * @param device Pointer to the device address array.
 * @param d_size Size of the device address array.
 * @param type Event type identifier.
 * @param data Pointer to the eventData structure containing the full event data.
 * @param max_pack_size Maximum allowed size of a single packet.
 * @return 0 on success, -1 on failure.
 */
uint8_t send_event(uint8_t *device, uint8_t d_size, uint8_t type, struct eventData *data, uint8_t max_pack_size);




#endif //_TINY_TP__H_