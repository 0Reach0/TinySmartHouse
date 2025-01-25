   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.3 - 22 Aug 2024
  42                     ; 51 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
  42                     ; 52 {
  43                     	switch	.text
  44  0000               f_TRAP_IRQHandler:
  48                     ; 56 }
  51  0000 80            	iret
  73                     ; 63 INTERRUPT_HANDLER(TLI_IRQHandler, 0)
  73                     ; 64 
  73                     ; 65 {
  74                     	switch	.text
  75  0001               f_TLI_IRQHandler:
  79                     ; 69 }
  82  0001 80            	iret
 104                     ; 76 INTERRUPT_HANDLER(AWU_IRQHandler, 1)
 104                     ; 77 {
 105                     	switch	.text
 106  0002               f_AWU_IRQHandler:
 110                     ; 81 }
 113  0002 80            	iret
 135                     ; 88 INTERRUPT_HANDLER(CLK_IRQHandler, 2)
 135                     ; 89 {
 136                     	switch	.text
 137  0003               f_CLK_IRQHandler:
 141                     ; 93 }
 144  0003 80            	iret
 167                     ; 100 INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
 167                     ; 101 {
 168                     	switch	.text
 169  0004               f_EXTI_PORTA_IRQHandler:
 173                     ; 105 }
 176  0004 80            	iret
 199                     ; 113 INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
 199                     ; 114 {
 200                     	switch	.text
 201  0005               f_EXTI_PORTB_IRQHandler:
 205                     ; 118 }
 208  0005 80            	iret
 231                     ; 125 INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
 231                     ; 126 {
 232                     	switch	.text
 233  0006               f_EXTI_PORTC_IRQHandler:
 237                     ; 130 }
 240  0006 80            	iret
 270                     ; 138 INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6) {
 271                     	switch	.text
 272  0007               f_EXTI_PORTD_IRQHandler:
 274  0007 8a            	push	cc
 275  0008 84            	pop	a
 276  0009 a4bf          	and	a,#191
 277  000b 88            	push	a
 278  000c 86            	pop	cc
 279  000d 3b0002        	push	c_x+2
 280  0010 be00          	ldw	x,c_x
 281  0012 89            	pushw	x
 282  0013 3b0002        	push	c_y+2
 283  0016 be00          	ldw	x,c_y
 284  0018 89            	pushw	x
 287                     ; 139 	GPIO_WriteHigh(GPIOB, GPIO_PIN_5);
 289  0019 4b20          	push	#32
 290  001b ae5005        	ldw	x,#20485
 291  001e cd0000        	call	_GPIO_WriteHigh
 293  0021 84            	pop	a
 294                     ; 140     if (GPIO_ReadInputPin(RC_PIN1) == RESET) {
 296  0022 4b02          	push	#2
 297  0024 ae500f        	ldw	x,#20495
 298  0027 cd0000        	call	_GPIO_ReadInputPin
 300  002a 5b01          	addw	sp,#1
 301  002c 4d            	tnz	a
 302  002d 2623          	jrne	L111
 303                     ; 141 				Init_Pins();
 305  002f cd0000        	call	_Init_Pins
 307                     ; 142         if(!Init_NRF()) {
 309  0032 cd0000        	call	_Init_NRF
 311  0035 4d            	tnz	a
 312  0036 261b          	jrne	L121
 313  0038               L511:
 314                     ; 145 						GPIO_WriteLow(GPIOB, GPIO_PIN_5);
 316  0038 4b20          	push	#32
 317  003a ae5005        	ldw	x,#20485
 318  003d cd0000        	call	_GPIO_WriteLow
 320  0040 84            	pop	a
 321                     ; 146 						delay(10);
 323  0041 ae000a        	ldw	x,#10
 324  0044 cd0000        	call	_delay
 326                     ; 147 						GPIO_WriteHigh(GPIOB, GPIO_PIN_5);
 328  0047 4b20          	push	#32
 329  0049 ae5005        	ldw	x,#20485
 330  004c cd0000        	call	_GPIO_WriteHigh
 332  004f 84            	pop	a
 334  0050 20e6          	jra	L511
 335  0052               L111:
 336                     ; 155         wfi();
 339  0052 8f            wfi
 341  0053               L121:
 342                     ; 157 		return;
 345  0053 85            	popw	x
 346  0054 bf00          	ldw	c_y,x
 347  0056 320002        	pop	c_y+2
 348  0059 85            	popw	x
 349  005a bf00          	ldw	c_x,x
 350  005c 320002        	pop	c_x+2
 351  005f 80            	iret
 374                     ; 165 INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
 374                     ; 166 {
 375                     	switch	.text
 376  0060               f_EXTI_PORTE_IRQHandler:
 380                     ; 170 }
 383  0060 80            	iret
 405                     ; 217 INTERRUPT_HANDLER(SPI_IRQHandler, 10)
 405                     ; 218 {
 406                     	switch	.text
 407  0061               f_SPI_IRQHandler:
 411                     ; 222 }
 414  0061 80            	iret
 437                     ; 229 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
 437                     ; 230 {
 438                     	switch	.text
 439  0062               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
 443                     ; 234 }
 446  0062 80            	iret
 469                     ; 241 INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
 469                     ; 242 {
 470                     	switch	.text
 471  0063               f_TIM1_CAP_COM_IRQHandler:
 475                     ; 246 }
 478  0063 80            	iret
 501                     ; 279  INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
 501                     ; 280  {
 502                     	switch	.text
 503  0064               f_TIM2_UPD_OVF_BRK_IRQHandler:
 507                     ; 284  }
 510  0064 80            	iret
 533                     ; 291  INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
 533                     ; 292  {
 534                     	switch	.text
 535  0065               f_TIM2_CAP_COM_IRQHandler:
 539                     ; 296  }
 542  0065 80            	iret
 565                     ; 333  INTERRUPT_HANDLER(UART1_TX_IRQHandler, 17)
 565                     ; 334  {
 566                     	switch	.text
 567  0066               f_UART1_TX_IRQHandler:
 571                     ; 338  }
 574  0066 80            	iret
 597                     ; 345  INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
 597                     ; 346  {
 598                     	switch	.text
 599  0067               f_UART1_RX_IRQHandler:
 603                     ; 350  }
 606  0067 80            	iret
 628                     ; 384 INTERRUPT_HANDLER(I2C_IRQHandler, 19)
 628                     ; 385 {
 629                     	switch	.text
 630  0068               f_I2C_IRQHandler:
 634                     ; 389 }
 637  0068 80            	iret
 659                     ; 463  INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
 659                     ; 464  {
 660                     	switch	.text
 661  0069               f_ADC1_IRQHandler:
 665                     ; 468  }
 668  0069 80            	iret
 691                     ; 489  INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
 691                     ; 490  {
 692                     	switch	.text
 693  006a               f_TIM4_UPD_OVF_IRQHandler:
 697                     ; 494  }
 700  006a 80            	iret
 723                     ; 502 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
 723                     ; 503 {
 724                     	switch	.text
 725  006b               f_EEPROM_EEC_IRQHandler:
 729                     ; 507 }
 732  006b 80            	iret
 744                     	xref	_Init_NRF
 745                     	xref	_Init_Pins
 746                     	xref	_delay
 747                     	xdef	f_EEPROM_EEC_IRQHandler
 748                     	xdef	f_TIM4_UPD_OVF_IRQHandler
 749                     	xdef	f_ADC1_IRQHandler
 750                     	xdef	f_I2C_IRQHandler
 751                     	xdef	f_UART1_RX_IRQHandler
 752                     	xdef	f_UART1_TX_IRQHandler
 753                     	xdef	f_TIM2_CAP_COM_IRQHandler
 754                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
 755                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
 756                     	xdef	f_TIM1_CAP_COM_IRQHandler
 757                     	xdef	f_SPI_IRQHandler
 758                     	xdef	f_EXTI_PORTE_IRQHandler
 759                     	xdef	f_EXTI_PORTD_IRQHandler
 760                     	xdef	f_EXTI_PORTC_IRQHandler
 761                     	xdef	f_EXTI_PORTB_IRQHandler
 762                     	xdef	f_EXTI_PORTA_IRQHandler
 763                     	xdef	f_CLK_IRQHandler
 764                     	xdef	f_AWU_IRQHandler
 765                     	xdef	f_TLI_IRQHandler
 766                     	xdef	f_TRAP_IRQHandler
 767                     	xref	_GPIO_ReadInputPin
 768                     	xref	_GPIO_WriteLow
 769                     	xref	_GPIO_WriteHigh
 770                     	xref.b	c_x
 771                     	xref.b	c_y
 790                     	end
