#include "main.h"
#include "tinytp.h"

uint8_t ledStripAddr[LED_ADDRESS_SIZE] = {0x1, 0x1, 0x1, 0x1, 0x1};

void SetUp_GPIO(void)
{
    GPIO_Init(GPIOD, GPIO_PIN_2, GPIO_MODE_OUT_PP_LOW_FAST);
    GPIO_Init(GPIOD, GPIO_PIN_3, GPIO_MODE_OUT_PP_LOW_FAST);
    GPIO_Init(GPIOD, GPIO_PIN_4, GPIO_MODE_OUT_PP_LOW_FAST);
    GPIO_Init(GPIOB, GPIO_PIN_5, GPIO_MODE_OUT_PP_HIGH_FAST);
}

void Init_NRF(void)
{
    uint8_t *rxaddr = ledStripAddr;
    uint8_t status;
    SPI_Init_NRF();
    delay(10);
    rx_init();
    SET_PPE0_ADDR(rxaddr, 5);
    delay(10);
    SET_PPE0_SIZE(LED_PIPE_SIZE);
    delay(10);
    status = test_rx();
    if (status != 0)
    {
        GPIO_WriteLow(GPIOB, GPIO_PIN_5);
        while (1);
    }
}

void SetUp_TIM2_PWM(void)
{
    CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, ENABLE);

    TIM2_TimeBaseInit(TIM2_PRESCALER_16, 999);

    TIM2_OC1Init(TIM2_OCMODE_PWM1, TIM2_OUTPUTSTATE_ENABLE, 0, TIM2_OCPOLARITY_HIGH);
    TIM2_OC1PreloadConfig(ENABLE);

    TIM2_OC2Init(TIM2_OCMODE_PWM1, TIM2_OUTPUTSTATE_ENABLE, 0, TIM2_OCPOLARITY_HIGH);
    TIM2_OC2PreloadConfig(ENABLE);

    TIM2_OC3Init(TIM2_OCMODE_PWM1, TIM2_OUTPUTSTATE_ENABLE, 0, TIM2_OCPOLARITY_HIGH);
    TIM2_OC3PreloadConfig(ENABLE);

    TIM2_Cmd(ENABLE);
}

void Set_Colour(uint8_t r, uint8_t g, uint8_t b)
{
    TIM2_SetCompare1(r);
    TIM2_SetCompare2(g);
    TIM2_SetCompare3(b);
}

void main(void)
{
    struct dataPackage rDataPackage;
    uint8_t reg;
    uint8_t buf[sizeof(struct dataPackage)];

    SetUp_GPIO();
    SetUp_TIM2_PWM();
    Init_NRF();

    while (1)
    {
        reg = read_register(STATUS_REGISTER);
        delay(10);

        if (reg & (1 << 6))
        {
            GPIO_WriteLow(GPIOB, GPIO_PIN_5);

            rx_read(buf, LED_PIPE_SIZE);
            deserializeDataPackage(&rDataPackage, buf);

            Set_Colour(
                rDataPackage.data[0],
                rDataPackage.data[1],
                rDataPackage.data[2]);

            reset_status();
            delay(10);
            flush_rx();
            GPIO_WriteHigh(GPIOB, GPIO_PIN_5);
        }
    }
}

#ifdef USE_FULL_ASSERT
void assert_failed(uint8_t* file, uint32_t line) {
    while (1);
}
#endif