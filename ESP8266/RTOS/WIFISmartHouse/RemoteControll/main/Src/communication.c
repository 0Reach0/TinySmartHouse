#include "communication.h"



 char saved_sid[SSID_SIZE];
 char temp_sid[SSID_SIZE];
 char saved_password[PASSWORD_SIZE];
 device_t devices[MAX_STA];
 int device_count = 0;
 const char *TAG;
 uint8_t trusted_ids[] = {LED_STRIP_ID};
 uint8_t trusted_size = 1;








 void event_handler(void* arg, esp_event_base_t event_base, int32_t event_id, void* event_data) {


    switch (event_id) {
        case WIFI_EVENT_AP_STACONNECTED: {
            wifi_event_ap_staconnected_t* event = (wifi_event_ap_staconnected_t*) event_data;
            vTaskDelay(pdMS_TO_TICKS(1000));

            update_sta_list(event);
            break;
        }

        case WIFI_EVENT_AP_STADISCONNECTED: {
            wifi_event_ap_stadisconnected_t* event = (wifi_event_ap_stadisconnected_t*) event_data;

            remove_sta(event);
            break;
        }

        default:
            break;  
    }
}








void setup_dns()
{
    tcpip_adapter_dns_info_t dns_main;
    dns_main.ip.addr = ipaddr_addr("8.8.8.8"); 
    tcpip_adapter_set_dns_info(TCPIP_ADAPTER_IF_STA, TCPIP_ADAPTER_DNS_MAIN, &dns_main);

    tcpip_adapter_dns_info_t dns_backup;
    dns_backup.ip.addr = ipaddr_addr("8.8.4.4"); 
    tcpip_adapter_set_dns_info(TCPIP_ADAPTER_IF_STA, TCPIP_ADAPTER_DNS_BACKUP, &dns_backup);
}




 bool scan_for_network(const char *target_ssid) {
    uint16_t ap_count = 0;
    wifi_ap_record_t ap_records[20];  
    for (int attempt = 0; attempt < MAX_SCAN_ATTEMPTS; attempt++) {
        ESP_ERROR_CHECK(esp_wifi_scan_start(NULL, true));  
        ESP_ERROR_CHECK(esp_wifi_scan_get_ap_num(&ap_count));

        if (ap_count > 0) {
            ESP_ERROR_CHECK(esp_wifi_scan_get_ap_records(&ap_count, ap_records));

            for (int i = 0; i < ap_count; i++) {
                if (strcmp((char *)ap_records[i].ssid, target_ssid) == 0) {
                    ESP_LOGI("WiFi", "Сеть найдена: %s", target_ssid);
                    return true;
                }
            }
        }
        ESP_LOGW("WiFi", "Попытка %d: сеть %s не найдена", attempt + 1, target_ssid);
    }
    return false;  
}



uint8_t connect_to_wifi(char *ssid, char *pass) {
    if (!scan_for_network(ssid)) {
        return 0;
    }
ESP_ERROR_CHECK(esp_wifi_stop()); 
  vTaskDelay(100 / portTICK_PERIOD_MS);  
    wifi_config_t wifi_config = {}; 

    strncpy((char *)wifi_config.sta.ssid, ssid, sizeof(wifi_config.sta.ssid) - 1);
    if(strcmp(pass, "")){strncpy((char *)wifi_config.sta.password, pass, sizeof(wifi_config.sta.password) - 1);

    wifi_config.sta.threshold.authmode = WIFI_AUTH_WPA2_PSK;}
    else wifi_config.sta.threshold.authmode = WIFI_AUTH_OPEN;

    ESP_ERROR_CHECK(esp_wifi_set_config(WIFI_IF_STA, &wifi_config));
    ESP_ERROR_CHECK(esp_wifi_start());
    ESP_ERROR_CHECK(esp_wifi_connect());
    vTaskDelay(5000 / portTICK_PERIOD_MS);
    wifi_ap_record_t ap_info;
    if (esp_wifi_sta_get_ap_info(&ap_info) != ESP_OK) {
        return 0;
    
}
    return 1;
}





void temp_wifi_connect()
{
    ESP_ERROR_CHECK(esp_wifi_scan_start(NULL, true));
    while(1){
    uint16_t ap_count = 0;
    esp_wifi_scan_get_ap_num(&ap_count);
    wifi_ap_record_t ap_records[ap_count];

    esp_wifi_scan_get_ap_records(&ap_count, ap_records);
    for (int i = 0; i < ap_count; i++) {
        if (strstr((char*)ap_records[i].ssid, TARGET_PATTERN)) { 
            wifi_config_t wifi_config = {};
            strncpy((char*)wifi_config.sta.ssid, (char*)ap_records[i].ssid, sizeof(wifi_config.sta.ssid));
            wifi_config.sta.threshold.authmode = WIFI_AUTH_OPEN;
            
            esp_wifi_set_config(WIFI_IF_STA, &wifi_config);
            esp_wifi_connect();
            strcpy(temp_sid,(char*)ap_records[i].ssid);
            return;
        }
    }
    }
}


