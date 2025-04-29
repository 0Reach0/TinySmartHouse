   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.3 - 22 Aug 2024
  44                     ; 13 @far @interrupt void NonHandledInterrupt (void)
  44                     ; 14 {
  45                     	switch	.text
  46  0000               f_NonHandledInterrupt:
  50                     ; 18 	return;
  53  0000 80            	iret
  55                     .const:	section	.text
  56  0000               __vectab:
  57  0000 82            	dc.b	130
  59  0001 00            	dc.b	page(__stext)
  60  0002 0000          	dc.w	__stext
  61  0004 82            	dc.b	130
  63  0005 00            	dc.b	page(f_TRAP_IRQHandler)
  64  0006 0000          	dc.w	f_TRAP_IRQHandler
  65  0008 82            	dc.b	130
  67  0009 00            	dc.b	page(f_TLI_IRQHandler)
  68  000a 0000          	dc.w	f_TLI_IRQHandler
  69  000c 82            	dc.b	130
  71  000d 00            	dc.b	page(f_AWU_IRQHandler)
  72  000e 0000          	dc.w	f_AWU_IRQHandler
  73  0010 82            	dc.b	130
  75  0011 00            	dc.b	page(f_CLK_IRQHandler)
  76  0012 0000          	dc.w	f_CLK_IRQHandler
  77  0014 82            	dc.b	130
  79  0015 00            	dc.b	page(f_EXTI_PORTA_IRQHandler)
  80  0016 0000          	dc.w	f_EXTI_PORTA_IRQHandler
  81  0018 82            	dc.b	130
  83  0019 00            	dc.b	page(f_EXTI_PORTB_IRQHandler)
  84  001a 0000          	dc.w	f_EXTI_PORTB_IRQHandler
  85  001c 82            	dc.b	130
  87  001d 00            	dc.b	page(f_EXTI_PORTC_IRQHandler)
  88  001e 0000          	dc.w	f_EXTI_PORTC_IRQHandler
  89  0020 82            	dc.b	130
  91  0021 00            	dc.b	page(f_EXTI_PORTD_IRQHandler)
  92  0022 0000          	dc.w	f_EXTI_PORTD_IRQHandler
  93  0024 82            	dc.b	130
  95  0025 00            	dc.b	page(f_EXTI_PORTE_IRQHandler)
  96  0026 0000          	dc.w	f_EXTI_PORTE_IRQHandler
  97  0028 82            	dc.b	130
  99  0029 00            	dc.b	page(f_NonHandledInterrupt)
 100  002a 0000          	dc.w	f_NonHandledInterrupt
 101  002c 82            	dc.b	130
 103  002d 00            	dc.b	page(f_NonHandledInterrupt)
 104  002e 0000          	dc.w	f_NonHandledInterrupt
 105  0030 82            	dc.b	130
 107  0031 00            	dc.b	page(f_SPI_IRQHandler)
 108  0032 0000          	dc.w	f_SPI_IRQHandler
 109  0034 82            	dc.b	130
 111  0035 00            	dc.b	page(f_TIM1_UPD_OVF_TRG_BRK_IRQHandler)
 112  0036 0000          	dc.w	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
 113  0038 82            	dc.b	130
 115  0039 00            	dc.b	page(f_TIM1_CAP_COM_IRQHandler)
 116  003a 0000          	dc.w	f_TIM1_CAP_COM_IRQHandler
 117  003c 82            	dc.b	130
 119  003d 00            	dc.b	page(f_TIM2_UPD_OVF_BRK_IRQHandler)
 120  003e 0000          	dc.w	f_TIM2_UPD_OVF_BRK_IRQHandler
 121  0040 82            	dc.b	130
 123  0041 00            	dc.b	page(f_TIM2_CAP_COM_IRQHandler)
 124  0042 0000          	dc.w	f_TIM2_CAP_COM_IRQHandler
 125  0044 82            	dc.b	130
 127  0045 00            	dc.b	page(f_NonHandledInterrupt)
 128  0046 0000          	dc.w	f_NonHandledInterrupt
 129  0048 82            	dc.b	130
 131  0049 00            	dc.b	page(f_NonHandledInterrupt)
 132  004a 0000          	dc.w	f_NonHandledInterrupt
 133  004c 82            	dc.b	130
 135  004d 00            	dc.b	page(f_UART1_TX_IRQHandler)
 136  004e 0000          	dc.w	f_UART1_TX_IRQHandler
 137  0050 82            	dc.b	130
 139  0051 00            	dc.b	page(f_UART1_RX_IRQHandler)
 140  0052 0000          	dc.w	f_UART1_RX_IRQHandler
 141  0054 82            	dc.b	130
 143  0055 00            	dc.b	page(f_I2C_IRQHandler)
 144  0056 0000          	dc.w	f_I2C_IRQHandler
 145  0058 82            	dc.b	130
 147  0059 00            	dc.b	page(f_NonHandledInterrupt)
 148  005a 0000          	dc.w	f_NonHandledInterrupt
 149  005c 82            	dc.b	130
 151  005d 00            	dc.b	page(f_NonHandledInterrupt)
 152  005e 0000          	dc.w	f_NonHandledInterrupt
 153  0060 82            	dc.b	130
 155  0061 00            	dc.b	page(f_ADC1_IRQHandler)
 156  0062 0000          	dc.w	f_ADC1_IRQHandler
 157  0064 82            	dc.b	130
 159  0065 00            	dc.b	page(f_TIM4_UPD_OVF_IRQHandler)
 160  0066 0000          	dc.w	f_TIM4_UPD_OVF_IRQHandler
 161  0068 82            	dc.b	130
 163  0069 00            	dc.b	page(f_EEPROM_EEC_IRQHandler)
 164  006a 0000          	dc.w	f_EEPROM_EEC_IRQHandler
 165  006c 82            	dc.b	130
 167  006d 00            	dc.b	page(f_NonHandledInterrupt)
 168  006e 0000          	dc.w	f_NonHandledInterrupt
 169  0070 82            	dc.b	130
 171  0071 00            	dc.b	page(f_NonHandledInterrupt)
 172  0072 0000          	dc.w	f_NonHandledInterrupt
 173  0074 82            	dc.b	130
 175  0075 00            	dc.b	page(f_NonHandledInterrupt)
 176  0076 0000          	dc.w	f_NonHandledInterrupt
 177  0078 82            	dc.b	130
 179  0079 00            	dc.b	page(f_NonHandledInterrupt)
 180  007a 0000          	dc.w	f_NonHandledInterrupt
 181  007c 82            	dc.b	130
 183  007d 00            	dc.b	page(f_NonHandledInterrupt)
 184  007e 0000          	dc.w	f_NonHandledInterrupt
 235                     	xdef	__vectab
 236                     	xref	f_EEPROM_EEC_IRQHandler
 237                     	xref	f_TIM4_UPD_OVF_IRQHandler
 238                     	xref	f_ADC1_IRQHandler
 239                     	xref	f_I2C_IRQHandler
 240                     	xref	f_UART1_RX_IRQHandler
 241                     	xref	f_UART1_TX_IRQHandler
 242                     	xref	f_TIM2_CAP_COM_IRQHandler
 243                     	xref	f_TIM2_UPD_OVF_BRK_IRQHandler
 244                     	xref	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
 245                     	xref	f_TIM1_CAP_COM_IRQHandler
 246                     	xref	f_SPI_IRQHandler
 247                     	xref	f_EXTI_PORTE_IRQHandler
 248                     	xref	f_EXTI_PORTD_IRQHandler
 249                     	xref	f_EXTI_PORTC_IRQHandler
 250                     	xref	f_EXTI_PORTB_IRQHandler
 251                     	xref	f_EXTI_PORTA_IRQHandler
 252                     	xref	f_CLK_IRQHandler
 253                     	xref	f_AWU_IRQHandler
 254                     	xref	f_TLI_IRQHandler
 255                     	xref	f_TRAP_IRQHandler
 256                     	xdef	f_NonHandledInterrupt
 257                     	xref	__stext
 276                     	end
