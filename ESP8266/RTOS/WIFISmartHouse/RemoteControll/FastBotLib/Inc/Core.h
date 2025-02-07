#include "esp_http_client.h"
#include <string.h>
#include <ctype.h>

#define URL_SIZE                   512
#define JSON_DATA_SIZE             2048
#define RESPONSE_BUFFER_SIZE       4096

extern char url[URL_SIZE];
extern char jsonData[JSON_DATA_SIZE];
extern char response_buffer[RESPONSE_BUFFER_SIZE];


char * urlencode(const char* text);
esp_err_t sendPostRequest(const char* url, const char* jsonData);
esp_http_client_handle_t sendGetRequestReturnClient(const char* url);
esp_err_t sendGetRequest(const char * url);
esp_err_t readHttpResponse(esp_http_client_handle_t client, char* response_buffer, int buffer_size);