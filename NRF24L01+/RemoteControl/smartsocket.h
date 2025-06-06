/**
 * @file smartsocket.h
 * @brief Main header for LedStrip module
*/

#ifndef _SMART_SOCKET__H_
#define _SMART_SOCKET__H_



#define SOCKET                    ///< Enable socket functionality
#define SOCKET_MOD 0x01           ///< Socket operating mode
#define SOCKET_ADDRESS_SIZE 5     ///< Socket addr width
#define SOCKET_ON_BUTTON   (col == 1 && row == 1)  
#define SOCKET_OFF_BUTTON (col == 1 && row == 2)  
#define CMD_SOCKET_ON 0x50
#define CMD_SOCKET_OFF 0x51
#define SOCKET_MOD_BUTTON (col == 4 && row == 2)    ///< Macro for socket mode button
#define SMART_SOCKET_DATA_SIZE 1


uint8_t smartSocketAddr[SOCKET_ADDRESS_SIZE];


/**
 * @brief Processes socket commands.
 *
 * Handles socket control based on the pressed button's row and column.
 *
 * @param row The row number of the pressed button.
 * @param col The column number of the pressed button.
 * @return uint8_t Status code indicating success or failure.
 */ 
uint8_t procces_socket(uint8_t row, uint8_t col);


uint8_t SWITCH_TO_SOCKET_MODE(void);

#endif
