#include "esp_wifi.h"
#include "esp_log.h"
#include "driver/ledc.h"
#include "lwip/err.h"
#include "lwip/sockets.h"
#include "driver/pwm.h"
#include "driver/gpio.h"
#include "esp_netif.h"
#include "esp_event.h"

#define CONTROLL_PIN     13

#define IDENTIFY_REQUEST "IDENTIFY"
#define COMD_ON "on"
#define COMD_OFF "of"

#define ID 0xb8

#define LED_GPIO GPIO_NUM_2
#define CONTROLL_PIN GPIO_NUM_13

#define WIFI_SSID "SmartHome"
#define WIFI_PASSWORD "12345678"

#define PORT 4210

uint8_t wifi_connected = 0;

typedef struct {
    uint32_t ip;
    uint8_t mac[6];
} Host;

static const char *TAG = "AP_Reciever";
static Host connected_host;

int sock, client_sock;
struct sockaddr_in server_addr, client_addr;
socklen_t addr_len = sizeof(client_addr);
int optval = 1;


void pair_with_host(wifi_event_sta_connected_t *event) {
    char buffer[32];

    sock = socket(AF_INET, SOCK_STREAM, 0);
    if (sock < 0) return;

    memset(&server_addr, 0, sizeof(server_addr));
    server_addr.sin_family = AF_INET;
    server_addr.sin_addr.s_addr = htonl(INADDR_ANY);
    server_addr.sin_port = htons(PORT);

    setsockopt(sock, SOL_SOCKET, SO_REUSEADDR, &optval, sizeof(optval));
    if (bind(sock, (struct sockaddr *)&server_addr, sizeof(server_addr)) < 0) {
        close(sock);
        return;
    }

    ESP_LOGI(TAG, "Listening");
    listen(sock, 5);

    client_sock = accept(sock, (struct sockaddr *)&client_addr, &addr_len);
    if (client_sock < 0) {
        close(sock);
        return;
    }

    ESP_LOGI(TAG, "Accepted");

    int len = recv(client_sock, buffer, sizeof(buffer) - 1, 0);
    if (len > 0) {
        buffer[len] = '\0';

        if (strcmp(buffer, IDENTIFY_REQUEST) == 0) {
            char response = ID;
            send(client_sock, &response, 1, 0);
        }
    }

    close(client_sock);
    close(sock);
}

static esp_err_t event_handler(void *ctx, system_event_t *event) {
    switch (event->event_id) {
        case SYSTEM_EVENT_STA_START:
            ESP_LOGI(TAG, "Wi-Fi started, connecting to AP...");
            esp_wifi_connect();
            break;
        default:
            break;
    }
    return ESP_OK;
}

static void wifi_handler(void *arg, esp_event_base_t event_base, int32_t event_id, void *event_data) {
    if (event_id == WIFI_EVENT_STA_CONNECTED) {
        ESP_LOGI(TAG, "Connected to AP");
        wifi_event_sta_connected_t *event = (wifi_event_sta_connected_t *)event_data;
        pair_with_host(event);
    } else if (event_id == WIFI_EVENT_STA_DISCONNECTED) {
        wifi_event_sta_disconnected_t *event = (wifi_event_sta_disconnected_t *)event_data;
        esp_wifi_connect();
    }
}

void setup_sta() {
    tcpip_adapter_init();
    ESP_ERROR_CHECK(esp_event_loop_init(event_handler, NULL));

    wifi_init_config_t cfg = WIFI_INIT_CONFIG_DEFAULT();
    ESP_ERROR_CHECK(esp_wifi_init(&cfg));
    ESP_ERROR_CHECK(esp_event_handler_register(WIFI_EVENT, ESP_EVENT_ANY_ID, wifi_handler, NULL));

    wifi_config_t sta_config = {
        .sta = {
            .ssid = WIFI_SSID,
            .password = WIFI_PASSWORD,
        },
    };

    ESP_ERROR_CHECK(esp_wifi_set_mode(WIFI_MODE_STA));
    ESP_ERROR_CHECK(esp_wifi_set_config(WIFI_IF_STA, &sta_config));
    ESP_ERROR_CHECK(esp_wifi_start());

    ESP_LOGI(TAG, "Wi-Fi initialization complete");
}

uint8_t receive_data(uint8_t *data, uint8_t size) {
    sock = socket(AF_INET, SOCK_DGRAM, 0);
    if (sock < 0) {
        ESP_LOGI(TAG, "Error creating socket");
        return 1;
    }

    memset(&server_addr, 0, sizeof(server_addr));
    server_addr.sin_family = AF_INET;
    server_addr.sin_addr.s_addr = htonl(INADDR_ANY);
    server_addr.sin_port = htons(PORT);

    setsockopt(sock, SOL_SOCKET, SO_REUSEADDR, &optval, sizeof(optval));
    if (bind(sock, (struct sockaddr *)&server_addr, sizeof(server_addr)) < 0) {
        ESP_LOGI(TAG, "Error binding socket");
        close(sock);
        return 1;
    }

    ESP_LOGI(TAG, "Waiting for data");

    while (true) {
        uint8_t len = recvfrom(sock, data, size, 0, (struct sockaddr *)&client_addr, &addr_len);
        if (len > 0) {
            break;
        }
    }

    close(sock);
    return 0;
}

void app_main() {
    gpio_config_t io_conf = {};
    io_conf.pin_bit_mask = (1ULL << CONTROLL_PIN); 
        io_conf.mode = GPIO_MODE_OUTPUT;             
    io_conf.pull_up_en = GPIO_PULLUP_DISABLE;    
    io_conf.pull_down_en = GPIO_PULLDOWN_DISABLE;
    io_conf.intr_type = GPIO_INTR_DISABLE;
    gpio_config(&io_conf);
    gpio_set_direction(LED_GPIO, GPIO_MODE_OUTPUT);
    gpio_set_direction(CONTROLL_PIN, GPIO_MODE_OUTPUT);
    setup_sta();
    uint8_t data[2];
    while (true) {
        receive_data(data, 2);
        if(!strcmp((char *)data, COMD_ON)) {
            gpio_set_level(CONTROLL_PIN, 0);
        } else if(!strcmp((char *)data, COMD_OFF)) {
            gpio_set_level(CONTROLL_PIN, 1);
     
        }
    }
}