
#include "tg_bot.h"

int chat_id;
void registerCommands() {
    addBotCommand("start", "start the bot");

    addBotCommand("menu", "show menu");

    addBotCommand("help", "Coming soon");

    addBotCommand("reset", "Reset device");

    addBotCommand("wifi", "change hub wifi");


    sendBotCommandsToAll();
}

void regCallback(const updateData  data) {

    if(!strcmp(data.text, "/start")){
        sendMessage(data.chatId, "Send </reg \"wifi sid\">\0");
    }
    if(!strncmp(data.text, "/reg", 4))
    {
        if(strstr((char*)data.text, saved_sid))
        {
            chat_id = data.chatId;
            sendMessage(data.chatId, "i found u)");
            save_chat_id(data.chatId);
        }
    }
}

void mainCommandsCallback(const updateData  data)
{
    if(!strcmp(data.text, "/help")){
        sendMessage(data.chatId, "Coming soon\0");
    }
    else if(!strcmp(data.text, "/menu")){
        set_main_menu_template();
        sendInlineKeyboard(data.chatId, "Choose Device");
        
    }
    else if(!strcmp(data.text, "/wifi")){
        sendMessage(data.chatId, "Send </ssid \"ssid\">\0");
    }
    else if(strstr((char*)data.text, "/ssid"))
    {
        strcpy(saved_sid,(char*)data.text+6);
        sendMessage(data.chatId, "Send </pswrd \"wifi password\">\0");
    }
    else if(!strcmp(data.text, "/reset"))
    {
        sendMessage(data.chatId, "reseting");
        ESP_ERROR_CHECK(nvs_flash_erase());
        sendMessage(data.chatId, "resetart"); 
        esp_restart(); 
    }
    else if(strstr((char*)data.text, "/pswrd"))
    {
        strcpy(saved_password, (char*)data.text+7);
        sendMessage(data.chatId, "try to connect\0");
        if(scan_for_network(saved_sid))
        {
            if(connect_to_wifi(saved_sid, saved_password))
            {
                save_wifi_data(saved_sid, saved_password);
                sendMessage(data.chatId, " Connected !\0");

            }
            else{
                while(!connect_to_wifi(temp_sid, ""));
                sendMessage(data.chatId, "not Connected !\0");
                }
        }
        else sendMessage(data.chatId, "not Connected !\0");
    }

}
void processCallback(const updateData  data)
{
    ESP_LOGI("TAG", data.callbackData);
    if(!strcmp(data.callbackData, LED_STRIP_DATA))
    {
        set_led_strip_template();
        editInlineKeyboard(data.chatId, data.messageId);
    }
    else if(!strcmp(data.callbackData, SMART_SOCKET_DATA)) 
    {
        set_socket_template();
        editInlineKeyboard(data.chatId, data.messageId);
    }   
    else if(!strcmp(data.callbackData, MAIN_DATA))
    {
        set_main_menu_template();
        editInlineKeyboard(data.chatId, data.messageId);
    }
    else if(!strcmp(data.callbackData, LED_STRIP_RED_DATA))
    {
        char collor[] = {254,0,0};
        uint32_t ip = 0;
        for(uint8_t i = 0; i < device_count; i++)
        {   
            if(devices[i].id == LED_STRIP_ID)
            {
                ip = devices[i].ip;
                send_udp(collor,3, ip);
                break;
            }
        }
    }
    else if(!strcmp(data.callbackData, LED_STRIP_GREEN_DATA))
    {
        char collor[] = {0,254,0};
        uint32_t ip = 0;
        for(uint8_t i = 0; i < device_count; i++)
        {   
            if(devices[i].id == LED_STRIP_ID)
            {
                ip = devices[i].ip;
                send_udp(collor,3, ip);
                break;
            }
        }
    }
    else if(!strcmp(data.callbackData, LED_STRIP_BLUE_DATA))
    {
        char collor[] = {0,0,254};
        uint32_t ip = 0;
        for(uint8_t i = 0; i < device_count; i++)
        {   
            if(devices[i].id == LED_STRIP_ID)
            {
                ip = devices[i].ip;
                send_udp(collor,3, ip);
                break;
            }
        }
    }

    else if(!strcmp(data.callbackData, SMART_SOCKET_ON_DATA))
    {
        uint32_t ip = 0;
        for(uint8_t i = 0; i < device_count; i++)
        {   
            if(devices[i].id == SMART_SOCKET_ID)
            {
                ip = devices[i].ip;
                send_udp("on",2, ip);
                break;
            }

        }
    }
    else if(!strcmp(data.callbackData, SMART_SOCKET_OFF_DATA))
    {
        uint32_t ip = 0;
        for(uint8_t i = 0; i < device_count; i++)
        {   
            if(devices[i].id == SMART_SOCKET_ID)
            {
                ip = devices[i].ip;
                send_udp("of",2, ip);
                break;
            }
        }
    }
    

}



void set_led_strip_template()
{
    addInlineButton("Red", LED_STRIP_RED_DATA);
    addInlineButton("Green", LED_STRIP_GREEN_DATA);
    addInlineButton("Blue", LED_STRIP_BLUE_DATA);
    addInlineButton("Back", MAIN_DATA);
}
void set_main_menu_template(){

    addInlineButton("Led Strip", LED_STRIP_DATA);
    addInlineButton("Smart Socket", SMART_SOCKET_DATA);
}
void set_socket_template()
{
    addInlineButton("On", SMART_SOCKET_ON_DATA);
    addInlineButton("off", SMART_SOCKET_OFF_DATA);
    addInlineButton("Back", MAIN_DATA);
}
