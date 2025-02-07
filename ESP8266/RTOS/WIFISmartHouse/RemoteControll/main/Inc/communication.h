#ifndef _COMMUNICATION_H_
#define _COMMUNICATION_H_



#include "esp_log.h"
#include "esp_event.h"
#include "lwip/sockets.h"
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "esp_wifi.h"
#include "esp_log.h"
#include "lwip/netdb.h"
#include "nvs_handler.h"


#define PASSWORD_SIZE   64
#define SSID_SIZE       64
#define MAX_STA         4        
#define AP_SSID         "SmartHome"
#define AP_PASSWORD     "12345678"      
#define DATA_PORT       4210
#define TARGET_PATTERN  "set_up"
#define MAX_SCAN_ATTEMPTS 10
#define LED_STRIP_ID 0xA7



typedef struct {
    uint8_t mac[6];                 
    uint32_t ip;                  
    uint8_t id;                                
} device_t;


extern int chat_id;
extern char saved_sid[SSID_SIZE];
extern char temp_sid[SSID_SIZE];
extern char saved_password[PASSWORD_SIZE];
extern device_t devices[MAX_STA];
extern int device_count;
extern const char *TAG;
extern uint8_t trusted_ids[];
extern uint8_t trusted_size;



void setup_dns();
bool scan_for_network(const char *target_ssid);
uint8_t connect_to_wifi(char *ssid, char *pass);
void event_handler(void* arg, esp_event_base_t event_base, int32_t event_id, void* event_data);
void temp_wifi_connect();
void wifi_init();


void update_sta_list(const wifi_event_ap_staconnected_t *event);
uint32_t get_sta_ip_address(const wifi_event_ap_staconnected_t *event);
int create_and_connect_socket(uint32_t ip);
uint8_t authorizate(int sock) ;
bool is_device_trusted(uint8_t device_id);
void add_device_to_list(const wifi_event_ap_staconnected_t *event, uint32_t ip, uint8_t device_id);
void remove_sta(const wifi_event_ap_stadisconnected_t *event);
void send_udp(char *data, uint8_t size, uint32_t ip);



void event_handler(void* arg, esp_event_base_t event_base, int32_t event_id, void* event_data);
#endif //_COMMUNICATION_H_