#ifndef _TINYTGBOT_
#define _TINYTGBOT_

/**
 * @file TinyTGBot.h
 * @brief Provides functions and definitions for interacting with the Telegram Bot API.
 *
 * This header defines constants, data structures, and functions for managing Telegram
 * bot commands, sending messages, editing messages, handling updates, and processing
 * callback queries.
 */

#include "Core.h"                 
#include "esp_log.h"              
#include <string.h>               
#include "cJSON.h"                
#include <stdio.h>                

char TOKEN[60];                   ///< Telegram Bot token used for authentication.

#define TELEGRAM_API_URL "https://api.telegram.org/bot" ///< Base URL for the Telegram Bot API.
#define SET_COMMANDS_CMD "setMyCommands"                ///< Telegram API command to set bot commands.
#define GET_UPDATES_CMD "getUpdates"                    ///< Telegram API command to retrieve updates.
#define SEND_MESSAGE_CMD "sendMessage"                  ///< Telegram API command to send messages.
#define EDIT_MESSAGE_CMD  "editMessage"                 ///< Telegram API command to edit messages.
#define EDIT_INLINE_KEYBOARD_CMD "editMessageReplyMarkup" ///< Telegram API command to edit inline keyboards.
#define ANSWER_CALLBACK_QUERY "answerCallbackQuery"     ///< Telegram API command to answer callback queries.

#define MAX_COMMANDS               10     ///< Maximum number of bot commands.
#define INLINE_BUTTONS_BUFFER_SIZE 1024   ///< Buffer size for inline buttons.
#define REPLY_KEYBOARD_BUFFER_SIZE 1024   ///< Buffer size for reply keyboards.
#define BUTTON_BUFFER_SIZE         512    ///< Buffer size for individual buttons.
#define OVERFLOW_ERROR             -2     ///< Error code indicating buffer overflow.
#define OK                          0     ///< Success code.
#define CLIENT_IS_NULL_ERROR       -3     ///< Error code when the client is NULL.
#define HTTP_RESPONSE_ERROR        -4     ///< Error code for HTTP response errors.
#define JSON_PARSE_ERROR           -5     ///< Error code for JSON parsing failure.
#define JSON_CANT_FIND_FIELD_ERROR -6     ///< Error code when a required JSON field is not found.
#define REQUESTED_DATA_NOT_FOUND   -7     ///< Error code when requested data is not found.
#define POST_REQUEST_ERROR         -8     ///< Error code for a failed POST request.
#define WRONG_ID_ERROR             -9     ///< Error code for an incorrect identifier.

#define OPEN_INLINE_BUTTON_JSON_STRING   "{\"inline_keyboard\":[[" ///< JSON string for opening an inline keyboard.
#define OPEN_REPLY_KEYBOARD_JSON_STRING  "{\"keyboard\":["            ///< JSON string for opening a reply keyboard.
#define CLOSE_INLINE_BUTTON_JSON_STRING  "]]}"                         ///< JSON string for closing an inline keyboard.
#define CLOSE_REPLY_KEYBOARD_JSON_STRING "],\"resize_keyboard\":true,\"one_time_keyboard\":false}" ///< JSON string for closing a reply keyboard.

#define tiny_err int8_t    ///< Type alias for error codes.
#define update_id int8_t   ///< Type alias for update identifiers.

#define MESSAGES 0x01      ///< Flag indicating message updates.
#define CALLBACKS 0x02     ///< Flag indicating callback queries.
#define ALL      0XFF      ///< Flag indicating all types of updates.

/// Structure representing a bot command.
typedef struct {
    char command[32];      ///< Command string (e.g., "/start").
    char description[64];  ///< Description of the command.
} BotCommand;

/// Structure containing data for a Telegram update.
typedef struct {
    uint8_t type;          ///< Update type (e.g., message, callback).
    char * text;           ///< Text of the message.
    int chatId;            ///< Chat identifier.
    int messageId;         ///< Message identifier.
    char * callbackData;   ///< Data associated with a callback query.
    char * callBackId;     ///< Callback query identifier.
} updateData;

extern void (*message_callback)(const updateData data); ///< Callback for handling message updates.
extern void (*inline_callback)(const updateData data);  ///< Callback for handling inline button interactions.

/**
 * @brief Sets the Telegram Bot token.
 *
 * @param t Pointer to the token string.
 */
