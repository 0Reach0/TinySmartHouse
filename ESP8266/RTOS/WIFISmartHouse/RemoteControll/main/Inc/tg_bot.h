#ifndef _TG_BOT_H_
#define _TG_BOT_H_

#include "communication.h"
#include "nvs_handler.h"
#include "TinyTGBot.h"


#define LED_STRIP_DATA        "0xc1"
#define SMART_SOCKET_DATA     "0xc2"
#define LED_STRIP_RED_DATA    "0xc3"
#define LED_STRIP_BLUE_DATA   "0xc5"
#define LED_STRIP_GREEN_DATA  "0xc6"
#define MAIN_DATA             "0xc7"
#define SMART_SOCKET_ON_DATA  "0xc8"
#define SMART_SOCKET_OFF_DATA  "0xc9"
 

extern int chat_id;



void registerCommands();
void mainCommandsCallback(const updateData  data);
void processCallback(const updateData  data);
void regCallback(const updateData  data);
void set_led_strip_template();
void set_main_menu_template();
void set_socket_template();

#endif //_TG_BOT_H_