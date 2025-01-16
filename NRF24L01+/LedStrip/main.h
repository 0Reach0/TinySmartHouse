#ifndef _MAIN__H_
#define _MAIN__H_
#include "stm8s_gpio.h"
#include "nrf24.h"
#include "stm8s.h"
#include "stm8s_tim2.h"


#define LED_PIPE_SIZE 3
 
#define LED_ADDRESS 0x01 
 
void SetUp_GPIO(void);

void SetUp_TIM2_PWM(void);

void Set_Colour(uint8_t r, uint8_t g, uint8_t b);



#endif //_MAIN__H_