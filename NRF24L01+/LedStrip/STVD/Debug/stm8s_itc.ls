   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.3 - 22 Aug 2024
   4                     ; Optimizer V4.6.3 - 22 Aug 2024
  46                     ; 50 uint8_t ITC_GetCPUCC(void)
  46                     ; 51 {
  48                     	switch	.text
  49  0000               _ITC_GetCPUCC:
  53                     ; 53   _asm("push cc");
  56  0000 8a            	push	cc
  58                     ; 54   _asm("pop a");
  61  0001 84            	pop	a
  63                     ; 55   return; /* Ignore compiler warning, the returned value is in A register */
  66  0002 81            	ret	
  89                     ; 80 void ITC_DeInit(void)
  89                     ; 81 {
  90                     	switch	.text
  91  0003               _ITC_DeInit:
  95                     ; 82   ITC->ISPR1 = ITC_SPRX_RESET_VALUE;
  97  0003 35ff7f70      	mov	32624,#255
  98                     ; 83   ITC->ISPR2 = ITC_SPRX_RESET_VALUE;
 100  0007 35ff7f71      	mov	32625,#255
 101                     ; 84   ITC->ISPR3 = ITC_SPRX_RESET_VALUE;
 103  000b 35ff7f72      	mov	32626,#255
 104                     ; 85   ITC->ISPR4 = ITC_SPRX_RESET_VALUE;
 106  000f 35ff7f73      	mov	32627,#255
 107                     ; 86   ITC->ISPR5 = ITC_SPRX_RESET_VALUE;
 109  0013 35ff7f74      	mov	32628,#255
 110                     ; 87   ITC->ISPR6 = ITC_SPRX_RESET_VALUE;
 112  0017 35ff7f75      	mov	32629,#255
 113                     ; 88   ITC->ISPR7 = ITC_SPRX_RESET_VALUE;
 115  001b 35ff7f76      	mov	32630,#255
 116                     ; 89   ITC->ISPR8 = ITC_SPRX_RESET_VALUE;
 118  001f 35ff7f77      	mov	32631,#255
 119                     ; 90 }
 122  0023 81            	ret	
 147                     ; 97 uint8_t ITC_GetSoftIntStatus(void)
 147                     ; 98 {
 148                     	switch	.text
 149  0024               _ITC_GetSoftIntStatus:
 153                     ; 99   return (uint8_t)(ITC_GetCPUCC() & CPU_CC_I1I0);
 155  0024 adda          	call	_ITC_GetCPUCC
 157  0026 a428          	and	a,#40
 160  0028 81            	ret	
 410                     .const:	section	.text
 411  0000               L23:
 412  0000 005e          	dc.w	L14
 413  0002 005e          	dc.w	L14
 414  0004 005e          	dc.w	L14
 415  0006 005e          	dc.w	L14
 416  0008 0063          	dc.w	L34
 417  000a 0063          	dc.w	L34
 418  000c 0063          	dc.w	L34
 419  000e 0063          	dc.w	L34
 420  0010 0083          	dc.w	L502
 421  0012 0083          	dc.w	L502
 422  0014 0068          	dc.w	L54
 423  0016 0068          	dc.w	L54
 424  0018 006d          	dc.w	L74
 425  001a 006d          	dc.w	L74
 426  001c 006d          	dc.w	L74
 427  001e 006d          	dc.w	L74
 428  0020 0072          	dc.w	L15
 429  0022 0072          	dc.w	L15
 430  0024 0072          	dc.w	L15
 431  0026 0072          	dc.w	L15
 432  0028 0083          	dc.w	L502
 433  002a 0083          	dc.w	L502
 434  002c 0077          	dc.w	L35
 435  002e 0077          	dc.w	L35
 436  0030 007c          	dc.w	L55
 437                     ; 107 ITC_PriorityLevel_TypeDef ITC_GetSoftwarePriority(ITC_Irq_TypeDef IrqNum)
 437                     ; 108 {
 438                     	switch	.text
 439  0029               _ITC_GetSoftwarePriority:
 441  0029 88            	push	a
 442  002a 89            	pushw	x
 443       00000002      OFST:	set	2
 446                     ; 109   uint8_t Value = 0;
 448  002b 0f02          	clr	(OFST+0,sp)
 450                     ; 110   uint8_t Mask = 0;
 452                     ; 113   assert_param(IS_ITC_IRQ_OK((uint8_t)IrqNum));
 454  002d a119          	cp	a,#25
 455  002f 250e          	jrult	L02
 456  0031 ae0071        	ldw	x,#113
 457  0034 89            	pushw	x
 458  0035 5f            	clrw	x
 459  0036 89            	pushw	x
 460  0037 ae0064        	ldw	x,#L102
 461  003a cd0000        	call	_assert_failed
 463  003d 5b04          	addw	sp,#4
 464  003f               L02:
 465                     ; 116   Mask = (uint8_t)(0x03U << (((uint8_t)IrqNum % 4U) * 2U));
 467  003f 7b03          	ld	a,(OFST+1,sp)
 468  0041 a403          	and	a,#3
 469  0043 48            	sll	a
 470  0044 5f            	clrw	x
 471  0045 97            	ld	xl,a
 472  0046 a603          	ld	a,#3
 473  0048 5d            	tnzw	x
 474  0049 2704          	jreq	L42
 475  004b               L62:
 476  004b 48            	sll	a
 477  004c 5a            	decw	x
 478  004d 26fc          	jrne	L62
 479  004f               L42:
 480  004f 6b01          	ld	(OFST-1,sp),a
 482                     ; 118   switch (IrqNum)
 484  0051 7b03          	ld	a,(OFST+1,sp)
 486                     ; 198   default:
 486                     ; 199     break;
 487  0053 a119          	cp	a,#25
 488  0055 242c          	jruge	L502
 489  0057 5f            	clrw	x
 490  0058 97            	ld	xl,a
 491  0059 58            	sllw	x
 492  005a de0000        	ldw	x,(L23,x)
 493  005d fc            	jp	(x)
 494  005e               L14:
 495                     ; 120   case ITC_IRQ_TLI: /* TLI software priority can be read but has no meaning */
 495                     ; 121   case ITC_IRQ_AWU:
 495                     ; 122   case ITC_IRQ_CLK:
 495                     ; 123   case ITC_IRQ_PORTA:
 495                     ; 124     Value = (uint8_t)(ITC->ISPR1 & Mask); /* Read software priority */
 497  005e c67f70        	ld	a,32624
 498                     ; 125     break;
 500  0061 201c          	jp	LC001
 501  0063               L34:
 502                     ; 127   case ITC_IRQ_PORTB:
 502                     ; 128   case ITC_IRQ_PORTC:
 502                     ; 129   case ITC_IRQ_PORTD:
 502                     ; 130   case ITC_IRQ_PORTE:
 502                     ; 131     Value = (uint8_t)(ITC->ISPR2 & Mask); /* Read software priority */
 504  0063 c67f71        	ld	a,32625
 505                     ; 132     break;
 507  0066 2017          	jp	LC001
 508  0068               L54:
 509                     ; 141   case ITC_IRQ_SPI:
 509                     ; 142   case ITC_IRQ_TIM1_OVF:
 509                     ; 143     Value = (uint8_t)(ITC->ISPR3 & Mask); /* Read software priority */
 511  0068 c67f72        	ld	a,32626
 512                     ; 144     break;
 514  006b 2012          	jp	LC001
 515  006d               L74:
 516                     ; 146   case ITC_IRQ_TIM1_CAPCOM:
 516                     ; 147 #if defined (STM8S903) || defined (STM8AF622x)
 516                     ; 148   case ITC_IRQ_TIM5_OVFTRI:
 516                     ; 149   case ITC_IRQ_TIM5_CAPCOM:
 516                     ; 150 #else
 516                     ; 151   case ITC_IRQ_TIM2_OVF:
 516                     ; 152   case ITC_IRQ_TIM2_CAPCOM:
 516                     ; 153 #endif /* STM8S903 or STM8AF622x*/
 516                     ; 154   case ITC_IRQ_TIM3_OVF:
 516                     ; 155     Value = (uint8_t)(ITC->ISPR4 & Mask); /* Read software priority */
 518  006d c67f73        	ld	a,32627
 519                     ; 156     break;
 521  0070 200d          	jp	LC001
 522  0072               L15:
 523                     ; 158   case ITC_IRQ_TIM3_CAPCOM:
 523                     ; 159 #if defined(STM8S208) ||defined(STM8S207) || defined (STM8S007) || defined(STM8S103) || \
 523                     ; 160     defined(STM8S003) ||defined(STM8S001) || defined (STM8S903) || defined (STM8AF52Ax) || defined (STM8AF62Ax)
 523                     ; 161   case ITC_IRQ_UART1_TX:
 523                     ; 162   case ITC_IRQ_UART1_RX:
 523                     ; 163 #endif /*STM8S208 or STM8S207 or STM8S007 or STM8S103 or STM8S003 or STM8S001 or STM8S903 or STM8AF52Ax or STM8AF62Ax */ 
 523                     ; 164 #if defined(STM8AF622x)
 523                     ; 165   case ITC_IRQ_UART4_TX:
 523                     ; 166   case ITC_IRQ_UART4_RX:
 523                     ; 167 #endif /*STM8AF622x */
 523                     ; 168   case ITC_IRQ_I2C:
 523                     ; 169     Value = (uint8_t)(ITC->ISPR5 & Mask); /* Read software priority */
 525  0072 c67f74        	ld	a,32628
 526                     ; 170     break;
 528  0075 2008          	jp	LC001
 529  0077               L35:
 530                     ; 184   case ITC_IRQ_ADC1:
 530                     ; 185 #endif /*STM8S105, STM8S005, STM8S103 or STM8S003 or STM8S001 or STM8S903 or STM8AF626x or STM8AF622x */
 530                     ; 186 #if defined (STM8S903) || defined (STM8AF622x)
 530                     ; 187   case ITC_IRQ_TIM6_OVFTRI:
 530                     ; 188 #else
 530                     ; 189   case ITC_IRQ_TIM4_OVF:
 530                     ; 190 #endif /*STM8S903 or STM8AF622x */
 530                     ; 191     Value = (uint8_t)(ITC->ISPR6 & Mask); /* Read software priority */
 532  0077 c67f75        	ld	a,32629
 533                     ; 192     break;
 535  007a 2003          	jp	LC001
 536  007c               L55:
 537                     ; 194   case ITC_IRQ_EEPROM_EEC:
 537                     ; 195     Value = (uint8_t)(ITC->ISPR7 & Mask); /* Read software priority */
 539  007c c67f76        	ld	a,32630
 540  007f               LC001:
 541  007f 1401          	and	a,(OFST-1,sp)
 542  0081 6b02          	ld	(OFST+0,sp),a
 544                     ; 196     break;
 546                     ; 198   default:
 546                     ; 199     break;
 548  0083               L502:
 549                     ; 202   Value >>= (uint8_t)(((uint8_t)IrqNum % 4u) * 2u);
 551  0083 7b03          	ld	a,(OFST+1,sp)
 552  0085 a403          	and	a,#3
 553  0087 48            	sll	a
 554  0088 5f            	clrw	x
 555  0089 97            	ld	xl,a
 556  008a 7b02          	ld	a,(OFST+0,sp)
 557  008c 5d            	tnzw	x
 558  008d 2704          	jreq	L43
 559  008f               L63:
 560  008f 44            	srl	a
 561  0090 5a            	decw	x
 562  0091 26fc          	jrne	L63
 563  0093               L43:
 565                     ; 204   return((ITC_PriorityLevel_TypeDef)Value);
 569  0093 5b03          	addw	sp,#3
 570  0095 81            	ret	
 636                     	switch	.const
 637  0032               L201:
 638  0032 00fc          	dc.w	L702
 639  0034 00fc          	dc.w	L702
 640  0036 00fc          	dc.w	L702
 641  0038 00fc          	dc.w	L702
 642  003a 010e          	dc.w	L112
 643  003c 010e          	dc.w	L112
 644  003e 010e          	dc.w	L112
 645  0040 010e          	dc.w	L112
 646  0042 0178          	dc.w	L362
 647  0044 0178          	dc.w	L362
 648  0046 0120          	dc.w	L312
 649  0048 0120          	dc.w	L312
 650  004a 0132          	dc.w	L512
 651  004c 0132          	dc.w	L512
 652  004e 0132          	dc.w	L512
 653  0050 0132          	dc.w	L512
 654  0052 0144          	dc.w	L712
 655  0054 0144          	dc.w	L712
 656  0056 0144          	dc.w	L712
 657  0058 0144          	dc.w	L712
 658  005a 0178          	dc.w	L362
 659  005c 0178          	dc.w	L362
 660  005e 0156          	dc.w	L122
 661  0060 0156          	dc.w	L122
 662  0062 0168          	dc.w	L322
 663                     ; 220 void ITC_SetSoftwarePriority(ITC_Irq_TypeDef IrqNum, ITC_PriorityLevel_TypeDef PriorityValue)
 663                     ; 221 {
 664                     	switch	.text
 665  0096               _ITC_SetSoftwarePriority:
 667  0096 89            	pushw	x
 668  0097 89            	pushw	x
 669       00000002      OFST:	set	2
 672                     ; 222   uint8_t Mask = 0;
 674                     ; 223   uint8_t NewPriority = 0;
 676                     ; 226   assert_param(IS_ITC_IRQ_OK((uint8_t)IrqNum));
 678  0098 9e            	ld	a,xh
 679  0099 a119          	cp	a,#25
 680  009b 2506          	jrult	L44
 681  009d ae00e2        	ldw	x,#226
 682  00a0 cd017b        	call	LC002
 683  00a3               L44:
 684                     ; 227   assert_param(IS_ITC_PRIORITY_OK(PriorityValue));
 686  00a3 7b04          	ld	a,(OFST+2,sp)
 687  00a5 a102          	cp	a,#2
 688  00a7 2711          	jreq	L45
 689  00a9 a101          	cp	a,#1
 690  00ab 270d          	jreq	L45
 691  00ad 4d            	tnz	a
 692  00ae 270a          	jreq	L45
 693  00b0 a103          	cp	a,#3
 694  00b2 2706          	jreq	L45
 695  00b4 ae00e3        	ldw	x,#227
 696  00b7 cd017b        	call	LC002
 697  00ba               L45:
 698                     ; 230   assert_param(IS_ITC_INTERRUPTS_DISABLED);
 700  00ba cd0024        	call	_ITC_GetSoftIntStatus
 702  00bd a128          	cp	a,#40
 703  00bf 2706          	jreq	L46
 704  00c1 ae00e6        	ldw	x,#230
 705  00c4 cd017b        	call	LC002
 706  00c7               L46:
 707                     ; 234   Mask = (uint8_t)(~(uint8_t)(0x03U << (((uint8_t)IrqNum % 4U) * 2U)));
 709  00c7 7b03          	ld	a,(OFST+1,sp)
 710  00c9 a403          	and	a,#3
 711  00cb 48            	sll	a
 712  00cc 5f            	clrw	x
 713  00cd 97            	ld	xl,a
 714  00ce a603          	ld	a,#3
 715  00d0 5d            	tnzw	x
 716  00d1 2704          	jreq	L07
 717  00d3               L27:
 718  00d3 48            	sll	a
 719  00d4 5a            	decw	x
 720  00d5 26fc          	jrne	L27
 721  00d7               L07:
 722  00d7 43            	cpl	a
 723  00d8 6b01          	ld	(OFST-1,sp),a
 725                     ; 237   NewPriority = (uint8_t)((uint8_t)(PriorityValue) << (((uint8_t)IrqNum % 4U) * 2U));
 727  00da 7b03          	ld	a,(OFST+1,sp)
 728  00dc a403          	and	a,#3
 729  00de 48            	sll	a
 730  00df 5f            	clrw	x
 731  00e0 97            	ld	xl,a
 732  00e1 7b04          	ld	a,(OFST+2,sp)
 733  00e3 5d            	tnzw	x
 734  00e4 2704          	jreq	L47
 735  00e6               L67:
 736  00e6 48            	sll	a
 737  00e7 5a            	decw	x
 738  00e8 26fc          	jrne	L67
 739  00ea               L47:
 740  00ea 6b02          	ld	(OFST+0,sp),a
 742                     ; 239   switch (IrqNum)
 744  00ec 7b03          	ld	a,(OFST+1,sp)
 746                     ; 329   default:
 746                     ; 330     break;
 747  00ee a119          	cp	a,#25
 748  00f0 2503cc0178    	jruge	L362
 749  00f5 5f            	clrw	x
 750  00f6 97            	ld	xl,a
 751  00f7 58            	sllw	x
 752  00f8 de0032        	ldw	x,(L201,x)
 753  00fb fc            	jp	(x)
 754  00fc               L702:
 755                     ; 241   case ITC_IRQ_TLI: /* TLI software priority can be written but has no meaning */
 755                     ; 242   case ITC_IRQ_AWU:
 755                     ; 243   case ITC_IRQ_CLK:
 755                     ; 244   case ITC_IRQ_PORTA:
 755                     ; 245     ITC->ISPR1 &= Mask;
 757  00fc c67f70        	ld	a,32624
 758  00ff 1401          	and	a,(OFST-1,sp)
 759  0101 c77f70        	ld	32624,a
 760                     ; 246     ITC->ISPR1 |= NewPriority;
 762  0104 c67f70        	ld	a,32624
 763  0107 1a02          	or	a,(OFST+0,sp)
 764  0109 c77f70        	ld	32624,a
 765                     ; 247     break;
 767  010c 206a          	jra	L362
 768  010e               L112:
 769                     ; 249   case ITC_IRQ_PORTB:
 769                     ; 250   case ITC_IRQ_PORTC:
 769                     ; 251   case ITC_IRQ_PORTD:
 769                     ; 252   case ITC_IRQ_PORTE:
 769                     ; 253     ITC->ISPR2 &= Mask;
 771  010e c67f71        	ld	a,32625
 772  0111 1401          	and	a,(OFST-1,sp)
 773  0113 c77f71        	ld	32625,a
 774                     ; 254     ITC->ISPR2 |= NewPriority;
 776  0116 c67f71        	ld	a,32625
 777  0119 1a02          	or	a,(OFST+0,sp)
 778  011b c77f71        	ld	32625,a
 779                     ; 255     break;
 781  011e 2058          	jra	L362
 782  0120               L312:
 783                     ; 264   case ITC_IRQ_SPI:
 783                     ; 265   case ITC_IRQ_TIM1_OVF:
 783                     ; 266     ITC->ISPR3 &= Mask;
 785  0120 c67f72        	ld	a,32626
 786  0123 1401          	and	a,(OFST-1,sp)
 787  0125 c77f72        	ld	32626,a
 788                     ; 267     ITC->ISPR3 |= NewPriority;
 790  0128 c67f72        	ld	a,32626
 791  012b 1a02          	or	a,(OFST+0,sp)
 792  012d c77f72        	ld	32626,a
 793                     ; 268     break;
 795  0130 2046          	jra	L362
 796  0132               L512:
 797                     ; 270   case ITC_IRQ_TIM1_CAPCOM:
 797                     ; 271 #if defined(STM8S903) || defined(STM8AF622x) 
 797                     ; 272   case ITC_IRQ_TIM5_OVFTRI:
 797                     ; 273   case ITC_IRQ_TIM5_CAPCOM:
 797                     ; 274 #else
 797                     ; 275   case ITC_IRQ_TIM2_OVF:
 797                     ; 276   case ITC_IRQ_TIM2_CAPCOM:
 797                     ; 277 #endif /*STM8S903 or STM8AF622x */
 797                     ; 278   case ITC_IRQ_TIM3_OVF:
 797                     ; 279     ITC->ISPR4 &= Mask;
 799  0132 c67f73        	ld	a,32627
 800  0135 1401          	and	a,(OFST-1,sp)
 801  0137 c77f73        	ld	32627,a
 802                     ; 280     ITC->ISPR4 |= NewPriority;
 804  013a c67f73        	ld	a,32627
 805  013d 1a02          	or	a,(OFST+0,sp)
 806  013f c77f73        	ld	32627,a
 807                     ; 281     break;
 809  0142 2034          	jra	L362
 810  0144               L712:
 811                     ; 283   case ITC_IRQ_TIM3_CAPCOM:
 811                     ; 284 #if defined(STM8S208) ||defined(STM8S207) || defined (STM8S007) || defined(STM8S103) || \
 811                     ; 285     defined(STM8S001) ||defined(STM8S003) ||defined(STM8S903) || defined (STM8AF52Ax) || defined (STM8AF62Ax)
 811                     ; 286   case ITC_IRQ_UART1_TX:
 811                     ; 287   case ITC_IRQ_UART1_RX:
 811                     ; 288 #endif /*STM8S208 or STM8S207 or STM8S007 or STM8S103 or STM8S003 or STM8S001 or STM8S903 or STM8AF52Ax or STM8AF62Ax */ 
 811                     ; 289 #if defined(STM8AF622x)
 811                     ; 290   case ITC_IRQ_UART4_TX:
 811                     ; 291   case ITC_IRQ_UART4_RX:
 811                     ; 292 #endif /*STM8AF622x */
 811                     ; 293   case ITC_IRQ_I2C:
 811                     ; 294     ITC->ISPR5 &= Mask;
 813  0144 c67f74        	ld	a,32628
 814  0147 1401          	and	a,(OFST-1,sp)
 815  0149 c77f74        	ld	32628,a
 816                     ; 295     ITC->ISPR5 |= NewPriority;
 818  014c c67f74        	ld	a,32628
 819  014f 1a02          	or	a,(OFST+0,sp)
 820  0151 c77f74        	ld	32628,a
 821                     ; 296     break;
 823  0154 2022          	jra	L362
 824  0156               L122:
 825                     ; 312   case ITC_IRQ_ADC1:
 825                     ; 313 #endif /*STM8S105, STM8S005, STM8S103 or STM8S003 or STM8S001 or STM8S903 or STM8AF626x or STM8AF622x */
 825                     ; 314     
 825                     ; 315 #if defined (STM8S903) || defined (STM8AF622x)
 825                     ; 316   case ITC_IRQ_TIM6_OVFTRI:
 825                     ; 317 #else
 825                     ; 318   case ITC_IRQ_TIM4_OVF:
 825                     ; 319 #endif /* STM8S903 or STM8AF622x */
 825                     ; 320     ITC->ISPR6 &= Mask;
 827  0156 c67f75        	ld	a,32629
 828  0159 1401          	and	a,(OFST-1,sp)
 829  015b c77f75        	ld	32629,a
 830                     ; 321     ITC->ISPR6 |= NewPriority;
 832  015e c67f75        	ld	a,32629
 833  0161 1a02          	or	a,(OFST+0,sp)
 834  0163 c77f75        	ld	32629,a
 835                     ; 322     break;
 837  0166 2010          	jra	L362
 838  0168               L322:
 839                     ; 324   case ITC_IRQ_EEPROM_EEC:
 839                     ; 325     ITC->ISPR7 &= Mask;
 841  0168 c67f76        	ld	a,32630
 842  016b 1401          	and	a,(OFST-1,sp)
 843  016d c77f76        	ld	32630,a
 844                     ; 326     ITC->ISPR7 |= NewPriority;
 846  0170 c67f76        	ld	a,32630
 847  0173 1a02          	or	a,(OFST+0,sp)
 848  0175 c77f76        	ld	32630,a
 849                     ; 327     break;
 851                     ; 329   default:
 851                     ; 330     break;
 853  0178               L362:
 854                     ; 332 }
 857  0178 5b04          	addw	sp,#4
 858  017a 81            	ret	
 859  017b               LC002:
 860  017b 89            	pushw	x
 861  017c 5f            	clrw	x
 862  017d 89            	pushw	x
 863  017e ae0064        	ldw	x,#L102
 864  0181 cd0000        	call	_assert_failed
 866  0184 5b04          	addw	sp,#4
 867  0186 81            	ret	
 880                     	xdef	_ITC_GetSoftwarePriority
 881                     	xdef	_ITC_SetSoftwarePriority
 882                     	xdef	_ITC_GetSoftIntStatus
 883                     	xdef	_ITC_DeInit
 884                     	xdef	_ITC_GetCPUCC
 885                     	xref	_assert_failed
 886                     	switch	.const
 887  0064               L102:
 888  0064 2e2e5c2e2e5c  	dc.b	"..\..\stm8s_spl\li"
 889  0076 627261726965  	dc.b	"braries\stm8s_stdp"
 890  0088 65726970685f  	dc.b	"eriph_driver\src\s"
 891  009a 746d38735f69  	dc.b	"tm8s_itc.c",0
 911                     	end
