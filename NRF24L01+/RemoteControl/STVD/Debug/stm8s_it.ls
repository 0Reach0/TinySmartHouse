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
 271                     ; 138 INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6) {
 272                     	switch	.text
 273  0007               f_EXTI_PORTD_IRQHandler:
 275  0007 8a            	push	cc
 276  0008 84            	pop	a
 277  0009 a4bf          	and	a,#191
 278  000b 88            	push	a
 279  000c 86            	pop	cc
 280  000d 3b0002        	push	c_x+2
 281  0010 be00          	ldw	x,c_x
 282  0012 89            	pushw	x
 283  0013 3b0002        	push	c_y+2
 284  0016 be00          	ldw	x,c_y
 285  0018 89            	pushw	x
 288                     ; 139 	GPIO_WriteHigh(GPIOB, GPIO_PIN_5);
 290  0019 4b20          	push	#32
 291  001b ae5005        	ldw	x,#20485
 292  001e cd0000        	call	_GPIO_WriteHigh
 294  0021 84            	pop	a
 295                     ; 140 	delay(1);
 297  0022 ae0001        	ldw	x,#1
 298  0025 cd0000        	call	_delay
 300                     ; 141     if (GPIO_ReadInputPin(RC_PIN1) == RESET) {
 302  0028 4b02          	push	#2
 303  002a ae500f        	ldw	x,#20495
 304  002d cd0000        	call	_GPIO_ReadInputPin
 306  0030 5b01          	addw	sp,#1
 307  0032 4d            	tnz	a
 308  0033 2623          	jrne	L111
 309                     ; 142           init_pins();
 311  0035 cd0000        	call	_init_pins
 313                     ; 143         if(!Init_NRF()) {
 315  0038 cd0000        	call	_Init_NRF
 317  003b 4d            	tnz	a
 318  003c 261b          	jrne	L121
 319  003e               L511:
 320                     ; 146 						GPIO_WriteLow(GPIOB, GPIO_PIN_5);
 322  003e 4b20          	push	#32
 323  0040 ae5005        	ldw	x,#20485
 324  0043 cd0000        	call	_GPIO_WriteLow
 326  0046 84            	pop	a
 327                     ; 147 						delay_ms(1000);
 329  0047 ae03e8        	ldw	x,#1000
 330  004a cd0000        	call	_delay_ms
 332                     ; 148 						GPIO_WriteHigh(GPIOB, GPIO_PIN_5);
 334  004d 4b20          	push	#32
 335  004f ae5005        	ldw	x,#20485
 336  0052 cd0000        	call	_GPIO_WriteHigh
 338  0055 84            	pop	a
 340  0056 20e6          	jra	L511
 341  0058               L111:
 342                     ; 156         wfi();
 345  0058 8f            wfi
 347  0059               L121:
 348                     ; 158 		return;
 351  0059 85            	popw	x
 352  005a bf00          	ldw	c_y,x
 353  005c 320002        	pop	c_y+2
 354  005f 85            	popw	x
 355  0060 bf00          	ldw	c_x,x
 356  0062 320002        	pop	c_x+2
 357  0065 80            	iret
 380                     ; 166 INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
 380                     ; 167 {
 381                     	switch	.text
 382  0066               f_EXTI_PORTE_IRQHandler:
 386                     ; 171 }
 389  0066 80            	iret
 411                     ; 218 INTERRUPT_HANDLER(SPI_IRQHandler, 10)
 411                     ; 219 {
 412                     	switch	.text
 413  0067               f_SPI_IRQHandler:
 417                     ; 223 }
 420  0067 80            	iret
 443                     ; 230 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
 443                     ; 231 {
 444                     	switch	.text
 445  0068               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
 449                     ; 235 }
 452  0068 80            	iret
 475                     ; 242 INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
 475                     ; 243 {
 476                     	switch	.text
 477  0069               f_TIM1_CAP_COM_IRQHandler:
 481                     ; 247 }
 484  0069 80            	iret
 507                     ; 280  INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
 507                     ; 281  {
 508                     	switch	.text
 509  006a               f_TIM2_UPD_OVF_BRK_IRQHandler:
 513                     ; 285  }
 516  006a 80            	iret
 539                     ; 292  INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
 539                     ; 293  {
 540                     	switch	.text
 541  006b               f_TIM2_CAP_COM_IRQHandler:
 545                     ; 297  }
 548  006b 80            	iret
 571                     ; 334  INTERRUPT_HANDLER(UART1_TX_IRQHandler, 17)
 571                     ; 335  {
 572                     	switch	.text
 573  006c               f_UART1_TX_IRQHandler:
 577                     ; 339  }
 580  006c 80            	iret
 603                     ; 346  INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
 603                     ; 347  {
 604                     	switch	.text
 605  006d               f_UART1_RX_IRQHandler:
 609                     ; 351  }
 612  006d 80            	iret
 634                     ; 385 INTERRUPT_HANDLER(I2C_IRQHandler, 19)
 634                     ; 386 {
 635                     	switch	.text
 636  006e               f_I2C_IRQHandler:
 640                     ; 390 }
 643  006e 80            	iret
 665                     ; 464  INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
 665                     ; 465  {
 666                     	switch	.text
 667  006f               f_ADC1_IRQHandler:
 671                     ; 469  }
 674  006f 80            	iret
 697                     ; 490  INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
 697                     ; 491  {
 698                     	switch	.text
 699  0070               f_TIM4_UPD_OVF_IRQHandler:
 703                     ; 495  }
 706  0070 80            	iret
 729                     ; 503 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
 729                     ; 504 {
 730                     	switch	.text
 731  0071               f_EEPROM_EEC_IRQHandler:
 735                     ; 508 }
 738  0071 80            	iret
 750                     	xref	_Init_NRF
 751                     	xref	_init_pins
 752                     	xref	_delay_ms
 753                     	xref	_delay
 754                     	xdef	f_EEPROM_EEC_IRQHandler
 755                     	xdef	f_TIM4_UPD_OVF_IRQHandler
 756                     	xdef	f_ADC1_IRQHandler
 757                     	xdef	f_I2C_IRQHandler
 758                     	xdef	f_UART1_RX_IRQHandler
 759                     	xdef	f_UART1_TX_IRQHandler
 760                     	xdef	f_TIM2_CAP_COM_IRQHandler
 761                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
 762                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
 763                     	xdef	f_TIM1_CAP_COM_IRQHandler
 764                     	xdef	f_SPI_IRQHandler
 765                     	xdef	f_EXTI_PORTE_IRQHandler
 766                     	xdef	f_EXTI_PORTD_IRQHandler
 767                     	xdef	f_EXTI_PORTC_IRQHandler
 768                     	xdef	f_EXTI_PORTB_IRQHandler
 769                     	xdef	f_EXTI_PORTA_IRQHandler
 770                     	xdef	f_CLK_IRQHandler
 771                     	xdef	f_AWU_IRQHandler
 772                     	xdef	f_TLI_IRQHandler
 773                     	xdef	f_TRAP_IRQHandler
 774                     	xref	_GPIO_ReadInputPin
 775                     	xref	_GPIO_WriteLow
 776                     	xref	_GPIO_WriteHigh
 777                     	xref.b	c_x
 778                     	xref.b	c_y
 797                     	end
