   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.3 - 22 Aug 2024
   4                     ; Optimizer V4.6.3 - 22 Aug 2024
  50                     ; 52 INTERRUPT_HANDLER(NonHandledInterrupt, 25)
  50                     ; 53 {
  51                     .text:	section	.text,new
  52  0000               f_NonHandledInterrupt:
  56                     ; 57 }
  59  0000 80            	iret	
  81                     ; 65 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
  81                     ; 66 {
  82                     .text:	section	.text,new
  83  0000               f_TRAP_IRQHandler:
  87                     ; 70 }
  90  0000 80            	iret	
 112                     ; 77 INTERRUPT_HANDLER(TLI_IRQHandler, 0)
 112                     ; 78 
 112                     ; 79 {
 113                     .text:	section	.text,new
 114  0000               f_TLI_IRQHandler:
 118                     ; 83 }
 121  0000 80            	iret	
 143                     ; 90 INTERRUPT_HANDLER(AWU_IRQHandler, 1)
 143                     ; 91 {
 144                     .text:	section	.text,new
 145  0000               f_AWU_IRQHandler:
 149                     ; 95 }
 152  0000 80            	iret	
 174                     ; 102 INTERRUPT_HANDLER(CLK_IRQHandler, 2)
 174                     ; 103 {
 175                     .text:	section	.text,new
 176  0000               f_CLK_IRQHandler:
 180                     ; 107 }
 183  0000 80            	iret	
 206                     ; 114 INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
 206                     ; 115 {
 207                     .text:	section	.text,new
 208  0000               f_EXTI_PORTA_IRQHandler:
 212                     ; 119 }
 215  0000 80            	iret	
 238                     ; 127 static void cs_high(void) {
 240                     .text:	section	.text,new
 241  0000               L17_cs_high:
 245                     ; 128     GPIO_WriteHigh(GPIOC, GPIO_PIN_4); // CSN ?? PC4
 247  0000 4b10          	push	#16
 248  0002 ae500a        	ldw	x,#20490
 249  0005 cd0000        	call	_GPIO_WriteHigh
 251  0008 84            	pop	a
 252                     ; 129 }
 255  0009 81            	ret	
 279                     ; 131 static void cs_low(void) {
 280                     .text:	section	.text,new
 281  0000               L301_cs_low:
 285                     ; 132     GPIO_WriteLow(GPIOC, GPIO_PIN_4); // CSN ?? PC4
 287  0000 4b10          	push	#16
 288  0002 ae500a        	ldw	x,#20490
 289  0005 cd0000        	call	_GPIO_WriteLow
 291  0008 84            	pop	a
 292                     ; 133 }
 295  0009 81            	ret	
 319                     ; 136 static void ce_high(void) {
 320                     .text:	section	.text,new
 321  0000               L511_ce_high:
 325                     ; 137     GPIO_WriteHigh(GPIOC, GPIO_PIN_3); // CE ?? PC3
 327  0000 4b08          	push	#8
 328  0002 ae500a        	ldw	x,#20490
 329  0005 cd0000        	call	_GPIO_WriteHigh
 331  0008 84            	pop	a
 332                     ; 138 }
 335  0009 81            	ret	
 359                     ; 140 static void ce_low(void) {
 360                     .text:	section	.text,new
 361  0000               L721_ce_low:
 365                     ; 141     GPIO_WriteLow(GPIOC, GPIO_PIN_3); // CE ?? PC3
 367  0000 4b08          	push	#8
 368  0002 ae500a        	ldw	x,#20490
 369  0005 cd0000        	call	_GPIO_WriteLow
 371  0008 84            	pop	a
 372                     ; 142 }
 375  0009 81            	ret	
 413                     ; 146 INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
 413                     ; 147 {
 415                     .text:	section	.text,new
 416  0000               f_EXTI_PORTB_IRQHandler:
 418  0000 8a            	push	cc
 419  0001 84            	pop	a
 420  0002 a4bf          	and	a,#191
 421  0004 88            	push	a
 422  0005 86            	pop	cc
 423       00000001      OFST:	set	1
 424  0006 3b0002        	push	c_x+2
 425  0009 be00          	ldw	x,c_x
 426  000b 89            	pushw	x
 427  000c 3b0002        	push	c_y+2
 428  000f be00          	ldw	x,c_y
 429  0011 89            	pushw	x
 430  0012 88            	push	a
 433                     ; 148 	uint8_t i = 0;
 435                     ; 150 	GPIO_WriteHigh(GPIOB, GPIO_PIN_5);
 437  0013 4b20          	push	#32
 438  0015 ae5005        	ldw	x,#20485
 439  0018 cd0000        	call	_GPIO_WriteHigh
 441  001b ae000a        	ldw	x,#10
 442  001e 84            	pop	a
 443                     ; 151 	    delay(10);
 445  001f cd0000        	call	_delay
 447                     ; 152     nrf24l01p_write_register(0x07, 0x70);
 449  0022 ae0770        	ldw	x,#1904
 450  0025 cd0000        	call	_nrf24l01p_write_register
 452                     ; 153     delay(10);
 454  0028 ae000a        	ldw	x,#10
 455  002b cd0000        	call	_delay
 457                     ; 158 }
 460  002e 84            	pop	a
 461  002f 85            	popw	x
 462  0030 bf00          	ldw	c_y,x
 463  0032 320002        	pop	c_y+2
 464  0035 85            	popw	x
 465  0036 bf00          	ldw	c_x,x
 466  0038 320002        	pop	c_x+2
 467  003b 80            	iret	
 490                     ; 165 INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
 490                     ; 166 {
 491                     .text:	section	.text,new
 492  0000               f_EXTI_PORTC_IRQHandler:
 496                     ; 170 }
 499  0000 80            	iret	
 523                     ; 177 INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
 523                     ; 178 {
 524                     .text:	section	.text,new
 525  0000               f_EXTI_PORTD_IRQHandler:
 527  0000 8a            	push	cc
 528  0001 84            	pop	a
 529  0002 a4bf          	and	a,#191
 530  0004 88            	push	a
 531  0005 86            	pop	cc
 532  0006 3b0002        	push	c_x+2
 533  0009 be00          	ldw	x,c_x
 534  000b 89            	pushw	x
 535  000c 3b0002        	push	c_y+2
 536  000f be00          	ldw	x,c_y
 537  0011 89            	pushw	x
 540                     ; 179 	GPIO_WriteHigh(GPIOB, GPIO_PIN_5);
 542  0012 4b20          	push	#32
 543  0014 ae5005        	ldw	x,#20485
 544  0017 cd0000        	call	_GPIO_WriteHigh
 546  001a 84            	pop	a
 547                     ; 183 }
 550  001b 85            	popw	x
 551  001c bf00          	ldw	c_y,x
 552  001e 320002        	pop	c_y+2
 553  0021 85            	popw	x
 554  0022 bf00          	ldw	c_x,x
 555  0024 320002        	pop	c_x+2
 556  0027 80            	iret	
 579                     ; 190 INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
 579                     ; 191 {
 580                     .text:	section	.text,new
 581  0000               f_EXTI_PORTE_IRQHandler:
 585                     ; 195 }
 588  0000 80            	iret	
 610                     ; 242 INTERRUPT_HANDLER(SPI_IRQHandler, 10)
 610                     ; 243 {
 611                     .text:	section	.text,new
 612  0000               f_SPI_IRQHandler:
 616                     ; 247 }
 619  0000 80            	iret	
 642                     ; 254 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
 642                     ; 255 {
 643                     .text:	section	.text,new
 644  0000               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
 648                     ; 259 }
 651  0000 80            	iret	
 674                     ; 266 INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
 674                     ; 267 {
 675                     .text:	section	.text,new
 676  0000               f_TIM1_CAP_COM_IRQHandler:
 680                     ; 271 }
 683  0000 80            	iret	
 706                     ; 304  INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
 706                     ; 305  {
 707                     .text:	section	.text,new
 708  0000               f_TIM2_UPD_OVF_BRK_IRQHandler:
 712                     ; 309  }
 715  0000 80            	iret	
 738                     ; 316  INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
 738                     ; 317  {
 739                     .text:	section	.text,new
 740  0000               f_TIM2_CAP_COM_IRQHandler:
 744                     ; 321  }
 747  0000 80            	iret	
 770                     ; 358  INTERRUPT_HANDLER(UART1_TX_IRQHandler, 17)
 770                     ; 359  {
 771                     .text:	section	.text,new
 772  0000               f_UART1_TX_IRQHandler:
 776                     ; 363  }
 779  0000 80            	iret	
 802                     ; 370  INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
 802                     ; 371  {
 803                     .text:	section	.text,new
 804  0000               f_UART1_RX_IRQHandler:
 808                     ; 375  }
 811  0000 80            	iret	
 833                     ; 409 INTERRUPT_HANDLER(I2C_IRQHandler, 19)
 833                     ; 410 {
 834                     .text:	section	.text,new
 835  0000               f_I2C_IRQHandler:
 839                     ; 414 }
 842  0000 80            	iret	
 864                     ; 488  INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
 864                     ; 489  {
 865                     .text:	section	.text,new
 866  0000               f_ADC1_IRQHandler:
 870                     ; 493  }
 873  0000 80            	iret	
 896                     ; 514  INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
 896                     ; 515  {
 897                     .text:	section	.text,new
 898  0000               f_TIM4_UPD_OVF_IRQHandler:
 902                     ; 519  }
 905  0000 80            	iret	
 928                     ; 527 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
 928                     ; 528 {
 929                     .text:	section	.text,new
 930  0000               f_EEPROM_EEC_IRQHandler:
 934                     ; 532 }
 937  0000 80            	iret	
 949                     	xref	_nrf24l01p_write_register
 950                     	xref	_delay
 951                     	xdef	f_EEPROM_EEC_IRQHandler
 952                     	xdef	f_TIM4_UPD_OVF_IRQHandler
 953                     	xdef	f_ADC1_IRQHandler
 954                     	xdef	f_I2C_IRQHandler
 955                     	xdef	f_UART1_RX_IRQHandler
 956                     	xdef	f_UART1_TX_IRQHandler
 957                     	xdef	f_TIM2_CAP_COM_IRQHandler
 958                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
 959                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
 960                     	xdef	f_TIM1_CAP_COM_IRQHandler
 961                     	xdef	f_SPI_IRQHandler
 962                     	xdef	f_EXTI_PORTE_IRQHandler
 963                     	xdef	f_EXTI_PORTD_IRQHandler
 964                     	xdef	f_EXTI_PORTC_IRQHandler
 965                     	xdef	f_EXTI_PORTB_IRQHandler
 966                     	xdef	f_EXTI_PORTA_IRQHandler
 967                     	xdef	f_CLK_IRQHandler
 968                     	xdef	f_AWU_IRQHandler
 969                     	xdef	f_TLI_IRQHandler
 970                     	xdef	f_TRAP_IRQHandler
 971                     	xdef	f_NonHandledInterrupt
 972                     	xref	_GPIO_WriteLow
 973                     	xref	_GPIO_WriteHigh
 974                     	xref.b	c_x
 975                     	xref.b	c_y
 994                     	end
