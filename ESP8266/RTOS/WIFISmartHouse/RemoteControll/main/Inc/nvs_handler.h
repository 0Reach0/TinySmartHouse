#ifndef _NVS_HANDLER_H_
#define _NVS_HANDLER_H_

#include "nvs_flash.h"

#define WIFI_NAMESPACE "wifi_config"
#define WIFI_SSID_KEY "ssid"
#define WIFI_PASS_KEY "pass"
#define BOT_NAMESPACE "bot_config"
#define BOT_ID_KEY "id"
#define CHAT_ID_LOADED 0x01
#define WIFI_LOADED 0x02


void save_chat_id(int chatId);
uint8_t load_chat_id(int *chatId);
void save_wifi_data(char *ssid, char *pass);
uint8_t load_wifi_data(char *ssid, char *pass);
void init_nvs();

#endif // _NVS_STORAGE_H_