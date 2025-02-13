#ifndef _TG_BOT_H_
#define _TG_BOT_H_

/**
 * @file tg_bot.h
 * @brief Header file for Telegram Bot interaction.
 *
 * This header provides functions and macros to interact with the Telegram Bot API.
 * It includes functionalities for sending commands, processing updates, and setting up
 * UI templates for device control.
 */

#include "communication.h" 
#include "nvs_handler.h"   
#include "TinyTGBot.h"     

/* Device data identifiers */
#define LED_STRIP_DATA        "0xc1" ///< Identifier for LED strip control data.
#define SMART_SOCKET_DATA     "0xc2" ///< Identifier for smart socket control data.
#define LED_STRIP_RED_DATA    "0xc3" ///< Identifier for setting LED strip to red.
#define LED_STRIP_BLUE_DATA   "0xc5" ///< Identifier for setting LED strip to blue.
#define LED_STRIP_GREEN_DATA  "0xc6" ///< Identifier for setting LED strip to green.
#define MAIN_DATA             "0xc7" ///< Identifier for main control data.
#define SMART_SOCKET_ON_DATA  "0xc8" ///< Identifier for turning on the smart socket.
#define SMART_SOCKET_OFF_DATA "0xc9" ///< Identifier for turning off the smart socket.

extern int chat_id; ///< Chat identifier for bot interactions.

/**
 * @brief Registers the available bot commands.
 *
 * This function initializes and registers all commands that the bot will support.
 */
void registerCommands();

/**
 * @brief Callback function for processing main bot commands.
 *
 * This function handles primary commands received via Telegram updates.
 *
 * @param data Telegram update data containing command and message details.
 */
void mainCommandsCallback(const updateData data);

/**
 * @brief Processes callback queries from Telegram.
 *
 * This function handles interactive responses (e.g., from inline keyboards).
 *
 * @param data Telegram update data related to callback queries.
 */
void processCallback(const updateData data);

/**
 * @brief Callback function for registration commands.
 *
 * This function processes registration commands received via Telegram.
 *
 * @param data Telegram update data containing registration details.
 */
void regCallback(const updateData data);

/**
 * @brief Sets up the LED strip control template.
 *
 * Configures and sends the LED strip control template to the user interface.
 */
void set_led_strip_template();

/**
 * @brief Sets up the main menu template.
 *
 * Configures and sends the main menu template for bot interactions.
 */
void set_main_menu_template();

/**
 * @brief Sets up the smart socket control template.
 *
 * Configures and sends the smart socket control template to the user interface.
 */
void set_socket_template();

#endif //_TG_BOT_H_
