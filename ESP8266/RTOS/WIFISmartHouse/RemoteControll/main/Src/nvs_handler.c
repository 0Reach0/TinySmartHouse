#include "nvs_handler.h"
#include "esp_log.h"

void save_chat_id(int chatId) {
    nvs_handle_t nvs_handle;
    esp_err_t err = nvs_open(BOT_NAMESPACE, NVS_READWRITE, &nvs_handle);
    if (err != ESP_OK) {
        return;
    }

    nvs_set_i32(nvs_handle, BOT_ID_KEY, chatId);
    nvs_commit(nvs_handle);
    nvs_close(nvs_handle);
}

uint8_t load_chat_id(int *chatId) {
    nvs_handle_t nvs_handle;
    esp_err_t err = nvs_open(BOT_NAMESPACE, NVS_READONLY, &nvs_handle);
    if (err != ESP_OK) {
        return 0;
    }

    err = nvs_get_i32(nvs_handle, BOT_ID_KEY, chatId);
    if (err != ESP_OK) {
        nvs_close(nvs_handle);
        return 0;
    }
    nvs_close(nvs_handle);

    return 1;
}

void save_wifi_data(char *ssid, char *pass) {
    nvs_handle_t nvs_handle;
    esp_err_t err;

    err = nvs_open(WIFI_NAMESPACE, NVS_READWRITE, &nvs_handle);
    if (err != ESP_OK) {
        return;
    }

    err = nvs_set_str(nvs_handle, WIFI_SSID_KEY, ssid);
    if (err != ESP_OK) {
        nvs_close(nvs_handle);
        return;
    }

    err = nvs_set_str(nvs_handle, WIFI_PASS_KEY, pass);
    if (err != ESP_OK) {
        nvs_close(nvs_handle);
        return;
    }

    err = nvs_commit(nvs_handle);
    if (err != ESP_OK) {
        nvs_close(nvs_handle);
        return;
    }

    nvs_close(nvs_handle);
}

uint8_t load_wifi_data(char *ssid, char *pass) {
    nvs_handle_t nvs_handle;
    esp_err_t err = nvs_open(WIFI_NAMESPACE, NVS_READONLY, &nvs_handle);
    if (err != ESP_OK) {
        return 0;
    }
    uint8_t req = 0;
    err = nvs_get_str(nvs_handle, WIFI_SSID_KEY, NULL, &req);

    if (err != ESP_OK) {
        nvs_close(nvs_handle);
        return 0;
    }
    err = nvs_get_str(nvs_handle, WIFI_SSID_KEY, ssid, &req);

    if (err != ESP_OK) {
        nvs_close(nvs_handle);
        return 0;
    }
    err = nvs_get_str(nvs_handle, WIFI_PASS_KEY, NULL, &req);
    if (err != ESP_OK) {
        nvs_close(nvs_handle);
        return 0;
    }
    err = nvs_get_str(nvs_handle, WIFI_PASS_KEY, pass, &req);

    nvs_close(nvs_handle);
    return 1;
}

void init_nvs() {
    esp_err_t err = nvs_flash_init();
    if (err == ESP_ERR_NVS_NO_FREE_PAGES || err == ESP_ERR_NVS_NEW_VERSION_FOUND) {
        ESP_ERROR_CHECK(nvs_flash_erase());
        nvs_flash_init();
    }
}
