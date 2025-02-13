#ifndef _COMMUNICATION_H_
#define _COMMUNICATION_H_

/**
 * @file communication.h
 * @brief Provides networking functionalities for device communication.
 *
 * This header defines constants, data structures, and functions for managing network
 * connections, scanning for Wi-Fi networks, handling events, and communicating with devices.
 */

#include "esp_log.h"
#include "esp_event.h"
#include "lwip/sockets.h"
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "esp_wifi.h"
#include "esp_log.h"
#include "lwip/netdb.h"
#include "nvs_handler.h"

/* Macros */
#define PASSWORD_SIZE      64           ///< Maximum Wi-Fi password size.
#define SSID_SIZE          64           ///< Maximum Wi-Fi SSID size.
#define MAX_STA            4            ///< Maximum number of connected stations.
#define AP_SSID            "SmartHome"  ///< Access point SSID.
#define AP_PASSWORD        "12345678"   ///< Access point password.
#define DATA_PORT          4210         ///< Port for data transmission.
#define TARGET_PATTERN     "set_up"     ///< Pattern used to identify target networks.
#define MAX_SCAN_ATTEMPTS  10           ///< Maximum number of Wi-Fi scan attempts.
#define LED_STRIP_ID       0xa7         ///< Identifier for the LED strip.
#define IDENTIFY_REQUEST   "IDENTIFY"   ///< Request string for device identification.

/* Data Structures */
/**
 * @brief Structure representing a network device.
 */
typedef struct {
    uint8_t mac[6];   ///< MAC address of the device.
    uint32_t ip;      ///< IP address of the device.
    uint8_t id;       ///< Unique device identifier.
} device_t;

/* External Variables */
extern int chat_id;                            ///< Chat identifier.
extern char saved_sid[SSID_SIZE];              ///< Stored Wi-Fi SSID.
extern char temp_sid[SSID_SIZE];               ///< Temporary Wi-Fi SSID.
extern char saved_password[PASSWORD_SIZE];     ///< Stored Wi-Fi password.
extern device_t devices[MAX_STA];              ///< List of connected devices.
extern int device_count;                       ///< Number of connected devices.
extern const char *TAG;                        ///< Logging tag.
extern uint8_t trusted_ids[];                  ///< List of trusted device IDs.
extern uint8_t trusted_size;                   ///< Number of trusted device IDs.

/* Function Prototypes */

/**
 * @brief Configures DNS settings.
 */
void setup_dns();

/**
 * @brief Scans for a Wi-Fi network matching the target SSID.
 *
 * @param target_ssid The SSID of the network to scan for.
 * @return true if the network is found, false otherwise.
 */
bool scan_for_network(const char *target_ssid);

/**
 * @brief Connects to a Wi-Fi network.
 *
 * @param ssid The network SSID.
 * @param pass The network password.
 * @return A connection status code.
 */
uint8_t connect_to_wifi(char *ssid, char *pass);

/**
 * @brief Handles system events related to networking.
 *
 * @param arg User-defined data.
 * @param event_base Base of the event.
 * @param event_id Identifier for the event.
 * @param event_data Pointer to additional event data.
 */
void event_handler(void* arg, esp_event_base_t event_base, int32_t event_id, void* event_data);

/**
 * @brief Initiates a temporary Wi-Fi connection.
 */
void temp_wifi_connect();

/**
 * @brief Initializes the Wi-Fi subsystem.
 */
void wifi_init();

/**
 * @brief Retrieves the IP address of a station based on its MAC address.
 *
 * @param mac The MAC address of the station.
 * @param ip Pointer to store the retrieved IP address.
 * @return true if the IP address was successfully retrieved, false otherwise.
 */
bool get_sta_ip(const uint8_t *mac, uint32_t *ip);

/**
 * @brief Establishes a connection with a device using its IP address.
 *
 * @param ip The IP address of the device.
 * @param sock Pointer to the socket descriptor to be used for the connection.
 * @return true if the connection was successfully established, false otherwise.
 */
bool connect_to_sta(uint32_t ip, int *sock);

/**
 * @brief Receives the device identifier over a socket connection.
 *
 * @param sock The socket descriptor.
 * @param device_id Pointer to store the received device identifier.
 * @return true if the device ID was successfully received, false otherwise.
 */
bool receive_device_id(int sock, uint8_t *device_id);

/**
 * @brief Adds a device to the list of connected devices.
 *
 * @param device_id The identifier of the device.
 * @param ip The IP address of the device.
 * @param mac The MAC address of the device.
 */
void add_device_to_list(uint8_t device_id, uint32_t ip, const uint8_t *mac);

/**
 * @brief Updates the list of stations when a new device connects.
 *
 * @param event Pointer to the event data for a station connection.
 */
void update_sta_list(const wifi_event_ap_staconnected_t *event);

/**
 * @brief Removes a station from the list when it disconnects.
 *
 * @param event Pointer to the event data for a station disconnection.
 */
void remove_sta(const wifi_event_ap_stadisconnected_t *event);

/**
 * @brief Sends data via UDP.
 *
 * @param data The data to be sent.
 * @param size The size of the data in bytes.
 * @param ip The destination IP address.
 */
void send_udp(char *data, uint8_t size, uint32_t ip);

#endif //_COMMUNICATION_H_
