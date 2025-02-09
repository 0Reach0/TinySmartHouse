#include "main.h"
 




uint8_t load_settings()
{
    uint8_t res =0;
    if(load_wifi_data(saved_sid, saved_password))
    {
        connect_to_wifi(saved_sid, saved_password);
        res|=WIFI_LOADED;
    }
     if(load_chat_id(&chat_id))
     {
         res|=CHAT_ID_LOADED;
     }

    return res;
}






void app_main() {
    setToken("7734291319:AAGQZHEis8b1InE06sZdu6L-Qy531X7AWQA");
    wifi_init();
    uint8_t setts = load_settings();
     if(!(setts & WIFI_LOADED))temp_wifi_connect();
         setup_dns();
     setMessageCallback(regCallback);
     registerCommands();
     while(!chat_id)
     {
         getUpdates(MESSAGES, 0);
         vTaskDelay(pdMS_TO_TICKS(100));
     }
     setMessageCallback(mainCommandsCallback);
    setInlineCallback(processCallback);
     while (1) {
           getUpdates(MESSAGES && CALLBACKS, chat_id);          
           vTaskDelay(pdMS_TO_TICKS(100)); 
     }
}