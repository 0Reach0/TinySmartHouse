#include "Core.h"



char url[URL_SIZE];
char jsonData[JSON_DATA_SIZE];
char response_buffer[RESPONSE_BUFFER_SIZE];


char * urlencode(const char* text) {
    if (text == NULL) return NULL;

    const char* hex = "0123456789ABCDEF";
    size_t len = strlen(text);
    char* encoded = malloc(3 * len + 1); 
    if (encoded == NULL) return NULL;

    size_t pos = 0;
    for (size_t i = 0; i < len; i++) {
        unsigned char c = text[i];
        if (isalnum(c) || c == '-' || c == '_' || c == '.' || c == '~') {
            encoded[pos++] = c;
        } else {
            encoded[pos++] = '%';
            encoded[pos++] = hex[(c >> 4) & 0xF];
            encoded[pos++] = hex[c & 0xF];
        }
    }
    encoded[pos] = '\0';
    return encoded;
}





esp_err_t sendPostRequest(const char* url, const char* jsonData) {
    esp_http_client_config_t config = {
        .url = url,
        .method = HTTP_METHOD_GET,
    };
    esp_http_client_handle_t client = esp_http_client_init(&config);
    
    esp_http_client_set_header(client, "Content-Type", "application/json");
    
    esp_http_client_set_post_field(client, jsonData, strlen(jsonData));

    esp_err_t err = esp_http_client_perform(client);

    esp_http_client_cleanup(client);
    return err;
}




esp_http_client_handle_t sendGetRequestReturnClient(const char* url) {
    esp_http_client_config_t config = {
        .url = url,
        .method = HTTP_METHOD_GET,
        .buffer_size = RESPONSE_BUFFER_SIZE  
    };

    esp_http_client_handle_t client = esp_http_client_init(&config);
    esp_err_t err = esp_http_client_perform(client);

    if (err != ESP_OK) {
        esp_http_client_cleanup(client);
        return NULL;
    }

    int status_code = esp_http_client_get_status_code(client);
    if (status_code != 200) {
        esp_http_client_cleanup(client);
        return NULL;
    }

    return client;
}



 esp_err_t sendGetRequest(const char* url)
{
    esp_http_client_config_t config = {
        .url = url,
        .method = HTTP_METHOD_GET
    };
    esp_http_client_handle_t client = esp_http_client_init(&config);
    esp_err_t err = esp_http_client_perform(client);
    if (err != ESP_OK) {
        esp_http_client_cleanup(client);
        return err;
    }

    int status_code = esp_http_client_get_status_code(client);
    if (status_code != 200) {
        esp_http_client_cleanup(client);
        return ESP_FAIL;
    }
    esp_http_client_cleanup(client);
    return ESP_OK;
}



esp_err_t readHttpResponse(esp_http_client_handle_t client, char* response_buffer, int buffer_size) {
    int total_read = 0;
    int read_len;

    memset(response_buffer, 0, buffer_size);

    while ((read_len = esp_http_client_read(client, response_buffer + total_read, buffer_size - total_read)) > 0) {
        total_read += read_len;
        if (total_read >= buffer_size - 1) {
            break;
        }
    }

    if (read_len < 0) {
        esp_http_client_cleanup(client);
        return ESP_FAIL;
    }
    response_buffer[total_read] = '\0';
    esp_http_client_cleanup(client);
    return ESP_OK;
}