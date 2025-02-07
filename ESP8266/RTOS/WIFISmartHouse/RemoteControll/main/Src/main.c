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
    wifi_init();
    uint8_t setts = load_settings();
     if(!(setts & WIFI_LOADED))temp_wifi_connect();

     setMessageCallback(regCallback);
     while(!chat_id)
     {
         getUpdates(MESSAGES, 0);
     }
     setMessageCallback(mainCommandsCallback);

     while (1) {
           getUpdates(MESSAGES, chat_id);          
        //send_udp(data, 3, devices[0].ip);
         vTaskDelay(5 / portTICK_PERIOD_MS);
     }
}