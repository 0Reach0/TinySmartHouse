
#include "tg_bot.h"

int chat_id;
void registerCommands() {
    addBotCommand("start", "Запуск бота");

    addBotCommand("help", "Получить помощь");

    addBotCommand("menu", "Показать меню");

    //sendBotCommands();
}

void regCallback(const char* command, const int chatId) {

    if(!strcmp(command, "/start")){
        sendMessage(chatId, "Send </reg \"wifi sid\">\0");
    }
    if(!strncmp(command, "/reg", 4))
    {
        if(strstr((char*)command, saved_sid))
        {
            chat_id = chatId;
            sendMessage(chatId, "i found u)");
            save_chat_id(chatId);
        }
    }
}

void mainCommandsCallback(const char* command, const int chatId)
{
    if(!strcmp(command, "/help")){
        sendMessage(chatId, "Coming soon\0");
    }
    else if(!strcmp(command, "/menu")){
        addInlineButton("Led Strip", LED_STRIP_DATA);
        addInlineButton("Smart Socket", SMART_SOCKET_DATA);
        sendInlineKeyboard(chat_id, "Choose Device");
        
    }
    else if(!strcmp(command, "/change wifi")){
        sendMessage(chatId, "Send </ssid \"ssid\">\0");
    }
    else if(strstr((char*)command, "/ssid"))
    {
        strcpy(saved_sid,(char*)command+6);
        sendMessage(chatId, "Send </pswrd \"wifi password\">\0");
    }
    else if(!strcmp(command, "/reset"))
    {
        sendMessage(chatId, "reseting");
        ESP_ERROR_CHECK(nvs_flash_erase());
        sendMessage(chatId, "resetart"); 
        esp_restart(); 
    }
    else if(strstr((char*)command, "/pswrd"))
    {
        strcpy(saved_password, (char*)command+7);
        sendMessage(chatId, "try to connect\0");
        if(scan_for_network(saved_sid))
        {
            if(connect_to_wifi(saved_sid, saved_password))
            {
                sendMessage(chatId, " Connected !\0");
                save_wifi_data(saved_sid, saved_password);
                sendMessage(chatId, " Connected !\0");

            }
            else{
                while(!connect_to_wifi(temp_sid, ""));
                sendMessage(chatId, "not Connected !\0");
                }
        }
        else sendMessage(chatId, "not Connected !\0");
    }

}
void processCallback(const char * data, const int * chatId)
{
    if(!strcmp(data, LED_STRIP_DATA))
    {
    }
    if(!strcmp(data, SMART_SOCKET_DATA))        sendMessage(chatId, "Pressed button 2\0");
}
