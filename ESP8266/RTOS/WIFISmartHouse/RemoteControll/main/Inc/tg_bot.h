#ifndef _TG_BOT_H_
#define _TG_BOT_H_

#include "communication.h"
#include "nvs_handler.h"
#include "TinyTGBot.h"


#define LED_STRIP_DATA "0xc1"
#define SMART_SOCKET_DATA "0xc8"

extern int chat_id;



void registerCommands();
void mainCommandsCallback(const char* command, const int chatId);
void processCallback(const char * data, const int * chatId);
void regCallback(const char* command, const int chatId);

#endif //_TG_BOT_H_