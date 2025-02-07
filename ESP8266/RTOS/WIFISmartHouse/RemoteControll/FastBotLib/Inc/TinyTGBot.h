#ifndef _TINYTGBOT_
#define _TINYTGBOT_

#include "Core.h"
#include "esp_log.h"
#include <string.h>
#include "cJSON.h"
#include <stdio.h>





#define TELEGRAM_API_URL "https://api.telegram.org/bot"
#define SET_COMMANDS_CMD "setMyCommands"
#define GET_UPDATES_CMD "getUpdates"
#define SEND_MESSAGE_CMD "sendMessage"



#define MAX_COMMANDS               10
#define INLINE_BUTTONS_BUFFER_SIZE 1024
#define REPLY_KEYBOARD_BUFFER_SIZE 1024
#define BUTTON_BUFFER_SIZE         512  


#define OVERFLOW_ERROR             -2
#define OK                          0 
#define CLIENT_IS_NULL_ERROR       -3
#define HTTP_RESPONSE_ERROR        -4
#define JSON_PARSE_ERROR           -5
#define JSON_CANT_FIND_FIELD_ERROR -6
#define REQUESTED_DATA_NOT_FOUND   -7
#define POST_REQUEST_ERROR         -8
#define WRONG_ID_ERROR             -9


#define OPEN_INLINE_BUTTON_JSON_STRING   "{\"inline_keyboard\":[["
#define OPEN_REPLY_KEYBOARD_JSON_STRING  "{\"keyboard\":["
#define CLOSE_INLINE_BUTTON_JSON_STRING  "]]}"
#define CLOSE_REPLY_KEYBOARD_JSON_STRING "],\"resize_keyboard\":true,\"one_time_keyboard\":false}"


#define tiny_err int8_t
#define update_id int8_t



#define MESSAGES 0x01

#define CALLBACKS 0x02 

#define ALL      0XFF



typedef struct {
    char command[32];
    char description[64];
} BotCommand;


extern void (*message_callback)(const char* command, const int chatId);

extern void (*inline_callback)(const char * data, const int * id); 


void setToken(const char * t);

void setMessageCallback(void (*mssg_clbck)(const char* command, const int chatId));
void setInlineCallback(void (*nln_clbck)(const char * data, const int * id));

tiny_err addBotCommand(const char* command, const char* description);
esp_err_t sendBotCommands(int chatId);



tiny_err sendMessage(const int chatId, const char * message);
tiny_err getUpdates(update_id allowed_updates,int chatId);
void resetInlineKeyboard();
void resetReplyKeyboard();
void addInlineButton(const char* text, const char* callbackData);
void addReplyButton(const char* text );
tiny_err sendInlineKeyboard(const int chatId, const char * text);
tiny_err sendReplyKeyboard(const int chatId, const char* text ) ;
void removeKeyboard(int chatId);
tiny_err handleMessageUpdate(cJSON *update, int chatId);
tiny_err processUpdate(update_id allowed_updates,int chatId);
tiny_err handleCallbackQuery(cJSON *update, int chatId);


#endif //_TINYTGBOT_