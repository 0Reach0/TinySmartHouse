#ifndef _NVS_HANDLER_H_
#define _NVS_HANDLER_H_

/**
 * @file nvs_handler.h
 * @brief Functions and macros for managing non-volatile storage (NVS) for Wi-Fi and bot configurations.
 *
 * This header provides functions to save and load Wi-Fi credentials and chat identifiers using
 * the ESP32's non-volatile storage (NVS). It also defines namespaces and keys used for NVS.
 */

#include "nvs_flash.h"

#define WIFI_NAMESPACE "wifi_config"   ///< Namespace for Wi-Fi configuration data.
#define WIFI_SSID_KEY  "ssid"            ///< Key for storing the Wi-Fi SSID.
#define WIFI_PASS_KEY  "pass"            ///< Key for storing the Wi-Fi password.
#define BOT_NAMESPACE  "bot_config"      ///< Namespace for bot configuration data.
#define BOT_ID_KEY     "id"              ///< Key for storing the bot identifier.
#define CHAT_ID_LOADED 0x01             ///< Flag indicating that the chat ID was successfully loaded.
#define WIFI_LOADED    0x02             ///< Flag indicating that the Wi-Fi data was successfully loaded.

/**
 * @brief Saves the chat identifier to NVS.
 *
 * @param chatId The chat identifier to be stored.
 */
void save_chat_id(int chatId);

/**
 * @brief Loads the chat identifier from NVS.
 *
 * @param chatId Pointer to an integer where the loaded chat identifier will be stored.
 * @return A flag indicating success (e.g., CHAT_ID_LOADED) or failure.
 */
uint8_t load_chat_id(int *chatId);

/**
 * @brief Saves Wi-Fi credentials to NVS.
 *
 * @param ssid The SSID of the Wi-Fi network.
 * @param pass The password of the Wi-Fi network.
 */
void save_wifi_data(char *ssid, char *pass);

/**
 * @brief Loads Wi-Fi credentials from NVS.
 *
 * @param ssid Pointer to a buffer where the SSID will be stored.
 * @param pass Pointer to a buffer where the Wi-Fi password will be stored.
 * @return A flag indicating success (e.g., WIFI_LOADED) or failure.
 */
uint8_t load_wifi_data(char *ssid, char *pass);

/**
 * @brief Initializes the non-volatile storage (NVS) system.
 */
void init_nvs();

#endif // _NVS_HANDLER_H_
