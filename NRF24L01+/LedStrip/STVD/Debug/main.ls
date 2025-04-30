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
 556                     ; 58 void main(void)
 556                     ; 59 {
 557                     	switch	.text
 558  00d2               _main:
 560  00d2 525b          	subw	sp,#91
 561       0000005b      OFST:	set	91
 564                     ; 64     SetUp_GPIO();
 566  00d4 cd0000        	call	_SetUp_GPIO
 568                     ; 65     SetUp_TIM2_PWM();
 570  00d7 ad9a          	call	_SetUp_TIM2_PWM
 572                     ; 66     Init_NRF();
 574  00d9 cd002d        	call	_Init_NRF
 576  00dc               L371:
 577                     ; 70         reg = read_register(STATUS_REGISTER);
 579  00dc a607          	ld	a,#7
 580  00de cd0000        	call	_read_register
 582  00e1 6b01          	ld	(OFST-90,sp),a
 584                     ; 71         delay(10);
 586  00e3 ae000a        	ldw	x,#10
 587  00e6 cd0000        	call	_delay
 589                     ; 73         if (reg & (1 << 6))
 591  00e9 7b01          	ld	a,(OFST-90,sp)
 592  00eb a540          	bcp	a,#64
 593  00ed 27ed          	jreq	L371
 594                     ; 75             GPIO_WriteLow(GPIOB, GPIO_PIN_5);
 596  00ef 4b20          	push	#32
 597  00f1 ae5005        	ldw	x,#20485
 598  00f4 cd0000        	call	_GPIO_WriteLow
 600  00f7 84            	pop	a
 601                     ; 77             rx_read(buf, LED_PIPE_SIZE);
 603  00f8 4b20          	push	#32
 604  00fa 96            	ldw	x,sp
 605  00fb 1c0003        	addw	x,#OFST-88
 606  00fe cd0000        	call	_rx_read
 608  0101 84            	pop	a
 609                     ; 78             deserializeDataPackage(&rDataPackage, buf);
 611  0102 96            	ldw	x,sp
 612  0103 1c0002        	addw	x,#OFST-89
 613  0106 89            	pushw	x
 614  0107 1c002d        	addw	x,#45
 615  010a cd0000        	call	_deserializeDataPackage
 617  010d 85            	popw	x
 618                     ; 80             Set_Colour(
 618                     ; 81                 rDataPackage.data.data[0],
 618                     ; 82                 rDataPackage.data.data[1],
 618                     ; 83                 rDataPackage.data.data[2]);
 620  010e 7b3c          	ld	a,(OFST-31,sp)
 621  0110 88            	push	a
 622  0111 7b3c          	ld	a,(OFST-31,sp)
 623  0113 97            	ld	xl,a
 624  0114 7b3b          	ld	a,(OFST-32,sp)
 625  0116 95            	ld	xh,a
 626  0117 ada2          	call	_Set_Colour
 628  0119 84            	pop	a
 629                     ; 85             reset_status();
 631  011a cd0000        	call	_reset_status
 633                     ; 86             delay(10);
 635  011d ae000a        	ldw	x,#10
 636  0120 cd0000        	call	_delay
 638                     ; 87             flush_rx();
 640  0123 cd0000        	call	_flush_rx
 642                     ; 88             GPIO_WriteHigh(GPIOB, GPIO_PIN_5);
 644  0126 4b20          	push	#32
 645  0128 ae5005        	ldw	x,#20485
 646  012b cd0000        	call	_GPIO_WriteHigh
 648  012e 84            	pop	a
 649  012f 20ab          	jra	L371
 684                     ; 94 void assert_failed(uint8_t* file, uint32_t line) {
 685                     	switch	.text
 686  0131               _assert_failed:
 690  0131               L712:
 691                     ; 95     while (1);
 693  0131 20fe          	jra	L712
 718                     	xdef	_main
 719                     	xref	_deserializeDataPackage
 720                     	xdef	_Set_Colour
 721                     	xdef	_SetUp_TIM2_PWM
 722                     	xdef	_Init_NRF
 723                     	xdef	_SetUp_GPIO
 724                     	xdef	_ledStripAddr
 725                     	xref	_test_rx
 726                     	xref	_SPI_Init_NRF
 727                     	xref	_rx_read
 728                     	xref	_rx_init
 729                     	xref	_write_registerN
 730                     	xref	_write_register
 731                     	xref	_read_register
 732                     	xref	_reset_status
 733                     	xref	_flush_rx
 734                     	xref	_delay
 735                     	xref	_GPIO_WriteLow
 736                     	xref	_GPIO_WriteHigh
 737                     	xref	_GPIO_Init
 738                     	xdef	_assert_failed
 739                     	xref	_TIM2_SetCompare3
 740                     	xref	_TIM2_SetCompare2
 741                     	xref	_TIM2_SetCompare1
 742                     	xref	_TIM2_OC3PreloadConfig
 743                     	xref	_TIM2_OC2PreloadConfig
 744                     	xref	_TIM2_OC1PreloadConfig
 745                     	xref	_TIM2_Cmd
 746                     	xref	_TIM2_OC3Init
 747                     	xref	_TIM2_OC2Init
 748                     	xref	_TIM2_OC1Init
 749                     	xref	_TIM2_TimeBaseInit
 750                     	xref	_CLK_PeripheralClockConfig
 769                     	end
