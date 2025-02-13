#ifndef _CORE_H_
#define _CORE_H_

/**
 * @file core.h
 * @brief Core networking functions for HTTP requests and URL encoding.
 *
 * This header defines macros, global buffers, and functions used for URL encoding
 * and sending HTTP requests (both GET and POST) using the ESP HTTP client library.
 */

#include "esp_http_client.h"
#include <string.h>
#include <ctype.h>

#define URL_SIZE 512                    ///< Maximum size for the URL buffer.
#define JSON_DATA_SIZE 2048             ///< Maximum size for the JSON data buffer.
#define RESPONSE_BUFFER_SIZE 4096       ///< Buffer size for HTTP response data.

extern char url[URL_SIZE];              ///< Global buffer for storing URL strings.
extern char jsonData[JSON_DATA_SIZE];    ///< Global buffer for storing JSON data.
extern char response_buffer[RESPONSE_BUFFER_SIZE]; ///< Global buffer for storing HTTP responses.

/**
 * @brief URL-encodes the provided text.
 *
 * Converts special characters in the input string into a URL-safe format.
 *
 * @param text The input string to be URL encoded.
 * @return A pointer to the URL-encoded string.
 */
char * urlencode(const char* text);

/**
 * @brief Sends an HTTP POST request.
 *
 * Sends a POST request to the specified URL with the provided JSON data.
 *
 * @param url The target URL for the POST request.
 * @param jsonData The JSON data to send.
 * @return ESP_OK on success, or an error code on failure.
 */
esp_err_t sendPostRequest(const char* url, const char* jsonData);

/**
 * @brief Sends an HTTP GET request and returns the HTTP client handle.
 *
 * Initiates a GET request to the specified URL and returns the HTTP client handle
 * for further processing.
 *
 * @param url The target URL for the GET request.
 * @return The HTTP client handle.
 */
esp_http_client_handle_t sendGetRequestReturnClient(const char* url);

/**
 * @brief Sends an HTTP GET request.
 *
 * Initiates a GET request to the specified URL.
 *
 * @param url The target URL for the GET request.
 * @return ESP_OK on success, or an error code on failure.
 */
esp_err_t sendGetRequest(const char * url);

/**
 * @brief Reads the HTTP response.
 *
 * Reads the response from the provided HTTP client and stores it in the specified buffer.
 *
 * @param client The HTTP client handle.
 * @param response_buffer Buffer to store the HTTP response.
 * @param buffer_size The size of the response buffer.
 * @return ESP_OK on success, or an error code on failure.
 */
esp_err_t readHttpResponse(esp_http_client_handle_t client, char* response_buffer, int buffer_size);

#endif //_CORE_H_
