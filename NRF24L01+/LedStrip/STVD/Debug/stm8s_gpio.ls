   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.3 - 22 Aug 2024
   4                     ; Optimizer V4.6.3 - 22 Aug 2024
 112                     ; 53 void GPIO_DeInit(GPIO_TypeDef* GPIOx)
 112                     ; 54 {
 114                     	switch	.text
 115  0000               _GPIO_DeInit:
 119                     ; 55   GPIOx->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
 121  0000 7f            	clr	(x)
 122                     ; 56   GPIOx->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
 124  0001 6f02          	clr	(2,x)
 125                     ; 57   GPIOx->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
 127  0003 6f03          	clr	(3,x)
 128                     ; 58   GPIOx->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
 130  0005 6f04          	clr	(4,x)
 131                     ; 59 }
 134  0007 81            	ret	
 375                     ; 71 void GPIO_Init(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, GPIO_Mode_TypeDef GPIO_Mode)
 375                     ; 72 {
 376                     	switch	.text
 377  0008               _GPIO_Init:
 379  0008 89            	pushw	x
 380       00000000      OFST:	set	0
 383                     ; 77   assert_param(IS_GPIO_MODE_OK(GPIO_Mode));
 385  0009 7b06          	ld	a,(OFST+6,sp)
 386  000b 2731          	jreq	L41
 387  000d a140          	cp	a,#64
 388  000f 272d          	jreq	L41
 389  0011 a120          	cp	a,#32
 390  0013 2729          	jreq	L41
 391  0015 a160          	cp	a,#96
 392  0017 2725          	jreq	L41
 393  0019 a1a0          	cp	a,#160
 394  001b 2721          	jreq	L41
 395  001d a1e0          	cp	a,#224
 396  001f 271d          	jreq	L41
 397  0021 a180          	cp	a,#128
 398  0023 2719          	jreq	L41
 399  0025 a1c0          	cp	a,#192
 400  0027 2715          	jreq	L41
 401  0029 a1b0          	cp	a,#176
 402  002b 2711          	jreq	L41
 403  002d a1f0          	cp	a,#240
 404  002f 270d          	jreq	L41
 405  0031 a190          	cp	a,#144
 406  0033 2709          	jreq	L41
 407  0035 a1d0          	cp	a,#208
 408  0037 2705          	jreq	L41
 409  0039 ae004d        	ldw	x,#77
 410  003c ad5d          	call	LC001
 411  003e               L41:
 412                     ; 78   assert_param(IS_GPIO_PIN_OK(GPIO_Pin));
 414  003e 7b05          	ld	a,(OFST+5,sp)
 415  0040 2607          	jrne	L22
 416  0042 ae004e        	ldw	x,#78
 417  0045 ad54          	call	LC001
 418  0047 7b05          	ld	a,(OFST+5,sp)
 419  0049               L22:
 420                     ; 81   GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 422  0049 1e01          	ldw	x,(OFST+1,sp)
 423  004b 43            	cpl	a
 424  004c e404          	and	a,(4,x)
 425  004e e704          	ld	(4,x),a
 426                     ; 87   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x80) != (uint8_t)0x00) /* Output mode */
 428  0050 7b06          	ld	a,(OFST+6,sp)
 429  0052 2a14          	jrpl	L102
 430                     ; 89     if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x10) != (uint8_t)0x00) /* High level */
 432  0054 a510          	bcp	a,#16
 433  0056 2705          	jreq	L302
 434                     ; 91       GPIOx->ODR |= (uint8_t)GPIO_Pin;
 436  0058 f6            	ld	a,(x)
 437  0059 1a05          	or	a,(OFST+5,sp)
 439  005b 2004          	jra	L502
 440  005d               L302:
 441                     ; 95       GPIOx->ODR &= (uint8_t)(~(GPIO_Pin));
 443  005d 7b05          	ld	a,(OFST+5,sp)
 444  005f 43            	cpl	a
 445  0060 f4            	and	a,(x)
 446  0061               L502:
 447  0061 f7            	ld	(x),a
 448                     ; 98     GPIOx->DDR |= (uint8_t)GPIO_Pin;
 450  0062 e602          	ld	a,(2,x)
 451  0064 1a05          	or	a,(OFST+5,sp)
 453  0066 2005          	jra	L702
 454  0068               L102:
 455                     ; 103     GPIOx->DDR &= (uint8_t)(~(GPIO_Pin));
 457  0068 7b05          	ld	a,(OFST+5,sp)
 458  006a 43            	cpl	a
 459  006b e402          	and	a,(2,x)
 460  006d               L702:
 461  006d e702          	ld	(2,x),a
 462                     ; 110   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x40) != (uint8_t)0x00) /* Pull-Up or Push-Pull */
 464  006f 7b06          	ld	a,(OFST+6,sp)
 465  0071 a540          	bcp	a,#64
 466  0073 2706          	jreq	L112
 467                     ; 112     GPIOx->CR1 |= (uint8_t)GPIO_Pin;
 469  0075 e603          	ld	a,(3,x)
 470  0077 1a05          	or	a,(OFST+5,sp)
 472  0079 2005          	jra	L312
 473  007b               L112:
 474                     ; 116     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
 476  007b 7b05          	ld	a,(OFST+5,sp)
 477  007d 43            	cpl	a
 478  007e e403          	and	a,(3,x)
 479  0080               L312:
 480  0080 e703          	ld	(3,x),a
 481                     ; 123   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x20) != (uint8_t)0x00) /* Interrupt or Slow slope */
 483  0082 7b06          	ld	a,(OFST+6,sp)
 484  0084 a520          	bcp	a,#32
 485  0086 2708          	jreq	L512
 486                     ; 125     GPIOx->CR2 |= (uint8_t)GPIO_Pin;
 488  0088 1e01          	ldw	x,(OFST+1,sp)
 489  008a e604          	ld	a,(4,x)
 490  008c 1a05          	or	a,(OFST+5,sp)
 492  008e 2007          	jra	L712
 493  0090               L512:
 494                     ; 129     GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 496  0090 1e01          	ldw	x,(OFST+1,sp)
 497  0092 7b05          	ld	a,(OFST+5,sp)
 498  0094 43            	cpl	a
 499  0095 e404          	and	a,(4,x)
 500  0097               L712:
 501  0097 e704          	ld	(4,x),a
 502                     ; 131 }
 505  0099 85            	popw	x
 506  009a 81            	ret	
 507  009b               LC001:
 508  009b 89            	pushw	x
 509  009c 5f            	clrw	x
 510  009d 89            	pushw	x
 511  009e ae0000        	ldw	x,#L771
 512  00a1 cd0000        	call	_assert_failed
 514  00a4 5b04          	addw	sp,#4
 515  00a6 81            	ret	
 561                     ; 141 void GPIO_Write(GPIO_TypeDef* GPIOx, uint8_t PortVal)
 561                     ; 142 {
 562                     	switch	.text
 563  00a7               _GPIO_Write:
 565       fffffffe      OFST: set -2
 568                     ; 143   GPIOx->ODR = PortVal;
 570  00a7 7b03          	ld	a,(OFST+5,sp)
 571  00a9 f7            	ld	(x),a
 572                     ; 144 }
 575  00aa 81            	ret	
 622                     ; 154 void GPIO_WriteHigh(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 622                     ; 155 {
 623                     	switch	.text
 624  00ab               _GPIO_WriteHigh:
 626       fffffffe      OFST: set -2
 629                     ; 156   GPIOx->ODR |= (uint8_t)PortPins;
 631  00ab f6            	ld	a,(x)
 632  00ac 1a03          	or	a,(OFST+5,sp)
 633  00ae f7            	ld	(x),a
 634                     ; 157 }
 637  00af 81            	ret	
 684                     ; 167 void GPIO_WriteLow(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 684                     ; 168 {
 685                     	switch	.text
 686  00b0               _GPIO_WriteLow:
 688       fffffffe      OFST: set -2
 691                     ; 169   GPIOx->ODR &= (uint8_t)(~PortPins);
 693  00b0 7b03          	ld	a,(OFST+5,sp)
 694  00b2 43            	cpl	a
 695  00b3 f4            	and	a,(x)
 696  00b4 f7            	ld	(x),a
 697                     ; 170 }
 700  00b5 81            	ret	
 747                     ; 180 void GPIO_WriteReverse(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 747                     ; 181 {
 748                     	switch	.text
 749  00b6               _GPIO_WriteReverse:
 751       fffffffe      OFST: set -2
 754                     ; 182   GPIOx->ODR ^= (uint8_t)PortPins;
 756  00b6 f6            	ld	a,(x)
 757  00b7 1803          	xor	a,(OFST+5,sp)
 758  00b9 f7            	ld	(x),a
 759                     ; 183 }
 762  00ba 81            	ret	
 800                     ; 191 uint8_t GPIO_ReadOutputData(GPIO_TypeDef* GPIOx)
 800                     ; 192 {
 801                     	switch	.text
 802  00bb               _GPIO_ReadOutputData:
 806                     ; 193   return ((uint8_t)GPIOx->ODR);
 808  00bb f6            	ld	a,(x)
 811  00bc 81            	ret	
 848                     ; 202 uint8_t GPIO_ReadInputData(GPIO_TypeDef* GPIOx)
 848                     ; 203 {
 849                     	switch	.text
 850  00bd               _GPIO_ReadInputData:
 854                     ; 204   return ((uint8_t)GPIOx->IDR);
 856  00bd e601          	ld	a,(1,x)
 859  00bf 81            	ret	
 927                     ; 213 BitStatus GPIO_ReadInputPin(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin) 
 927                     ; 214 {
 928                     	switch	.text
 929  00c0               _GPIO_ReadInputPin:
 931       fffffffe      OFST: set -2
 934                     ; 215   return ((BitStatus)(GPIOx->IDR & GPIO_Pin)); 
 936  00c0 e601          	ld	a,(1,x)
 937  00c2 1403          	and	a,(OFST+5,sp)
 940  00c4 81            	ret	
1019                     ; 225 void GPIO_ExternalPullUpConfig(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, FunctionalState NewState)
1019                     ; 226 {
1020                     	switch	.text
1021  00c5               _GPIO_ExternalPullUpConfig:
1023  00c5 89            	pushw	x
1024       00000000      OFST:	set	0
1027                     ; 228   assert_param(IS_GPIO_PIN_OK(GPIO_Pin));
1029  00c6 7b05          	ld	a,(OFST+5,sp)
1030  00c8 2605          	jrne	L05
1031  00ca ae00e4        	ldw	x,#228
1032  00cd ad23          	call	LC002
1033  00cf               L05:
1034                     ; 229   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1036  00cf 7b06          	ld	a,(OFST+6,sp)
1037  00d1 2708          	jreq	L06
1038  00d3 4a            	dec	a
1039  00d4 2705          	jreq	L06
1040  00d6 ae00e5        	ldw	x,#229
1041  00d9 ad17          	call	LC002
1042  00db               L06:
1043                     ; 231   if (NewState != DISABLE) /* External Pull-Up Set*/
1045  00db 7b06          	ld	a,(OFST+6,sp)
1046  00dd 2708          	jreq	L574
1047                     ; 233     GPIOx->CR1 |= (uint8_t)GPIO_Pin;
1049  00df 1e01          	ldw	x,(OFST+1,sp)
1050  00e1 e603          	ld	a,(3,x)
1051  00e3 1a05          	or	a,(OFST+5,sp)
1053  00e5 2007          	jra	L774
1054  00e7               L574:
1055                     ; 236     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
1057  00e7 1e01          	ldw	x,(OFST+1,sp)
1058  00e9 7b05          	ld	a,(OFST+5,sp)
1059  00eb 43            	cpl	a
1060  00ec e403          	and	a,(3,x)
1061  00ee               L774:
1062  00ee e703          	ld	(3,x),a
1063                     ; 238 }
1066  00f0 85            	popw	x
1067  00f1 81            	ret	
1068  00f2               LC002:
1069  00f2 89            	pushw	x
1070  00f3 5f            	clrw	x
1071  00f4 89            	pushw	x
1072  00f5 ae0000        	ldw	x,#L771
1073  00f8 cd0000        	call	_assert_failed
1075  00fb 5b04          	addw	sp,#4
1076  00fd 81            	ret	
1089                     	xdef	_GPIO_ExternalPullUpConfig
1090                     	xdef	_GPIO_ReadInputPin
1091                     	xdef	_GPIO_ReadOutputData
1092                     	xdef	_GPIO_ReadInputData
1093                     	xdef	_GPIO_WriteReverse
1094                     	xdef	_GPIO_WriteLow
1095                     	xdef	_GPIO_WriteHigh
1096                     	xdef	_GPIO_Write
1097                     	xdef	_GPIO_Init
1098                     	xdef	_GPIO_DeInit
1099                     	xref	_assert_failed
1100                     .const:	section	.text
1101  0000               L771:
1102  0000 2e2e5c2e2e5c  	dc.b	"..\..\stm8s_spl\li"
1103  0012 627261726965  	dc.b	"braries\stm8s_stdp"
1104  0024 65726970685f  	dc.b	"eriph_driver\src\s"
1105  0036 746d38735f67  	dc.b	"tm8s_gpio.c",0
1125                     	end
