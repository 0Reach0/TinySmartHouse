#include "stm8s.h"
#include "main.h"

//GLOBAL VARIABLES
uint8_t CURRENT_MODE = DEFAULT_MOD;
 uint8_t txaddr[5] = {DEFAULT_ADDRESS, DEFAULT_ADDRESS, DEFAULT_ADDRESS,  DEFAULT_ADDRESS, DEFAULT_ADDRESS};
uint8_t row;
		uint8_t col;
//end GLOBAL VARIABLES




void Init_Pins(void) {

	//rows
    GPIO_Init(RC_PIN5, GPIO_MODE_OUT_PP_LOW_FAST); 
    GPIO_Init(RC_PIN6, GPIO_MODE_OUT_PP_LOW_FAST); 
    GPIO_Init(RC_PIN7, GPIO_MODE_OUT_PP_LOW_FAST);
    GPIO_Init(RC_PIN8, GPIO_MODE_OUT_PP_LOW_FAST);

		//collumns
    GPIO_Init(RC_PIN1, GPIO_MODE_IN_PU_NO_IT); // ?????? 1
    GPIO_Init(RC_PIN2, GPIO_MODE_IN_PU_NO_IT); // ?????? 2
    GPIO_Init(RC_PIN3, GPIO_MODE_IN_PU_NO_IT); // ?????? 3
    GPIO_Init(RC_PIN4, GPIO_MODE_IN_PU_NO_IT); // ?????? 4

}

uint8_t Init_NRF(void)
{
		uint8_t reg;
    SPI_Init_NRF();
    tx_init();
    delay(10);
    SET_TX_ADDR(txaddr, 5);
    delay(10);
    reg = test_tx();
    if(reg!= 0)
    {
        return 0;
    }
    return 1  ;
}


uint8_t waiting_for_click(uint8_t *row, uint8_t *col, uint8_t t) {
    uint8_t timeCounter = 0;
    while (1) {
        GPIO_WriteLow(RC_PIN5); GPIO_WriteHigh(RC_PIN6); GPIO_WriteHigh(RC_PIN7); GPIO_WriteHigh(RC_PIN8);
        if (GPIO_ReadInputPin(RC_PIN1) == RESET) { *row = 1; *col = 1; return 1; }
        if (GPIO_ReadInputPin(RC_PIN2) == RESET) { *row = 2; *col = 1; return 1; }
        if (GPIO_ReadInputPin(RC_PIN3) == RESET) { *row = 3; *col = 1; return 1; }
        if (GPIO_ReadInputPin(RC_PIN4) == RESET) { *row = 4; *col = 1; return 1; }
        delay(10);

        GPIO_WriteHigh(RC_PIN5); GPIO_WriteLow(RC_PIN6); GPIO_WriteHigh(RC_PIN7); GPIO_WriteHigh(RC_PIN8);
        if (GPIO_ReadInputPin(RC_PIN1) == RESET) { *row = 1; *col = 2; return 1; }
        if (GPIO_ReadInputPin(RC_PIN2) == RESET) { *row = 2; *col = 2; return 1; }
        if (GPIO_ReadInputPin(RC_PIN3) == RESET) { *row = 3; *col = 2; return 1; }
        if (GPIO_ReadInputPin(RC_PIN4) == RESET) { *row = 4; *col = 2; return 1; }
        delay(10);

        GPIO_WriteHigh(RC_PIN5); GPIO_WriteHigh(RC_PIN6); GPIO_WriteLow(RC_PIN7); GPIO_WriteHigh(RC_PIN8);
        if (GPIO_ReadInputPin(RC_PIN1) == RESET) { *row = 1; *col = 3; return 1; }
        if (GPIO_ReadInputPin(RC_PIN2) == RESET) { *row = 2; *col = 3; return 1; }
        if (GPIO_ReadInputPin(RC_PIN3) == RESET) { *row = 3; *col = 3; return 1; }
        if (GPIO_ReadInputPin(RC_PIN4) == RESET) { *row = 4; *col = 3; return 1; }
        delay(10);

        GPIO_WriteHigh(RC_PIN5); GPIO_WriteHigh(RC_PIN6); GPIO_WriteHigh(RC_PIN7); GPIO_WriteLow(RC_PIN8);
        if (GPIO_ReadInputPin(RC_PIN1) == RESET) { *row = 1; *col = 4; return 1; }
        if (GPIO_ReadInputPin(RC_PIN2) == RESET) { *row = 2; *col = 4; return 1; }
        if (GPIO_ReadInputPin(RC_PIN3) == RESET) { *row = 3; *col = 4; return 1; }
        if (GPIO_ReadInputPin(RC_PIN4) == RESET) { *row = 4; *col = 4; return 1; }
        delay(10);

        if (t != 0) {
            timeCounter++;
            if (timeCounter >= t) {
                return 0;  
            }
        }
    }
}