void setToken(const char * t);

/**
 * @brief Registers a callback for handling message updates.
 *
 * @param mssg_clbck Pointer to the message callback function.
 */
void setMessageCallback(void (*mssg_clbck)(const updateData data));

/**
 * @brief Registers a callback for handling inline button interactions.
 *
 * @param nln_clbck Pointer to the inline button callback function.
 */
void setInlineCallback(void (*nln_clbck)(const updateData data));

/**
 * @brief Adds a new command for the bot.
 *
 * @param command The command string.
 * @param description The description of the command.
 * @return tiny_err Error code (OK on success).
 */
tiny_err addBotCommand(const char* command, const char* description);

/**
 * @brief Sends the registered bot commands to a specific chat.
 *
 * @param chatId Chat identifier.
 * @return esp_err_t ESP error code (ESP_OK on success).
 */
esp_err_t sendBotCommands(int chatId);

/**
 * @brief Sends the registered bot commands to all users.
 *
 * @return esp_err_t ESP error code (ESP_OK on success).
 */
esp_err_t sendBotCommandsToAll();

/**
 * @brief Sends a message to a specified chat.
 *
 * @param chatId Chat identifier.
 * @param message The message text to send.
 * @return tiny_err Error code (OK on success).
 */
tiny_err sendMessage(const int chatId, const char * message);

/**
 * @brief Edits an existing message.
 *
 * @param chatId Chat identifier.
 * @param messageId Message identifier.
 * @param message New message text.
 * @return tiny_err Error code (OK on success).
 */
tiny_err editMessage(const int chatId, const int messageId, const char * message);

/**
 * @brief Retrieves updates from Telegram.
 *
 * @param allowed_updates Allowed update types.
 * @param chatId Chat identifier.
 * @return tiny_err Error code (OK on success).
 */
tiny_err getUpdates(update_id allowed_updates, int chatId);

/**
 * @brief Resets the inline keyboard buffer.
 */
void resetInlineKeyboard();

/**
 * @brief Resets the reply keyboard buffer.
 */
void resetReplyKeyboard();

/**
 * @brief Adds an inline button to the keyboard.
 *
 * @param text Button text.
 * @param callbackData Data sent when the button is pressed.
 */
void addInlineButton(const char* text, const char* callbackData);

/**
 * @brief Adds a reply button to the keyboard.
 *
 * @param text Button text.
 */
void addReplyButton(const char* text);

/**
 * @brief Sends a message with an inline keyboard.
 *
 * @param chatId Chat identifier.
 * @param text Message text.
 * @return tiny_err Error code (OK on success).
 */
tiny_err sendInlineKeyboard(const int chatId, const char * text);

/**
 * @brief Edits the inline keyboard of an existing message.
 *
 * @param chatId Chat identifier.
 * @param messageId Message identifier.
 * @return tiny_err Error code (OK on success).
 */
tiny_err editInlineKeyboard(const int chatId, const int messageId);

/**
 * @brief Sends a message with a reply keyboard.
 *
 * @param chatId Chat identifier.
 * @param text Message text.
 * @return tiny_err Error code (OK on success).
 */
tiny_err sendReplyKeyboard(const int chatId, const char* text);

/**
 * @brief Removes the keyboard from a chat.
 *
 * @param chatId Chat identifier.
 */
void removeKeyboard(int chatId);

/**
 * @brief Handles a message update received from Telegram.
 *
 * @param update Pointer to JSON update data.
 * @param chatId Chat identifier.
 * @return tiny_err Error code (OK on success).
 */
tiny_err handleMessageUpdate(cJSON *update, int chatId);

/**
 * @brief Processes updates from Telegram.
 *
 * @param allowed_updates Allowed update types.
 * @param chatId Chat identifier.
 * @return tiny_err Error code (OK on success).
 */
tiny_err processUpdate(update_id allowed_updates, int chatId);

/**
 * @brief Handles a callback query from Telegram.
 *
 * @param update Pointer to JSON update data.
 * @param chatId Chat identifier.
 * @return tiny_err Error code (OK on success).
 */
tiny_err handleCallbackQuery(cJSON *update, int chatId);

/**
 * @brief Answers a callback query.
 *
 * @param id Callback query identifier.
 * @return tiny_err Error code (OK on success).
 */
tiny_err answerCallbackQuery(char *id);

#endif //_TINYTGBOT_
