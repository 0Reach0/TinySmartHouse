   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.3 - 22 Aug 2024
   4                     ; Optimizer V4.6.3 - 22 Aug 2024
 113                     ; 53 void GPIO_DeInit(GPIO_TypeDef* GPIOx)
 113                     ; 54 {
 115                     	switch	.text
 116  0000               _GPIO_DeInit:
 120                     ; 55   GPIOx->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
 122  0000 7f            	clr	(x)
 123                     ; 56   GPIOx->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
 125  0001 6f02          	clr	(2,x)
 126                     ; 57   GPIOx->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
 128  0003 6f03          	clr	(3,x)
 129                     ; 58   GPIOx->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
 131  0005 6f04          	clr	(4,x)
 132                     ; 59 }
 135  0007 81            	ret	
 376                     ; 71 void GPIO_Init(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, GPIO_Mode_TypeDef GPIO_Mode)
 376                     ; 72 {
 377                     	switch	.text
 378  0008               _GPIO_Init:
 380  0008 89            	pushw	x
 381       00000000      OFST:	set	0
 384                     ; 77   assert_param(IS_GPIO_MODE_OK(GPIO_Mode));
 386  0009 7b06          	ld	a,(OFST+6,sp)
 387  000b 2731          	jreq	L41
 388  000d a140          	cp	a,#64
 389  000f 272d          	jreq	L41
 390  0011 a120          	cp	a,#32
 391  0013 2729          	jreq	L41
 392  0015 a160          	cp	a,#96
 393  0017 2725          	jreq	L41
 394  0019 a1a0          	cp	a,#160
 395  001b 2721          	jreq	L41
 396  001d a1e0          	cp	a,#224
 397  001f 271d          	jreq	L41
 398  0021 a180          	cp	a,#128
 399  0023 2719          	jreq	L41
 400  0025 a1c0          	cp	a,#192
 401  0027 2715          	jreq	L41
 402  0029 a1b0          	cp	a,#176
 403  002b 2711          	jreq	L41
 404  002d a1f0          	cp	a,#240
 405  002f 270d          	jreq	L41
 406  0031 a190          	cp	a,#144
 407  0033 2709          	jreq	L41
 408  0035 a1d0          	cp	a,#208
 409  0037 2705          	jreq	L41
 410  0039 ae004d        	ldw	x,#77
 411  003c ad5d          	call	LC001
 412  003e               L41:
 413                     ; 78   assert_param(IS_GPIO_PIN_OK(GPIO_Pin));
 415  003e 7b05          	ld	a,(OFST+5,sp)
 416  0040 2607          	jrne	L22
 417  0042 ae004e        	ldw	x,#78
 418  0045 ad54          	call	LC001
 419  0047 7b05          	ld	a,(OFST+5,sp)
 420  0049               L22:
 421                     ; 81   GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 423  0049 1e01          	ldw	x,(OFST+1,sp)
 424  004b 43            	cpl	a
 425  004c e404          	and	a,(4,x)
 426  004e e704          	ld	(4,x),a
 427                     ; 87   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x80) != (uint8_t)0x00) /* Output mode */
 429  0050 7b06          	ld	a,(OFST+6,sp)
 430  0052 2a14          	jrpl	L102
 431                     ; 89     if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x10) != (uint8_t)0x00) /* High level */
 433  0054 a510          	bcp	a,#16
 434  0056 2705          	jreq	L302
 435                     ; 91       GPIOx->ODR |= (uint8_t)GPIO_Pin;
 437  0058 f6            	ld	a,(x)
 438  0059 1a05          	or	a,(OFST+5,sp)
 440  005b 2004          	jra	L502
 441  005d               L302:
 442                     ; 95       GPIOx->ODR &= (uint8_t)(~(GPIO_Pin));
 444  005d 7b05          	ld	a,(OFST+5,sp)
 445  005f 43            	cpl	a
 446  0060 f4            	and	a,(x)
 447  0061               L502:
 448  0061 f7            	ld	(x),a
 449                     ; 98     GPIOx->DDR |= (uint8_t)GPIO_Pin;
 451  0062 e602          	ld	a,(2,x)
 452  0064 1a05          	or	a,(OFST+5,sp)
 454  0066 2005          	jra	L702
 455  0068               L102:
 456                     ; 103     GPIOx->DDR &= (uint8_t)(~(GPIO_Pin));
 458  0068 7b05          	ld	a,(OFST+5,sp)
 459  006a 43            	cpl	a
 460  006b e402          	and	a,(2,x)
 461  006d               L702:
 462  006d e702          	ld	(2,x),a
 463                     ; 110   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x40) != (uint8_t)0x00) /* Pull-Up or Push-Pull */
 465  006f 7b06          	ld	a,(OFST+6,sp)
 466  0071 a540          	bcp	a,#64
 467  0073 2706          	jreq	L112
 468                     ; 112     GPIOx->CR1 |= (uint8_t)GPIO_Pin;
 470  0075 e603          	ld	a,(3,x)
 471  0077 1a05          	or	a,(OFST+5,sp)
 473  0079 2005          	jra	L312
 474  007b               L112:
 475                     ; 116     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
 477  007b 7b05          	ld	a,(OFST+5,sp)
 478  007d 43            	cpl	a
 479  007e e403          	and	a,(3,x)
 480  0080               L312:
 481  0080 e703          	ld	(3,x),a
 482                     ; 123   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x20) != (uint8_t)0x00) /* Interrupt or Slow slope */
 484  0082 7b06          	ld	a,(OFST+6,sp)
 485  0084 a520          	bcp	a,#32
 486  0086 2708          	jreq	L512
 487                     ; 125     GPIOx->CR2 |= (uint8_t)GPIO_Pin;
 489  0088 1e01          	ldw	x,(OFST+1,sp)
 490  008a e604          	ld	a,(4,x)
 491  008c 1a05          	or	a,(OFST+5,sp)
 493  008e 2007          	jra	L712
 494  0090               L512:
 495                     ; 129     GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 497  0090 1e01          	ldw	x,(OFST+1,sp)
 498  0092 7b05          	ld	a,(OFST+5,sp)
 499  0094 43            	cpl	a
 500  0095 e404          	and	a,(4,x)
 501  0097               L712:
 502  0097 e704          	ld	(4,x),a
 503                     ; 131 }
 506  0099 85            	popw	x
 507  009a 81            	ret	
 508  009b               LC001:
 509  009b 89            	pushw	x
 510  009c 5f            	clrw	x
 511  009d 89            	pushw	x
 512  009e ae0000        	ldw	x,#L771
 513  00a1 cd0000        	call	_assert_failed
 515  00a4 5b04          	addw	sp,#4
 516  00a6 81            	ret	
 562                     ; 141 void GPIO_Write(GPIO_TypeDef* GPIOx, uint8_t PortVal)
 562                     ; 142 {
 563                     	switch	.text
 564  00a7               _GPIO_Write:
 566       fffffffe      OFST: set -2
 569                     ; 143   GPIOx->ODR = PortVal;
 571  00a7 7b03          	ld	a,(OFST+5,sp)
 572  00a9 f7            	ld	(x),a
 573                     ; 144 }
 576  00aa 81            	ret	
 623                     ; 154 void GPIO_WriteHigh(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 623                     ; 155 {
 624                     	switch	.text
 625  00ab               _GPIO_WriteHigh:
 627       fffffffe      OFST: set -2
 630                     ; 156   GPIOx->ODR |= (uint8_t)PortPins;
 632  00ab f6            	ld	a,(x)
 633  00ac 1a03          	or	a,(OFST+5,sp)
 634  00ae f7            	ld	(x),a
 635                     ; 157 }
 638  00af 81            	ret	
 685                     ; 167 void GPIO_WriteLow(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 685                     ; 168 {
 686                     	switch	.text
 687  00b0               _GPIO_WriteLow:
 689       fffffffe      OFST: set -2
 692                     ; 169   GPIOx->ODR &= (uint8_t)(~PortPins);
 694  00b0 7b03          	ld	a,(OFST+5,sp)
 695  00b2 43            	cpl	a
 696  00b3 f4            	and	a,(x)
 697  00b4 f7            	ld	(x),a
 698                     ; 170 }
 701  00b5 81            	ret	
 748                     ; 180 void GPIO_WriteReverse(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 748                     ; 181 {
 749                     	switch	.text
 750  00b6               _GPIO_WriteReverse:
 752       fffffffe      OFST: set -2
 755                     ; 182   GPIOx->ODR ^= (uint8_t)PortPins;
 757  00b6 f6            	ld	a,(x)
 758  00b7 1803          	xor	a,(OFST+5,sp)
 759  00b9 f7            	ld	(x),a
 760                     ; 183 }
 763  00ba 81            	ret	
 801                     ; 191 uint8_t GPIO_ReadOutputData(GPIO_TypeDef* GPIOx)
 801                     ; 192 {
 802                     	switch	.text
 803  00bb               _GPIO_ReadOutputData:
 807                     ; 193   return ((uint8_t)GPIOx->ODR);
 809  00bb f6            	ld	a,(x)
 812  00bc 81            	ret	
 849                     ; 202 uint8_t GPIO_ReadInputData(GPIO_TypeDef* GPIOx)
 849                     ; 203 {
 850                     	switch	.text
 851  00bd               _GPIO_ReadInputData:
 855                     ; 204   return ((uint8_t)GPIOx->IDR);
 857  00bd e601          	ld	a,(1,x)
 860  00bf 81            	ret	
 928                     ; 213 BitStatus GPIO_ReadInputPin(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin) 
 928                     ; 214 {
 929                     	switch	.text
 930  00c0               _GPIO_ReadInputPin:
 932       fffffffe      OFST: set -2
 935                     ; 215   return ((BitStatus)(GPIOx->IDR & GPIO_Pin)); 
 937  00c0 e601          	ld	a,(1,x)
 938  00c2 1403          	and	a,(OFST+5,sp)
 941  00c4 81            	ret	
1020                     ; 225 void GPIO_ExternalPullUpConfig(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, FunctionalState NewState)
1020                     ; 226 {
1021                     	switch	.text
1022  00c5               _GPIO_ExternalPullUpConfig:
1024  00c5 89            	pushw	x
1025       00000000      OFST:	set	0
1028                     ; 228   assert_param(IS_GPIO_PIN_OK(GPIO_Pin));
1030  00c6 7b05          	ld	a,(OFST+5,sp)
1031  00c8 2605          	jrne	L05
1032  00ca ae00e4        	ldw	x,#228
1033  00cd ad23          	call	LC002
1034  00cf               L05:
1035                     ; 229   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1037  00cf 7b06          	ld	a,(OFST+6,sp)
1038  00d1 2708          	jreq	L06
1039  00d3 4a            	dec	a
1040  00d4 2705          	jreq	L06
1041  00d6 ae00e5        	ldw	x,#229
1042  00d9 ad17          	call	LC002
1043  00db               L06:
1044                     ; 231   if (NewState != DISABLE) /* External Pull-Up Set*/
1046  00db 7b06          	ld	a,(OFST+6,sp)
1047  00dd 2708          	jreq	L574
1048                     ; 233     GPIOx->CR1 |= (uint8_t)GPIO_Pin;
1050  00df 1e01          	ldw	x,(OFST+1,sp)
1051  00e1 e603          	ld	a,(3,x)
1052  00e3 1a05          	or	a,(OFST+5,sp)
1054  00e5 2007          	jra	L774
1055  00e7               L574:
1056                     ; 236     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
1058  00e7 1e01          	ldw	x,(OFST+1,sp)
1059  00e9 7b05          	ld	a,(OFST+5,sp)
1060  00eb 43            	cpl	a
1061  00ec e403          	and	a,(3,x)
1062  00ee               L774:
1063  00ee e703          	ld	(3,x),a
1064                     ; 238 }
1067  00f0 85            	popw	x
1068  00f1 81            	ret	
1069  00f2               LC002:
1070  00f2 89            	pushw	x
1071  00f3 5f            	clrw	x
1072  00f4 89            	pushw	x
1073  00f5 ae0000        	ldw	x,#L771
1074  00f8 cd0000        	call	_assert_failed
1076  00fb 5b04          	addw	sp,#4
1077  00fd 81            	ret	
1090                     	xdef	_GPIO_ExternalPullUpConfig
1091                     	xdef	_GPIO_ReadInputPin
1092                     	xdef	_GPIO_ReadOutputData
1093                     	xdef	_GPIO_ReadInputData
1094                     	xdef	_GPIO_WriteReverse
1095                     	xdef	_GPIO_WriteLow
1096                     	xdef	_GPIO_WriteHigh
1097                     	xdef	_GPIO_Write
1098                     	xdef	_GPIO_Init
1099                     	xdef	_GPIO_DeInit
1100                     	xref	_assert_failed
1101                     .const:	section	.text
1102  0000               L771:
1103  0000 2e2e5c2e2e5c  	dc.b	"..\..\stm8s_spl\li"
1104  0012 627261726965  	dc.b	"braries\stm8s_stdp"
1105  0024 65726970685f  	dc.b	"eriph_driver\src\s"
1106  0036 746d38735f67  	dc.b	"tm8s_gpio.c",0
1126                     	end
