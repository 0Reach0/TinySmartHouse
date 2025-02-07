#include "TinyTGBot.h"



int offset = -1;

void (*message_callback)(const char* command, const int chatId);
void (*inline_callback)(const char * data, const int * id); 

char * TOKEN = "7734291319:AAGQZHEis8b1InE06sZdu6L-Qy531X7AWQA";  


char inlineKeyboardBuffer[INLINE_BUTTONS_BUFFER_SIZE] = OPEN_INLINE_BUTTON_JSON_STRING;
bool isFirstInline = true; 
char replyKeyboardBuffer[REPLY_KEYBOARD_BUFFER_SIZE] = OPEN_REPLY_KEYBOARD_JSON_STRING;
bool isFirstReply = true;
char button[BUTTON_BUFFER_SIZE];




BotCommand commands[MAX_COMMANDS];
int commandCount = 0;




void setToken(const char * t)
{
    TOKEN = t;
}


void setMessageCallback(void (*mssg_clbck)(const char* command, const int chatId))
{
    message_callback = mssg_clbck;
}


void setInlineCallback(void (*nln_clbck)(const char * data, const int * id))
{
    inline_callback = nln_clbck; 

}




int8_t addBotCommand(const char* command, const char* description) {
    if (commandCount >= MAX_COMMANDS) {

        return OVERFLOW_ERROR;
    }

    strncpy(commands[commandCount].command, command, sizeof(commands[commandCount].command) - 1);
    strncpy(commands[commandCount].description, description, sizeof(commands[commandCount].description) - 1);
    commandCount++;
    return OK;
}




esp_err_t sendBotCommands(int chatId) {
    if (commandCount == 0) {
        return ESP_OK;
    }

    snprintf(jsonData, sizeof(jsonData), "{\"commands\":[");

    for (int i = 0; i < commandCount; i++) {
        char commandEntry[128];
        snprintf(commandEntry, sizeof(commandEntry), "{\"command\":\"%s\",\"description\":\"%s\"}",
                 commands[i].command, commands[i].description);

        strncat(jsonData, commandEntry, sizeof(jsonData) - strlen(jsonData) - 1);

        if (i < commandCount - 1) {
            strncat(jsonData, ",", sizeof(jsonData) - strlen(jsonData) - 1);
        }
    }

    strncat(jsonData, "]}", sizeof(jsonData) - strlen(jsonData) - 1);

    snprintf(url, sizeof(url), "%s%s/%s?chat_id=%d", TELEGRAM_API_URL, TOKEN, SET_COMMANDS_CMD, chatId);

    commandCount  = 0;
    return sendPostRequest(url, jsonData);
}







tiny_err sendMessage(const int chatId, const char * message){


    snprintf(url, sizeof(url), "%s%s/%s?chat_id=%d&text=%s", TELEGRAM_API_URL, TOKEN, SEND_MESSAGE_CMD,chatId, urlencode(message));
    sendGetRequest(url);
    return 1;
}


tiny_err handleMessageUpdate(cJSON *update, int chatId) {
    cJSON *message = cJSON_GetObjectItem(update, "message");
    if (!cJSON_IsObject(message)) return JSON_CANT_FIND_FIELD_ERROR;

    cJSON *chat = cJSON_GetObjectItem(message, "chat");
    if (!cJSON_IsObject(chat)) return JSON_CANT_FIND_FIELD_ERROR;

    cJSON *chat_id = cJSON_GetObjectItem(chat, "id");
    if (!cJSON_IsNumber(chat_id)) return JSON_CANT_FIND_FIELD_ERROR;

    if (chatId != 0 && chatId != chat_id->valueint) return WRONG_ID_ERROR;

    cJSON *text = cJSON_GetObjectItem(message, "text");
    if (!cJSON_IsString(text)) return JSON_CANT_FIND_FIELD_ERROR;

    message_callback(text->valuestring, chat_id->valueint);
    return OK;
}

tiny_err handleCallbackQuery(cJSON *update, int chatId) {
    cJSON *callback_query = cJSON_GetObjectItem(update, "callback_query");
    if (!cJSON_IsObject(callback_query)) return JSON_CANT_FIND_FIELD_ERROR;

    cJSON *message = cJSON_GetObjectItem(callback_query, "message");
    if (!cJSON_IsObject(message)) return JSON_CANT_FIND_FIELD_ERROR;

    cJSON *chat = cJSON_GetObjectItem(message, "chat");
    if (!cJSON_IsObject(chat)) return JSON_CANT_FIND_FIELD_ERROR;

    cJSON *chat_id = cJSON_GetObjectItem(chat, "id");
    if (!cJSON_IsNumber(chat_id)) return JSON_CANT_FIND_FIELD_ERROR;

    if (chatId != 0 && chatId != chat_id->valueint) return WRONG_ID_ERROR;

    cJSON *callback_data = cJSON_GetObjectItem(callback_query, "data");
    if (!cJSON_IsString(callback_data)) return JSON_CANT_FIND_FIELD_ERROR;

    inline_callback(callback_data->valuestring, chat_id->valueint);
    return OK;
}



