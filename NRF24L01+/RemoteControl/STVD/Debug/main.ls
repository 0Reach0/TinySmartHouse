   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.3 - 22 Aug 2024
  44                     	bsct
  45  0000               _CURRENT_MODE:
  46  0000 00            	dc.b	0
  76                     ; 16 void Init_Pins(void) {
  78                     	switch	.text
  79  0000               _Init_Pins:
  83                     ; 19     GPIO_Init(RC_PIN5, GPIO_MODE_OUT_PP_LOW_FAST); 
  85  0000 4be0          	push	#224
  86  0002 4b02          	push	#2
  87  0004 ae5000        	ldw	x,#20480
  88  0007 cd0000        	call	_GPIO_Init
  90  000a 85            	popw	x
  91                     ; 20     GPIO_Init(RC_PIN6, GPIO_MODE_OUT_PP_LOW_FAST); 
  93  000b 4be0          	push	#224
  94  000d 4b40          	push	#64
  95  000f ae500f        	ldw	x,#20495
  96  0012 cd0000        	call	_GPIO_Init
  98  0015 85            	popw	x
  99                     ; 21     GPIO_Init(RC_PIN7, GPIO_MODE_OUT_PP_LOW_FAST);
 101  0016 4be0          	push	#224
 102  0018 4b20          	push	#32
 103  001a ae500f        	ldw	x,#20495
 104  001d cd0000        	call	_GPIO_Init
 106  0020 85            	popw	x
 107                     ; 22     GPIO_Init(RC_PIN8, GPIO_MODE_OUT_PP_LOW_FAST);
 109  0021 4be0          	push	#224
 110  0023 4b10          	push	#16
 111  0025 ae500f        	ldw	x,#20495
 112  0028 cd0000        	call	_GPIO_Init
 114  002b 85            	popw	x
 115                     ; 25     GPIO_Init(RC_PIN1, GPIO_MODE_IN_PU_NO_IT); // ?????? 1
 117  002c 4b40          	push	#64
 118  002e 4b02          	push	#2
 119  0030 ae500f        	ldw	x,#20495
 120  0033 cd0000        	call	_GPIO_Init
 122  0036 85            	popw	x
 123                     ; 26     GPIO_Init(RC_PIN2, GPIO_MODE_IN_PU_NO_IT); // ?????? 2
 125  0037 4b40          	push	#64
 126  0039 4b04          	push	#4
 127  003b ae500f        	ldw	x,#20495
 128  003e cd0000        	call	_GPIO_Init
 130  0041 85            	popw	x
 131                     ; 27     GPIO_Init(RC_PIN3, GPIO_MODE_IN_PU_NO_IT); // ?????? 3
 133  0042 4b40          	push	#64
 134  0044 4b08          	push	#8
 135  0046 ae500f        	ldw	x,#20495
 136  0049 cd0000        	call	_GPIO_Init
 138  004c 85            	popw	x
 139                     ; 28     GPIO_Init(RC_PIN4, GPIO_MODE_IN_PU_NO_IT); // ?????? 4
 141  004d 4b40          	push	#64
 142  004f 4b04          	push	#4
 143  0051 ae5000        	ldw	x,#20480
 144  0054 cd0000        	call	_GPIO_Init
 146  0057 85            	popw	x
 147                     ; 30 }
 150  0058 81            	ret
 190                     ; 32 uint8_t Init_NRF(void)
 190                     ; 33 {
 191                     	switch	.text
 192  0059               _Init_NRF:
 194  0059 88            	push	a
 195       00000001      OFST:	set	1
 198                     ; 35     SPI_Init_NRF();
 200  005a cd0000        	call	_SPI_Init_NRF
 202                     ; 36     tx_init();
 204  005d cd0000        	call	_tx_init
 206                     ; 37     delay(10);
 208  0060 ae000a        	ldw	x,#10
 209  0063 cd0000        	call	_delay
 211                     ; 38     SET_TX_ADDR(txaddr, 5);
 213  0066 4b05          	push	#5
 214  0068 be00          	ldw	x,_txaddr
 215  006a 89            	pushw	x
 216  006b a610          	ld	a,#16
 217  006d cd0000        	call	_write_registerN
 219  0070 5b03          	addw	sp,#3
 220                     ; 39     delay(10);
 222  0072 ae000a        	ldw	x,#10
 223  0075 cd0000        	call	_delay
 225                     ; 40     reg = test_tx();
 227  0078 cd0000        	call	_test_tx
 229  007b 6b01          	ld	(OFST+0,sp),a
 231                     ; 41     if(reg!= 0)
 233  007d 0d01          	tnz	(OFST+0,sp)
 234  007f 2704          	jreq	L35
 235                     ; 43         return 0;
 237  0081 4f            	clr	a
 240  0082 5b01          	addw	sp,#1
 241  0084 81            	ret
 242  0085               L35:
 243                     ; 45     return 1  ;
 245  0085 a601          	ld	a,#1
 248  0087 5b01          	addw	sp,#1
 249  0089 81            	ret
 316                     ; 49 uint8_t waiting_for_click(uint8_t *row, uint8_t *col, uint8_t t) {
 317                     	switch	.text
 318  008a               _waiting_for_click:
 320  008a 89            	pushw	x
 321  008b 88            	push	a
 322       00000001      OFST:	set	1
 325                     ; 50     uint8_t timeCounter = 0;
 327  008c 0f01          	clr	(OFST+0,sp)
 329  008e               L701:
 330                     ; 52         GPIO_WriteLow(RC_PIN5); GPIO_WriteHigh(RC_PIN6); GPIO_WriteHigh(RC_PIN7); GPIO_WriteHigh(RC_PIN8);
 332  008e 4b02          	push	#2
 333  0090 ae5000        	ldw	x,#20480
 334  0093 cd0000        	call	_GPIO_WriteLow
 336  0096 84            	pop	a
 339  0097 4b40          	push	#64
 340  0099 ae500f        	ldw	x,#20495
 341  009c cd0000        	call	_GPIO_WriteHigh
 343  009f 84            	pop	a
 346  00a0 4b20          	push	#32
 347  00a2 ae500f        	ldw	x,#20495
 348  00a5 cd0000        	call	_GPIO_WriteHigh
 350  00a8 84            	pop	a
 353  00a9 4b10          	push	#16
 354  00ab ae500f        	ldw	x,#20495
 355  00ae cd0000        	call	_GPIO_WriteHigh
 357  00b1 84            	pop	a
 358                     ; 53         if (GPIO_ReadInputPin(RC_PIN1) == RESET) { *row = 1; *col = 1; return 1; }
 360  00b2 4b02          	push	#2
 361  00b4 ae500f        	ldw	x,#20495
 362  00b7 cd0000        	call	_GPIO_ReadInputPin
 364  00ba 5b01          	addw	sp,#1
 365  00bc 4d            	tnz	a
 366  00bd 260e          	jrne	L311
 369  00bf 1e02          	ldw	x,(OFST+1,sp)
 370  00c1 a601          	ld	a,#1
 371  00c3 f7            	ld	(x),a
 374  00c4 1e06          	ldw	x,(OFST+5,sp)
 375  00c6 a601          	ld	a,#1
 376  00c8 f7            	ld	(x),a
 379  00c9 a601          	ld	a,#1
 381  00cb 2019          	jra	L21
 382  00cd               L311:
 383                     ; 54         if (GPIO_ReadInputPin(RC_PIN2) == RESET) { *row = 2; *col = 1; return 1; }
 385  00cd 4b04          	push	#4
 386  00cf ae500f        	ldw	x,#20495
 387  00d2 cd0000        	call	_GPIO_ReadInputPin
 389  00d5 5b01          	addw	sp,#1
 390  00d7 4d            	tnz	a
 391  00d8 260f          	jrne	L511
 394  00da 1e02          	ldw	x,(OFST+1,sp)
 395  00dc a602          	ld	a,#2
 396  00de f7            	ld	(x),a
 399  00df 1e06          	ldw	x,(OFST+5,sp)
 400  00e1 a601          	ld	a,#1
 401  00e3 f7            	ld	(x),a
 404  00e4 a601          	ld	a,#1
 406  00e6               L21:
 408  00e6 5b03          	addw	sp,#3
 409  00e8 81            	ret
 410  00e9               L511:
 411                     ; 55         if (GPIO_ReadInputPin(RC_PIN3) == RESET) { *row = 3; *col = 1; return 1; }
 413  00e9 4b08          	push	#8
 414  00eb ae500f        	ldw	x,#20495
 415  00ee cd0000        	call	_GPIO_ReadInputPin
 417  00f1 5b01          	addw	sp,#1
 418  00f3 4d            	tnz	a
 419  00f4 260e          	jrne	L711
 422  00f6 1e02          	ldw	x,(OFST+1,sp)
 423  00f8 a603          	ld	a,#3
 424  00fa f7            	ld	(x),a
 427  00fb 1e06          	ldw	x,(OFST+5,sp)
 428  00fd a601          	ld	a,#1
 429  00ff f7            	ld	(x),a
 432  0100 a601          	ld	a,#1
 434  0102 20e2          	jra	L21
 435  0104               L711:
 436                     ; 56         if (GPIO_ReadInputPin(RC_PIN4) == RESET) { *row = 4; *col = 1; return 1; }
 438  0104 4b04          	push	#4
 439  0106 ae5000        	ldw	x,#20480
 440  0109 cd0000        	call	_GPIO_ReadInputPin
 442  010c 5b01          	addw	sp,#1
 443  010e 4d            	tnz	a
 444  010f 260e          	jrne	L121
 447  0111 1e02          	ldw	x,(OFST+1,sp)
 448  0113 a604          	ld	a,#4
 449  0115 f7            	ld	(x),a
 452  0116 1e06          	ldw	x,(OFST+5,sp)
 453  0118 a601          	ld	a,#1
 454  011a f7            	ld	(x),a
 457  011b a601          	ld	a,#1
 459  011d 20c7          	jra	L21
 460  011f               L121:
 461                     ; 57         delay(10);
 463  011f ae000a        	ldw	x,#10
 464  0122 cd0000        	call	_delay
 466                     ; 59         GPIO_WriteHigh(RC_PIN5); GPIO_WriteLow(RC_PIN6); GPIO_WriteHigh(RC_PIN7); GPIO_WriteHigh(RC_PIN8);
 468  0125 4b02          	push	#2
 469  0127 ae5000        	ldw	x,#20480
 470  012a cd0000        	call	_GPIO_WriteHigh
 472  012d 84            	pop	a
 475  012e 4b40          	push	#64
 476  0130 ae500f        	ldw	x,#20495
 477  0133 cd0000        	call	_GPIO_WriteLow
 479  0136 84            	pop	a
 482  0137 4b20          	push	#32
 483  0139 ae500f        	ldw	x,#20495
 484  013c cd0000        	call	_GPIO_WriteHigh
 486  013f 84            	pop	a
 489  0140 4b10          	push	#16
 490  0142 ae500f        	ldw	x,#20495
 491  0145 cd0000        	call	_GPIO_WriteHigh
 493  0148 84            	pop	a
 494                     ; 60         if (GPIO_ReadInputPin(RC_PIN1) == RESET) { *row = 1; *col = 2; return 1; }
 496  0149 4b02          	push	#2
 497  014b ae500f        	ldw	x,#20495
 498  014e cd0000        	call	_GPIO_ReadInputPin
 500  0151 5b01          	addw	sp,#1
 501  0153 4d            	tnz	a
 502  0154 260e          	jrne	L321
 505  0156 1e02          	ldw	x,(OFST+1,sp)
 506  0158 a601          	ld	a,#1
 507  015a f7            	ld	(x),a
 510  015b 1e06          	ldw	x,(OFST+5,sp)
 511  015d a602          	ld	a,#2
 512  015f f7            	ld	(x),a
 515  0160 a601          	ld	a,#1
 517  0162 2082          	jra	L21
 518  0164               L321:
 519                     ; 61         if (GPIO_ReadInputPin(RC_PIN2) == RESET) { *row = 2; *col = 2; return 1; }
 521  0164 4b04          	push	#4
 522  0166 ae500f        	ldw	x,#20495
 523  0169 cd0000        	call	_GPIO_ReadInputPin
 525  016c 5b01          	addw	sp,#1
 526  016e 4d            	tnz	a
 527  016f 2610          	jrne	L521
 530  0171 1e02          	ldw	x,(OFST+1,sp)
 531  0173 a602          	ld	a,#2
 532  0175 f7            	ld	(x),a
 535  0176 1e06          	ldw	x,(OFST+5,sp)
 536  0178 a602          	ld	a,#2
 537  017a f7            	ld	(x),a
 540  017b a601          	ld	a,#1
 542  017d ace600e6      	jpf	L21
 543  0181               L521:
 544                     ; 62         if (GPIO_ReadInputPin(RC_PIN3) == RESET) { *row = 3; *col = 2; return 1; }
 546  0181 4b08          	push	#8
 547  0183 ae500f        	ldw	x,#20495
 548  0186 cd0000        	call	_GPIO_ReadInputPin
 550  0189 5b01          	addw	sp,#1
 551  018b 4d            	tnz	a
 552  018c 2610          	jrne	L721
 555  018e 1e02          	ldw	x,(OFST+1,sp)
 556  0190 a603          	ld	a,#3
 557  0192 f7            	ld	(x),a
 560  0193 1e06          	ldw	x,(OFST+5,sp)
 561  0195 a602          	ld	a,#2
 562  0197 f7            	ld	(x),a
 565  0198 a601          	ld	a,#1
 567  019a ace600e6      	jpf	L21
 568  019e               L721:
 569                     ; 63         if (GPIO_ReadInputPin(RC_PIN4) == RESET) { *row = 4; *col = 2; return 1; }
 571  019e 4b04          	push	#4
 572  01a0 ae5000        	ldw	x,#20480
 573  01a3 cd0000        	call	_GPIO_ReadInputPin
 575  01a6 5b01          	addw	sp,#1
 576  01a8 4d            	tnz	a
 577  01a9 2610          	jrne	L131
 580  01ab 1e02          	ldw	x,(OFST+1,sp)
 581  01ad a604          	ld	a,#4
 582  01af f7            	ld	(x),a
 585  01b0 1e06          	ldw	x,(OFST+5,sp)
 586  01b2 a602          	ld	a,#2
 587  01b4 f7            	ld	(x),a
 590  01b5 a601          	ld	a,#1
 592  01b7 ace600e6      	jpf	L21
 593  01bb               L131:
 594                     ; 64         delay(10);
 596  01bb ae000a        	ldw	x,#10
 597  01be cd0000        	call	_delay
 599                     ; 66         GPIO_WriteHigh(RC_PIN5); GPIO_WriteHigh(RC_PIN6); GPIO_WriteLow(RC_PIN7); GPIO_WriteHigh(RC_PIN8);
 601  01c1 4b02          	push	#2
 602  01c3 ae5000        	ldw	x,#20480
 603  01c6 cd0000        	call	_GPIO_WriteHigh
 605  01c9 84            	pop	a
 608  01ca 4b40          	push	#64
 609  01cc ae500f        	ldw	x,#20495
 610  01cf cd0000        	call	_GPIO_WriteHigh
 612  01d2 84            	pop	a
 615  01d3 4b20          	push	#32
 616  01d5 ae500f        	ldw	x,#20495
 617  01d8 cd0000        	call	_GPIO_WriteLow
 619  01db 84            	pop	a
 622  01dc 4b10          	push	#16
 623  01de ae500f        	ldw	x,#20495
 624  01e1 cd0000        	call	_GPIO_WriteHigh
 626  01e4 84            	pop	a
 627                     ; 67         if (GPIO_ReadInputPin(RC_PIN1) == RESET) { *row = 1; *col = 3; return 1; }
 629  01e5 4b02          	push	#2
 630  01e7 ae500f        	ldw	x,#20495
 631  01ea cd0000        	call	_GPIO_ReadInputPin
 633  01ed 5b01          	addw	sp,#1
 634  01ef 4d            	tnz	a
 635  01f0 2610          	jrne	L331
 638  01f2 1e02          	ldw	x,(OFST+1,sp)
 639  01f4 a601          	ld	a,#1
 640  01f6 f7            	ld	(x),a
 643  01f7 1e06          	ldw	x,(OFST+5,sp)
 644  01f9 a603          	ld	a,#3
 645  01fb f7            	ld	(x),a
 648  01fc a601          	ld	a,#1
 650  01fe ace600e6      	jpf	L21
 651  0202               L331:
 652                     ; 68         if (GPIO_ReadInputPin(RC_PIN2) == RESET) { *row = 2; *col = 3; return 1; }
 654  0202 4b04          	push	#4
 655  0204 ae500f        	ldw	x,#20495
 656  0207 cd0000        	call	_GPIO_ReadInputPin
 658  020a 5b01          	addw	sp,#1
 659  020c 4d            	tnz	a
 660  020d 2610          	jrne	L531
 663  020f 1e02          	ldw	x,(OFST+1,sp)
 664  0211 a602          	ld	a,#2
 665  0213 f7            	ld	(x),a
 668  0214 1e06          	ldw	x,(OFST+5,sp)
 669  0216 a603          	ld	a,#3
 670  0218 f7            	ld	(x),a
 673  0219 a601          	ld	a,#1
 675  021b ace600e6      	jpf	L21
 676  021f               L531:
 677                     ; 69         if (GPIO_ReadInputPin(RC_PIN3) == RESET) { *row = 3; *col = 3; return 1; }
 679  021f 4b08          	push	#8
 680  0221 ae500f        	ldw	x,#20495
 681  0224 cd0000        	call	_GPIO_ReadInputPin
 683  0227 5b01          	addw	sp,#1
 684  0229 4d            	tnz	a
 685  022a 2610          	jrne	L731
 688  022c 1e02          	ldw	x,(OFST+1,sp)
 689  022e a603          	ld	a,#3
 690  0230 f7            	ld	(x),a
 693  0231 1e06          	ldw	x,(OFST+5,sp)
 694  0233 a603          	ld	a,#3
 695  0235 f7            	ld	(x),a
 698  0236 a601          	ld	a,#1
 700  0238 ace600e6      	jpf	L21
 701  023c               L731:
 702                     ; 70         if (GPIO_ReadInputPin(RC_PIN4) == RESET) { *row = 4; *col = 3; return 1; }
 704  023c 4b04          	push	#4
 705  023e ae5000        	ldw	x,#20480
 706  0241 cd0000        	call	_GPIO_ReadInputPin
 708  0244 5b01          	addw	sp,#1
 709  0246 4d            	tnz	a
 710  0247 2610          	jrne	L141
 713  0249 1e02          	ldw	x,(OFST+1,sp)
 714  024b a604          	ld	a,#4
 715  024d f7            	ld	(x),a
 718  024e 1e06          	ldw	x,(OFST+5,sp)
 719  0250 a603          	ld	a,#3
 720  0252 f7            	ld	(x),a
 723  0253 a601          	ld	a,#1
 725  0255 ace600e6      	jpf	L21
 726  0259               L141:
 727                     ; 71         delay(10);
 729  0259 ae000a        	ldw	x,#10
 730  025c cd0000        	call	_delay
 732                     ; 73         GPIO_WriteHigh(RC_PIN5); GPIO_WriteHigh(RC_PIN6); GPIO_WriteHigh(RC_PIN7); GPIO_WriteLow(RC_PIN8);
 734  025f 4b02          	push	#2
 735  0261 ae5000        	ldw	x,#20480
 736  0264 cd0000        	call	_GPIO_WriteHigh
 738  0267 84            	pop	a
 741  0268 4b40          	push	#64
 742  026a ae500f        	ldw	x,#20495
 743  026d cd0000        	call	_GPIO_WriteHigh
 745  0270 84            	pop	a
 748  0271 4b20          	push	#32
 749  0273 ae500f        	ldw	x,#20495
 750  0276 cd0000        	call	_GPIO_WriteHigh
 752  0279 84            	pop	a
 755  027a 4b10          	push	#16
 756  027c ae500f        	ldw	x,#20495
 757  027f cd0000        	call	_GPIO_WriteLow
 759  0282 84            	pop	a
 760                     ; 74         if (GPIO_ReadInputPin(RC_PIN1) == RESET) { *row = 1; *col = 4; return 1; }
 762  0283 4b02          	push	#2
 763  0285 ae500f        	ldw	x,#20495
 764  0288 cd0000        	call	_GPIO_ReadInputPin
 766  028b 5b01          	addw	sp,#1
 767  028d 4d            	tnz	a
 768  028e 2610          	jrne	L341
 771  0290 1e02          	ldw	x,(OFST+1,sp)
 772  0292 a601          	ld	a,#1
 773  0294 f7            	ld	(x),a
 776  0295 1e06          	ldw	x,(OFST+5,sp)
 777  0297 a604          	ld	a,#4
 778  0299 f7            	ld	(x),a
 781  029a a601          	ld	a,#1
 783  029c ace600e6      	jpf	L21
 784  02a0               L341:
 785                     ; 75         if (GPIO_ReadInputPin(RC_PIN2) == RESET) { *row = 2; *col = 4; return 1; }
 787  02a0 4b04          	push	#4
 788  02a2 ae500f        	ldw	x,#20495
 789  02a5 cd0000        	call	_GPIO_ReadInputPin
 791  02a8 5b01          	addw	sp,#1
 792  02aa 4d            	tnz	a
 793  02ab 2610          	jrne	L541
 796  02ad 1e02          	ldw	x,(OFST+1,sp)
 797  02af a602          	ld	a,#2
 798  02b1 f7            	ld	(x),a
 801  02b2 1e06          	ldw	x,(OFST+5,sp)
 802  02b4 a604          	ld	a,#4
 803  02b6 f7            	ld	(x),a
 806  02b7 a601          	ld	a,#1
 808  02b9 ace600e6      	jpf	L21
 809  02bd               L541:
 810                     ; 76         if (GPIO_ReadInputPin(RC_PIN3) == RESET) { *row = 3; *col = 4; return 1; }
 812  02bd 4b08          	push	#8
 813  02bf ae500f        	ldw	x,#20495
 814  02c2 cd0000        	call	_GPIO_ReadInputPin
 816  02c5 5b01          	addw	sp,#1
 817  02c7 4d            	tnz	a
 818  02c8 2610          	jrne	L741
 821  02ca 1e02          	ldw	x,(OFST+1,sp)
 822  02cc a603          	ld	a,#3
 823  02ce f7            	ld	(x),a
 826  02cf 1e06          	ldw	x,(OFST+5,sp)
 827  02d1 a604          	ld	a,#4
 828  02d3 f7            	ld	(x),a
 831  02d4 a601          	ld	a,#1
 833  02d6 ace600e6      	jpf	L21
 834  02da               L741:
 835                     ; 77         if (GPIO_ReadInputPin(RC_PIN4) == RESET) { *row = 4; *col = 4; return 1; }
 837  02da 4b04          	push	#4
 838  02dc ae5000        	ldw	x,#20480
 839  02df cd0000        	call	_GPIO_ReadInputPin
 841  02e2 5b01          	addw	sp,#1
 842  02e4 4d            	tnz	a
 843  02e5 2610          	jrne	L151
 846  02e7 1e02          	ldw	x,(OFST+1,sp)
 847  02e9 a604          	ld	a,#4
 848  02eb f7            	ld	(x),a
 851  02ec 1e06          	ldw	x,(OFST+5,sp)
 852  02ee a604          	ld	a,#4
 853  02f0 f7            	ld	(x),a
 856  02f1 a601          	ld	a,#1
 858  02f3 ace600e6      	jpf	L21
 859  02f7               L151:
 860                     ; 78         delay(10);
 862  02f7 ae000a        	ldw	x,#10
 863  02fa cd0000        	call	_delay
 865                     ; 80         if (t != 0) {
 867  02fd 0d08          	tnz	(OFST+7,sp)
 868  02ff 2603          	jrne	L41
 869  0301 cc008e        	jp	L701
 870  0304               L41:
 871                     ; 81             timeCounter++;
 873  0304 0c01          	inc	(OFST+0,sp)
 875                     ; 82             if (timeCounter >= t) {
 877  0306 7b01          	ld	a,(OFST+0,sp)
 878  0308 1108          	cp	a,(OFST+7,sp)
 879  030a 2403          	jruge	L61
 880  030c cc008e        	jp	L701
 881  030f               L61:
 882                     ; 83                 return 0;  
 884  030f 4f            	clr	a
 886  0310 ace600e6      	jpf	L21
 918                     ; 92     void POWERSAVE(void)
 918                     ; 93     {
 919                     	switch	.text
 920  0314               _POWERSAVE:
 924                     ; 94 				nrf_deinit();
 926  0314 cd0000        	call	_nrf_deinit
 928                     ; 95 				delay(10);
 930  0317 ae000a        	ldw	x,#10
 931  031a cd0000        	call	_delay
 933                     ; 96         SPI_DeInit_NRF();
 935  031d cd0000        	call	_SPI_DeInit_NRF
 937                     ; 99         GPIO_DeInit(GPIOD);
 939  0320 ae500f        	ldw	x,#20495
 940  0323 cd0000        	call	_GPIO_DeInit
 942                     ; 100 				GPIO_DeInit(GPIOA);
 944  0326 ae5000        	ldw	x,#20480
 945  0329 cd0000        	call	_GPIO_DeInit
 947                     ; 103 				GPIO_Init(RC_PIN5, GPIO_MODE_OUT_PP_LOW_FAST);
 949  032c 4be0          	push	#224
 950  032e 4b02          	push	#2
 951  0330 ae5000        	ldw	x,#20480
 952  0333 cd0000        	call	_GPIO_Init
 954  0336 85            	popw	x
 955                     ; 104         GPIO_WriteLow(RC_PIN5);
 957  0337 4b02          	push	#2
 958  0339 ae5000        	ldw	x,#20480
 959  033c cd0000        	call	_GPIO_WriteLow
 961  033f 84            	pop	a
 962                     ; 105         GPIO_Init(RC_PIN1, GPIO_MODE_IN_PU_IT);
 964  0340 4b60          	push	#96
 965  0342 4b02          	push	#2
 966  0344 ae500f        	ldw	x,#20495
 967  0347 cd0000        	call	_GPIO_Init
 969  034a 85            	popw	x
 970                     ; 106         EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOD, EXTI_SENSITIVITY_FALL_ONLY);
 972  034b ae0302        	ldw	x,#770
 973  034e cd0000        	call	_EXTI_SetExtIntSensitivity
 975                     ; 107         enableInterrupts();
 978  0351 9a            rim
 980                     ; 108 				wfi();
 984  0352 8f            wfi
 986                     ; 113     }
 990  0353 81            	ret
1018                     ; 120 void SystemClock_Config(void) {
1019                     	switch	.text
1020  0354               _SystemClock_Config:
1024                     ; 121     CLK_HSICmd(ENABLE);
1026  0354 a601          	ld	a,#1
1027  0356 cd0000        	call	_CLK_HSICmd
1030  0359               L102:
1031                     ; 123     while (CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == RESET);
1033  0359 ae0102        	ldw	x,#258
1034  035c cd0000        	call	_CLK_GetFlagStatus
1036  035f 4d            	tnz	a
1037  0360 27f7          	jreq	L102
1038                     ; 125     CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV8);
1040  0362 a618          	ld	a,#24
1041  0364 cd0000        	call	_CLK_HSIPrescalerConfig
1043                     ; 127 		CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV128);
1045  0367 a687          	ld	a,#135
1046  0369 cd0000        	call	_CLK_SYSCLKConfig
1048                     ; 129     CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, DISABLE, CLK_CURRENTCLOCKSTATE_DISABLE);
1050  036c 4b00          	push	#0
1051  036e 4b00          	push	#0
1052  0370 ae01e1        	ldw	x,#481
1053  0373 cd0000        	call	_CLK_ClockSwitchConfig
1055  0376 85            	popw	x
1056                     ; 130 }
1059  0377 81            	ret
1107                     ; 134 void main(void) {
1108                     	switch	.text
1109  0378               _main:
1111  0378 88            	push	a
1112       00000001      OFST:	set	1
1115                     ; 136      Init_Pins();
1117  0379 cd0000        	call	_Init_Pins
1119                     ; 137 		GPIO_Init(GPIOB, GPIO_PIN_5, GPIO_MODE_OUT_PP_HIGH_FAST);
1121  037c 4bf0          	push	#240
1122  037e 4b20          	push	#32
1123  0380 ae5005        	ldw	x,#20485
1124  0383 cd0000        	call	_GPIO_Init
1126  0386 85            	popw	x
1127                     ; 138 		if(!Init_NRF()) {
1129  0387 cd0059        	call	_Init_NRF
1131  038a 4d            	tnz	a
1132  038b 2602          	jrne	L132
1133  038d               L522:
1134                     ; 139         while(1);
1136  038d 20fe          	jra	L522
1137  038f               L132:
1138                     ; 142         res = waiting_for_click(&row, &col, 0);
1140  038f 4b00          	push	#0
1141  0391 ae0026        	ldw	x,#_col
1142  0394 89            	pushw	x
1143  0395 ae0027        	ldw	x,#_row
1144  0398 cd008a        	call	_waiting_for_click
1146  039b 5b03          	addw	sp,#3
1147  039d 6b01          	ld	(OFST+0,sp),a
1149                     ; 143 						GPIO_WriteLow(GPIOB, GPIO_PIN_5);
1151  039f 4b20          	push	#32
1152  03a1 ae5005        	ldw	x,#20485
1153  03a4 cd0000        	call	_GPIO_WriteLow
1155  03a7 84            	pop	a
1156                     ; 144         if (res) {
1158  03a8 0d01          	tnz	(OFST+0,sp)
1159  03aa 27e3          	jreq	L132
1160                     ; 148                 if(POWER_SAVE_BUTTON) {
1162  03ac b626          	ld	a,_col
1163  03ae a101          	cp	a,#1
1164  03b0 2614          	jrne	L732
1166  03b2 b627          	ld	a,_row
1167  03b4 a104          	cp	a,#4
1168  03b6 260e          	jrne	L732
1169                     ; 149                     POWERSAVE();
1171  03b8 cd0314        	call	_POWERSAVE
1173                     ; 150 										GPIO_WriteHigh(GPIOB, GPIO_PIN_5);
1175  03bb 4b20          	push	#32
1176  03bd ae5005        	ldw	x,#20485
1177  03c0 cd0000        	call	_GPIO_WriteHigh
1179  03c3 84            	pop	a
1180                     ; 151                     continue;
1182  03c4 20c9          	jra	L132
1183  03c6               L732:
1184                     ; 155                 if(STRIP_MOD_BUTTON) {
1186  03c6 b626          	ld	a,_col
1187  03c8 a104          	cp	a,#4
1188  03ca 260b          	jrne	L142
1190  03cc b627          	ld	a,_row
1191  03ce a101          	cp	a,#1
1192  03d0 2605          	jrne	L142
1193                     ; 156                     SWITCH_TO_LEDSTRIP_MODE();
1195  03d2 cd0000        	call	_SWITCH_TO_LEDSTRIP_MODE
1198  03d5 2018          	jra	L342
1199  03d7               L142:
1200                     ; 158                 else if(CURRENT_MODE == STRIP_MOD) {
1202  03d7 3d00          	tnz	_CURRENT_MODE
1203  03d9 2614          	jrne	L342
1204                     ; 159                     process_LEDStrip(row, col);
1206  03db b626          	ld	a,_col
1207  03dd 97            	ld	xl,a
1208  03de b627          	ld	a,_row
1209  03e0 95            	ld	xh,a
1210  03e1 cd0000        	call	_process_LEDStrip
1212                     ; 160 										GPIO_WriteHigh(GPIOB, GPIO_PIN_5);
1214  03e4 4b20          	push	#32
1215  03e6 ae5005        	ldw	x,#20485
1216  03e9 cd0000        	call	_GPIO_WriteHigh
1218  03ec 84            	pop	a
1219                     ; 161                     continue;
1221  03ed 20a0          	jra	L132
1222  03ef               L342:
1223                     ; 168                 if(SOCKET_MOD_BUTTON)
1225  03ef b626          	ld	a,_col
1226  03f1 a104          	cp	a,#4
1227  03f3 260b          	jrne	L742
1229  03f5 b627          	ld	a,_row
1230  03f7 a102          	cp	a,#2
1231  03f9 2605          	jrne	L742
1232                     ; 170 									SWITCH_TO_SOCKET_MODE();
1234  03fb cd0000        	call	_SWITCH_TO_SOCKET_MODE
1237  03fe 201c          	jra	L152
1238  0400               L742:
1239                     ; 172 								else if(CURRENT_MODE == SOCKET_MOD) {
1241  0400 b600          	ld	a,_CURRENT_MODE
1242  0402 a101          	cp	a,#1
1243  0404 2616          	jrne	L152
1244                     ; 173                     procces_socket(row, col);
1246  0406 b626          	ld	a,_col
1247  0408 97            	ld	xl,a
1248  0409 b627          	ld	a,_row
1249  040b 95            	ld	xh,a
1250  040c cd0000        	call	_procces_socket
1252                     ; 174 										GPIO_WriteHigh(GPIOB, GPIO_PIN_5);
1254  040f 4b20          	push	#32
1255  0411 ae5005        	ldw	x,#20485
1256  0414 cd0000        	call	_GPIO_WriteHigh
1258  0417 84            	pop	a
1259                     ; 175                     continue;
1261  0418 ac8f038f      	jpf	L132
1262  041c               L152:
1263                     ; 182 				GPIO_WriteHigh(GPIOB, GPIO_PIN_5);
1265  041c 4b20          	push	#32
1266  041e ae5005        	ldw	x,#20485
1267  0421 cd0000        	call	_GPIO_WriteHigh
1269  0424 84            	pop	a
1270  0425 ac8f038f      	jpf	L132
1305                     ; 193 void assert_failed(uint8_t* file, uint32_t line) {
1306                     	switch	.text
1307  0429               _assert_failed:
1311  0429               L372:
1312                     ; 195     while (1);
1314  0429 20fe          	jra	L372
1421                     	xdef	_main
1422                     	xdef	_SystemClock_Config
1423                     	xdef	_POWERSAVE
1424                     	switch	.ubsct
1425  0000               _dPack:
1426  0000 000000000000  	ds.b	38
1427                     	xdef	_dPack
1428  0026               _col:
1429  0026 00            	ds.b	1
1430                     	xdef	_col
1431  0027               _row:
1432  0027 00            	ds.b	1
1433                     	xdef	_row
1434                     	xdef	_CURRENT_MODE
1435                     	xref.b	_txaddr
1436                     	xref	_SWITCH_TO_SOCKET_MODE
1437                     	xref	_procces_socket
1438  0028               _smartSocketAddr:
1439  0028 0000000000    	ds.b	5
1440                     	xdef	_smartSocketAddr
1441                     	xdef	_Init_NRF
1442                     	xdef	_Init_Pins
1443                     	xdef	_waiting_for_click
1444                     	xref	_SWITCH_TO_LEDSTRIP_MODE
1445                     	xref	_process_LEDStrip
1446                     	xref	_test_tx
1447                     	xref	_SPI_DeInit_NRF
1448                     	xref	_SPI_Init_NRF
1449                     	xref	_nrf_deinit
1450                     	xref	_tx_init
1451                     	xref	_write_registerN
1452                     	xref	_delay
1453                     	xdef	_assert_failed
1454                     	xref	_GPIO_ReadInputPin
1455                     	xref	_GPIO_WriteLow
1456                     	xref	_GPIO_WriteHigh
1457                     	xref	_GPIO_Init
1458                     	xref	_GPIO_DeInit
1459                     	xref	_EXTI_SetExtIntSensitivity
1460                     	xref	_CLK_GetFlagStatus
1461                     	xref	_CLK_SYSCLKConfig
1462                     	xref	_CLK_HSIPrescalerConfig
1463                     	xref	_CLK_ClockSwitchConfig
1464                     	xref	_CLK_HSICmd
1484                     	end
