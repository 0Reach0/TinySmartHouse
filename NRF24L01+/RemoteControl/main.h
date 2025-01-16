#ifndef _MAIN__H_
#define _MAIN__H_

#include "NRF24.H"

//change this defines due to ur hardware


//set up RC_PINS - REMOTE CONTROL PINS DUE TO UR HARDWARE 
#define RC_PIN1 GPIOD, GPIO_PIN_1
#define RC_PIN2 GPIOD, GPIO_PIN_2
#define RC_PIN3 GPIOD, GPIO_PIN_3
#define RC_PIN4 GPIOA, GPIO_PIN_2
#define RC_PIN5 GPIOA, GPIO_PIN_1
#define RC_PIN6 GPIOD, GPIO_PIN_6
#define RC_PIN7 GPIOD, GPIO_PIN_5
#define RC_PIN8 GPIOD, GPIO_PIN_4

/////////////////////////////////////////


//change this defines due to ur needs

#define DEFAULT_MOD 0x00

#define DEFAULT_ADDRESS 0x01


#define LED_STRIP


#define STRIP_MOD  0x00
#define LED_STRIP_ADDRESS 0x01


#define STRIP_MOD_BUTTON col == 4 && row == 1  
#define RED_COLOUR_BUTTON   col == 1 && row == 1
#define GREEN_COLOUR_BUTTON col == 1 && row == 2
#define BLUE_COLOUR_BUTTON  col == 1 && row == 3






#define SOCKET

#define SOCKET_MOD 0x01
#define SOCKET_ADDRESS 0x02


#define SOCKET_MOD_BUTTON col == 2 && row == 4



//////////////////////////////////////




uint8_t waiting_for_click(uint8_t * row, uint8_t * col, uint8_t t); //t - timeout in ms


uint8_t swap_chanel(uint8_t chanel);

void delay_ms(uint16_t ms);

#ifdef LED_STRIP

    uint8_t procces_LEDStrip(uint8_t row, uint8_t col);

#endif //LED_STRIP


#ifdef SOCKET

    uint8_t procces_socket(uint8_t row, uint8_t col);

#endif //SOCKET

#endif //_MAIN__H_