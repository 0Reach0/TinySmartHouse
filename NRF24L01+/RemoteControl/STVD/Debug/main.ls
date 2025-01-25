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
  52                     ; 14 void Init_Pins(void) {
  54                     	switch	.text
  55  0000               _Init_Pins:
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
 182                     ; 35     delay(10);
 184  0060 ae000a        	ldw	x,#10
 185  0063 cd0000        	call	_delay
 187                     ; 36     SET_TX_ADDR(txaddr, 5);
 189  0066 4b05          	push	#5
 190  0068 ae0001        	ldw	x,#_txaddr
 191  006b 89            	pushw	x
 192  006c a610          	ld	a,#16
 193  006e cd0000        	call	_write_registerN
 195  0071 5b03          	addw	sp,#3
 196                     ; 37     delay(10);
 198  0073 ae000a        	ldw	x,#10
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
 437                     ; 55         delay(10);
 439  0120 ae000a        	ldw	x,#10
 440  0123 cd0000        	call	_delay
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
 570                     ; 62         delay(10);
 572  01bc ae000a        	ldw	x,#10
 573  01bf cd0000        	call	_delay
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
 703                     ; 69         delay(10);
 705  025a ae000a        	ldw	x,#10
 706  025d cd0000        	call	_delay
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
 836                     ; 76         delay(10);
 838  02f8 ae000a        	ldw	x,#10
 839  02fb cd0000        	call	_delay
 841                     ; 78         if (t != 0) {
 843  02fe 0d08          	tnz	(OFST+7,sp)
 844  0300 2603          	jrne	L41
 845  0302 cc008f        	jp	L37
 846  0305               L41:
 847                     ; 79             timeCounter++;
 849  0305 0c01          	inc	(OFST+0,sp)
 851                     ; 80             if (timeCounter >= t) {
 853  0307 7b01          	ld	a,(OFST+0,sp)
 854  0309 1108          	cp	a,(OFST+7,sp)
 855  030b 2403          	jruge	L61
 856  030d cc008f        	jp	L37
 857  0310               L61:
 858                     ; 81                 return 0;  
 860  0310 4f            	clr	a
 862  0311 ace700e7      	jpf	L21
 865                     .const:	section	.text
 866  0000               L341_txaddr1:
 867  0000 01            	dc.b	1
 868  0001 01            	dc.b	1
 869  0002 01            	dc.b	1
 870  0003 01            	dc.b	1
 871  0004 01            	dc.b	1
 908                     ; 92 uint8_t SWITCH_TO_LESDSTRIP_MODE(void) {
 909                     	switch	.text
 910  0315               _SWITCH_TO_LESDSTRIP_MODE:
 912  0315 5205          	subw	sp,#5
 913       00000005      OFST:	set	5
 916                     ; 93         uint8_t txaddr1[] = {LED_STRIP_ADDRESS, LED_STRIP_ADDRESS, LED_STRIP_ADDRESS, LED_STRIP_ADDRESS, LED_STRIP_ADDRESS};
 918  0317 96            	ldw	x,sp
 919  0318 1c0001        	addw	x,#OFST-4
 920  031b 90ae0000      	ldw	y,#L341_txaddr1
 921  031f a605          	ld	a,#5
 922  0321 cd0000        	call	c_xymov
 924                     ; 94 		CURRENT_MODE = STRIP_MOD;
 926  0324 3f00          	clr	_CURRENT_MODE
 927                     ; 95     SET_TX_ADDR(txaddr1, 5);
 929  0326 4b05          	push	#5
 930  0328 96            	ldw	x,sp
 931  0329 1c0002        	addw	x,#OFST-3
 932  032c 89            	pushw	x
 933  032d a610          	ld	a,#16
 934  032f cd0000        	call	_write_registerN
 936  0332 5b03          	addw	sp,#3
 937                     ; 96     delay(10);
 939  0334 ae000a        	ldw	x,#10
 940  0337 cd0000        	call	_delay
 942                     ; 97     return 1;
 944  033a a601          	ld	a,#1
 947  033c 5b05          	addw	sp,#5
 948  033e 81            	ret
 951                     	switch	.const
 952  0005               L361_buf:
 953  0005 fe            	dc.b	254
 954  0006 00            	dc.b	0
 955  0007 00            	dc.b	0
 956  0008               L561_buf:
 957  0008 00            	dc.b	0
 958  0009 fe            	dc.b	254
 959  000a 00            	dc.b	0
 960  000b               L761_buf:
 961  000b 00            	dc.b	0
 962  000c 00            	dc.b	0
 963  000d fe            	dc.b	254
1035                     ; 101 uint8_t procces_LEDStrip(uint8_t row, uint8_t col) {
1036                     	switch	.text
1037  033f               _procces_LEDStrip:
1039  033f 89            	pushw	x
1040  0340 5203          	subw	sp,#3
1041       00000003      OFST:	set	3
1044                     ; 104 if (RED_COLOUR_BUTTON) {
1046  0342 9f            	ld	a,xl
1047  0343 a101          	cp	a,#1
1048  0345 261e          	jrne	L722
1050  0347 9e            	ld	a,xh
1051  0348 a101          	cp	a,#1
1052  034a 2619          	jrne	L722
1053                     ; 105     uint8_t buf[] = {254, 0, 0};
1055  034c 96            	ldw	x,sp
1056  034d 1c0001        	addw	x,#OFST-2
1057  0350 90ae0005      	ldw	y,#L361_buf
1058  0354 a603          	ld	a,#3
1059  0356 cd0000        	call	c_xymov
1061                     ; 106     tx_send(buf, 3);
1063  0359 4b03          	push	#3
1064  035b 96            	ldw	x,sp
1065  035c 1c0002        	addw	x,#OFST-1
1066  035f cd0000        	call	_tx_send
1068  0362 84            	pop	a
1070  0363 2048          	jra	L132
1071  0365               L722:
1072                     ; 108 else if (GREEN_COLOUR_BUTTON) {
1074  0365 7b05          	ld	a,(OFST+2,sp)
1075  0367 a101          	cp	a,#1
1076  0369 261f          	jrne	L332
1078  036b 7b04          	ld	a,(OFST+1,sp)
1079  036d a102          	cp	a,#2
1080  036f 2619          	jrne	L332
1081                     ; 109     uint8_t buf[] = {0, 254, 0};
1083  0371 96            	ldw	x,sp
1084  0372 1c0001        	addw	x,#OFST-2
1085  0375 90ae0008      	ldw	y,#L561_buf
1086  0379 a603          	ld	a,#3
1087  037b cd0000        	call	c_xymov
1089                     ; 110     tx_send(buf, 3);
1091  037e 4b03          	push	#3
1092  0380 96            	ldw	x,sp
1093  0381 1c0002        	addw	x,#OFST-1
1094  0384 cd0000        	call	_tx_send
1096  0387 84            	pop	a
1098  0388 2023          	jra	L132
1099  038a               L332:
1100                     ; 112 else if (BLUE_COLOUR_BUTTON) {
1102  038a 7b05          	ld	a,(OFST+2,sp)
1103  038c a101          	cp	a,#1
1104  038e 261d          	jrne	L132
1106  0390 7b04          	ld	a,(OFST+1,sp)
1107  0392 a103          	cp	a,#3
1108  0394 2617          	jrne	L132
1109                     ; 113     uint8_t buf[] = {0, 0, 254};
1111  0396 96            	ldw	x,sp
1112  0397 1c0001        	addw	x,#OFST-2
1113  039a 90ae000b      	ldw	y,#L761_buf
1114  039e a603          	ld	a,#3
1115  03a0 cd0000        	call	c_xymov
1117                     ; 114     tx_send(buf, 3);
1119  03a3 4b03          	push	#3
1120  03a5 96            	ldw	x,sp
1121  03a6 1c0002        	addw	x,#OFST-1
1122  03a9 cd0000        	call	_tx_send
1124  03ac 84            	pop	a
1125  03ad               L132:
1126                     ; 116     return 1;
1128  03ad a601          	ld	a,#1
1131  03af 5b05          	addw	sp,#5
1132  03b1 81            	ret
1166                     ; 124 uint8_t procces_socket(uint8_t row, uint8_t col) {
1167                     	switch	.text
1168  03b2               _procces_socket:
1172                     ; 126     return 1;
1174  03b2 a601          	ld	a,#1
1177  03b4 81            	ret
1209                     ; 133     void POWERSAVE(void)
1209                     ; 134     {
1210                     	switch	.text
1211  03b5               _POWERSAVE:
1215                     ; 135 				nrf_deinit();
1217  03b5 cd0000        	call	_nrf_deinit
1219                     ; 136 				delay(10);
1221  03b8 ae000a        	ldw	x,#10
1222  03bb cd0000        	call	_delay
1224                     ; 137         SPI_DeInit_NRF();
1226  03be cd0000        	call	_SPI_DeInit_NRF
1228                     ; 140         GPIO_DeInit(GPIOD);
1230  03c1 ae500f        	ldw	x,#20495
1231  03c4 cd0000        	call	_GPIO_DeInit
1233                     ; 141 				GPIO_DeInit(GPIOA);
1235  03c7 ae5000        	ldw	x,#20480
1236  03ca cd0000        	call	_GPIO_DeInit
1238                     ; 144 				GPIO_Init(RC_PIN5, GPIO_MODE_OUT_PP_LOW_FAST);
1240  03cd 4be0          	push	#224
1241  03cf 4b02          	push	#2
1242  03d1 ae5000        	ldw	x,#20480
1243  03d4 cd0000        	call	_GPIO_Init
1245  03d7 85            	popw	x
1246                     ; 145         GPIO_WriteLow(RC_PIN5);
1248  03d8 4b02          	push	#2
1249  03da ae5000        	ldw	x,#20480
1250  03dd cd0000        	call	_GPIO_WriteLow
1252  03e0 84            	pop	a
1253                     ; 146         GPIO_Init(RC_PIN1, GPIO_MODE_IN_PU_IT);
1255  03e1 4b60          	push	#96
1256  03e3 4b02          	push	#2
1257  03e5 ae500f        	ldw	x,#20495
1258  03e8 cd0000        	call	_GPIO_Init
1260  03eb 85            	popw	x
1261                     ; 147         EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOD, EXTI_SENSITIVITY_FALL_ONLY);
1263  03ec ae0302        	ldw	x,#770
1264  03ef cd0000        	call	_EXTI_SetExtIntSensitivity
1266                     ; 148         enableInterrupts();
1269  03f2 9a            rim
1271                     ; 149 				wfi();
1275  03f3 8f            wfi
1277                     ; 154     }
1281  03f4 81            	ret
1309                     ; 161 void SystemClock_Config(void) {
1310                     	switch	.text
1311  03f5               _SystemClock_Config:
1315                     ; 163     CLK_HSICmd(ENABLE);
1317  03f5 a601          	ld	a,#1
1318  03f7 cd0000        	call	_CLK_HSICmd
1321  03fa               L103:
1322                     ; 166     while (CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == RESET);
1324  03fa ae0102        	ldw	x,#258
1325  03fd cd0000        	call	_CLK_GetFlagStatus
1327  0400 4d            	tnz	a
1328  0401 27f7          	jreq	L103
1329                     ; 169     CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV8); // HSI = 16 ??? / 8 = 2 ???
1331  0403 a618          	ld	a,#24
1332  0405 cd0000        	call	_CLK_HSIPrescalerConfig
1334                     ; 172     CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV128); // CPU = 2 ??? / 128 = 15.625 ???
1336  0408 a687          	ld	a,#135
1337  040a cd0000        	call	_CLK_SYSCLKConfig
1339                     ; 175     CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, DISABLE, CLK_CURRENTCLOCKSTATE_DISABLE);
1341  040d 4b00          	push	#0
1342  040f 4b00          	push	#0
1343  0411 ae01e1        	ldw	x,#481
1344  0414 cd0000        	call	_CLK_ClockSwitchConfig
1346  0417 85            	popw	x
1347                     ; 176 }
1350  0418 81            	ret
1396                     ; 180 void main(void) {
1397                     	switch	.text
1398  0419               _main:
1400  0419 88            	push	a
1401       00000001      OFST:	set	1
1404                     ; 182      Init_Pins();
1406  041a cd0000        	call	_Init_Pins
1408                     ; 183 		GPIO_Init(GPIOB, GPIO_PIN_5, GPIO_MODE_OUT_PP_HIGH_FAST);
1410  041d 4bf0          	push	#240
1411  041f 4b20          	push	#32
1412  0421 ae5005        	ldw	x,#20485
1413  0424 cd0000        	call	_GPIO_Init
1415  0427 85            	popw	x
1416                     ; 184 		if(!Init_NRF()) {
1418  0428 cd0059        	call	_Init_NRF
1420  042b 4d            	tnz	a
1421  042c 2602          	jrne	L133
1422  042e               L523:
1423                     ; 185         while(1);
1425  042e 20fe          	jra	L523
1426  0430               L133:
1427                     ; 188         res = waiting_for_click(&row, &col, 0);
1429  0430 4b00          	push	#0
1430  0432 ae0000        	ldw	x,#_col
1431  0435 89            	pushw	x
1432  0436 ae0001        	ldw	x,#_row
1433  0439 cd008b        	call	_waiting_for_click
1435  043c 5b03          	addw	sp,#3
1436  043e 6b01          	ld	(OFST+0,sp),a
1438                     ; 189 						GPIO_WriteLow(GPIOB, GPIO_PIN_5);
1440  0440 4b20          	push	#32
1441  0442 ae5005        	ldw	x,#20485
1442  0445 cd0000        	call	_GPIO_WriteLow
1444  0448 84            	pop	a
1445                     ; 190         if (res) {
1447  0449 0d01          	tnz	(OFST+0,sp)
1448  044b 27e3          	jreq	L133
1449                     ; 194                 if(POWER_SAVE_BUTTON) {
1451  044d b600          	ld	a,_col
1452  044f a101          	cp	a,#1
1453  0451 2614          	jrne	L733
1455  0453 b601          	ld	a,_row
1456  0455 a104          	cp	a,#4
1457  0457 260e          	jrne	L733
1458                     ; 195                     POWERSAVE();
1460  0459 cd03b5        	call	_POWERSAVE
1462                     ; 196 										GPIO_WriteHigh(GPIOB, GPIO_PIN_5);
1464  045c 4b20          	push	#32
1465  045e ae5005        	ldw	x,#20485
1466  0461 cd0000        	call	_GPIO_WriteHigh
1468  0464 84            	pop	a
1469                     ; 197                     continue;
1471  0465 20c9          	jra	L133
1472  0467               L733:
1473                     ; 201                 if(STRIP_MOD_BUTTON) {
1475  0467 b600          	ld	a,_col
1476  0469 a104          	cp	a,#4
1477  046b 260b          	jrne	L143
1479  046d b601          	ld	a,_row
1480  046f a101          	cp	a,#1
1481  0471 2605          	jrne	L143
1482                     ; 202                     SWITCH_TO_LESDSTRIP_MODE();
1484  0473 cd0315        	call	_SWITCH_TO_LESDSTRIP_MODE
1487  0476 2018          	jra	L343
1488  0478               L143:
1489                     ; 204                 else if(CURRENT_MODE == STRIP_MOD) {
1491  0478 3d00          	tnz	_CURRENT_MODE
1492  047a 2614          	jrne	L343
1493                     ; 205                     procces_LEDStrip(row, col);
1495  047c b600          	ld	a,_col
1496  047e 97            	ld	xl,a
1497  047f b601          	ld	a,_row
1498  0481 95            	ld	xh,a
1499  0482 cd033f        	call	_procces_LEDStrip
1501                     ; 206 										GPIO_WriteHigh(GPIOB, GPIO_PIN_5);
1503  0485 4b20          	push	#32
1504  0487 ae5005        	ldw	x,#20485
1505  048a cd0000        	call	_GPIO_WriteHigh
1507  048d 84            	pop	a
1508                     ; 207                     continue;
1510  048e 20a0          	jra	L133
1511  0490               L343:
1512                     ; 214                 if(SOCKET_MOD_BUTTON) continue;
1514  0490 b600          	ld	a,_col
1515  0492 a102          	cp	a,#2
1516  0494 2606          	jrne	L743
1518  0496 b601          	ld	a,_row
1519  0498 a104          	cp	a,#4
1520  049a 2794          	jreq	L133
1523  049c               L743:
1524                     ; 220 				GPIO_WriteHigh(GPIOB, GPIO_PIN_5);
1526  049c 4b20          	push	#32
1527  049e ae5005        	ldw	x,#20485
1528  04a1 cd0000        	call	_GPIO_WriteHigh
1530  04a4 84            	pop	a
1531  04a5 2089          	jra	L133
1566                     ; 231 void assert_failed(uint8_t* file, uint32_t line) {
1567                     	switch	.text
1568  04a7               _assert_failed:
1572  04a7               L763:
1573                     ; 233     while (1);
1575  04a7 20fe          	jra	L763
1627                     	xdef	_main
1628                     	xdef	_SystemClock_Config
1629                     	xdef	_POWERSAVE
1630                     	xdef	_SWITCH_TO_LESDSTRIP_MODE
1631                     	switch	.ubsct
1632  0000               _col:
1633  0000 00            	ds.b	1
1634                     	xdef	_col
1635  0001               _row:
1636  0001 00            	ds.b	1
1637                     	xdef	_row
1638                     	xdef	_txaddr
1639                     	xdef	_CURRENT_MODE
1640                     	xdef	_procces_socket
1641                     	xdef	_procces_LEDStrip
1642                     	xdef	_Init_NRF
1643                     	xdef	_Init_Pins
1644                     	xdef	_waiting_for_click
1645                     	xref	_test_tx
1646                     	xref	_SPI_DeInit_NRF
1647                     	xref	_SPI_Init_NRF
1648                     	xref	_tx_send
1649                     	xref	_nrf_deinit
1650                     	xref	_tx_init
1651                     	xref	_write_registerN
1652                     	xref	_delay
1653                     	xdef	_assert_failed
1654                     	xref	_GPIO_ReadInputPin
1655                     	xref	_GPIO_WriteLow
1656                     	xref	_GPIO_WriteHigh
1657                     	xref	_GPIO_Init
1658                     	xref	_GPIO_DeInit
1659                     	xref	_EXTI_SetExtIntSensitivity
1660                     	xref	_CLK_GetFlagStatus
1661                     	xref	_CLK_SYSCLKConfig
1662                     	xref	_CLK_HSIPrescalerConfig
1663                     	xref	_CLK_ClockSwitchConfig
1664                     	xref	_CLK_HSICmd
1665                     	xref.b	c_x
1685                     	xref	c_xymov
1686                     	end
