   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.3 - 22 Aug 2024
  14                     	bsct
  15  0000               _CURRENT_MODE:
  16  0000 00            	dc.b	0
  17  0001               _txaddr:
  18  0001 01            	dc.b	1
  19  0002 01            	dc.b	1
  20  0003 01            	dc.b	1
  21  0004 01            	dc.b	1
  22  0005 01            	dc.b	1
  52                     ; 14 void init_pins(void) {
  54                     	switch	.text
  55  0000               _init_pins:
  59                     ; 17     GPIO_Init(RC_PIN5, GPIO_MODE_OUT_PP_LOW_FAST); 
  61  0000 4be0          	push	#224
  62  0002 4b02          	push	#2
  63  0004 ae5000        	ldw	x,#20480
  64  0007 cd0000        	call	_GPIO_Init
  66  000a 85            	popw	x
  67                     ; 18     GPIO_Init(RC_PIN6, GPIO_MODE_OUT_PP_LOW_FAST); 
  69  000b 4be0          	push	#224
  70  000d 4b40          	push	#64
  71  000f ae500f        	ldw	x,#20495
  72  0012 cd0000        	call	_GPIO_Init
  74  0015 85            	popw	x
  75                     ; 19     GPIO_Init(RC_PIN7, GPIO_MODE_OUT_PP_LOW_FAST);
  77  0016 4be0          	push	#224
  78  0018 4b20          	push	#32
  79  001a ae500f        	ldw	x,#20495
  80  001d cd0000        	call	_GPIO_Init
  82  0020 85            	popw	x
  83                     ; 20     GPIO_Init(RC_PIN8, GPIO_MODE_OUT_PP_LOW_FAST);
  85  0021 4be0          	push	#224
  86  0023 4b10          	push	#16
  87  0025 ae500f        	ldw	x,#20495
  88  0028 cd0000        	call	_GPIO_Init
  90  002b 85            	popw	x
  91                     ; 23     GPIO_Init(RC_PIN1, GPIO_MODE_IN_PU_NO_IT); // ?????? 1
  93  002c 4b40          	push	#64
  94  002e 4b02          	push	#2
  95  0030 ae500f        	ldw	x,#20495
  96  0033 cd0000        	call	_GPIO_Init
  98  0036 85            	popw	x
  99                     ; 24     GPIO_Init(RC_PIN2, GPIO_MODE_IN_PU_NO_IT); // ?????? 2
 101  0037 4b40          	push	#64
 102  0039 4b04          	push	#4
 103  003b ae500f        	ldw	x,#20495
 104  003e cd0000        	call	_GPIO_Init
 106  0041 85            	popw	x
 107                     ; 25     GPIO_Init(RC_PIN3, GPIO_MODE_IN_PU_NO_IT); // ?????? 3
 109  0042 4b40          	push	#64
 110  0044 4b08          	push	#8
 111  0046 ae500f        	ldw	x,#20495
 112  0049 cd0000        	call	_GPIO_Init
 114  004c 85            	popw	x
 115                     ; 26     GPIO_Init(RC_PIN4, GPIO_MODE_IN_PU_NO_IT); // ?????? 4
 117  004d 4b40          	push	#64
 118  004f 4b04          	push	#4
 119  0051 ae5000        	ldw	x,#20480
 120  0054 cd0000        	call	_GPIO_Init
 122  0057 85            	popw	x
 123                     ; 28 }
 126  0058 81            	ret
 166                     ; 30 uint8_t Init_NRF(void)
 166                     ; 31 {
 167                     	switch	.text
 168  0059               _Init_NRF:
 170  0059 88            	push	a
 171       00000001      OFST:	set	1
 174                     ; 33     SPI_Init_NRF();
 176  005a cd0000        	call	_SPI_Init_NRF
 178                     ; 34     tx_init();
 180  005d cd0000        	call	_tx_init
 182                     ; 35     delay(1000);
 184  0060 ae03e8        	ldw	x,#1000
 185  0063 cd0000        	call	_delay
 187                     ; 36     SET_TX_ADDR(txaddr, 5);
 189  0066 4b05          	push	#5
 190  0068 ae0001        	ldw	x,#_txaddr
 191  006b 89            	pushw	x
 192  006c a610          	ld	a,#16
 193  006e cd0000        	call	_write_registerN
 195  0071 5b03          	addw	sp,#3
 196                     ; 37     delay(100);
 198  0073 ae0064        	ldw	x,#100
 199  0076 cd0000        	call	_delay
 201                     ; 38     reg = test_tx();
 203  0079 cd0000        	call	_test_tx
 205  007c 6b01          	ld	(OFST+0,sp),a
 207                     ; 39     if(reg!= 0)
 209  007e 0d01          	tnz	(OFST+0,sp)
 210  0080 2704          	jreq	L73
 211                     ; 41         return 0;
 213  0082 4f            	clr	a
 216  0083 5b01          	addw	sp,#1
 217  0085 81            	ret
 218  0086               L73:
 219                     ; 43     return 1  ;
 221  0086 a601          	ld	a,#1
 224  0088 5b01          	addw	sp,#1
 225  008a 81            	ret
 292                     ; 47 uint8_t waiting_for_click(uint8_t *row, uint8_t *col, uint8_t t) {
 293                     	switch	.text
 294  008b               _waiting_for_click:
 296  008b 89            	pushw	x
 297  008c 88            	push	a
 298       00000001      OFST:	set	1
 301                     ; 48     uint8_t timeCounter = 0;
 303  008d 0f01          	clr	(OFST+0,sp)
 305  008f               L37:
 306                     ; 50         GPIO_WriteLow(RC_PIN5); GPIO_WriteHigh(RC_PIN6); GPIO_WriteHigh(RC_PIN7); GPIO_WriteHigh(RC_PIN8);
 308  008f 4b02          	push	#2
 309  0091 ae5000        	ldw	x,#20480
 310  0094 cd0000        	call	_GPIO_WriteLow
 312  0097 84            	pop	a
 315  0098 4b40          	push	#64
 316  009a ae500f        	ldw	x,#20495
 317  009d cd0000        	call	_GPIO_WriteHigh
 319  00a0 84            	pop	a
 322  00a1 4b20          	push	#32
 323  00a3 ae500f        	ldw	x,#20495
 324  00a6 cd0000        	call	_GPIO_WriteHigh
 326  00a9 84            	pop	a
 329  00aa 4b10          	push	#16
 330  00ac ae500f        	ldw	x,#20495
 331  00af cd0000        	call	_GPIO_WriteHigh
 333  00b2 84            	pop	a
 334                     ; 51         if (GPIO_ReadInputPin(RC_PIN1) == RESET) { *row = 1; *col = 1; return 1; }
 336  00b3 4b02          	push	#2
 337  00b5 ae500f        	ldw	x,#20495
 338  00b8 cd0000        	call	_GPIO_ReadInputPin
 340  00bb 5b01          	addw	sp,#1
 341  00bd 4d            	tnz	a
 342  00be 260e          	jrne	L77
 345  00c0 1e02          	ldw	x,(OFST+1,sp)
 346  00c2 a601          	ld	a,#1
 347  00c4 f7            	ld	(x),a
 350  00c5 1e06          	ldw	x,(OFST+5,sp)
 351  00c7 a601          	ld	a,#1
 352  00c9 f7            	ld	(x),a
 355  00ca a601          	ld	a,#1
 357  00cc 2019          	jra	L21
 358  00ce               L77:
 359                     ; 52         if (GPIO_ReadInputPin(RC_PIN2) == RESET) { *row = 2; *col = 1; return 1; }
 361  00ce 4b04          	push	#4
 362  00d0 ae500f        	ldw	x,#20495
 363  00d3 cd0000        	call	_GPIO_ReadInputPin
 365  00d6 5b01          	addw	sp,#1
 366  00d8 4d            	tnz	a
 367  00d9 260f          	jrne	L101
 370  00db 1e02          	ldw	x,(OFST+1,sp)
 371  00dd a602          	ld	a,#2
 372  00df f7            	ld	(x),a
 375  00e0 1e06          	ldw	x,(OFST+5,sp)
 376  00e2 a601          	ld	a,#1
 377  00e4 f7            	ld	(x),a
 380  00e5 a601          	ld	a,#1
 382  00e7               L21:
 384  00e7 5b03          	addw	sp,#3
 385  00e9 81            	ret
 386  00ea               L101:
 387                     ; 53         if (GPIO_ReadInputPin(RC_PIN3) == RESET) { *row = 3; *col = 1; return 1; }
 389  00ea 4b08          	push	#8
 390  00ec ae500f        	ldw	x,#20495
 391  00ef cd0000        	call	_GPIO_ReadInputPin
 393  00f2 5b01          	addw	sp,#1
 394  00f4 4d            	tnz	a
 395  00f5 260e          	jrne	L301
 398  00f7 1e02          	ldw	x,(OFST+1,sp)
 399  00f9 a603          	ld	a,#3
 400  00fb f7            	ld	(x),a
 403  00fc 1e06          	ldw	x,(OFST+5,sp)
 404  00fe a601          	ld	a,#1
 405  0100 f7            	ld	(x),a
 408  0101 a601          	ld	a,#1
 410  0103 20e2          	jra	L21
 411  0105               L301:
 412                     ; 54         if (GPIO_ReadInputPin(RC_PIN4) == RESET) { *row = 4; *col = 1; return 1; }
 414  0105 4b04          	push	#4
 415  0107 ae5000        	ldw	x,#20480
 416  010a cd0000        	call	_GPIO_ReadInputPin
 418  010d 5b01          	addw	sp,#1
 419  010f 4d            	tnz	a
 420  0110 260e          	jrne	L501
 423  0112 1e02          	ldw	x,(OFST+1,sp)
 424  0114 a604          	ld	a,#4
 425  0116 f7            	ld	(x),a
 428  0117 1e06          	ldw	x,(OFST+5,sp)
 429  0119 a601          	ld	a,#1
 430  011b f7            	ld	(x),a
 433  011c a601          	ld	a,#1
 435  011e 20c7          	jra	L21
 436  0120               L501:
 437                     ; 55         delay_ms(10);
 439  0120 ae000a        	ldw	x,#10
 440  0123 cd0314        	call	_delay_ms
 442                     ; 57         GPIO_WriteHigh(RC_PIN5); GPIO_WriteLow(RC_PIN6); GPIO_WriteHigh(RC_PIN7); GPIO_WriteHigh(RC_PIN8);
 444  0126 4b02          	push	#2
 445  0128 ae5000        	ldw	x,#20480
 446  012b cd0000        	call	_GPIO_WriteHigh
 448  012e 84            	pop	a
 451  012f 4b40          	push	#64
 452  0131 ae500f        	ldw	x,#20495
 453  0134 cd0000        	call	_GPIO_WriteLow
 455  0137 84            	pop	a
 458  0138 4b20          	push	#32
 459  013a ae500f        	ldw	x,#20495
 460  013d cd0000        	call	_GPIO_WriteHigh
 462  0140 84            	pop	a
 465  0141 4b10          	push	#16
 466  0143 ae500f        	ldw	x,#20495
 467  0146 cd0000        	call	_GPIO_WriteHigh
 469  0149 84            	pop	a
 470                     ; 58         if (GPIO_ReadInputPin(RC_PIN1) == RESET) { *row = 1; *col = 2; return 1; }
 472  014a 4b02          	push	#2
 473  014c ae500f        	ldw	x,#20495
 474  014f cd0000        	call	_GPIO_ReadInputPin
 476  0152 5b01          	addw	sp,#1
 477  0154 4d            	tnz	a
 478  0155 260e          	jrne	L701
 481  0157 1e02          	ldw	x,(OFST+1,sp)
 482  0159 a601          	ld	a,#1
 483  015b f7            	ld	(x),a
 486  015c 1e06          	ldw	x,(OFST+5,sp)
 487  015e a602          	ld	a,#2
 488  0160 f7            	ld	(x),a
 491  0161 a601          	ld	a,#1
 493  0163 2082          	jra	L21
 494  0165               L701:
 495                     ; 59         if (GPIO_ReadInputPin(RC_PIN2) == RESET) { *row = 2; *col = 2; return 1; }
 497  0165 4b04          	push	#4
 498  0167 ae500f        	ldw	x,#20495
 499  016a cd0000        	call	_GPIO_ReadInputPin
 501  016d 5b01          	addw	sp,#1
 502  016f 4d            	tnz	a
 503  0170 2610          	jrne	L111
 506  0172 1e02          	ldw	x,(OFST+1,sp)
 507  0174 a602          	ld	a,#2
 508  0176 f7            	ld	(x),a
 511  0177 1e06          	ldw	x,(OFST+5,sp)
 512  0179 a602          	ld	a,#2
 513  017b f7            	ld	(x),a
 516  017c a601          	ld	a,#1
 518  017e ace700e7      	jpf	L21
 519  0182               L111:
 520                     ; 60         if (GPIO_ReadInputPin(RC_PIN3) == RESET) { *row = 3; *col = 2; return 1; }
 522  0182 4b08          	push	#8
 523  0184 ae500f        	ldw	x,#20495
 524  0187 cd0000        	call	_GPIO_ReadInputPin
 526  018a 5b01          	addw	sp,#1
 527  018c 4d            	tnz	a
 528  018d 2610          	jrne	L311
 531  018f 1e02          	ldw	x,(OFST+1,sp)
 532  0191 a603          	ld	a,#3
 533  0193 f7            	ld	(x),a
 536  0194 1e06          	ldw	x,(OFST+5,sp)
 537  0196 a602          	ld	a,#2
 538  0198 f7            	ld	(x),a
 541  0199 a601          	ld	a,#1
 543  019b ace700e7      	jpf	L21
 544  019f               L311:
 545                     ; 61         if (GPIO_ReadInputPin(RC_PIN4) == RESET) { *row = 4; *col = 2; return 1; }
 547  019f 4b04          	push	#4
 548  01a1 ae5000        	ldw	x,#20480
 549  01a4 cd0000        	call	_GPIO_ReadInputPin
 551  01a7 5b01          	addw	sp,#1
 552  01a9 4d            	tnz	a
 553  01aa 2610          	jrne	L511
 556  01ac 1e02          	ldw	x,(OFST+1,sp)
 557  01ae a604          	ld	a,#4
 558  01b0 f7            	ld	(x),a
 561  01b1 1e06          	ldw	x,(OFST+5,sp)
 562  01b3 a602          	ld	a,#2
 563  01b5 f7            	ld	(x),a
 566  01b6 a601          	ld	a,#1
 568  01b8 ace700e7      	jpf	L21
 569  01bc               L511:
 570                     ; 62         delay_ms(10);
 572  01bc ae000a        	ldw	x,#10
 573  01bf cd0314        	call	_delay_ms
 575                     ; 64         GPIO_WriteHigh(RC_PIN5); GPIO_WriteHigh(RC_PIN6); GPIO_WriteLow(RC_PIN7); GPIO_WriteHigh(RC_PIN8);
 577  01c2 4b02          	push	#2
 578  01c4 ae5000        	ldw	x,#20480
 579  01c7 cd0000        	call	_GPIO_WriteHigh
 581  01ca 84            	pop	a
 584  01cb 4b40          	push	#64
 585  01cd ae500f        	ldw	x,#20495
 586  01d0 cd0000        	call	_GPIO_WriteHigh
 588  01d3 84            	pop	a
 591  01d4 4b20          	push	#32
 592  01d6 ae500f        	ldw	x,#20495
 593  01d9 cd0000        	call	_GPIO_WriteLow
 595  01dc 84            	pop	a
 598  01dd 4b10          	push	#16
 599  01df ae500f        	ldw	x,#20495
 600  01e2 cd0000        	call	_GPIO_WriteHigh
 602  01e5 84            	pop	a
 603                     ; 65         if (GPIO_ReadInputPin(RC_PIN1) == RESET) { *row = 1; *col = 3; return 1; }
 605  01e6 4b02          	push	#2
 606  01e8 ae500f        	ldw	x,#20495
 607  01eb cd0000        	call	_GPIO_ReadInputPin
 609  01ee 5b01          	addw	sp,#1
 610  01f0 4d            	tnz	a
 611  01f1 2610          	jrne	L711
 614  01f3 1e02          	ldw	x,(OFST+1,sp)
 615  01f5 a601          	ld	a,#1
 616  01f7 f7            	ld	(x),a
 619  01f8 1e06          	ldw	x,(OFST+5,sp)
 620  01fa a603          	ld	a,#3
 621  01fc f7            	ld	(x),a
 624  01fd a601          	ld	a,#1
 626  01ff ace700e7      	jpf	L21
 627  0203               L711:
 628                     ; 66         if (GPIO_ReadInputPin(RC_PIN2) == RESET) { *row = 2; *col = 3; return 1; }
 630  0203 4b04          	push	#4
 631  0205 ae500f        	ldw	x,#20495
 632  0208 cd0000        	call	_GPIO_ReadInputPin
 634  020b 5b01          	addw	sp,#1
 635  020d 4d            	tnz	a
 636  020e 2610          	jrne	L121
 639  0210 1e02          	ldw	x,(OFST+1,sp)
 640  0212 a602          	ld	a,#2
 641  0214 f7            	ld	(x),a
 644  0215 1e06          	ldw	x,(OFST+5,sp)
 645  0217 a603          	ld	a,#3
 646  0219 f7            	ld	(x),a
 649  021a a601          	ld	a,#1
 651  021c ace700e7      	jpf	L21
 652  0220               L121:
 653                     ; 67         if (GPIO_ReadInputPin(RC_PIN3) == RESET) { *row = 3; *col = 3; return 1; }
 655  0220 4b08          	push	#8
 656  0222 ae500f        	ldw	x,#20495
 657  0225 cd0000        	call	_GPIO_ReadInputPin
 659  0228 5b01          	addw	sp,#1
 660  022a 4d            	tnz	a
 661  022b 2610          	jrne	L321
 664  022d 1e02          	ldw	x,(OFST+1,sp)
 665  022f a603          	ld	a,#3
 666  0231 f7            	ld	(x),a
 669  0232 1e06          	ldw	x,(OFST+5,sp)
 670  0234 a603          	ld	a,#3
 671  0236 f7            	ld	(x),a
 674  0237 a601          	ld	a,#1
 676  0239 ace700e7      	jpf	L21
 677  023d               L321:
 678                     ; 68         if (GPIO_ReadInputPin(RC_PIN4) == RESET) { *row = 4; *col = 3; return 1; }
 680  023d 4b04          	push	#4
 681  023f ae5000        	ldw	x,#20480
 682  0242 cd0000        	call	_GPIO_ReadInputPin
 684  0245 5b01          	addw	sp,#1
 685  0247 4d            	tnz	a
 686  0248 2610          	jrne	L521
 689  024a 1e02          	ldw	x,(OFST+1,sp)
 690  024c a604          	ld	a,#4
 691  024e f7            	ld	(x),a
 694  024f 1e06          	ldw	x,(OFST+5,sp)
 695  0251 a603          	ld	a,#3
 696  0253 f7            	ld	(x),a
 699  0254 a601          	ld	a,#1
 701  0256 ace700e7      	jpf	L21
 702  025a               L521:
 703                     ; 69         delay_ms(10);
 705  025a ae000a        	ldw	x,#10
 706  025d cd0314        	call	_delay_ms
 708                     ; 71         GPIO_WriteHigh(RC_PIN5); GPIO_WriteHigh(RC_PIN6); GPIO_WriteHigh(RC_PIN7); GPIO_WriteLow(RC_PIN8);
 710  0260 4b02          	push	#2
 711  0262 ae5000        	ldw	x,#20480
 712  0265 cd0000        	call	_GPIO_WriteHigh
 714  0268 84            	pop	a
 717  0269 4b40          	push	#64
 718  026b ae500f        	ldw	x,#20495
 719  026e cd0000        	call	_GPIO_WriteHigh
 721  0271 84            	pop	a
 724  0272 4b20          	push	#32
 725  0274 ae500f        	ldw	x,#20495
 726  0277 cd0000        	call	_GPIO_WriteHigh
 728  027a 84            	pop	a
 731  027b 4b10          	push	#16
 732  027d ae500f        	ldw	x,#20495
 733  0280 cd0000        	call	_GPIO_WriteLow
 735  0283 84            	pop	a
 736                     ; 72         if (GPIO_ReadInputPin(RC_PIN1) == RESET) { *row = 1; *col = 4; return 1; }
 738  0284 4b02          	push	#2
 739  0286 ae500f        	ldw	x,#20495
 740  0289 cd0000        	call	_GPIO_ReadInputPin
 742  028c 5b01          	addw	sp,#1
 743  028e 4d            	tnz	a
 744  028f 2610          	jrne	L721
 747  0291 1e02          	ldw	x,(OFST+1,sp)
 748  0293 a601          	ld	a,#1
 749  0295 f7            	ld	(x),a
 752  0296 1e06          	ldw	x,(OFST+5,sp)
 753  0298 a604          	ld	a,#4
 754  029a f7            	ld	(x),a
 757  029b a601          	ld	a,#1
 759  029d ace700e7      	jpf	L21
 760  02a1               L721:
 761                     ; 73         if (GPIO_ReadInputPin(RC_PIN2) == RESET) { *row = 2; *col = 4; return 1; }
 763  02a1 4b04          	push	#4
 764  02a3 ae500f        	ldw	x,#20495
 765  02a6 cd0000        	call	_GPIO_ReadInputPin
 767  02a9 5b01          	addw	sp,#1
 768  02ab 4d            	tnz	a
 769  02ac 2610          	jrne	L131
 772  02ae 1e02          	ldw	x,(OFST+1,sp)
 773  02b0 a602          	ld	a,#2
 774  02b2 f7            	ld	(x),a
 777  02b3 1e06          	ldw	x,(OFST+5,sp)
 778  02b5 a604          	ld	a,#4
 779  02b7 f7            	ld	(x),a
 782  02b8 a601          	ld	a,#1
 784  02ba ace700e7      	jpf	L21
 785  02be               L131:
 786                     ; 74         if (GPIO_ReadInputPin(RC_PIN3) == RESET) { *row = 3; *col = 4; return 1; }
 788  02be 4b08          	push	#8
 789  02c0 ae500f        	ldw	x,#20495
 790  02c3 cd0000        	call	_GPIO_ReadInputPin
 792  02c6 5b01          	addw	sp,#1
 793  02c8 4d            	tnz	a
 794  02c9 2610          	jrne	L331
 797  02cb 1e02          	ldw	x,(OFST+1,sp)
 798  02cd a603          	ld	a,#3
 799  02cf f7            	ld	(x),a
 802  02d0 1e06          	ldw	x,(OFST+5,sp)
 803  02d2 a604          	ld	a,#4
 804  02d4 f7            	ld	(x),a
 807  02d5 a601          	ld	a,#1
 809  02d7 ace700e7      	jpf	L21
 810  02db               L331:
 811                     ; 75         if (GPIO_ReadInputPin(RC_PIN4) == RESET) { *row = 4; *col = 4; return 1; }
 813  02db 4b04          	push	#4
 814  02dd ae5000        	ldw	x,#20480
 815  02e0 cd0000        	call	_GPIO_ReadInputPin
 817  02e3 5b01          	addw	sp,#1
 818  02e5 4d            	tnz	a
 819  02e6 2610          	jrne	L531
 822  02e8 1e02          	ldw	x,(OFST+1,sp)
 823  02ea a604          	ld	a,#4
 824  02ec f7            	ld	(x),a
 827  02ed 1e06          	ldw	x,(OFST+5,sp)
 828  02ef a604          	ld	a,#4
 829  02f1 f7            	ld	(x),a
 832  02f2 a601          	ld	a,#1
 834  02f4 ace700e7      	jpf	L21
 835  02f8               L531:
 836                     ; 76         delay_ms(10);
 838  02f8 ae000a        	ldw	x,#10
 839  02fb ad17          	call	_delay_ms
 841                     ; 78         if (t != 0) {
 843  02fd 0d08          	tnz	(OFST+7,sp)
 844  02ff 2603          	jrne	L41
 845  0301 cc008f        	jp	L37
 846  0304               L41:
 847                     ; 79             timeCounter++;
 849  0304 0c01          	inc	(OFST+0,sp)
 851                     ; 80             if (timeCounter >= t) {
 853  0306 7b01          	ld	a,(OFST+0,sp)
 854  0308 1108          	cp	a,(OFST+7,sp)
 855  030a 2403          	jruge	L61
 856  030c cc008f        	jp	L37
 857  030f               L61:
 858                     ; 81                 return 0;  
 860  030f 4f            	clr	a
 862  0310 ace700e7      	jpf	L21
 907                     ; 94 void delay_ms(uint16_t ms) {
 908                     	switch	.text
 909  0314               _delay_ms:
 911  0314 89            	pushw	x
 912  0315 89            	pushw	x
 913       00000002      OFST:	set	2
 916  0316 2012          	jra	L761
 917  0318               L561:
 918                     ; 97         for (i = 0; i < 1600; i++) {
 920  0318 5f            	clrw	x
 921  0319 1f01          	ldw	(OFST-1,sp),x
 923  031b               L371:
 924                     ; 98             __asm("nop");
 927  031b 9d            nop
 929                     ; 97         for (i = 0; i < 1600; i++) {
 931  031c 1e01          	ldw	x,(OFST-1,sp)
 932  031e 1c0001        	addw	x,#1
 933  0321 1f01          	ldw	(OFST-1,sp),x
 937  0323 1e01          	ldw	x,(OFST-1,sp)
 938  0325 a30640        	cpw	x,#1600
 939  0328 25f1          	jrult	L371
 940  032a               L761:
 941                     ; 96 		while (ms--) {
 943  032a 1e03          	ldw	x,(OFST+1,sp)
 944  032c 1d0001        	subw	x,#1
 945  032f 1f03          	ldw	(OFST+1,sp),x
 946  0331 1c0001        	addw	x,#1
 947  0334 a30000        	cpw	x,#0
 948  0337 26df          	jrne	L561
 949                     ; 101 }
 952  0339 5b04          	addw	sp,#4
 953  033b 81            	ret
 956                     .const:	section	.text
 957  0000               L102_txaddr1:
 958  0000 01            	dc.b	1
 959  0001 01            	dc.b	1
 960  0002 01            	dc.b	1
 961  0003 01            	dc.b	1
 962  0004 01            	dc.b	1
 999                     ; 108 uint8_t SWITCH_TO_LESDSTRIP_MODE(void) {
1000                     	switch	.text
1001  033c               _SWITCH_TO_LESDSTRIP_MODE:
1003  033c 5205          	subw	sp,#5
1004       00000005      OFST:	set	5
1007                     ; 109         uint8_t txaddr1[] = {LED_STRIP_ADDRESS, LED_STRIP_ADDRESS, LED_STRIP_ADDRESS, LED_STRIP_ADDRESS, LED_STRIP_ADDRESS};
1009  033e 96            	ldw	x,sp
1010  033f 1c0001        	addw	x,#OFST-4
1011  0342 90ae0000      	ldw	y,#L102_txaddr1
1012  0346 a605          	ld	a,#5
1013  0348 cd0000        	call	c_xymov
1015                     ; 110 		CURRENT_MODE = STRIP_MOD;
1017  034b 3f00          	clr	_CURRENT_MODE
1018                     ; 111     SET_TX_ADDR(txaddr1, 5);
1020  034d 4b05          	push	#5
1021  034f 96            	ldw	x,sp
1022  0350 1c0002        	addw	x,#OFST-3
1023  0353 89            	pushw	x
1024  0354 a610          	ld	a,#16
1025  0356 cd0000        	call	_write_registerN
1027  0359 5b03          	addw	sp,#3
1028                     ; 112     delay(100);
1030  035b ae0064        	ldw	x,#100
1031  035e cd0000        	call	_delay
1033                     ; 113     return 1;
1035  0361 a601          	ld	a,#1
1038  0363 5b05          	addw	sp,#5
1039  0365 81            	ret
1042                     	switch	.const
1043  0005               L122_buf:
1044  0005 fe            	dc.b	254
1045  0006 00            	dc.b	0
1046  0007 00            	dc.b	0
1047  0008               L322_buf:
1048  0008 00            	dc.b	0
1049  0009 fe            	dc.b	254
1050  000a 00            	dc.b	0
1051  000b               L522_buf:
1052  000b 00            	dc.b	0
1053  000c 00            	dc.b	0
1054  000d fe            	dc.b	254
1126                     ; 117 uint8_t procces_LEDStrip(uint8_t row, uint8_t col) {
1127                     	switch	.text
1128  0366               _procces_LEDStrip:
1130  0366 89            	pushw	x
1131  0367 5203          	subw	sp,#3
1132       00000003      OFST:	set	3
1135                     ; 120 if (RED_COLOUR_BUTTON) {
1137  0369 9f            	ld	a,xl
1138  036a a101          	cp	a,#1
1139  036c 261e          	jrne	L562
1141  036e 9e            	ld	a,xh
1142  036f a101          	cp	a,#1
1143  0371 2619          	jrne	L562
1144                     ; 121     uint8_t buf[] = {254, 0, 0};
1146  0373 96            	ldw	x,sp
1147  0374 1c0001        	addw	x,#OFST-2
1148  0377 90ae0005      	ldw	y,#L122_buf
1149  037b a603          	ld	a,#3
1150  037d cd0000        	call	c_xymov
1152                     ; 122     tx_send(buf, 3);
1154  0380 4b03          	push	#3
1155  0382 96            	ldw	x,sp
1156  0383 1c0002        	addw	x,#OFST-1
1157  0386 cd0000        	call	_tx_send
1159  0389 84            	pop	a
1161  038a 2048          	jra	L762
1162  038c               L562:
1163                     ; 124 else if (GREEN_COLOUR_BUTTON) {
1165  038c 7b05          	ld	a,(OFST+2,sp)
1166  038e a101          	cp	a,#1
1167  0390 261f          	jrne	L172
1169  0392 7b04          	ld	a,(OFST+1,sp)
1170  0394 a102          	cp	a,#2
1171  0396 2619          	jrne	L172
1172                     ; 125     uint8_t buf[] = {0, 254, 0};
1174  0398 96            	ldw	x,sp
1175  0399 1c0001        	addw	x,#OFST-2
1176  039c 90ae0008      	ldw	y,#L322_buf
1177  03a0 a603          	ld	a,#3
1178  03a2 cd0000        	call	c_xymov
1180                     ; 126     tx_send(buf, 3);
1182  03a5 4b03          	push	#3
1183  03a7 96            	ldw	x,sp
1184  03a8 1c0002        	addw	x,#OFST-1
1185  03ab cd0000        	call	_tx_send
1187  03ae 84            	pop	a
1189  03af 2023          	jra	L762
1190  03b1               L172:
1191                     ; 128 else if (BLUE_COLOUR_BUTTON) {
1193  03b1 7b05          	ld	a,(OFST+2,sp)
1194  03b3 a101          	cp	a,#1
1195  03b5 261d          	jrne	L762
1197  03b7 7b04          	ld	a,(OFST+1,sp)
1198  03b9 a103          	cp	a,#3
1199  03bb 2617          	jrne	L762
1200                     ; 129     uint8_t buf[] = {0, 0, 254};
1202  03bd 96            	ldw	x,sp
1203  03be 1c0001        	addw	x,#OFST-2
1204  03c1 90ae000b      	ldw	y,#L522_buf
1205  03c5 a603          	ld	a,#3
1206  03c7 cd0000        	call	c_xymov
1208                     ; 130     tx_send(buf, 3);
1210  03ca 4b03          	push	#3
1211  03cc 96            	ldw	x,sp
1212  03cd 1c0002        	addw	x,#OFST-1
1213  03d0 cd0000        	call	_tx_send
1215  03d3 84            	pop	a
1216  03d4               L762:
1217                     ; 132     return 1;
1219  03d4 a601          	ld	a,#1
1222  03d6 5b05          	addw	sp,#5
1223  03d8 81            	ret
1257                     ; 140 uint8_t procces_socket(uint8_t row, uint8_t col) {
1258                     	switch	.text
1259  03d9               _procces_socket:
1263                     ; 142     return 1;
1265  03d9 a601          	ld	a,#1
1268  03db 81            	ret
1300                     ; 149     void POWERSAVE(void)
1300                     ; 150     {
1301                     	switch	.text
1302  03dc               _POWERSAVE:
1306                     ; 151 				nrf_deinit();
1308  03dc cd0000        	call	_nrf_deinit
1310                     ; 152 				delay(1000);
1312  03df ae03e8        	ldw	x,#1000
1313  03e2 cd0000        	call	_delay
1315                     ; 153         SPI_DeInit_NRF();
1317  03e5 cd0000        	call	_SPI_DeInit_NRF
1319                     ; 156         GPIO_DeInit(GPIOD);
1321  03e8 ae500f        	ldw	x,#20495
1322  03eb cd0000        	call	_GPIO_DeInit
1324                     ; 157 				GPIO_DeInit(GPIOA);
1326  03ee ae5000        	ldw	x,#20480
1327  03f1 cd0000        	call	_GPIO_DeInit
1329                     ; 160 				GPIO_Init(RC_PIN5, GPIO_MODE_OUT_PP_LOW_FAST);
1331  03f4 4be0          	push	#224
1332  03f6 4b02          	push	#2
1333  03f8 ae5000        	ldw	x,#20480
1334  03fb cd0000        	call	_GPIO_Init
1336  03fe 85            	popw	x
1337                     ; 161         GPIO_WriteLow(RC_PIN5);
1339  03ff 4b02          	push	#2
1340  0401 ae5000        	ldw	x,#20480
1341  0404 cd0000        	call	_GPIO_WriteLow
1343  0407 84            	pop	a
1344                     ; 162         GPIO_Init(RC_PIN1, GPIO_MODE_IN_PU_IT);
1346  0408 4b60          	push	#96
1347  040a 4b02          	push	#2
1348  040c ae500f        	ldw	x,#20495
1349  040f cd0000        	call	_GPIO_Init
1351  0412 85            	popw	x
1352                     ; 163         EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOD, EXTI_SENSITIVITY_FALL_ONLY);
1354  0413 ae0302        	ldw	x,#770
1355  0416 cd0000        	call	_EXTI_SetExtIntSensitivity
1357                     ; 164         enableInterrupts();
1360  0419 9a            rim
1362                     ; 165 				wfi();
1366  041a 8f            wfi
1368                     ; 170     }
1372  041b 81            	ret
1418                     ; 174 void main(void) {
1419                     	switch	.text
1420  041c               _main:
1422  041c 88            	push	a
1423       00000001      OFST:	set	1
1426                     ; 176      init_pins();
1428  041d cd0000        	call	_init_pins
1430                     ; 177 		GPIO_Init(GPIOB, GPIO_PIN_5, GPIO_MODE_OUT_PP_HIGH_FAST);
1432  0420 4bf0          	push	#240
1433  0422 4b20          	push	#32
1434  0424 ae5005        	ldw	x,#20485
1435  0427 cd0000        	call	_GPIO_Init
1437  042a 85            	popw	x
1438                     ; 178 		if(!Init_NRF()) {
1440  042b cd0059        	call	_Init_NRF
1442  042e 4d            	tnz	a
1443  042f 2602          	jrne	L153
1444  0431               L543:
1445                     ; 179         while(1);
1447  0431 20fe          	jra	L543
1448  0433               L153:
1449                     ; 182         res = waiting_for_click(&row, &col, 0);
1451  0433 4b00          	push	#0
1452  0435 ae0000        	ldw	x,#_col
1453  0438 89            	pushw	x
1454  0439 ae0001        	ldw	x,#_row
1455  043c cd008b        	call	_waiting_for_click
1457  043f 5b03          	addw	sp,#3
1458  0441 6b01          	ld	(OFST+0,sp),a
1460                     ; 183 						GPIO_WriteLow(GPIOB, GPIO_PIN_5);
1462  0443 4b20          	push	#32
1463  0445 ae5005        	ldw	x,#20485
1464  0448 cd0000        	call	_GPIO_WriteLow
1466  044b 84            	pop	a
1467                     ; 184         if (res) {
1469  044c 0d01          	tnz	(OFST+0,sp)
1470  044e 27e3          	jreq	L153
1471                     ; 188                 if(POWER_SAVE_BUTTON) {
1473  0450 b600          	ld	a,_col
1474  0452 a101          	cp	a,#1
1475  0454 2614          	jrne	L753
1477  0456 b601          	ld	a,_row
1478  0458 a104          	cp	a,#4
1479  045a 260e          	jrne	L753
1480                     ; 189                     POWERSAVE();
1482  045c cd03dc        	call	_POWERSAVE
1484                     ; 190 										GPIO_WriteHigh(GPIOB, GPIO_PIN_5);
1486  045f 4b20          	push	#32
1487  0461 ae5005        	ldw	x,#20485
1488  0464 cd0000        	call	_GPIO_WriteHigh
1490  0467 84            	pop	a
1491                     ; 191                     continue;
1493  0468 20c9          	jra	L153
1494  046a               L753:
1495                     ; 195                 if(STRIP_MOD_BUTTON) {
1497  046a b600          	ld	a,_col
1498  046c a104          	cp	a,#4
1499  046e 260b          	jrne	L163
1501  0470 b601          	ld	a,_row
1502  0472 a101          	cp	a,#1
1503  0474 2605          	jrne	L163
1504                     ; 196                     SWITCH_TO_LESDSTRIP_MODE();
1506  0476 cd033c        	call	_SWITCH_TO_LESDSTRIP_MODE
1509  0479 2018          	jra	L363
1510  047b               L163:
1511                     ; 198                 else if(CURRENT_MODE == STRIP_MOD) {
1513  047b 3d00          	tnz	_CURRENT_MODE
1514  047d 2614          	jrne	L363
1515                     ; 199                     procces_LEDStrip(row, col);
1517  047f b600          	ld	a,_col
1518  0481 97            	ld	xl,a
1519  0482 b601          	ld	a,_row
1520  0484 95            	ld	xh,a
1521  0485 cd0366        	call	_procces_LEDStrip
1523                     ; 200 										GPIO_WriteHigh(GPIOB, GPIO_PIN_5);
1525  0488 4b20          	push	#32
1526  048a ae5005        	ldw	x,#20485
1527  048d cd0000        	call	_GPIO_WriteHigh
1529  0490 84            	pop	a
1530                     ; 201                     continue;
1532  0491 20a0          	jra	L153
1533  0493               L363:
1534                     ; 208                 if(SOCKET_MOD_BUTTON) continue;
1536  0493 b600          	ld	a,_col
1537  0495 a102          	cp	a,#2
1538  0497 2606          	jrne	L763
1540  0499 b601          	ld	a,_row
1541  049b a104          	cp	a,#4
1542  049d 2794          	jreq	L153
1545  049f               L763:
1546                     ; 214 				GPIO_WriteHigh(GPIOB, GPIO_PIN_5);
1548  049f 4b20          	push	#32
1549  04a1 ae5005        	ldw	x,#20485
1550  04a4 cd0000        	call	_GPIO_WriteHigh
1552  04a7 84            	pop	a
1553  04a8 2089          	jra	L153
1588                     ; 225 void assert_failed(uint8_t* file, uint32_t line) {
1589                     	switch	.text
1590  04aa               _assert_failed:
1594  04aa               L704:
1595                     ; 227     while (1);
1597  04aa 20fe          	jra	L704
1649                     	xdef	_main
1650                     	xdef	_POWERSAVE
1651                     	xdef	_SWITCH_TO_LESDSTRIP_MODE
1652                     	switch	.ubsct
1653  0000               _col:
1654  0000 00            	ds.b	1
1655                     	xdef	_col
1656  0001               _row:
1657  0001 00            	ds.b	1
1658                     	xdef	_row
1659                     	xdef	_txaddr
1660                     	xdef	_CURRENT_MODE
1661                     	xdef	_procces_socket
1662                     	xdef	_procces_LEDStrip
1663                     	xdef	_Init_NRF
1664                     	xdef	_init_pins
1665                     	xdef	_delay_ms
1666                     	xdef	_waiting_for_click
1667                     	xref	_test_tx
1668                     	xref	_SPI_DeInit_NRF
1669                     	xref	_SPI_Init_NRF
1670                     	xref	_tx_send
1671                     	xref	_nrf_deinit
1672                     	xref	_tx_init
1673                     	xref	_write_registerN
1674                     	xref	_delay
1675                     	xdef	_assert_failed
1676                     	xref	_GPIO_ReadInputPin
1677                     	xref	_GPIO_WriteLow
1678                     	xref	_GPIO_WriteHigh
1679                     	xref	_GPIO_Init
1680                     	xref	_GPIO_DeInit
1681                     	xref	_EXTI_SetExtIntSensitivity
1682                     	xref.b	c_x
1702                     	xref	c_xymov
1703                     	end
