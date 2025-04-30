   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.3 - 22 Aug 2024
   4                     ; Optimizer V4.6.3 - 22 Aug 2024
  18                     	bsct
  19  0000               _ledStripAddr:
  20  0000 01            	dc.b	1
  21  0001 01            	dc.b	1
  22  0002 01            	dc.b	1
  23  0003 01            	dc.b	1
  24  0004 01            	dc.b	1
  54                     ; 6 void SetUp_GPIO(void)
  54                     ; 7 {
  56                     	switch	.text
  57  0000               _SetUp_GPIO:
  61                     ; 8     GPIO_Init(GPIOD, GPIO_PIN_2, GPIO_MODE_OUT_PP_LOW_FAST);
  63  0000 4be0          	push	#224
  64  0002 4b04          	push	#4
  65  0004 ae500f        	ldw	x,#20495
  66  0007 cd0000        	call	_GPIO_Init
  68  000a 85            	popw	x
  69                     ; 9     GPIO_Init(GPIOD, GPIO_PIN_3, GPIO_MODE_OUT_PP_LOW_FAST);
  71  000b 4be0          	push	#224
  72  000d 4b08          	push	#8
  73  000f ae500f        	ldw	x,#20495
  74  0012 cd0000        	call	_GPIO_Init
  76  0015 85            	popw	x
  77                     ; 10     GPIO_Init(GPIOD, GPIO_PIN_4, GPIO_MODE_OUT_PP_LOW_FAST);
  79  0016 4be0          	push	#224
  80  0018 4b10          	push	#16
  81  001a ae500f        	ldw	x,#20495
  82  001d cd0000        	call	_GPIO_Init
  84  0020 85            	popw	x
  85                     ; 11     GPIO_Init(GPIOB, GPIO_PIN_5, GPIO_MODE_OUT_PP_HIGH_FAST);
  87  0021 4bf0          	push	#240
  88  0023 4b20          	push	#32
  89  0025 ae5005        	ldw	x,#20485
  90  0028 cd0000        	call	_GPIO_Init
  92  002b 85            	popw	x
  93                     ; 12 }
  96  002c 81            	ret	
 148                     ; 14 void Init_NRF(void)
 148                     ; 15 {
 149                     	switch	.text
 150  002d               _Init_NRF:
 152  002d 5203          	subw	sp,#3
 153       00000003      OFST:	set	3
 156                     ; 16     uint8_t *rxaddr = ledStripAddr;
 158  002f ae0000        	ldw	x,#_ledStripAddr
 159  0032 1f01          	ldw	(OFST-2,sp),x
 161                     ; 18     SPI_Init_NRF();
 163  0034 cd0000        	call	_SPI_Init_NRF
 165                     ; 19     delay(10);
 167  0037 ae000a        	ldw	x,#10
 168  003a cd0000        	call	_delay
 170                     ; 20     rx_init();
 172  003d cd0000        	call	_rx_init
 174                     ; 21     SET_PPE0_ADDR(rxaddr, 5);
 176  0040 4b05          	push	#5
 177  0042 1e02          	ldw	x,(OFST-1,sp)
 178  0044 89            	pushw	x
 179  0045 a60a          	ld	a,#10
 180  0047 cd0000        	call	_write_registerN
 182  004a 5b03          	addw	sp,#3
 183                     ; 22     delay(10);
 185  004c ae000a        	ldw	x,#10
 186  004f cd0000        	call	_delay
 188                     ; 23     SET_PPE0_SIZE(LED_PIPE_SIZE);
 190  0052 ae1120        	ldw	x,#4384
 191  0055 cd0000        	call	_write_register
 193                     ; 24     delay(10);
 195  0058 ae000a        	ldw	x,#10
 196  005b cd0000        	call	_delay
 198                     ; 25     status = test_rx();
 200  005e cd0000        	call	_test_rx
 202  0061 6b03          	ld	(OFST+0,sp),a
 204                     ; 26     if (status != 0)
 206  0063 270b          	jreq	L34
 207                     ; 28         GPIO_WriteLow(GPIOB, GPIO_PIN_5);
 209  0065 4b20          	push	#32
 210  0067 ae5005        	ldw	x,#20485
 211  006a cd0000        	call	_GPIO_WriteLow
 213  006d 84            	pop	a
 214  006e               L54:
 215                     ; 29         while (1);
 217  006e 20fe          	jra	L54
 218  0070               L34:
 219                     ; 31 }
 222  0070 5b03          	addw	sp,#3
 223  0072 81            	ret	
 255                     ; 33 void SetUp_TIM2_PWM(void)
 255                     ; 34 {
 256                     	switch	.text
 257  0073               _SetUp_TIM2_PWM:
 261                     ; 35     CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, ENABLE);
 263  0073 ae0501        	ldw	x,#1281
 264  0076 cd0000        	call	_CLK_PeripheralClockConfig
 266                     ; 37     TIM2_TimeBaseInit(TIM2_PRESCALER_16, 999);
 268  0079 ae03e7        	ldw	x,#999
 269  007c 89            	pushw	x
 270  007d a604          	ld	a,#4
 271  007f cd0000        	call	_TIM2_TimeBaseInit
 273  0082 85            	popw	x
 274                     ; 39     TIM2_OC1Init(TIM2_OCMODE_PWM1, TIM2_OUTPUTSTATE_ENABLE, 0, TIM2_OCPOLARITY_HIGH);
 276  0083 4b00          	push	#0
 277  0085 5f            	clrw	x
 278  0086 89            	pushw	x
 279  0087 ae6011        	ldw	x,#24593
 280  008a cd0000        	call	_TIM2_OC1Init
 282  008d 5b03          	addw	sp,#3
 283                     ; 40     TIM2_OC1PreloadConfig(ENABLE);
 285  008f a601          	ld	a,#1
 286  0091 cd0000        	call	_TIM2_OC1PreloadConfig
 288                     ; 42     TIM2_OC2Init(TIM2_OCMODE_PWM1, TIM2_OUTPUTSTATE_ENABLE, 0, TIM2_OCPOLARITY_HIGH);
 290  0094 4b00          	push	#0
 291  0096 5f            	clrw	x
 292  0097 89            	pushw	x
 293  0098 ae6011        	ldw	x,#24593
 294  009b cd0000        	call	_TIM2_OC2Init
 296  009e 5b03          	addw	sp,#3
 297                     ; 43     TIM2_OC2PreloadConfig(ENABLE);
 299  00a0 a601          	ld	a,#1
 300  00a2 cd0000        	call	_TIM2_OC2PreloadConfig
 302                     ; 45     TIM2_OC3Init(TIM2_OCMODE_PWM1, TIM2_OUTPUTSTATE_ENABLE, 0, TIM2_OCPOLARITY_HIGH);
 304  00a5 4b00          	push	#0
 305  00a7 5f            	clrw	x
 306  00a8 89            	pushw	x
 307  00a9 ae6011        	ldw	x,#24593
 308  00ac cd0000        	call	_TIM2_OC3Init
 310  00af 5b03          	addw	sp,#3
 311                     ; 46     TIM2_OC3PreloadConfig(ENABLE);
 313  00b1 a601          	ld	a,#1
 314  00b3 cd0000        	call	_TIM2_OC3PreloadConfig
 316                     ; 48     TIM2_Cmd(ENABLE);
 318  00b6 a601          	ld	a,#1
 320                     ; 49 }
 323  00b8 cc0000        	jp	_TIM2_Cmd
 378                     ; 51 void Set_Colour(uint8_t r, uint8_t g, uint8_t b)
 378                     ; 52 {
 379                     	switch	.text
 380  00bb               _Set_Colour:
 382  00bb 89            	pushw	x
 383       00000000      OFST:	set	0
 386                     ; 53     TIM2_SetCompare1(r);
 388  00bc 9e            	ld	a,xh
 389  00bd 5f            	clrw	x
 390  00be 97            	ld	xl,a
 391  00bf cd0000        	call	_TIM2_SetCompare1
 393                     ; 54     TIM2_SetCompare2(g);
 395  00c2 7b02          	ld	a,(OFST+2,sp)
 396  00c4 5f            	clrw	x
 397  00c5 97            	ld	xl,a
 398  00c6 cd0000        	call	_TIM2_SetCompare2
 400                     ; 55     TIM2_SetCompare3(b);
 402  00c9 7b05          	ld	a,(OFST+5,sp)
 403  00cb 5f            	clrw	x
 404  00cc 97            	ld	xl,a
 405  00cd cd0000        	call	_TIM2_SetCompare3
 407                     ; 56 }
 410  00d0 85            	popw	x
 411  00d1 81            	ret	
 532                     ; 58 void main(void)
 532                     ; 59 {
 533                     	switch	.text
 534  00d2               _main:
 536  00d2 524d          	subw	sp,#77
 537       0000004d      OFST:	set	77
 540                     ; 64     SetUp_GPIO();
 542  00d4 cd0000        	call	_SetUp_GPIO
 544                     ; 65     SetUp_TIM2_PWM();
 546  00d7 ad9a          	call	_SetUp_TIM2_PWM
 548                     ; 66     Init_NRF();
 550  00d9 cd002d        	call	_Init_NRF
 552  00dc               L161:
 553                     ; 70         reg = read_register(STATUS_REGISTER);
 555  00dc a607          	ld	a,#7
 556  00de cd0000        	call	_read_register
 558  00e1 6b01          	ld	(OFST-76,sp),a
 560                     ; 71         delay(10);
 562  00e3 ae000a        	ldw	x,#10
 563  00e6 cd0000        	call	_delay
 565                     ; 73         if (reg & (1 << 6))
 567  00e9 7b01          	ld	a,(OFST-76,sp)
 568  00eb a540          	bcp	a,#64
 569  00ed 27ed          	jreq	L161
 570                     ; 75             GPIO_WriteLow(GPIOB, GPIO_PIN_5);
 572  00ef 4b20          	push	#32
 573  00f1 ae5005        	ldw	x,#20485
 574  00f4 cd0000        	call	_GPIO_WriteLow
 576  00f7 84            	pop	a
 577                     ; 77             rx_read(buf, LED_PIPE_SIZE);
 579  00f8 4b20          	push	#32
 580  00fa 96            	ldw	x,sp
 581  00fb 1c0003        	addw	x,#OFST-74
 582  00fe cd0000        	call	_rx_read
 584  0101 84            	pop	a
 585                     ; 78             deserializeDataPackage(&rDataPackage, buf);
 587  0102 96            	ldw	x,sp
 588  0103 1c0002        	addw	x,#OFST-75
 589  0106 89            	pushw	x
 590  0107 1c0026        	addw	x,#38
 591  010a cd0000        	call	_deserializeDataPackage
 593  010d 85            	popw	x
 594                     ; 80             Set_Colour(
 594                     ; 81                 rDataPackage.data[0],
 594                     ; 82                 rDataPackage.data[1],
 594                     ; 83                 rDataPackage.data[2]);
 596  010e 7b2e          	ld	a,(OFST-31,sp)
 597  0110 88            	push	a
 598  0111 7b2e          	ld	a,(OFST-31,sp)
 599  0113 97            	ld	xl,a
 600  0114 7b2d          	ld	a,(OFST-32,sp)
 601  0116 95            	ld	xh,a
 602  0117 ada2          	call	_Set_Colour
 604  0119 84            	pop	a
 605                     ; 85             reset_status();
 607  011a cd0000        	call	_reset_status
 609                     ; 86             delay(10);
 611  011d ae000a        	ldw	x,#10
 612  0120 cd0000        	call	_delay
 614                     ; 87             flush_rx();
 616  0123 cd0000        	call	_flush_rx
 618                     ; 88             GPIO_WriteHigh(GPIOB, GPIO_PIN_5);
 620  0126 4b20          	push	#32
 621  0128 ae5005        	ldw	x,#20485
 622  012b cd0000        	call	_GPIO_WriteHigh
 624  012e 84            	pop	a
 625  012f 20ab          	jra	L161
 660                     ; 94 void assert_failed(uint8_t* file, uint32_t line) {
 661                     	switch	.text
 662  0131               _assert_failed:
 666  0131               L502:
 667                     ; 95     while (1);
 669  0131 20fe          	jra	L502
 694                     	xdef	_main
 695                     	xref	_deserializeDataPackage
 696                     	xdef	_Set_Colour
 697                     	xdef	_SetUp_TIM2_PWM
 698                     	xdef	_Init_NRF
 699                     	xdef	_SetUp_GPIO
 700                     	xdef	_ledStripAddr
 701                     	xref	_test_rx
 702                     	xref	_SPI_Init_NRF
 703                     	xref	_rx_read
 704                     	xref	_rx_init
 705                     	xref	_write_registerN
 706                     	xref	_write_register
 707                     	xref	_read_register
 708                     	xref	_reset_status
 709                     	xref	_flush_rx
 710                     	xref	_delay
 711                     	xref	_GPIO_WriteLow
 712                     	xref	_GPIO_WriteHigh
 713                     	xref	_GPIO_Init
 714                     	xdef	_assert_failed
 715                     	xref	_TIM2_SetCompare3
 716                     	xref	_TIM2_SetCompare2
 717                     	xref	_TIM2_SetCompare1
 718                     	xref	_TIM2_OC3PreloadConfig
 719                     	xref	_TIM2_OC2PreloadConfig
 720                     	xref	_TIM2_OC1PreloadConfig
 721                     	xref	_TIM2_Cmd
 722                     	xref	_TIM2_OC3Init
 723                     	xref	_TIM2_OC2Init
 724                     	xref	_TIM2_OC1Init
 725                     	xref	_TIM2_TimeBaseInit
 726                     	xref	_CLK_PeripheralClockConfig
 745                     	end
