   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.3 - 22 Aug 2024
   4                     ; Optimizer V4.6.3 - 22 Aug 2024
  47                     ; 53 void EXTI_DeInit(void)
  47                     ; 54 {
  49                     	switch	.text
  50  0000               _EXTI_DeInit:
  54                     ; 55   EXTI->CR1 = EXTI_CR1_RESET_VALUE;
  56  0000 725f50a0      	clr	20640
  57                     ; 56   EXTI->CR2 = EXTI_CR2_RESET_VALUE;
  59  0004 725f50a1      	clr	20641
  60                     ; 57 }
  63  0008 81            	ret	
 189                     ; 70 void EXTI_SetExtIntSensitivity(EXTI_Port_TypeDef Port, EXTI_Sensitivity_TypeDef SensitivityValue)
 189                     ; 71 {
 190                     	switch	.text
 191  0009               _EXTI_SetExtIntSensitivity:
 193  0009 89            	pushw	x
 194       00000000      OFST:	set	0
 197                     ; 73   assert_param(IS_EXTI_PORT_OK(Port));
 199  000a 9e            	ld	a,xh
 200  000b 4d            	tnz	a
 201  000c 2718          	jreq	L41
 202  000e 9e            	ld	a,xh
 203  000f 4a            	dec	a
 204  0010 2714          	jreq	L41
 205  0012 9e            	ld	a,xh
 206  0013 a102          	cp	a,#2
 207  0015 270f          	jreq	L41
 208  0017 9e            	ld	a,xh
 209  0018 a103          	cp	a,#3
 210  001a 270a          	jreq	L41
 211  001c 9e            	ld	a,xh
 212  001d a104          	cp	a,#4
 213  001f 2705          	jreq	L41
 214  0021 ae0049        	ldw	x,#73
 215  0024 ad7c          	call	LC004
 216  0026               L41:
 217                     ; 74   assert_param(IS_EXTI_SENSITIVITY_OK(SensitivityValue));
 219  0026 7b02          	ld	a,(OFST+2,sp)
 220  0028 2711          	jreq	L42
 221  002a a101          	cp	a,#1
 222  002c 270d          	jreq	L42
 223  002e a102          	cp	a,#2
 224  0030 2709          	jreq	L42
 225  0032 a103          	cp	a,#3
 226  0034 2705          	jreq	L42
 227  0036 ae004a        	ldw	x,#74
 228  0039 ad67          	call	LC004
 229  003b               L42:
 230                     ; 77   switch (Port)
 232  003b 7b01          	ld	a,(OFST+1,sp)
 234                     ; 99   default:
 234                     ; 100     break;
 235  003d 270e          	jreq	L12
 236  003f 4a            	dec	a
 237  0040 271a          	jreq	L32
 238  0042 4a            	dec	a
 239  0043 2725          	jreq	L52
 240  0045 4a            	dec	a
 241  0046 2731          	jreq	L72
 242  0048 4a            	dec	a
 243  0049 2745          	jreq	L13
 244  004b 2053          	jra	L511
 245  004d               L12:
 246                     ; 79   case EXTI_PORT_GPIOA:
 246                     ; 80     EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PAIS);
 248  004d c650a0        	ld	a,20640
 249  0050 a4fc          	and	a,#252
 250  0052 c750a0        	ld	20640,a
 251                     ; 81     EXTI->CR1 |= (uint8_t)(SensitivityValue);
 253  0055 c650a0        	ld	a,20640
 254  0058 1a02          	or	a,(OFST+2,sp)
 255                     ; 82     break;
 257  005a 202f          	jp	LC001
 258  005c               L32:
 259                     ; 83   case EXTI_PORT_GPIOB:
 259                     ; 84     EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PBIS);
 261  005c c650a0        	ld	a,20640
 262  005f a4f3          	and	a,#243
 263  0061 c750a0        	ld	20640,a
 264                     ; 85     EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 2);
 266  0064 7b02          	ld	a,(OFST+2,sp)
 267  0066 48            	sll	a
 268  0067 48            	sll	a
 269                     ; 86     break;
 271  0068 201e          	jp	LC002
 272  006a               L52:
 273                     ; 87   case EXTI_PORT_GPIOC:
 273                     ; 88     EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PCIS);
 275  006a c650a0        	ld	a,20640
 276  006d a4cf          	and	a,#207
 277  006f c750a0        	ld	20640,a
 278                     ; 89     EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 4);
 280  0072 7b02          	ld	a,(OFST+2,sp)
 281  0074 97            	ld	xl,a
 282  0075 a610          	ld	a,#16
 283                     ; 90     break;
 285  0077 200d          	jp	LC003
 286  0079               L72:
 287                     ; 91   case EXTI_PORT_GPIOD:
 287                     ; 92     EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PDIS);
 289  0079 c650a0        	ld	a,20640
 290  007c a43f          	and	a,#63
 291  007e c750a0        	ld	20640,a
 292                     ; 93     EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 6);
 294  0081 7b02          	ld	a,(OFST+2,sp)
 295  0083 97            	ld	xl,a
 296  0084 a640          	ld	a,#64
 297  0086               LC003:
 298  0086 42            	mul	x,a
 299  0087 9f            	ld	a,xl
 300  0088               LC002:
 301  0088 ca50a0        	or	a,20640
 302  008b               LC001:
 303  008b c750a0        	ld	20640,a
 304                     ; 94     break;
 306  008e 2010          	jra	L511
 307  0090               L13:
 308                     ; 95   case EXTI_PORT_GPIOE:
 308                     ; 96     EXTI->CR2 &= (uint8_t)(~EXTI_CR2_PEIS);
 310  0090 c650a1        	ld	a,20641
 311  0093 a4fc          	and	a,#252
 312  0095 c750a1        	ld	20641,a
 313                     ; 97     EXTI->CR2 |= (uint8_t)(SensitivityValue);
 315  0098 c650a1        	ld	a,20641
 316  009b 1a02          	or	a,(OFST+2,sp)
 317  009d c750a1        	ld	20641,a
 318                     ; 98     break;
 320                     ; 99   default:
 320                     ; 100     break;
 322  00a0               L511:
 323                     ; 102 }
 326  00a0 85            	popw	x
 327  00a1 81            	ret	
 328  00a2               LC004:
 329  00a2 89            	pushw	x
 330  00a3 5f            	clrw	x
 331  00a4 89            	pushw	x
 332  00a5 ae0000        	ldw	x,#L111
 333  00a8 cd0000        	call	_assert_failed
 335  00ab 5b04          	addw	sp,#4
 336  00ad 81            	ret	
 395                     ; 111 void EXTI_SetTLISensitivity(EXTI_TLISensitivity_TypeDef SensitivityValue)
 395                     ; 112 {
 396                     	switch	.text
 397  00ae               _EXTI_SetTLISensitivity:
 399  00ae 88            	push	a
 400       00000000      OFST:	set	0
 403                     ; 114   assert_param(IS_EXTI_TLISENSITIVITY_OK(SensitivityValue));
 405  00af 4d            	tnz	a
 406  00b0 2712          	jreq	L63
 407  00b2 a104          	cp	a,#4
 408  00b4 270e          	jreq	L63
 409  00b6 ae0072        	ldw	x,#114
 410  00b9 89            	pushw	x
 411  00ba 5f            	clrw	x
 412  00bb 89            	pushw	x
 413  00bc ae0000        	ldw	x,#L111
 414  00bf cd0000        	call	_assert_failed
 416  00c2 5b04          	addw	sp,#4
 417  00c4               L63:
 418                     ; 117   EXTI->CR2 &= (uint8_t)(~EXTI_CR2_TLIS);
 420  00c4 721550a1      	bres	20641,#2
 421                     ; 118   EXTI->CR2 |= (uint8_t)(SensitivityValue);
 423  00c8 c650a1        	ld	a,20641
 424  00cb 1a01          	or	a,(OFST+1,sp)
 425  00cd c750a1        	ld	20641,a
 426                     ; 119 }
 429  00d0 84            	pop	a
 430  00d1 81            	ret	
 477                     ; 126 EXTI_Sensitivity_TypeDef EXTI_GetExtIntSensitivity(EXTI_Port_TypeDef Port)
 477                     ; 127 {
 478                     	switch	.text
 479  00d2               _EXTI_GetExtIntSensitivity:
 481  00d2 88            	push	a
 482  00d3 88            	push	a
 483       00000001      OFST:	set	1
 486                     ; 128   uint8_t value = 0;
 488  00d4 0f01          	clr	(OFST+0,sp)
 490                     ; 131   assert_param(IS_EXTI_PORT_OK(Port));
 492  00d6 4d            	tnz	a
 493  00d7 271e          	jreq	L05
 494  00d9 a101          	cp	a,#1
 495  00db 271a          	jreq	L05
 496  00dd a102          	cp	a,#2
 497  00df 2716          	jreq	L05
 498  00e1 a103          	cp	a,#3
 499  00e3 2712          	jreq	L05
 500  00e5 a104          	cp	a,#4
 501  00e7 270e          	jreq	L05
 502  00e9 ae0083        	ldw	x,#131
 503  00ec 89            	pushw	x
 504  00ed 5f            	clrw	x
 505  00ee 89            	pushw	x
 506  00ef ae0000        	ldw	x,#L111
 507  00f2 cd0000        	call	_assert_failed
 509  00f5 5b04          	addw	sp,#4
 510  00f7               L05:
 511                     ; 133   switch (Port)
 513  00f7 7b02          	ld	a,(OFST+1,sp)
 515                     ; 150   default:
 515                     ; 151     break;
 516  00f9 2710          	jreq	L541
 517  00fb 4a            	dec	a
 518  00fc 2712          	jreq	L741
 519  00fe 4a            	dec	a
 520  00ff 2718          	jreq	L151
 521  0101 4a            	dec	a
 522  0102 271b          	jreq	L351
 523  0104 4a            	dec	a
 524  0105 2722          	jreq	L551
 525  0107 7b01          	ld	a,(OFST+0,sp)
 526  0109 2023          	jra	LC005
 527  010b               L541:
 528                     ; 135   case EXTI_PORT_GPIOA:
 528                     ; 136     value = (uint8_t)(EXTI->CR1 & EXTI_CR1_PAIS);
 530  010b c650a0        	ld	a,20640
 531                     ; 137     break;
 533  010e 201c          	jp	LC006
 534  0110               L741:
 535                     ; 138   case EXTI_PORT_GPIOB:
 535                     ; 139     value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PBIS) >> 2);
 537  0110 c650a0        	ld	a,20640
 538  0113 a40c          	and	a,#12
 539  0115 44            	srl	a
 540  0116 44            	srl	a
 541                     ; 140     break;
 543  0117 2015          	jp	LC005
 544  0119               L151:
 545                     ; 141   case EXTI_PORT_GPIOC:
 545                     ; 142     value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PCIS) >> 4);
 547  0119 c650a0        	ld	a,20640
 548  011c 4e            	swap	a
 549                     ; 143     break;
 551  011d 200d          	jp	LC006
 552  011f               L351:
 553                     ; 144   case EXTI_PORT_GPIOD:
 553                     ; 145     value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PDIS) >> 6);
 555  011f c650a0        	ld	a,20640
 556  0122 4e            	swap	a
 557  0123 a40c          	and	a,#12
 558  0125 44            	srl	a
 559  0126 44            	srl	a
 560                     ; 146     break;
 562  0127 2003          	jp	LC006
 563  0129               L551:
 564                     ; 147   case EXTI_PORT_GPIOE:
 564                     ; 148     value = (uint8_t)(EXTI->CR2 & EXTI_CR2_PEIS);
 566  0129 c650a1        	ld	a,20641
 567  012c               LC006:
 568  012c a403          	and	a,#3
 569  012e               LC005:
 571                     ; 149     break;
 573                     ; 150   default:
 573                     ; 151     break;
 575                     ; 154   return((EXTI_Sensitivity_TypeDef)value);
 579  012e 85            	popw	x
 580  012f 81            	ret	
 616                     ; 162 EXTI_TLISensitivity_TypeDef EXTI_GetTLISensitivity(void)
 616                     ; 163 {
 617                     	switch	.text
 618  0130               _EXTI_GetTLISensitivity:
 620       00000001      OFST:	set	1
 623                     ; 164   uint8_t value = 0;
 625                     ; 167   value = (uint8_t)(EXTI->CR2 & EXTI_CR2_TLIS);
 627  0130 c650a1        	ld	a,20641
 628  0133 a404          	and	a,#4
 630                     ; 169   return((EXTI_TLISensitivity_TypeDef)value);
 634  0135 81            	ret	
 647                     	xdef	_EXTI_GetTLISensitivity
 648                     	xdef	_EXTI_GetExtIntSensitivity
 649                     	xdef	_EXTI_SetTLISensitivity
 650                     	xdef	_EXTI_SetExtIntSensitivity
 651                     	xdef	_EXTI_DeInit
 652                     	xref	_assert_failed
 653                     .const:	section	.text
 654  0000               L111:
 655  0000 2e2e5c2e2e5c  	dc.b	"..\..\stm8s_spl\li"
 656  0012 627261726965  	dc.b	"braries\stm8s_stdp"
 657  0024 65726970685f  	dc.b	"eriph_driver\src\s"
 658  0036 746d38735f65  	dc.b	"tm8s_exti.c",0
 678                     	end