void wifi_init()
{
    tcpip_adapter_init();



    ESP_ERROR_CHECK(esp_event_loop_create_default());

    

    wifi_init_config_t cfg = WIFI_INIT_CONFIG_DEFAULT();
    ESP_ERROR_CHECK(esp_wifi_init(&cfg));


    ESP_ERROR_CHECK(esp_event_handler_register(WIFI_EVENT, ESP_EVENT_ANY_ID, event_handler, NULL));

   
   
    ESP_ERROR_CHECK(esp_wifi_set_mode(WIFI_MODE_APSTA));
    wifi_config_t ap_config = {
        .ap = {
            .ssid_len = strlen(AP_SSID),
            .max_connection = MAX_STA,
            .authmode = WIFI_AUTH_WPA2_PSK,
            .password = AP_PASSWORD
        },
    };
    
    strcpy((char*)ap_config.ap.ssid, AP_SSID);

    ESP_ERROR_CHECK(esp_wifi_set_config(ESP_IF_WIFI_AP, &ap_config));
    ESP_ERROR_CHECK(esp_wifi_start());
    
    
    

}








bool get_sta_ip(const uint8_t *mac, uint32_t *ip) {
    wifi_sta_list_t wifi_sta_list;
    esp_wifi_ap_get_sta_list(&wifi_sta_list);

    tcpip_adapter_sta_list_t station_list;
    esp_err_t err = tcpip_adapter_get_sta_list(&wifi_sta_list, &station_list);
    if (err != ESP_OK) {
        return false;
    }

    for (int i = 0; i < station_list.num; i++) {
        if (memcmp(station_list.sta[i].mac, mac, 6) == 0) {
            *ip = station_list.sta[i].ip.addr;
            return true;
        }
    }
    return false;
}

bool connect_to_sta(uint32_t ip, int *sock) {
    struct sockaddr_in dest_addr = {
        .sin_family = AF_INET,
        .sin_port = htons(DATA_PORT),
        .sin_addr.s_addr = ip
    };

    *sock = socket(AF_INET, SOCK_STREAM, IPPROTO_IP);
    if (*sock < 0) {
        return false;
    }

    if (connect(*sock, (struct sockaddr *)&dest_addr, sizeof(dest_addr)) < 0) {
        close(*sock);
        return false;
    }

    return true;
}

bool receive_device_id(int sock, uint8_t *device_id) {
    struct timeval tv = { .tv_sec = 5, .tv_usec = 0 };
    setsockopt(sock, SOL_SOCKET, SO_RCVTIMEO, &tv, sizeof(tv));

    char buffer[1];
    int recv_len = recv(sock, buffer, 1, 0);
    if (recv_len > 0) {
        *device_id = buffer[0];
        return true;
    }
    return false;
}

void add_device_to_list(uint8_t device_id, uint32_t ip, const uint8_t *mac) {
    devices[device_count].id = device_id;
    devices[device_count].ip = ip;
    memcpy(devices[device_count].mac, mac, 6);
    device_count++;
}

void update_sta_list(const wifi_event_ap_staconnected_t *event) {
    if (device_count >= MAX_STA) {
        esp_wifi_deauth_sta(event->mac); 
        return;
    }

    uint32_t ip = 0;
    if (!get_sta_ip(event->mac, &ip)) {
        return;
    }

    int sock;
    if (!connect_to_sta(ip, &sock)) {
        return;
    }

    send(sock, IDENTIFY_REQUEST, 8, 0);

    uint8_t device_id;
    if (!receive_device_id(sock, &device_id)) {
        close(sock);
        return;
    }

    bool is_trusted = false;
    for (uint8_t i = 0; i < trusted_size; i++) {
        if (device_id == trusted_ids[i]) {
            is_trusted = true;
            break;
        }
    }

    if (!is_trusted) {
        close(sock);
        esp_wifi_deauth_sta(event->mac); 
        return;
    }

    add_device_to_list(device_id, ip, event->mac);
    close(sock);
}




void remove_sta(const wifi_event_ap_stadisconnected_t *event) {
    for (int i = 0; i < device_count; i++) {
        if (memcmp(devices[i].mac, event->mac, 6) == 0) {
            memmove(&devices[i], &devices[i + 1], (device_count - i - 1) * sizeof(device_t));
            device_count--;
            break;
        }
    }
}

void send_udp(char *data, uint8_t size, uint32_t ip) {
    struct sockaddr_in dest_addr = {
        .sin_addr.s_addr = ip,
        .sin_family = AF_INET,
        .sin_port = htons(DATA_PORT)
    };
    int sock = socket(AF_INET, SOCK_DGRAM, IPPROTO_IP);
    sendto(sock, data, size, 0, (struct sockaddr *)&dest_addr, sizeof(dest_addr));
    close(sock);
}