#ifdef LED_STRIP



uint8_t SWITCH_TO_LESDSTRIP_MODE(void) {
        uint8_t txaddr1[] = {LED_STRIP_ADDRESS, LED_STRIP_ADDRESS, LED_STRIP_ADDRESS, LED_STRIP_ADDRESS, LED_STRIP_ADDRESS};
		CURRENT_MODE = STRIP_MOD;
    SET_TX_ADDR(txaddr1, 5);
    delay(10);
    return 1;
}


uint8_t procces_LEDStrip(uint8_t row, uint8_t col) {
    uint8_t buf[3];
		
if (RED_COLOUR_BUTTON) {
    uint8_t buf[] = {254, 0, 0};
    tx_send(buf, 3);
} 
else if (GREEN_COLOUR_BUTTON) {
    uint8_t buf[] = {0, 254, 0};
    tx_send(buf, 3);
} 
else if (BLUE_COLOUR_BUTTON) {
    uint8_t buf[] = {0, 0, 254};
    tx_send(buf, 3);
}
    return 1;
}

#endif //LED_STRIP


#ifdef SOCKET

uint8_t procces_socket(uint8_t row, uint8_t col) {
    // Process socket
    return 1;
}

#endif //SOCKET


#ifdef POWER_SAVE_MODE
    void POWERSAVE(void)
    {
				nrf_deinit();
				delay(10);
        SPI_DeInit_NRF();
				
        //rows
        GPIO_DeInit(GPIOD);
				GPIO_DeInit(GPIOA);

        //Waiting for cAlick "*"
				GPIO_Init(RC_PIN5, GPIO_MODE_OUT_PP_LOW_FAST);
        GPIO_WriteLow(RC_PIN5);
        GPIO_Init(RC_PIN1, GPIO_MODE_IN_PU_IT);
        EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOD, EXTI_SENSITIVITY_FALL_ONLY);
        enableInterrupts();
				wfi();
        



    }
#endif


#include "stm8s.h"


void SystemClock_Config(void) {
    // ???????? ?????????? ???????????????? ????????? (HSI)
    CLK_HSICmd(ENABLE);

    // ????, ???? HSI ???????????????
    while (CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == RESET);

    // ??????????? ???????? ??? HSI
    CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV8); // HSI = 16 ??? / 8 = 2 ???

    // ??????????? ???????? ??? CPU
    CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV128); // CPU = 2 ??? / 128 = 15.625 ???

    // ????????????? HSI ??? ???????? ?????????? ????????? ???????
    CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, DISABLE, CLK_CURRENTCLOCKSTATE_DISABLE);
}



void main(void) {
    uint8_t res;
     Init_Pins();
		GPIO_Init(GPIOB, GPIO_PIN_5, GPIO_MODE_OUT_PP_HIGH_FAST);
		if(!Init_NRF()) {
        while(1);
    }
    while (1) {
        res = waiting_for_click(&row, &col, 0);
						GPIO_WriteLow(GPIOB, GPIO_PIN_5);
        if (res) {
        {
					
						#ifdef POWER_SAVE_MODE
                if(POWER_SAVE_BUTTON) {
                    POWERSAVE();
										GPIO_WriteHigh(GPIOB, GPIO_PIN_5);
                    continue;
                }	
						#endif
            #ifdef LED_STRIP
                if(STRIP_MOD_BUTTON) {
                    SWITCH_TO_LESDSTRIP_MODE();
                }
                else if(CURRENT_MODE == STRIP_MOD) {
                    procces_LEDStrip(row, col);
										GPIO_WriteHigh(GPIOB, GPIO_PIN_5);
                    continue;
                }
            #endif LED_STRIP



			#ifdef SOCKET
                if(SOCKET_MOD_BUTTON) continue;
            #endif //SOCKET



        }  
				GPIO_WriteHigh(GPIOB, GPIO_PIN_5);
    }
	}
}






#ifdef USE_FULL_ASSERT
void assert_failed(uint8_t* file, uint32_t line) {
    // ??????????? ???? ? ?????? ??????
    while (1);
}
#endif
