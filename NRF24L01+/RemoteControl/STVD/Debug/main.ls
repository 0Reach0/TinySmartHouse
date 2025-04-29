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
 916                     ; 93 		uint8_t txaddr1[] = {LED_STRIP_ADDRESS, LED_STRIP_ADDRESS, LED_STRIP_ADDRESS, LED_STRIP_ADDRESS, LED_STRIP_ADDRESS};
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
1002                     ; 101 uint8_t procces_LEDStrip(uint8_t row, uint8_t col) {
1003                     	switch	.text
1004  033f               _procces_LEDStrip:
1006  033f 89            	pushw	x
1007  0340 5203          	subw	sp,#3
1008       00000003      OFST:	set	3
1011                     ; 104 if (SOCKET_ON_BUTTON) {
1013  0342 9f            	ld	a,xl
1014  0343 a101          	cp	a,#1
1015  0345 2611          	jrne	L112
1017  0347 9e            	ld	a,xh
1018  0348 a101          	cp	a,#1
1019  034a 260c          	jrne	L112
1020                     ; 105     tx_send(buf, CMD_SOCKET_ON);
1022  034c 4b50          	push	#80
1023  034e 96            	ldw	x,sp
1024  034f 1c0002        	addw	x,#OFST-1
1025  0352 cd0000        	call	_tx_send
1027  0355 84            	pop	a
1029  0356 2016          	jra	L312
1030  0358               L112:
1031                     ; 107 else if (SOCKET_OFF_BUTTON) {
1033  0358 7b05          	ld	a,(OFST+2,sp)
1034  035a a101          	cp	a,#1
1035  035c 2610          	jrne	L312
1037  035e 7b04          	ld	a,(OFST+1,sp)
1038  0360 a102          	cp	a,#2
1039  0362 260a          	jrne	L312
1040                     ; 108     tx_send(buf, CMD_SOCKET_OFF);
1042  0364 4b51          	push	#81
1043  0366 96            	ldw	x,sp
1044  0367 1c0002        	addw	x,#OFST-1
1045  036a cd0000        	call	_tx_send
1047  036d 84            	pop	a
1048  036e               L312:
1049                     ; 110 }
1052  036e 5b05          	addw	sp,#5
1053  0370 81            	ret
1056                     	switch	.const
1057  0005               L712_txaddr1:
1058  0005 02            	dc.b	2
1059  0006 02            	dc.b	2
1060  0007 02            	dc.b	2
1061  0008 02            	dc.b	2
1062  0009 02            	dc.b	2
1099                     ; 117 uint8_t SWITCH_TO_SOCKET_MODE(void)
1099                     ; 118 {
1100                     	switch	.text
1101  0371               _SWITCH_TO_SOCKET_MODE:
1103  0371 5205          	subw	sp,#5
1104       00000005      OFST:	set	5
1107                     ; 119 		uint8_t txaddr1[] = {SOCKET_ADDRESS, SOCKET_ADDRESS, SOCKET_ADDRESS, SOCKET_ADDRESS, SOCKET_ADDRESS};
1109  0373 96            	ldw	x,sp
1110  0374 1c0001        	addw	x,#OFST-4
1111  0377 90ae0005      	ldw	y,#L712_txaddr1
1112  037b a605          	ld	a,#5
1113  037d cd0000        	call	c_xymov
1115                     ; 120 		CURRENT_MODE = SOCKET_MOD;
1117  0380 35010000      	mov	_CURRENT_MODE,#1
1118                     ; 121     SET_TX_ADDR(txaddr1, 5);
1120  0384 4b05          	push	#5
1121  0386 96            	ldw	x,sp
1122  0387 1c0002        	addw	x,#OFST-3
1123  038a 89            	pushw	x
1124  038b a610          	ld	a,#16
1125  038d cd0000        	call	_write_registerN
1127  0390 5b03          	addw	sp,#3
1128                     ; 122     delay(10);
1130  0392 ae000a        	ldw	x,#10
1131  0395 cd0000        	call	_delay
1133                     ; 123     return 1;
1135  0398 a601          	ld	a,#1
1138  039a 5b05          	addw	sp,#5
1139  039c 81            	ret
1173                     ; 126 uint8_t procces_socket(uint8_t row, uint8_t col) {
1174                     	switch	.text
1175  039d               _procces_socket:
1179                     ; 129     return 1;
1181  039d a601          	ld	a,#1
1184  039f 81            	ret
1216                     ; 136     void POWERSAVE(void)
1216                     ; 137     {
1217                     	switch	.text
1218  03a0               _POWERSAVE:
1222                     ; 138 				nrf_deinit();
1224  03a0 cd0000        	call	_nrf_deinit
1226                     ; 139 				delay(10);
1228  03a3 ae000a        	ldw	x,#10
1229  03a6 cd0000        	call	_delay
1231                     ; 140         SPI_DeInit_NRF();
1233  03a9 cd0000        	call	_SPI_DeInit_NRF
1235                     ; 143         GPIO_DeInit(GPIOD);
1237  03ac ae500f        	ldw	x,#20495
1238  03af cd0000        	call	_GPIO_DeInit
1240                     ; 144 				GPIO_DeInit(GPIOA);
1242  03b2 ae5000        	ldw	x,#20480
1243  03b5 cd0000        	call	_GPIO_DeInit
1245                     ; 147 				GPIO_Init(RC_PIN5, GPIO_MODE_OUT_PP_LOW_FAST);
1247  03b8 4be0          	push	#224
1248  03ba 4b02          	push	#2
1249  03bc ae5000        	ldw	x,#20480
1250  03bf cd0000        	call	_GPIO_Init
1252  03c2 85            	popw	x
1253                     ; 148         GPIO_WriteLow(RC_PIN5);
1255  03c3 4b02          	push	#2
1256  03c5 ae5000        	ldw	x,#20480
1257  03c8 cd0000        	call	_GPIO_WriteLow
1259  03cb 84            	pop	a
1260                     ; 149         GPIO_Init(RC_PIN1, GPIO_MODE_IN_PU_IT);
1262  03cc 4b60          	push	#96
1263  03ce 4b02          	push	#2
1264  03d0 ae500f        	ldw	x,#20495
1265  03d3 cd0000        	call	_GPIO_Init
1267  03d6 85            	popw	x
1268                     ; 150         EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOD, EXTI_SENSITIVITY_FALL_ONLY);
1270  03d7 ae0302        	ldw	x,#770
1271  03da cd0000        	call	_EXTI_SetExtIntSensitivity
1273                     ; 151         enableInterrupts();
1276  03dd 9a            rim
1278                     ; 152 				wfi();
1282  03de 8f            wfi
1284                     ; 157     }
1288  03df 81            	ret
1316                     ; 164 void SystemClock_Config(void) {
1317                     	switch	.text
1318  03e0               _SystemClock_Config:
1322                     ; 165     CLK_HSICmd(ENABLE);
1324  03e0 a601          	ld	a,#1
1325  03e2 cd0000        	call	_CLK_HSICmd
1328  03e5               L772:
1329                     ; 167     while (CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == RESET);
1331  03e5 ae0102        	ldw	x,#258
1332  03e8 cd0000        	call	_CLK_GetFlagStatus
1334  03eb 4d            	tnz	a
1335  03ec 27f7          	jreq	L772
1336                     ; 169     CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV8);
1338  03ee a618          	ld	a,#24
1339  03f0 cd0000        	call	_CLK_HSIPrescalerConfig
1341                     ; 171 		CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV128);
1343  03f3 a687          	ld	a,#135
1344  03f5 cd0000        	call	_CLK_SYSCLKConfig
1346                     ; 173     CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, DISABLE, CLK_CURRENTCLOCKSTATE_DISABLE);
1348  03f8 4b00          	push	#0
1349  03fa 4b00          	push	#0
1350  03fc ae01e1        	ldw	x,#481
1351  03ff cd0000        	call	_CLK_ClockSwitchConfig
1353  0402 85            	popw	x
1354                     ; 174 }
1357  0403 81            	ret
1405                     ; 178 void main(void) {
1406                     	switch	.text
1407  0404               _main:
1409  0404 88            	push	a
1410       00000001      OFST:	set	1
1413                     ; 180      Init_Pins();
1415  0405 cd0000        	call	_Init_Pins
1417                     ; 181 		GPIO_Init(GPIOB, GPIO_PIN_5, GPIO_MODE_OUT_PP_HIGH_FAST);
1419  0408 4bf0          	push	#240
1420  040a 4b20          	push	#32
1421  040c ae5005        	ldw	x,#20485
1422  040f cd0000        	call	_GPIO_Init
1424  0412 85            	popw	x
1425                     ; 182 		if(!Init_NRF()) {
1427  0413 cd0059        	call	_Init_NRF
1429  0416 4d            	tnz	a
1430  0417 2602          	jrne	L723
1431  0419               L323:
1432                     ; 183         while(1);
1434  0419 20fe          	jra	L323
1435  041b               L723:
1436                     ; 186         res = waiting_for_click(&row, &col, 0);
1438  041b 4b00          	push	#0
1439  041d ae0000        	ldw	x,#_col
1440  0420 89            	pushw	x
1441  0421 ae0001        	ldw	x,#_row
1442  0424 cd008b        	call	_waiting_for_click
1444  0427 5b03          	addw	sp,#3
1445  0429 6b01          	ld	(OFST+0,sp),a
1447                     ; 187 						GPIO_WriteLow(GPIOB, GPIO_PIN_5);
1449  042b 4b20          	push	#32
1450  042d ae5005        	ldw	x,#20485
1451  0430 cd0000        	call	_GPIO_WriteLow
1453  0433 84            	pop	a
1454                     ; 188         if (res) {
1456  0434 0d01          	tnz	(OFST+0,sp)
1457  0436 27e3          	jreq	L723
1458                     ; 192                 if(POWER_SAVE_BUTTON) {
1460  0438 b600          	ld	a,_col
1461  043a a101          	cp	a,#1
1462  043c 2614          	jrne	L533
1464  043e b601          	ld	a,_row
1465  0440 a104          	cp	a,#4
1466  0442 260e          	jrne	L533
1467                     ; 193                     POWERSAVE();
1469  0444 cd03a0        	call	_POWERSAVE
1471                     ; 194 										GPIO_WriteHigh(GPIOB, GPIO_PIN_5);
1473  0447 4b20          	push	#32
1474  0449 ae5005        	ldw	x,#20485
1475  044c cd0000        	call	_GPIO_WriteHigh
1477  044f 84            	pop	a
1478                     ; 195                     continue;
1480  0450 20c9          	jra	L723
1481  0452               L533:
1482                     ; 199                 if(STRIP_MOD_BUTTON) {
1484  0452 b600          	ld	a,_col
1485  0454 a104          	cp	a,#4
1486  0456 260b          	jrne	L733
1488  0458 b601          	ld	a,_row
1489  045a a101          	cp	a,#1
1490  045c 2605          	jrne	L733
1491                     ; 200                     SWITCH_TO_LESDSTRIP_MODE();
1493  045e cd0315        	call	_SWITCH_TO_LESDSTRIP_MODE
1496  0461 2018          	jra	L143
1497  0463               L733:
1498                     ; 202                 else if(CURRENT_MODE == STRIP_MOD) {
1500  0463 3d00          	tnz	_CURRENT_MODE
1501  0465 2614          	jrne	L143
1502                     ; 203                     procces_LEDStrip(row, col);
1504  0467 b600          	ld	a,_col
1505  0469 97            	ld	xl,a
1506  046a b601          	ld	a,_row
1507  046c 95            	ld	xh,a
1508  046d cd033f        	call	_procces_LEDStrip
1510                     ; 204 										GPIO_WriteHigh(GPIOB, GPIO_PIN_5);
1512  0470 4b20          	push	#32
1513  0472 ae5005        	ldw	x,#20485
1514  0475 cd0000        	call	_GPIO_WriteHigh
1516  0478 84            	pop	a
1517                     ; 205                     continue;
1519  0479 20a0          	jra	L723
1520  047b               L143:
1521                     ; 212                 if(SOCKET_MOD_BUTTON)
1523  047b b600          	ld	a,_col
1524  047d a104          	cp	a,#4
1525  047f 260b          	jrne	L543
1527  0481 b601          	ld	a,_row
1528  0483 a102          	cp	a,#2
1529  0485 2605          	jrne	L543
1530                     ; 214 									SWITCH_TO_SOCKET_MODE();
1532  0487 cd0371        	call	_SWITCH_TO_SOCKET_MODE
1535  048a 201c          	jra	L743
1536  048c               L543:
1537                     ; 216 								else if(CURRENT_MODE == SOCKET_MOD) {
1539  048c b600          	ld	a,_CURRENT_MODE
1540  048e a101          	cp	a,#1
1541  0490 2616          	jrne	L743
1542                     ; 217                     procces_socket(row, col);
1544  0492 b600          	ld	a,_col
1545  0494 97            	ld	xl,a
1546  0495 b601          	ld	a,_row
1547  0497 95            	ld	xh,a
1548  0498 cd039d        	call	_procces_socket
1550                     ; 218 										GPIO_WriteHigh(GPIOB, GPIO_PIN_5);
1552  049b 4b20          	push	#32
1553  049d ae5005        	ldw	x,#20485
1554  04a0 cd0000        	call	_GPIO_WriteHigh
1556  04a3 84            	pop	a
1557                     ; 219                     continue;
1559  04a4 ac1b041b      	jpf	L723
1560  04a8               L743:
1561                     ; 226 				GPIO_WriteHigh(GPIOB, GPIO_PIN_5);
1563  04a8 4b20          	push	#32
1564  04aa ae5005        	ldw	x,#20485
1565  04ad cd0000        	call	_GPIO_WriteHigh
1567  04b0 84            	pop	a
1568  04b1 ac1b041b      	jpf	L723
1603                     ; 237 void assert_failed(uint8_t* file, uint32_t line) {
1604                     	switch	.text
1605  04b5               _assert_failed:
1609  04b5               L173:
1610                     ; 239     while (1);
1612  04b5 20fe          	jra	L173
1664                     	xdef	_main
1665                     	xdef	_SystemClock_Config
1666                     	xdef	_POWERSAVE
1667                     	switch	.ubsct
1668  0000               _col:
1669  0000 00            	ds.b	1
1670                     	xdef	_col
1671  0001               _row:
1672  0001 00            	ds.b	1
1673                     	xdef	_row
1674                     	xdef	_txaddr
1675                     	xdef	_CURRENT_MODE
1676                     	xdef	_SWITCH_TO_SOCKET_MODE
1677                     	xdef	_procces_socket
1678                     	xdef	_SWITCH_TO_LESDSTRIP_MODE
1679                     	xdef	_procces_LEDStrip
1680                     	xdef	_Init_NRF
1681                     	xdef	_Init_Pins
1682                     	xdef	_waiting_for_click
1683                     	xref	_test_tx
1684                     	xref	_SPI_DeInit_NRF
1685                     	xref	_SPI_Init_NRF
1686                     	xref	_tx_send
1687                     	xref	_nrf_deinit
1688                     	xref	_tx_init
1689                     	xref	_write_registerN
1690                     	xref	_delay
1691                     	xdef	_assert_failed
1692                     	xref	_GPIO_ReadInputPin
1693                     	xref	_GPIO_WriteLow
1694                     	xref	_GPIO_WriteHigh
1695                     	xref	_GPIO_Init
1696                     	xref	_GPIO_DeInit
1697                     	xref	_EXTI_SetExtIntSensitivity
1698                     	xref	_CLK_GetFlagStatus
1699                     	xref	_CLK_SYSCLKConfig
1700                     	xref	_CLK_HSIPrescalerConfig
1701                     	xref	_CLK_ClockSwitchConfig
1702                     	xref	_CLK_HSICmd
1703                     	xref.b	c_x
1723                     	xref	c_xymov
1724                     	end
