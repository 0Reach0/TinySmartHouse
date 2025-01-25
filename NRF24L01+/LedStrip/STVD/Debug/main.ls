   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.3 - 22 Aug 2024
   4                     ; Optimizer V4.6.3 - 22 Aug 2024
  48                     ; 4 void SetUp_GPIO(void)
  48                     ; 5 {
  50                     	switch	.text
  51  0000               _SetUp_GPIO:
  55                     ; 6     GPIO_Init(GPIOD, GPIO_PIN_2, GPIO_MODE_OUT_PP_LOW_FAST);
  57  0000 4be0          	push	#224
  58  0002 4b04          	push	#4
  59  0004 ae500f        	ldw	x,#20495
  60  0007 cd0000        	call	_GPIO_Init
  62  000a 85            	popw	x
  63                     ; 7     GPIO_Init(GPIOD, GPIO_PIN_3, GPIO_MODE_OUT_PP_LOW_FAST);
  65  000b 4be0          	push	#224
  66  000d 4b08          	push	#8
  67  000f ae500f        	ldw	x,#20495
  68  0012 cd0000        	call	_GPIO_Init
  70  0015 85            	popw	x
  71                     ; 8     GPIO_Init(GPIOD, GPIO_PIN_4, GPIO_MODE_OUT_PP_LOW_FAST);
  73  0016 4be0          	push	#224
  74  0018 4b10          	push	#16
  75  001a ae500f        	ldw	x,#20495
  76  001d cd0000        	call	_GPIO_Init
  78  0020 85            	popw	x
  79                     ; 9 		GPIO_Init(GPIOB, GPIO_PIN_5, GPIO_MODE_OUT_PP_HIGH_FAST);
  81  0021 4bf0          	push	#240
  82  0023 4b20          	push	#32
  83  0025 ae5005        	ldw	x,#20485
  84  0028 cd0000        	call	_GPIO_Init
  86  002b 85            	popw	x
  87                     ; 10 }
  90  002c 81            	ret	
  93                     .const:	section	.text
  94  0000               L12_rxaddr:
  95  0000 01            	dc.b	1
  96  0001 01            	dc.b	1
  97  0002 01            	dc.b	1
  98  0003 01            	dc.b	1
  99  0004 01            	dc.b	1
 148                     ; 12 void Init_NRF(void)
 148                     ; 13 {
 149                     	switch	.text
 150  002d               _Init_NRF:
 152  002d 5206          	subw	sp,#6
 153       00000006      OFST:	set	6
 156                     ; 14 		uint8_t rxaddr[5] = {LED_ADDRESS, LED_ADDRESS, LED_ADDRESS, LED_ADDRESS, LED_ADDRESS};
 158  002f 96            	ldw	x,sp
 159  0030 5c            	incw	x
 160  0031 90ae0000      	ldw	y,#L12_rxaddr
 161  0035 a605          	ld	a,#5
 162  0037 cd0000        	call	c_xymov
 164                     ; 16 		SPI_Init_NRF();
 166  003a cd0000        	call	_SPI_Init_NRF
 168                     ; 17 		delay(10);
 170  003d ae000a        	ldw	x,#10
 171  0040 cd0000        	call	_delay
 173                     ; 18     rx_init();
 175  0043 cd0000        	call	_rx_init
 177                     ; 19 		SET_PPE0_ADDR(rxaddr, 5);
 179  0046 4b05          	push	#5
 180  0048 96            	ldw	x,sp
 181  0049 1c0002        	addw	x,#OFST-4
 182  004c 89            	pushw	x
 183  004d a60a          	ld	a,#10
 184  004f cd0000        	call	_write_registerN
 186  0052 5b03          	addw	sp,#3
 187                     ; 20 		delay(10);
 189  0054 ae000a        	ldw	x,#10
 190  0057 cd0000        	call	_delay
 192                     ; 21 		SET_PPE0_SIZE(LED_PIPE_SIZE);
 194  005a ae1103        	ldw	x,#4355
 195  005d cd0000        	call	_write_register
 197                     ; 22 		delay(10);
 199  0060 ae000a        	ldw	x,#10
 200  0063 cd0000        	call	_delay
 202                     ; 23 		status = test_rx();
 204  0066 cd0000        	call	_test_rx
 206  0069 6b06          	ld	(OFST+0,sp),a
 208                     ; 24 		if(status!= 0)
 210  006b 270b          	jreq	L54
 211                     ; 26 			GPIO_WriteLow(GPIOB, GPIO_PIN_5);
 213  006d 4b20          	push	#32
 214  006f ae5005        	ldw	x,#20485
 215  0072 cd0000        	call	_GPIO_WriteLow
 217  0075 84            	pop	a
 218  0076               L74:
 219                     ; 27 			while(1);
 221  0076 20fe          	jra	L74
 222  0078               L54:
 223                     ; 29 }
 226  0078 5b06          	addw	sp,#6
 227  007a 81            	ret	
 259                     ; 32 void SetUp_TIM2_PWM(void)
 259                     ; 33 {
 260                     	switch	.text
 261  007b               _SetUp_TIM2_PWM:
 265                     ; 34     CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, ENABLE);
 267  007b ae0501        	ldw	x,#1281
 268  007e cd0000        	call	_CLK_PeripheralClockConfig
 270                     ; 36     TIM2_TimeBaseInit(TIM2_PRESCALER_16, 999);
 272  0081 ae03e7        	ldw	x,#999
 273  0084 89            	pushw	x
 274  0085 a604          	ld	a,#4
 275  0087 cd0000        	call	_TIM2_TimeBaseInit
 277  008a 85            	popw	x
 278                     ; 38     TIM2_OC1Init(TIM2_OCMODE_PWM1, TIM2_OUTPUTSTATE_ENABLE, 0, TIM2_OCPOLARITY_HIGH);
 280  008b 4b00          	push	#0
 281  008d 5f            	clrw	x
 282  008e 89            	pushw	x
 283  008f ae6011        	ldw	x,#24593
 284  0092 cd0000        	call	_TIM2_OC1Init
 286  0095 5b03          	addw	sp,#3
 287                     ; 39     TIM2_OC1PreloadConfig(ENABLE);
 289  0097 a601          	ld	a,#1
 290  0099 cd0000        	call	_TIM2_OC1PreloadConfig
 292                     ; 41     TIM2_OC2Init(TIM2_OCMODE_PWM1, TIM2_OUTPUTSTATE_ENABLE, 0, TIM2_OCPOLARITY_HIGH);
 294  009c 4b00          	push	#0
 295  009e 5f            	clrw	x
 296  009f 89            	pushw	x
 297  00a0 ae6011        	ldw	x,#24593
 298  00a3 cd0000        	call	_TIM2_OC2Init
 300  00a6 5b03          	addw	sp,#3
 301                     ; 42     TIM2_OC2PreloadConfig(ENABLE);
 303  00a8 a601          	ld	a,#1
 304  00aa cd0000        	call	_TIM2_OC2PreloadConfig
 306                     ; 44     TIM2_OC3Init(TIM2_OCMODE_PWM1, TIM2_OUTPUTSTATE_ENABLE, 0, TIM2_OCPOLARITY_HIGH);
 308  00ad 4b00          	push	#0
 309  00af 5f            	clrw	x
 310  00b0 89            	pushw	x
 311  00b1 ae6011        	ldw	x,#24593
 312  00b4 cd0000        	call	_TIM2_OC3Init
 314  00b7 5b03          	addw	sp,#3
 315                     ; 45     TIM2_OC3PreloadConfig(ENABLE);
 317  00b9 a601          	ld	a,#1
 318  00bb cd0000        	call	_TIM2_OC3PreloadConfig
 320                     ; 47     TIM2_Cmd(ENABLE);
 322  00be a601          	ld	a,#1
 324                     ; 48 }
 327  00c0 cc0000        	jp	_TIM2_Cmd
 382                     ; 50 void Set_Colour(uint8_t r, uint8_t g, uint8_t b)
 382                     ; 51 {
 383                     	switch	.text
 384  00c3               _Set_Colour:
 386  00c3 89            	pushw	x
 387       00000000      OFST:	set	0
 390                     ; 52     TIM2_SetCompare1(r);
 392  00c4 9e            	ld	a,xh
 393  00c5 5f            	clrw	x
 394  00c6 97            	ld	xl,a
 395  00c7 cd0000        	call	_TIM2_SetCompare1
 397                     ; 53     TIM2_SetCompare2(g);
 399  00ca 7b02          	ld	a,(OFST+2,sp)
 400  00cc 5f            	clrw	x
 401  00cd 97            	ld	xl,a
 402  00ce cd0000        	call	_TIM2_SetCompare2
 404                     ; 54     TIM2_SetCompare3(b);
 406  00d1 7b05          	ld	a,(OFST+5,sp)
 407  00d3 5f            	clrw	x
 408  00d4 97            	ld	xl,a
 409  00d5 cd0000        	call	_TIM2_SetCompare3
 411                     ; 55 }
 414  00d8 85            	popw	x
 415  00d9 81            	ret	
 470                     ; 57 void main(void)
 470                     ; 58 {
 471                     	switch	.text
 472  00da               _main:
 474  00da 5204          	subw	sp,#4
 475       00000004      OFST:	set	4
 478                     ; 61 	SetUp_GPIO();
 480  00dc cd0000        	call	_SetUp_GPIO
 482                     ; 62 	SetUp_TIM2_PWM();
 484  00df ad9a          	call	_SetUp_TIM2_PWM
 486                     ; 63 	Init_NRF();
 488  00e1 cd002d        	call	_Init_NRF
 490  00e4               L331:
 491                     ; 66         reg = read_register(STATUS_REGISTER);
 493  00e4 a607          	ld	a,#7
 494  00e6 cd0000        	call	_read_register
 496  00e9 6b01          	ld	(OFST-3,sp),a
 498                     ; 67 				delay(10);
 500  00eb ae000a        	ldw	x,#10
 501  00ee cd0000        	call	_delay
 503                     ; 68         if (reg & (1 << 6))
 505  00f1 7b01          	ld	a,(OFST-3,sp)
 506  00f3 a540          	bcp	a,#64
 507  00f5 27ed          	jreq	L331
 508                     ; 70 						GPIO_WriteLow(GPIOB, GPIO_PIN_5);
 510  00f7 4b20          	push	#32
 511  00f9 ae5005        	ldw	x,#20485
 512  00fc cd0000        	call	_GPIO_WriteLow
 514  00ff 84            	pop	a
 515                     ; 71             rx_read(buf, 3);
 517  0100 4b03          	push	#3
 518  0102 96            	ldw	x,sp
 519  0103 1c0003        	addw	x,#OFST-1
 520  0106 cd0000        	call	_rx_read
 522  0109 84            	pop	a
 523                     ; 72 						Set_Colour(buf[0], buf[1], buf[2]);
 525  010a 7b04          	ld	a,(OFST+0,sp)
 526  010c 88            	push	a
 527  010d 7b04          	ld	a,(OFST+0,sp)
 528  010f 97            	ld	xl,a
 529  0110 7b03          	ld	a,(OFST-1,sp)
 530  0112 95            	ld	xh,a
 531  0113 adae          	call	_Set_Colour
 533  0115 84            	pop	a
 534                     ; 73             reset_status();
 536  0116 cd0000        	call	_reset_status
 538                     ; 74             delay(10);
 540  0119 ae000a        	ldw	x,#10
 541  011c cd0000        	call	_delay
 543                     ; 75 						flush_rx();
 545  011f cd0000        	call	_flush_rx
 547                     ; 76 						GPIO_WriteHigh(GPIOB, GPIO_PIN_5);
 549  0122 4b20          	push	#32
 550  0124 ae5005        	ldw	x,#20485
 551  0127 cd0000        	call	_GPIO_WriteHigh
 553  012a 84            	pop	a
 554  012b 20b7          	jra	L331
 589                     ; 84 void assert_failed(uint8_t* file, uint32_t line) {
 590                     	switch	.text
 591  012d               _assert_failed:
 595  012d               L751:
 596                     ; 86     while (1);
 598  012d 20fe          	jra	L751
 611                     	xdef	_main
 612                     	xdef	_Set_Colour
 613                     	xdef	_SetUp_TIM2_PWM
 614                     	xdef	_Init_NRF
 615                     	xdef	_SetUp_GPIO
 616                     	xref	_test_rx
 617                     	xref	_SPI_Init_NRF
 618                     	xref	_rx_read
 619                     	xref	_rx_init
 620                     	xref	_write_registerN
 621                     	xref	_write_register
 622                     	xref	_read_register
 623                     	xref	_reset_status
 624                     	xref	_flush_rx
 625                     	xref	_delay
 626                     	xref	_GPIO_WriteLow
 627                     	xref	_GPIO_WriteHigh
 628                     	xref	_GPIO_Init
 629                     	xdef	_assert_failed
 630                     	xref	_TIM2_SetCompare3
 631                     	xref	_TIM2_SetCompare2
 632                     	xref	_TIM2_SetCompare1
 633                     	xref	_TIM2_OC3PreloadConfig
 634                     	xref	_TIM2_OC2PreloadConfig
 635                     	xref	_TIM2_OC1PreloadConfig
 636                     	xref	_TIM2_Cmd
 637                     	xref	_TIM2_OC3Init
 638                     	xref	_TIM2_OC2Init
 639                     	xref	_TIM2_OC1Init
 640                     	xref	_TIM2_TimeBaseInit
 641                     	xref	_CLK_PeripheralClockConfig
 642                     	xref.b	c_x
 661                     	xref	c_xymov
 662                     	end
