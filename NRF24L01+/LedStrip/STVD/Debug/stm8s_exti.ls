   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.3 - 22 Aug 2024
   4                     ; Optimizer V4.6.3 - 22 Aug 2024
  46                     ; 53 void EXTI_DeInit(void)
  46                     ; 54 {
  48                     	switch	.text
  49  0000               _EXTI_DeInit:
  53                     ; 55   EXTI->CR1 = EXTI_CR1_RESET_VALUE;
  55  0000 725f50a0      	clr	20640
  56                     ; 56   EXTI->CR2 = EXTI_CR2_RESET_VALUE;
  58  0004 725f50a1      	clr	20641
  59                     ; 57 }
  62  0008 81            	ret	
 188                     ; 70 void EXTI_SetExtIntSensitivity(EXTI_Port_TypeDef Port, EXTI_Sensitivity_TypeDef SensitivityValue)
 188                     ; 71 {
 189                     	switch	.text
 190  0009               _EXTI_SetExtIntSensitivity:
 192  0009 89            	pushw	x
 193       00000000      OFST:	set	0
 196                     ; 73   assert_param(IS_EXTI_PORT_OK(Port));
 198  000a 9e            	ld	a,xh
 199  000b 4d            	tnz	a
 200  000c 2718          	jreq	L41
 201  000e 9e            	ld	a,xh
 202  000f 4a            	dec	a
 203  0010 2714          	jreq	L41
 204  0012 9e            	ld	a,xh
 205  0013 a102          	cp	a,#2
 206  0015 270f          	jreq	L41
 207  0017 9e            	ld	a,xh
 208  0018 a103          	cp	a,#3
 209  001a 270a          	jreq	L41
 210  001c 9e            	ld	a,xh
 211  001d a104          	cp	a,#4
 212  001f 2705          	jreq	L41
 213  0021 ae0049        	ldw	x,#73
 214  0024 ad7c          	call	LC004
 215  0026               L41:
 216                     ; 74   assert_param(IS_EXTI_SENSITIVITY_OK(SensitivityValue));
 218  0026 7b02          	ld	a,(OFST+2,sp)
 219  0028 2711          	jreq	L42
 220  002a a101          	cp	a,#1
 221  002c 270d          	jreq	L42
 222  002e a102          	cp	a,#2
 223  0030 2709          	jreq	L42
 224  0032 a103          	cp	a,#3
 225  0034 2705          	jreq	L42
 226  0036 ae004a        	ldw	x,#74
 227  0039 ad67          	call	LC004
 228  003b               L42:
 229                     ; 77   switch (Port)
 231  003b 7b01          	ld	a,(OFST+1,sp)
 233                     ; 99   default:
 233                     ; 100     break;
 234  003d 270e          	jreq	L12
 235  003f 4a            	dec	a
 236  0040 271a          	jreq	L32
 237  0042 4a            	dec	a
 238  0043 2725          	jreq	L52
 239  0045 4a            	dec	a
 240  0046 2731          	jreq	L72
 241  0048 4a            	dec	a
 242  0049 2745          	jreq	L13
 243  004b 2053          	jra	L511
 244  004d               L12:
 245                     ; 79   case EXTI_PORT_GPIOA:
 245                     ; 80     EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PAIS);
 247  004d c650a0        	ld	a,20640
 248  0050 a4fc          	and	a,#252
 249  0052 c750a0        	ld	20640,a
 250                     ; 81     EXTI->CR1 |= (uint8_t)(SensitivityValue);
 252  0055 c650a0        	ld	a,20640
 253  0058 1a02          	or	a,(OFST+2,sp)
 254                     ; 82     break;
 256  005a 202f          	jp	LC001
 257  005c               L32:
 258                     ; 83   case EXTI_PORT_GPIOB:
 258                     ; 84     EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PBIS);
 260  005c c650a0        	ld	a,20640
 261  005f a4f3          	and	a,#243
 262  0061 c750a0        	ld	20640,a
 263                     ; 85     EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 2);
 265  0064 7b02          	ld	a,(OFST+2,sp)
 266  0066 48            	sll	a
 267  0067 48            	sll	a
 268                     ; 86     break;
 270  0068 201e          	jp	LC002
 271  006a               L52:
 272                     ; 87   case EXTI_PORT_GPIOC:
 272                     ; 88     EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PCIS);
 274  006a c650a0        	ld	a,20640
 275  006d a4cf          	and	a,#207
 276  006f c750a0        	ld	20640,a
 277                     ; 89     EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 4);
 279  0072 7b02          	ld	a,(OFST+2,sp)
 280  0074 97            	ld	xl,a
 281  0075 a610          	ld	a,#16
 282                     ; 90     break;
 284  0077 200d          	jp	LC003
 285  0079               L72:
 286                     ; 91   case EXTI_PORT_GPIOD:
 286                     ; 92     EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PDIS);
 288  0079 c650a0        	ld	a,20640
 289  007c a43f          	and	a,#63
 290  007e c750a0        	ld	20640,a
 291                     ; 93     EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 6);
 293  0081 7b02          	ld	a,(OFST+2,sp)
 294  0083 97            	ld	xl,a
 295  0084 a640          	ld	a,#64
 296  0086               LC003:
 297  0086 42            	mul	x,a
 298  0087 9f            	ld	a,xl
 299  0088               LC002:
 300  0088 ca50a0        	or	a,20640
 301  008b               LC001:
 302  008b c750a0        	ld	20640,a
 303                     ; 94     break;
 305  008e 2010          	jra	L511
 306  0090               L13:
 307                     ; 95   case EXTI_PORT_GPIOE:
 307                     ; 96     EXTI->CR2 &= (uint8_t)(~EXTI_CR2_PEIS);
 309  0090 c650a1        	ld	a,20641
 310  0093 a4fc          	and	a,#252
 311  0095 c750a1        	ld	20641,a
 312                     ; 97     EXTI->CR2 |= (uint8_t)(SensitivityValue);
 314  0098 c650a1        	ld	a,20641
 315  009b 1a02          	or	a,(OFST+2,sp)
 316  009d c750a1        	ld	20641,a
 317                     ; 98     break;
 319                     ; 99   default:
 319                     ; 100     break;
 321  00a0               L511:
 322                     ; 102 }
 325  00a0 85            	popw	x
 326  00a1 81            	ret	
 327  00a2               LC004:
 328  00a2 89            	pushw	x
 329  00a3 5f            	clrw	x
 330  00a4 89            	pushw	x
 331  00a5 ae0000        	ldw	x,#L111
 332  00a8 cd0000        	call	_assert_failed
 334  00ab 5b04          	addw	sp,#4
 335  00ad 81            	ret	
 394                     ; 111 void EXTI_SetTLISensitivity(EXTI_TLISensitivity_TypeDef SensitivityValue)
 394                     ; 112 {
 395                     	switch	.text
 396  00ae               _EXTI_SetTLISensitivity:
 398  00ae 88            	push	a
 399       00000000      OFST:	set	0
 402                     ; 114   assert_param(IS_EXTI_TLISENSITIVITY_OK(SensitivityValue));
 404  00af 4d            	tnz	a
 405  00b0 2712          	jreq	L63
 406  00b2 a104          	cp	a,#4
 407  00b4 270e          	jreq	L63
 408  00b6 ae0072        	ldw	x,#114
 409  00b9 89            	pushw	x
 410  00ba 5f            	clrw	x
 411  00bb 89            	pushw	x
 412  00bc ae0000        	ldw	x,#L111
 413  00bf cd0000        	call	_assert_failed
 415  00c2 5b04          	addw	sp,#4
 416  00c4               L63:
 417                     ; 117   EXTI->CR2 &= (uint8_t)(~EXTI_CR2_TLIS);
 419  00c4 721550a1      	bres	20641,#2
 420                     ; 118   EXTI->CR2 |= (uint8_t)(SensitivityValue);
 422  00c8 c650a1        	ld	a,20641
 423  00cb 1a01          	or	a,(OFST+1,sp)
 424  00cd c750a1        	ld	20641,a
 425                     ; 119 }
 428  00d0 84            	pop	a
 429  00d1 81            	ret	
 476                     ; 126 EXTI_Sensitivity_TypeDef EXTI_GetExtIntSensitivity(EXTI_Port_TypeDef Port)
 476                     ; 127 {
 477                     	switch	.text
 478  00d2               _EXTI_GetExtIntSensitivity:
 480  00d2 88            	push	a
 481  00d3 88            	push	a
 482       00000001      OFST:	set	1
 485                     ; 128   uint8_t value = 0;
 487  00d4 0f01          	clr	(OFST+0,sp)
 489                     ; 131   assert_param(IS_EXTI_PORT_OK(Port));
 491  00d6 4d            	tnz	a
 492  00d7 271e          	jreq	L05
 493  00d9 a101          	cp	a,#1
 494  00db 271a          	jreq	L05
 495  00dd a102          	cp	a,#2
 496  00df 2716          	jreq	L05
 497  00e1 a103          	cp	a,#3
 498  00e3 2712          	jreq	L05
 499  00e5 a104          	cp	a,#4
 500  00e7 270e          	jreq	L05
 501  00e9 ae0083        	ldw	x,#131
 502  00ec 89            	pushw	x
 503  00ed 5f            	clrw	x
 504  00ee 89            	pushw	x
 505  00ef ae0000        	ldw	x,#L111
 506  00f2 cd0000        	call	_assert_failed
 508  00f5 5b04          	addw	sp,#4
 509  00f7               L05:
 510                     ; 133   switch (Port)
 512  00f7 7b02          	ld	a,(OFST+1,sp)
 514                     ; 150   default:
 514                     ; 151     break;
 515  00f9 2710          	jreq	L541
 516  00fb 4a            	dec	a
 517  00fc 2712          	jreq	L741
 518  00fe 4a            	dec	a
 519  00ff 2718          	jreq	L151
 520  0101 4a            	dec	a
 521  0102 271b          	jreq	L351
 522  0104 4a            	dec	a
 523  0105 2722          	jreq	L551
 524  0107 7b01          	ld	a,(OFST+0,sp)
 525  0109 2023          	jra	LC005
 526  010b               L541:
 527                     ; 135   case EXTI_PORT_GPIOA:
 527                     ; 136     value = (uint8_t)(EXTI->CR1 & EXTI_CR1_PAIS);
 529  010b c650a0        	ld	a,20640
 530                     ; 137     break;
 532  010e 201c          	jp	LC006
 533  0110               L741:
 534                     ; 138   case EXTI_PORT_GPIOB:
 534                     ; 139     value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PBIS) >> 2);
 536  0110 c650a0        	ld	a,20640
 537  0113 a40c          	and	a,#12
 538  0115 44            	srl	a
 539  0116 44            	srl	a
 540                     ; 140     break;
 542  0117 2015          	jp	LC005
 543  0119               L151:
 544                     ; 141   case EXTI_PORT_GPIOC:
 544                     ; 142     value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PCIS) >> 4);
 546  0119 c650a0        	ld	a,20640
 547  011c 4e            	swap	a
 548                     ; 143     break;
 550  011d 200d          	jp	LC006
 551  011f               L351:
 552                     ; 144   case EXTI_PORT_GPIOD:
 552                     ; 145     value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PDIS) >> 6);
 554  011f c650a0        	ld	a,20640
 555  0122 4e            	swap	a
 556  0123 a40c          	and	a,#12
 557  0125 44            	srl	a
 558  0126 44            	srl	a
 559                     ; 146     break;
 561  0127 2003          	jp	LC006
 562  0129               L551:
 563                     ; 147   case EXTI_PORT_GPIOE:
 563                     ; 148     value = (uint8_t)(EXTI->CR2 & EXTI_CR2_PEIS);
 565  0129 c650a1        	ld	a,20641
 566  012c               LC006:
 567  012c a403          	and	a,#3
 568  012e               LC005:
 570                     ; 149     break;
 572                     ; 150   default:
 572                     ; 151     break;
 574                     ; 154   return((EXTI_Sensitivity_TypeDef)value);
 578  012e 85            	popw	x
 579  012f 81            	ret	
 615                     ; 162 EXTI_TLISensitivity_TypeDef EXTI_GetTLISensitivity(void)
 615                     ; 163 {
 616                     	switch	.text
 617  0130               _EXTI_GetTLISensitivity:
 619       00000001      OFST:	set	1
 622                     ; 164   uint8_t value = 0;
 624                     ; 167   value = (uint8_t)(EXTI->CR2 & EXTI_CR2_TLIS);
 626  0130 c650a1        	ld	a,20641
 627  0133 a404          	and	a,#4
 629                     ; 169   return((EXTI_TLISensitivity_TypeDef)value);
 633  0135 81            	ret	
 646                     	xdef	_EXTI_GetTLISensitivity
 647                     	xdef	_EXTI_GetExtIntSensitivity
 648                     	xdef	_EXTI_SetTLISensitivity
 649                     	xdef	_EXTI_SetExtIntSensitivity
 650                     	xdef	_EXTI_DeInit
 651                     	xref	_assert_failed
 652                     .const:	section	.text
 653  0000               L111:
 654  0000 2e2e5c2e2e5c  	dc.b	"..\..\stm8s_spl\li"
 655  0012 627261726965  	dc.b	"braries\stm8s_stdp"
 656  0024 65726970685f  	dc.b	"eriph_driver\src\s"
 657  0036 746d38735f65  	dc.b	"tm8s_exti.c",0
 677                     	end