tiny_err processUpdate(update_id allowed_updates, int chatId) {
    cJSON *root = cJSON_Parse(response_buffer);
    if (!root) return JSON_PARSE_ERROR;

    cJSON *result = cJSON_GetObjectItem(root, "result");
    if (!cJSON_IsArray(result)) goto cleanup_error;

    cJSON *first_update = cJSON_GetArrayItem(result, 0);
    if (!cJSON_IsObject(first_update)) goto cleanup_error;

    offset = cJSON_GetObjectItem(first_update, "update_id")->valueint + 1;

    if ((allowed_updates & (1 << 0)) && handleMessageUpdate(first_update, chatId) == OK)
        goto cleanup_ok;

    if ((allowed_updates & (1 << 1)) && handleCallbackQuery(first_update, chatId) == OK)
        goto cleanup_ok;

cleanup_ok:
    cJSON_Delete(root);
    return OK;

cleanup_error:
    cJSON_Delete(root);
    return JSON_CANT_FIND_FIELD_ERROR;
}

tiny_err getUpdates(update_id allowed_updates, int chatId) {
    
    if(allowed_updates == 0) return OK;
    snprintf(url, sizeof(url), "%s%s/%s?offset=%d&limit=1&allowed_updates=[\"message\",\"callback_query\"]",
             TELEGRAM_API_URL, TOKEN, GET_UPDATES_CMD, offset);
    
    esp_http_client_handle_t client = sendGetRequestReturnClient(url);
    if (client == NULL) {
        return CLIENT_IS_NULL_ERROR;
    }
    
    esp_err_t err = readHttpResponse(client, response_buffer, 4096);
    if (err != ESP_OK) {
        return HTTP_RESPONSE_ERROR;
    }
    
    
    return processUpdate(allowed_updates,chatId);
}




void addInlineButton(const char* text, const char* callbackData) {
    if (!isFirstInline) {
        strcat(inlineKeyboardBuffer, ",");
    }

    snprintf(button, sizeof(button), 
             "{\"text\":\"%s\",\"callback_data\":\"%s\"}", 
             text, callbackData);
    
    strcat(inlineKeyboardBuffer, button);
     isFirstInline = false;
}


void addReplyButton(const char* text) {
        if (!isFirstReply) {
        strcat(replyKeyboardBuffer, ",");
    }
    snprintf(button, sizeof(button), 
            "[\"%s\"]",
            text);
        isFirstReply = false;
    strcat(replyKeyboardBuffer, button);
}

tiny_err sendInlineKeyboard(const int chatId, const char * text) {
    strcat(inlineKeyboardBuffer, CLOSE_INLINE_BUTTON_JSON_STRING); 

    snprintf(jsonData, sizeof(jsonData),
             "{\"chat_id\":%d,\"text\":\"%s\",\"reply_markup\":%s}",
             chatId, text, inlineKeyboardBuffer);

    snprintf(url, sizeof(url), "%s%s/%s", TELEGRAM_API_URL, TOKEN, SEND_MESSAGE_CMD);

    esp_err_t err = sendPostRequest(url, jsonData);
    if (err != ESP_OK) {
       return POST_REQUEST_ERROR;
    }

    strcpy(inlineKeyboardBuffer, OPEN_INLINE_BUTTON_JSON_STRING);
    isFirstInline = true;
    return OK;
}

tiny_err sendReplyKeyboard(const int chatId, const char* text) {
    strcat(replyKeyboardBuffer, CLOSE_REPLY_KEYBOARD_JSON_STRING);
    
    snprintf(jsonData, sizeof(jsonData),
            "{\"chat_id\":%d,\"text\":\"%s\",\"reply_markup\":%s}",
            chatId, text, replyKeyboardBuffer);

    snprintf(url, sizeof(url), "%s%s/%s", TELEGRAM_API_URL, TOKEN, SEND_MESSAGE_CMD);

    esp_err_t err = sendPostRequest(url, jsonData);

    if (err != ESP_OK) {
       return POST_REQUEST_ERROR;
    }

    memset(replyKeyboardBuffer, 0, sizeof(replyKeyboardBuffer));
    strcpy(replyKeyboardBuffer, OPEN_REPLY_KEYBOARD_JSON_STRING);
    isFirstReply = true;

    return OK;
}



