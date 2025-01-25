   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.3 - 22 Aug 2024
   4                     ; Optimizer V4.6.3 - 22 Aug 2024
  47                     ; 50 uint8_t ITC_GetCPUCC(void)
  47                     ; 51 {
  49                     	switch	.text
  50  0000               _ITC_GetCPUCC:
  54                     ; 53   _asm("push cc");
  57  0000 8a            	push	cc
  59                     ; 54   _asm("pop a");
  62  0001 84            	pop	a
  64                     ; 55   return; /* Ignore compiler warning, the returned value is in A register */
  67  0002 81            	ret	
  90                     ; 80 void ITC_DeInit(void)
  90                     ; 81 {
  91                     	switch	.text
  92  0003               _ITC_DeInit:
  96                     ; 82   ITC->ISPR1 = ITC_SPRX_RESET_VALUE;
  98  0003 35ff7f70      	mov	32624,#255
  99                     ; 83   ITC->ISPR2 = ITC_SPRX_RESET_VALUE;
 101  0007 35ff7f71      	mov	32625,#255
 102                     ; 84   ITC->ISPR3 = ITC_SPRX_RESET_VALUE;
 104  000b 35ff7f72      	mov	32626,#255
 105                     ; 85   ITC->ISPR4 = ITC_SPRX_RESET_VALUE;
 107  000f 35ff7f73      	mov	32627,#255
 108                     ; 86   ITC->ISPR5 = ITC_SPRX_RESET_VALUE;
 110  0013 35ff7f74      	mov	32628,#255
 111                     ; 87   ITC->ISPR6 = ITC_SPRX_RESET_VALUE;
 113  0017 35ff7f75      	mov	32629,#255
 114                     ; 88   ITC->ISPR7 = ITC_SPRX_RESET_VALUE;
 116  001b 35ff7f76      	mov	32630,#255
 117                     ; 89   ITC->ISPR8 = ITC_SPRX_RESET_VALUE;
 119  001f 35ff7f77      	mov	32631,#255
 120                     ; 90 }
 123  0023 81            	ret	
 148                     ; 97 uint8_t ITC_GetSoftIntStatus(void)
 148                     ; 98 {
 149                     	switch	.text
 150  0024               _ITC_GetSoftIntStatus:
 154                     ; 99   return (uint8_t)(ITC_GetCPUCC() & CPU_CC_I1I0);
 156  0024 adda          	call	_ITC_GetCPUCC
 158  0026 a428          	and	a,#40
 161  0028 81            	ret	
 411                     .const:	section	.text
 412  0000               L23:
 413  0000 005e          	dc.w	L14
 414  0002 005e          	dc.w	L14
 415  0004 005e          	dc.w	L14
 416  0006 005e          	dc.w	L14
 417  0008 0063          	dc.w	L34
 418  000a 0063          	dc.w	L34
 419  000c 0063          	dc.w	L34
 420  000e 0063          	dc.w	L34
 421  0010 0083          	dc.w	L502
 422  0012 0083          	dc.w	L502
 423  0014 0068          	dc.w	L54
 424  0016 0068          	dc.w	L54
 425  0018 006d          	dc.w	L74
 426  001a 006d          	dc.w	L74
 427  001c 006d          	dc.w	L74
 428  001e 006d          	dc.w	L74
 429  0020 0072          	dc.w	L15
 430  0022 0072          	dc.w	L15
 431  0024 0072          	dc.w	L15
 432  0026 0072          	dc.w	L15
 433  0028 0083          	dc.w	L502
 434  002a 0083          	dc.w	L502
 435  002c 0077          	dc.w	L35
 436  002e 0077          	dc.w	L35
 437  0030 007c          	dc.w	L55
 438                     ; 107 ITC_PriorityLevel_TypeDef ITC_GetSoftwarePriority(ITC_Irq_TypeDef IrqNum)
 438                     ; 108 {
 439                     	switch	.text
 440  0029               _ITC_GetSoftwarePriority:
 442  0029 88            	push	a
 443  002a 89            	pushw	x
 444       00000002      OFST:	set	2
 447                     ; 109   uint8_t Value = 0;
 449  002b 0f02          	clr	(OFST+0,sp)
 451                     ; 110   uint8_t Mask = 0;
 453                     ; 113   assert_param(IS_ITC_IRQ_OK((uint8_t)IrqNum));
 455  002d a119          	cp	a,#25
 456  002f 250e          	jrult	L02
 457  0031 ae0071        	ldw	x,#113
 458  0034 89            	pushw	x
 459  0035 5f            	clrw	x
 460  0036 89            	pushw	x
 461  0037 ae0064        	ldw	x,#L102
 462  003a cd0000        	call	_assert_failed
 464  003d 5b04          	addw	sp,#4
 465  003f               L02:
 466                     ; 116   Mask = (uint8_t)(0x03U << (((uint8_t)IrqNum % 4U) * 2U));
 468  003f 7b03          	ld	a,(OFST+1,sp)
 469  0041 a403          	and	a,#3
 470  0043 48            	sll	a
 471  0044 5f            	clrw	x
 472  0045 97            	ld	xl,a
 473  0046 a603          	ld	a,#3
 474  0048 5d            	tnzw	x
 475  0049 2704          	jreq	L42
 476  004b               L62:
 477  004b 48            	sll	a
 478  004c 5a            	decw	x
 479  004d 26fc          	jrne	L62
 480  004f               L42:
 481  004f 6b01          	ld	(OFST-1,sp),a
 483                     ; 118   switch (IrqNum)
 485  0051 7b03          	ld	a,(OFST+1,sp)
 487                     ; 198   default:
 487                     ; 199     break;
 488  0053 a119          	cp	a,#25
 489  0055 242c          	jruge	L502
 490  0057 5f            	clrw	x
 491  0058 97            	ld	xl,a
 492  0059 58            	sllw	x
 493  005a de0000        	ldw	x,(L23,x)
 494  005d fc            	jp	(x)
 495  005e               L14:
 496                     ; 120   case ITC_IRQ_TLI: /* TLI software priority can be read but has no meaning */
 496                     ; 121   case ITC_IRQ_AWU:
 496                     ; 122   case ITC_IRQ_CLK:
 496                     ; 123   case ITC_IRQ_PORTA:
 496                     ; 124     Value = (uint8_t)(ITC->ISPR1 & Mask); /* Read software priority */
 498  005e c67f70        	ld	a,32624
 499                     ; 125     break;
 501  0061 201c          	jp	LC001
 502  0063               L34:
 503                     ; 127   case ITC_IRQ_PORTB:
 503                     ; 128   case ITC_IRQ_PORTC:
 503                     ; 129   case ITC_IRQ_PORTD:
 503                     ; 130   case ITC_IRQ_PORTE:
 503                     ; 131     Value = (uint8_t)(ITC->ISPR2 & Mask); /* Read software priority */
 505  0063 c67f71        	ld	a,32625
 506                     ; 132     break;
 508  0066 2017          	jp	LC001
 509  0068               L54:
 510                     ; 141   case ITC_IRQ_SPI:
 510                     ; 142   case ITC_IRQ_TIM1_OVF:
 510                     ; 143     Value = (uint8_t)(ITC->ISPR3 & Mask); /* Read software priority */
 512  0068 c67f72        	ld	a,32626
 513                     ; 144     break;
 515  006b 2012          	jp	LC001
 516  006d               L74:
 517                     ; 146   case ITC_IRQ_TIM1_CAPCOM:
 517                     ; 147 #if defined (STM8S903) || defined (STM8AF622x)
 517                     ; 148   case ITC_IRQ_TIM5_OVFTRI:
 517                     ; 149   case ITC_IRQ_TIM5_CAPCOM:
 517                     ; 150 #else
 517                     ; 151   case ITC_IRQ_TIM2_OVF:
 517                     ; 152   case ITC_IRQ_TIM2_CAPCOM:
 517                     ; 153 #endif /* STM8S903 or STM8AF622x*/
 517                     ; 154   case ITC_IRQ_TIM3_OVF:
 517                     ; 155     Value = (uint8_t)(ITC->ISPR4 & Mask); /* Read software priority */
 519  006d c67f73        	ld	a,32627
 520                     ; 156     break;
 522  0070 200d          	jp	LC001
 523  0072               L15:
 524                     ; 158   case ITC_IRQ_TIM3_CAPCOM:
 524                     ; 159 #if defined(STM8S208) ||defined(STM8S207) || defined (STM8S007) || defined(STM8S103) || \
 524                     ; 160     defined(STM8S003) ||defined(STM8S001) || defined (STM8S903) || defined (STM8AF52Ax) || defined (STM8AF62Ax)
 524                     ; 161   case ITC_IRQ_UART1_TX:
 524                     ; 162   case ITC_IRQ_UART1_RX:
 524                     ; 163 #endif /*STM8S208 or STM8S207 or STM8S007 or STM8S103 or STM8S003 or STM8S001 or STM8S903 or STM8AF52Ax or STM8AF62Ax */ 
 524                     ; 164 #if defined(STM8AF622x)
 524                     ; 165   case ITC_IRQ_UART4_TX:
 524                     ; 166   case ITC_IRQ_UART4_RX:
 524                     ; 167 #endif /*STM8AF622x */
 524                     ; 168   case ITC_IRQ_I2C:
 524                     ; 169     Value = (uint8_t)(ITC->ISPR5 & Mask); /* Read software priority */
 526  0072 c67f74        	ld	a,32628
 527                     ; 170     break;
 529  0075 2008          	jp	LC001
 530  0077               L35:
 531                     ; 184   case ITC_IRQ_ADC1:
 531                     ; 185 #endif /*STM8S105, STM8S005, STM8S103 or STM8S003 or STM8S001 or STM8S903 or STM8AF626x or STM8AF622x */
 531                     ; 186 #if defined (STM8S903) || defined (STM8AF622x)
 531                     ; 187   case ITC_IRQ_TIM6_OVFTRI:
 531                     ; 188 #else
 531                     ; 189   case ITC_IRQ_TIM4_OVF:
 531                     ; 190 #endif /*STM8S903 or STM8AF622x */
 531                     ; 191     Value = (uint8_t)(ITC->ISPR6 & Mask); /* Read software priority */
 533  0077 c67f75        	ld	a,32629
 534                     ; 192     break;
 536  007a 2003          	jp	LC001
 537  007c               L55:
 538                     ; 194   case ITC_IRQ_EEPROM_EEC:
 538                     ; 195     Value = (uint8_t)(ITC->ISPR7 & Mask); /* Read software priority */
 540  007c c67f76        	ld	a,32630
 541  007f               LC001:
 542  007f 1401          	and	a,(OFST-1,sp)
 543  0081 6b02          	ld	(OFST+0,sp),a
 545                     ; 196     break;
 547                     ; 198   default:
 547                     ; 199     break;
 549  0083               L502:
 550                     ; 202   Value >>= (uint8_t)(((uint8_t)IrqNum % 4u) * 2u);
 552  0083 7b03          	ld	a,(OFST+1,sp)
 553  0085 a403          	and	a,#3
 554  0087 48            	sll	a
 555  0088 5f            	clrw	x
 556  0089 97            	ld	xl,a
 557  008a 7b02          	ld	a,(OFST+0,sp)
 558  008c 5d            	tnzw	x
 559  008d 2704          	jreq	L43
 560  008f               L63:
 561  008f 44            	srl	a
 562  0090 5a            	decw	x
 563  0091 26fc          	jrne	L63
 564  0093               L43:
 566                     ; 204   return((ITC_PriorityLevel_TypeDef)Value);
 570  0093 5b03          	addw	sp,#3
 571  0095 81            	ret	
 637                     	switch	.const
 638  0032               L201:
 639  0032 00fc          	dc.w	L702
 640  0034 00fc          	dc.w	L702
 641  0036 00fc          	dc.w	L702
 642  0038 00fc          	dc.w	L702
 643  003a 010e          	dc.w	L112
 644  003c 010e          	dc.w	L112
 645  003e 010e          	dc.w	L112
 646  0040 010e          	dc.w	L112
 647  0042 0178          	dc.w	L362
 648  0044 0178          	dc.w	L362
 649  0046 0120          	dc.w	L312
 650  0048 0120          	dc.w	L312
 651  004a 0132          	dc.w	L512
 652  004c 0132          	dc.w	L512
 653  004e 0132          	dc.w	L512
 654  0050 0132          	dc.w	L512
 655  0052 0144          	dc.w	L712
 656  0054 0144          	dc.w	L712
 657  0056 0144          	dc.w	L712
 658  0058 0144          	dc.w	L712
 659  005a 0178          	dc.w	L362
 660  005c 0178          	dc.w	L362
 661  005e 0156          	dc.w	L122
 662  0060 0156          	dc.w	L122
 663  0062 0168          	dc.w	L322
 664                     ; 220 void ITC_SetSoftwarePriority(ITC_Irq_TypeDef IrqNum, ITC_PriorityLevel_TypeDef PriorityValue)
 664                     ; 221 {
 665                     	switch	.text
 666  0096               _ITC_SetSoftwarePriority:
 668  0096 89            	pushw	x
 669  0097 89            	pushw	x
 670       00000002      OFST:	set	2
 673                     ; 222   uint8_t Mask = 0;
 675                     ; 223   uint8_t NewPriority = 0;
 677                     ; 226   assert_param(IS_ITC_IRQ_OK((uint8_t)IrqNum));
 679  0098 9e            	ld	a,xh
 680  0099 a119          	cp	a,#25
 681  009b 2506          	jrult	L44
 682  009d ae00e2        	ldw	x,#226
 683  00a0 cd017b        	call	LC002
 684  00a3               L44:
 685                     ; 227   assert_param(IS_ITC_PRIORITY_OK(PriorityValue));
 687  00a3 7b04          	ld	a,(OFST+2,sp)
 688  00a5 a102          	cp	a,#2
 689  00a7 2711          	jreq	L45
 690  00a9 a101          	cp	a,#1
 691  00ab 270d          	jreq	L45
 692  00ad 4d            	tnz	a
 693  00ae 270a          	jreq	L45
 694  00b0 a103          	cp	a,#3
 695  00b2 2706          	jreq	L45
 696  00b4 ae00e3        	ldw	x,#227
 697  00b7 cd017b        	call	LC002
 698  00ba               L45:
 699                     ; 230   assert_param(IS_ITC_INTERRUPTS_DISABLED);
 701  00ba cd0024        	call	_ITC_GetSoftIntStatus
 703  00bd a128          	cp	a,#40
 704  00bf 2706          	jreq	L46
 705  00c1 ae00e6        	ldw	x,#230
 706  00c4 cd017b        	call	LC002
 707  00c7               L46:
 708                     ; 234   Mask = (uint8_t)(~(uint8_t)(0x03U << (((uint8_t)IrqNum % 4U) * 2U)));
 710  00c7 7b03          	ld	a,(OFST+1,sp)
 711  00c9 a403          	and	a,#3
 712  00cb 48            	sll	a
 713  00cc 5f            	clrw	x
 714  00cd 97            	ld	xl,a
 715  00ce a603          	ld	a,#3
 716  00d0 5d            	tnzw	x
 717  00d1 2704          	jreq	L07
 718  00d3               L27:
 719  00d3 48            	sll	a
 720  00d4 5a            	decw	x
 721  00d5 26fc          	jrne	L27
 722  00d7               L07:
 723  00d7 43            	cpl	a
 724  00d8 6b01          	ld	(OFST-1,sp),a
 726                     ; 237   NewPriority = (uint8_t)((uint8_t)(PriorityValue) << (((uint8_t)IrqNum % 4U) * 2U));
 728  00da 7b03          	ld	a,(OFST+1,sp)
 729  00dc a403          	and	a,#3
 730  00de 48            	sll	a
 731  00df 5f            	clrw	x
 732  00e0 97            	ld	xl,a
 733  00e1 7b04          	ld	a,(OFST+2,sp)
 734  00e3 5d            	tnzw	x
 735  00e4 2704          	jreq	L47
 736  00e6               L67:
 737  00e6 48            	sll	a
 738  00e7 5a            	decw	x
 739  00e8 26fc          	jrne	L67
 740  00ea               L47:
 741  00ea 6b02          	ld	(OFST+0,sp),a
 743                     ; 239   switch (IrqNum)
 745  00ec 7b03          	ld	a,(OFST+1,sp)
 747                     ; 329   default:
 747                     ; 330     break;
 748  00ee a119          	cp	a,#25
 749  00f0 2503cc0178    	jruge	L362
 750  00f5 5f            	clrw	x
 751  00f6 97            	ld	xl,a
 752  00f7 58            	sllw	x
 753  00f8 de0032        	ldw	x,(L201,x)
 754  00fb fc            	jp	(x)
 755  00fc               L702:
 756                     ; 241   case ITC_IRQ_TLI: /* TLI software priority can be written but has no meaning */
 756                     ; 242   case ITC_IRQ_AWU:
 756                     ; 243   case ITC_IRQ_CLK:
 756                     ; 244   case ITC_IRQ_PORTA:
 756                     ; 245     ITC->ISPR1 &= Mask;
 758  00fc c67f70        	ld	a,32624
 759  00ff 1401          	and	a,(OFST-1,sp)
 760  0101 c77f70        	ld	32624,a
 761                     ; 246     ITC->ISPR1 |= NewPriority;
 763  0104 c67f70        	ld	a,32624
 764  0107 1a02          	or	a,(OFST+0,sp)
 765  0109 c77f70        	ld	32624,a
 766                     ; 247     break;
 768  010c 206a          	jra	L362
 769  010e               L112:
 770                     ; 249   case ITC_IRQ_PORTB:
 770                     ; 250   case ITC_IRQ_PORTC:
 770                     ; 251   case ITC_IRQ_PORTD:
 770                     ; 252   case ITC_IRQ_PORTE:
 770                     ; 253     ITC->ISPR2 &= Mask;
 772  010e c67f71        	ld	a,32625
 773  0111 1401          	and	a,(OFST-1,sp)
 774  0113 c77f71        	ld	32625,a
 775                     ; 254     ITC->ISPR2 |= NewPriority;
 777  0116 c67f71        	ld	a,32625
 778  0119 1a02          	or	a,(OFST+0,sp)
 779  011b c77f71        	ld	32625,a
 780                     ; 255     break;
 782  011e 2058          	jra	L362
 783  0120               L312:
 784                     ; 264   case ITC_IRQ_SPI:
 784                     ; 265   case ITC_IRQ_TIM1_OVF:
 784                     ; 266     ITC->ISPR3 &= Mask;
 786  0120 c67f72        	ld	a,32626
 787  0123 1401          	and	a,(OFST-1,sp)
 788  0125 c77f72        	ld	32626,a
 789                     ; 267     ITC->ISPR3 |= NewPriority;
 791  0128 c67f72        	ld	a,32626
 792  012b 1a02          	or	a,(OFST+0,sp)
 793  012d c77f72        	ld	32626,a
 794                     ; 268     break;
 796  0130 2046          	jra	L362
 797  0132               L512:
 798                     ; 270   case ITC_IRQ_TIM1_CAPCOM:
 798                     ; 271 #if defined(STM8S903) || defined(STM8AF622x) 
 798                     ; 272   case ITC_IRQ_TIM5_OVFTRI:
 798                     ; 273   case ITC_IRQ_TIM5_CAPCOM:
 798                     ; 274 #else
 798                     ; 275   case ITC_IRQ_TIM2_OVF:
 798                     ; 276   case ITC_IRQ_TIM2_CAPCOM:
 798                     ; 277 #endif /*STM8S903 or STM8AF622x */
 798                     ; 278   case ITC_IRQ_TIM3_OVF:
 798                     ; 279     ITC->ISPR4 &= Mask;
 800  0132 c67f73        	ld	a,32627
 801  0135 1401          	and	a,(OFST-1,sp)
 802  0137 c77f73        	ld	32627,a
 803                     ; 280     ITC->ISPR4 |= NewPriority;
 805  013a c67f73        	ld	a,32627
 806  013d 1a02          	or	a,(OFST+0,sp)
 807  013f c77f73        	ld	32627,a
 808                     ; 281     break;
 810  0142 2034          	jra	L362
 811  0144               L712:
 812                     ; 283   case ITC_IRQ_TIM3_CAPCOM:
 812                     ; 284 #if defined(STM8S208) ||defined(STM8S207) || defined (STM8S007) || defined(STM8S103) || \
 812                     ; 285     defined(STM8S001) ||defined(STM8S003) ||defined(STM8S903) || defined (STM8AF52Ax) || defined (STM8AF62Ax)
 812                     ; 286   case ITC_IRQ_UART1_TX:
 812                     ; 287   case ITC_IRQ_UART1_RX:
 812                     ; 288 #endif /*STM8S208 or STM8S207 or STM8S007 or STM8S103 or STM8S003 or STM8S001 or STM8S903 or STM8AF52Ax or STM8AF62Ax */ 
 812                     ; 289 #if defined(STM8AF622x)
 812                     ; 290   case ITC_IRQ_UART4_TX:
 812                     ; 291   case ITC_IRQ_UART4_RX:
 812                     ; 292 #endif /*STM8AF622x */
 812                     ; 293   case ITC_IRQ_I2C:
 812                     ; 294     ITC->ISPR5 &= Mask;
 814  0144 c67f74        	ld	a,32628
 815  0147 1401          	and	a,(OFST-1,sp)
 816  0149 c77f74        	ld	32628,a
 817                     ; 295     ITC->ISPR5 |= NewPriority;
 819  014c c67f74        	ld	a,32628
 820  014f 1a02          	or	a,(OFST+0,sp)
 821  0151 c77f74        	ld	32628,a
 822                     ; 296     break;
 824  0154 2022          	jra	L362
 825  0156               L122:
 826                     ; 312   case ITC_IRQ_ADC1:
 826                     ; 313 #endif /*STM8S105, STM8S005, STM8S103 or STM8S003 or STM8S001 or STM8S903 or STM8AF626x or STM8AF622x */
 826                     ; 314     
 826                     ; 315 #if defined (STM8S903) || defined (STM8AF622x)
 826                     ; 316   case ITC_IRQ_TIM6_OVFTRI:
 826                     ; 317 #else
 826                     ; 318   case ITC_IRQ_TIM4_OVF:
 826                     ; 319 #endif /* STM8S903 or STM8AF622x */
 826                     ; 320     ITC->ISPR6 &= Mask;
 828  0156 c67f75        	ld	a,32629
 829  0159 1401          	and	a,(OFST-1,sp)
 830  015b c77f75        	ld	32629,a
 831                     ; 321     ITC->ISPR6 |= NewPriority;
 833  015e c67f75        	ld	a,32629
 834  0161 1a02          	or	a,(OFST+0,sp)
 835  0163 c77f75        	ld	32629,a
 836                     ; 322     break;
 838  0166 2010          	jra	L362
 839  0168               L322:
 840                     ; 324   case ITC_IRQ_EEPROM_EEC:
 840                     ; 325     ITC->ISPR7 &= Mask;
 842  0168 c67f76        	ld	a,32630
 843  016b 1401          	and	a,(OFST-1,sp)
 844  016d c77f76        	ld	32630,a
 845                     ; 326     ITC->ISPR7 |= NewPriority;
 847  0170 c67f76        	ld	a,32630
 848  0173 1a02          	or	a,(OFST+0,sp)
 849  0175 c77f76        	ld	32630,a
 850                     ; 327     break;
 852                     ; 329   default:
 852                     ; 330     break;
 854  0178               L362:
 855                     ; 332 }
 858  0178 5b04          	addw	sp,#4
 859  017a 81            	ret	
 860  017b               LC002:
 861  017b 89            	pushw	x
 862  017c 5f            	clrw	x
 863  017d 89            	pushw	x
 864  017e ae0064        	ldw	x,#L102
 865  0181 cd0000        	call	_assert_failed
 867  0184 5b04          	addw	sp,#4
 868  0186 81            	ret	
 881                     	xdef	_ITC_GetSoftwarePriority
 882                     	xdef	_ITC_SetSoftwarePriority
 883                     	xdef	_ITC_GetSoftIntStatus
 884                     	xdef	_ITC_DeInit
 885                     	xdef	_ITC_GetCPUCC
 886                     	xref	_assert_failed
 887                     	switch	.const
 888  0064               L102:
 889  0064 2e2e5c2e2e5c  	dc.b	"..\..\stm8s_spl\li"
 890  0076 627261726965  	dc.b	"braries\stm8s_stdp"
 891  0088 65726970685f  	dc.b	"eriph_driver\src\s"
 892  009a 746d38735f69  	dc.b	"tm8s_itc.c",0
 912                     	end
