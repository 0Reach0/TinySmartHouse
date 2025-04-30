   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.3 - 22 Aug 2024
   4                     ; Optimizer V4.6.3 - 22 Aug 2024
  46                     ; 52 void TIM2_DeInit(void)
  46                     ; 53 {
  48                     	switch	.text
  49  0000               _TIM2_DeInit:
  53                     ; 54   TIM2->CR1 = (uint8_t)TIM2_CR1_RESET_VALUE;
  55  0000 725f5300      	clr	21248
  56                     ; 55   TIM2->IER = (uint8_t)TIM2_IER_RESET_VALUE;
  58  0004 725f5303      	clr	21251
  59                     ; 56   TIM2->SR2 = (uint8_t)TIM2_SR2_RESET_VALUE;
  61  0008 725f5305      	clr	21253
  62                     ; 59   TIM2->CCER1 = (uint8_t)TIM2_CCER1_RESET_VALUE;
  64  000c 725f530a      	clr	21258
  65                     ; 60   TIM2->CCER2 = (uint8_t)TIM2_CCER2_RESET_VALUE;
  67  0010 725f530b      	clr	21259
  68                     ; 64   TIM2->CCER1 = (uint8_t)TIM2_CCER1_RESET_VALUE;
  70  0014 725f530a      	clr	21258
  71                     ; 65   TIM2->CCER2 = (uint8_t)TIM2_CCER2_RESET_VALUE;
  73  0018 725f530b      	clr	21259
  74                     ; 66   TIM2->CCMR1 = (uint8_t)TIM2_CCMR1_RESET_VALUE;
  76  001c 725f5307      	clr	21255
  77                     ; 67   TIM2->CCMR2 = (uint8_t)TIM2_CCMR2_RESET_VALUE;
  79  0020 725f5308      	clr	21256
  80                     ; 68   TIM2->CCMR3 = (uint8_t)TIM2_CCMR3_RESET_VALUE;
  82  0024 725f5309      	clr	21257
  83                     ; 69   TIM2->CNTRH = (uint8_t)TIM2_CNTRH_RESET_VALUE;
  85  0028 725f530c      	clr	21260
  86                     ; 70   TIM2->CNTRL = (uint8_t)TIM2_CNTRL_RESET_VALUE;
  88  002c 725f530d      	clr	21261
  89                     ; 71   TIM2->PSCR = (uint8_t)TIM2_PSCR_RESET_VALUE;
  91  0030 725f530e      	clr	21262
  92                     ; 72   TIM2->ARRH  = (uint8_t)TIM2_ARRH_RESET_VALUE;
  94  0034 35ff530f      	mov	21263,#255
  95                     ; 73   TIM2->ARRL  = (uint8_t)TIM2_ARRL_RESET_VALUE;
  97  0038 35ff5310      	mov	21264,#255
  98                     ; 74   TIM2->CCR1H = (uint8_t)TIM2_CCR1H_RESET_VALUE;
 100  003c 725f5311      	clr	21265
 101                     ; 75   TIM2->CCR1L = (uint8_t)TIM2_CCR1L_RESET_VALUE;
 103  0040 725f5312      	clr	21266
 104                     ; 76   TIM2->CCR2H = (uint8_t)TIM2_CCR2H_RESET_VALUE;
 106  0044 725f5313      	clr	21267
 107                     ; 77   TIM2->CCR2L = (uint8_t)TIM2_CCR2L_RESET_VALUE;
 109  0048 725f5314      	clr	21268
 110                     ; 78   TIM2->CCR3H = (uint8_t)TIM2_CCR3H_RESET_VALUE;
 112  004c 725f5315      	clr	21269
 113                     ; 79   TIM2->CCR3L = (uint8_t)TIM2_CCR3L_RESET_VALUE;
 115  0050 725f5316      	clr	21270
 116                     ; 80   TIM2->SR1 = (uint8_t)TIM2_SR1_RESET_VALUE;
 118  0054 725f5304      	clr	21252
 119                     ; 81 }
 122  0058 81            	ret	
 290                     ; 89 void TIM2_TimeBaseInit( TIM2_Prescaler_TypeDef TIM2_Prescaler,
 290                     ; 90                         uint16_t TIM2_Period)
 290                     ; 91 {
 291                     	switch	.text
 292  0059               _TIM2_TimeBaseInit:
 294       ffffffff      OFST: set -1
 297                     ; 93   TIM2->PSCR = (uint8_t)(TIM2_Prescaler);
 299  0059 c7530e        	ld	21262,a
 300                     ; 95   TIM2->ARRH = (uint8_t)(TIM2_Period >> 8);
 302  005c 7b03          	ld	a,(OFST+4,sp)
 303  005e c7530f        	ld	21263,a
 304                     ; 96   TIM2->ARRL = (uint8_t)(TIM2_Period);
 306  0061 7b04          	ld	a,(OFST+5,sp)
 307  0063 c75310        	ld	21264,a
 308                     ; 97 }
 311  0066 81            	ret	
 469                     ; 108 void TIM2_OC1Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 469                     ; 109                   TIM2_OutputState_TypeDef TIM2_OutputState,
 469                     ; 110                   uint16_t TIM2_Pulse,
 469                     ; 111                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 469                     ; 112 {
 470                     	switch	.text
 471  0067               _TIM2_OC1Init:
 473  0067 89            	pushw	x
 474  0068 88            	push	a
 475       00000001      OFST:	set	1
 478                     ; 114   assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 480  0069 9e            	ld	a,xh
 481  006a 4d            	tnz	a
 482  006b 271e          	jreq	L61
 483  006d 9e            	ld	a,xh
 484  006e a110          	cp	a,#16
 485  0070 2719          	jreq	L61
 486  0072 9e            	ld	a,xh
 487  0073 a120          	cp	a,#32
 488  0075 2714          	jreq	L61
 489  0077 9e            	ld	a,xh
 490  0078 a130          	cp	a,#48
 491  007a 270f          	jreq	L61
 492  007c 9e            	ld	a,xh
 493  007d a160          	cp	a,#96
 494  007f 270a          	jreq	L61
 495  0081 9e            	ld	a,xh
 496  0082 a170          	cp	a,#112
 497  0084 2705          	jreq	L61
 498  0086 ae0072        	ldw	x,#114
 499  0089 ad4b          	call	LC001
 500  008b               L61:
 501                     ; 115   assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 503  008b 7b03          	ld	a,(OFST+2,sp)
 504  008d 2709          	jreq	L62
 505  008f a111          	cp	a,#17
 506  0091 2705          	jreq	L62
 507  0093 ae0073        	ldw	x,#115
 508  0096 ad3e          	call	LC001
 509  0098               L62:
 510                     ; 116   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 512  0098 7b08          	ld	a,(OFST+7,sp)
 513  009a 2709          	jreq	L63
 514  009c a122          	cp	a,#34
 515  009e 2705          	jreq	L63
 516  00a0 ae0074        	ldw	x,#116
 517  00a3 ad31          	call	LC001
 518  00a5               L63:
 519                     ; 119   TIM2->CCER1 &= (uint8_t)(~( TIM2_CCER1_CC1E | TIM2_CCER1_CC1P));
 521  00a5 c6530a        	ld	a,21258
 522  00a8 a4fc          	and	a,#252
 523  00aa c7530a        	ld	21258,a
 524                     ; 121   TIM2->CCER1 |= (uint8_t)((uint8_t)(TIM2_OutputState & TIM2_CCER1_CC1E ) | 
 524                     ; 122                            (uint8_t)(TIM2_OCPolarity & TIM2_CCER1_CC1P));
 526  00ad 7b08          	ld	a,(OFST+7,sp)
 527  00af a402          	and	a,#2
 528  00b1 6b01          	ld	(OFST+0,sp),a
 530  00b3 7b03          	ld	a,(OFST+2,sp)
 531  00b5 a401          	and	a,#1
 532  00b7 1a01          	or	a,(OFST+0,sp)
 533  00b9 ca530a        	or	a,21258
 534  00bc c7530a        	ld	21258,a
 535                     ; 125   TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM)) |
 535                     ; 126                           (uint8_t)TIM2_OCMode);
 537  00bf c65307        	ld	a,21255
 538  00c2 a48f          	and	a,#143
 539  00c4 1a02          	or	a,(OFST+1,sp)
 540  00c6 c75307        	ld	21255,a
 541                     ; 129   TIM2->CCR1H = (uint8_t)(TIM2_Pulse >> 8);
 543  00c9 7b06          	ld	a,(OFST+5,sp)
 544  00cb c75311        	ld	21265,a
 545                     ; 130   TIM2->CCR1L = (uint8_t)(TIM2_Pulse);
 547  00ce 7b07          	ld	a,(OFST+6,sp)
 548  00d0 c75312        	ld	21266,a
 549                     ; 131 }
 552  00d3 5b03          	addw	sp,#3
 553  00d5 81            	ret	
 554  00d6               LC001:
 555  00d6 89            	pushw	x
 556  00d7 5f            	clrw	x
 557  00d8 89            	pushw	x
 558  00d9 ae0000        	ldw	x,#L702
 559  00dc cd0000        	call	_assert_failed
 561  00df 5b04          	addw	sp,#4
 562  00e1 81            	ret	
 627                     ; 142 void TIM2_OC2Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 627                     ; 143                   TIM2_OutputState_TypeDef TIM2_OutputState,
 627                     ; 144                   uint16_t TIM2_Pulse,
 627                     ; 145                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 627                     ; 146 {
 628                     	switch	.text
 629  00e2               _TIM2_OC2Init:
 631  00e2 89            	pushw	x
 632  00e3 88            	push	a
 633       00000001      OFST:	set	1
 636                     ; 148   assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 638  00e4 9e            	ld	a,xh
 639  00e5 4d            	tnz	a
 640  00e6 271e          	jreq	L05
 641  00e8 9e            	ld	a,xh
 642  00e9 a110          	cp	a,#16
 643  00eb 2719          	jreq	L05
 644  00ed 9e            	ld	a,xh
 645  00ee a120          	cp	a,#32
 646  00f0 2714          	jreq	L05
 647  00f2 9e            	ld	a,xh
 648  00f3 a130          	cp	a,#48
 649  00f5 270f          	jreq	L05
 650  00f7 9e            	ld	a,xh
 651  00f8 a160          	cp	a,#96
 652  00fa 270a          	jreq	L05
 653  00fc 9e            	ld	a,xh
 654  00fd a170          	cp	a,#112
 655  00ff 2705          	jreq	L05
 656  0101 ae0094        	ldw	x,#148
 657  0104 ad4b          	call	LC002
 658  0106               L05:
 659                     ; 149   assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 661  0106 7b03          	ld	a,(OFST+2,sp)
 662  0108 2709          	jreq	L06
 663  010a a111          	cp	a,#17
 664  010c 2705          	jreq	L06
 665  010e ae0095        	ldw	x,#149
 666  0111 ad3e          	call	LC002
 667  0113               L06:
 668                     ; 150   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 670  0113 7b08          	ld	a,(OFST+7,sp)
 671  0115 2709          	jreq	L07
 672  0117 a122          	cp	a,#34
 673  0119 2705          	jreq	L07
 674  011b ae0096        	ldw	x,#150
 675  011e ad31          	call	LC002
 676  0120               L07:
 677                     ; 154   TIM2->CCER1 &= (uint8_t)(~( TIM2_CCER1_CC2E |  TIM2_CCER1_CC2P ));
 679  0120 c6530a        	ld	a,21258
 680  0123 a4cf          	and	a,#207
 681  0125 c7530a        	ld	21258,a
 682                     ; 156   TIM2->CCER1 |= (uint8_t)((uint8_t)(TIM2_OutputState  & TIM2_CCER1_CC2E ) |
 682                     ; 157                            (uint8_t)(TIM2_OCPolarity & TIM2_CCER1_CC2P));
 684  0128 7b08          	ld	a,(OFST+7,sp)
 685  012a a420          	and	a,#32
 686  012c 6b01          	ld	(OFST+0,sp),a
 688  012e 7b03          	ld	a,(OFST+2,sp)
 689  0130 a410          	and	a,#16
 690  0132 1a01          	or	a,(OFST+0,sp)
 691  0134 ca530a        	or	a,21258
 692  0137 c7530a        	ld	21258,a
 693                     ; 161   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM)) | 
 693                     ; 162                           (uint8_t)TIM2_OCMode);
 695  013a c65308        	ld	a,21256
 696  013d a48f          	and	a,#143
 697  013f 1a02          	or	a,(OFST+1,sp)
 698  0141 c75308        	ld	21256,a
 699                     ; 166   TIM2->CCR2H = (uint8_t)(TIM2_Pulse >> 8);
 701  0144 7b06          	ld	a,(OFST+5,sp)
 702  0146 c75313        	ld	21267,a
 703                     ; 167   TIM2->CCR2L = (uint8_t)(TIM2_Pulse);
 705  0149 7b07          	ld	a,(OFST+6,sp)
 706  014b c75314        	ld	21268,a
 707                     ; 168 }
 710  014e 5b03          	addw	sp,#3
 711  0150 81            	ret	
 712  0151               LC002:
 713  0151 89            	pushw	x
 714  0152 5f            	clrw	x
 715  0153 89            	pushw	x
 716  0154 ae0000        	ldw	x,#L702
 717  0157 cd0000        	call	_assert_failed
 719  015a 5b04          	addw	sp,#4
 720  015c 81            	ret	
 785                     ; 179 void TIM2_OC3Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 785                     ; 180                   TIM2_OutputState_TypeDef TIM2_OutputState,
 785                     ; 181                   uint16_t TIM2_Pulse,
 785                     ; 182                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 785                     ; 183 {
 786                     	switch	.text
 787  015d               _TIM2_OC3Init:
 789  015d 89            	pushw	x
 790  015e 88            	push	a
 791       00000001      OFST:	set	1
 794                     ; 185   assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 796  015f 9e            	ld	a,xh
 797  0160 4d            	tnz	a
 798  0161 271e          	jreq	L201
 799  0163 9e            	ld	a,xh
 800  0164 a110          	cp	a,#16
 801  0166 2719          	jreq	L201
 802  0168 9e            	ld	a,xh
 803  0169 a120          	cp	a,#32
 804  016b 2714          	jreq	L201
 805  016d 9e            	ld	a,xh
 806  016e a130          	cp	a,#48
 807  0170 270f          	jreq	L201
 808  0172 9e            	ld	a,xh
 809  0173 a160          	cp	a,#96
 810  0175 270a          	jreq	L201
 811  0177 9e            	ld	a,xh
 812  0178 a170          	cp	a,#112
 813  017a 2705          	jreq	L201
 814  017c ae00b9        	ldw	x,#185
 815  017f ad4b          	call	LC003
 816  0181               L201:
 817                     ; 186   assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 819  0181 7b03          	ld	a,(OFST+2,sp)
 820  0183 2709          	jreq	L211
 821  0185 a111          	cp	a,#17
 822  0187 2705          	jreq	L211
 823  0189 ae00ba        	ldw	x,#186
 824  018c ad3e          	call	LC003
 825  018e               L211:
 826                     ; 187   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 828  018e 7b08          	ld	a,(OFST+7,sp)
 829  0190 2709          	jreq	L221
 830  0192 a122          	cp	a,#34
 831  0194 2705          	jreq	L221
 832  0196 ae00bb        	ldw	x,#187
 833  0199 ad31          	call	LC003
 834  019b               L221:
 835                     ; 189   TIM2->CCER2 &= (uint8_t)(~( TIM2_CCER2_CC3E  | TIM2_CCER2_CC3P));
 837  019b c6530b        	ld	a,21259
 838  019e a4fc          	and	a,#252
 839  01a0 c7530b        	ld	21259,a
 840                     ; 191   TIM2->CCER2 |= (uint8_t)((uint8_t)(TIM2_OutputState & TIM2_CCER2_CC3E) |  
 840                     ; 192                            (uint8_t)(TIM2_OCPolarity & TIM2_CCER2_CC3P));
 842  01a3 7b08          	ld	a,(OFST+7,sp)
 843  01a5 a402          	and	a,#2
 844  01a7 6b01          	ld	(OFST+0,sp),a
 846  01a9 7b03          	ld	a,(OFST+2,sp)
 847  01ab a401          	and	a,#1
 848  01ad 1a01          	or	a,(OFST+0,sp)
 849  01af ca530b        	or	a,21259
 850  01b2 c7530b        	ld	21259,a
 851                     ; 195   TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM)) |
 851                     ; 196                           (uint8_t)TIM2_OCMode);
 853  01b5 c65309        	ld	a,21257
 854  01b8 a48f          	and	a,#143
 855  01ba 1a02          	or	a,(OFST+1,sp)
 856  01bc c75309        	ld	21257,a
 857                     ; 199   TIM2->CCR3H = (uint8_t)(TIM2_Pulse >> 8);
 859  01bf 7b06          	ld	a,(OFST+5,sp)
 860  01c1 c75315        	ld	21269,a
 861                     ; 200   TIM2->CCR3L = (uint8_t)(TIM2_Pulse);
 863  01c4 7b07          	ld	a,(OFST+6,sp)
 864  01c6 c75316        	ld	21270,a
 865                     ; 201 }
 868  01c9 5b03          	addw	sp,#3
 869  01cb 81            	ret	
 870  01cc               LC003:
 871  01cc 89            	pushw	x
 872  01cd 5f            	clrw	x
 873  01ce 89            	pushw	x
 874  01cf ae0000        	ldw	x,#L702
 875  01d2 cd0000        	call	_assert_failed
 877  01d5 5b04          	addw	sp,#4
 878  01d7 81            	ret	
1072                     ; 212 void TIM2_ICInit(TIM2_Channel_TypeDef TIM2_Channel,
1072                     ; 213                  TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
1072                     ; 214                  TIM2_ICSelection_TypeDef TIM2_ICSelection,
1072                     ; 215                  TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
1072                     ; 216                  uint8_t TIM2_ICFilter)
1072                     ; 217 {
1073                     	switch	.text
1074  01d8               _TIM2_ICInit:
1076  01d8 89            	pushw	x
1077       00000000      OFST:	set	0
1080                     ; 219   assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
1082  01d9 9e            	ld	a,xh
1083  01da 4d            	tnz	a
1084  01db 270f          	jreq	L431
1085  01dd 9e            	ld	a,xh
1086  01de 4a            	dec	a
1087  01df 270b          	jreq	L431
1088  01e1 9e            	ld	a,xh
1089  01e2 a102          	cp	a,#2
1090  01e4 2706          	jreq	L431
1091  01e6 ae00db        	ldw	x,#219
1092  01e9 cd026f        	call	LC004
1093  01ec               L431:
1094                     ; 220   assert_param(IS_TIM2_IC_POLARITY_OK(TIM2_ICPolarity));
1096  01ec 7b02          	ld	a,(OFST+2,sp)
1097  01ee 2709          	jreq	L441
1098  01f0 a144          	cp	a,#68
1099  01f2 2705          	jreq	L441
1100  01f4 ae00dc        	ldw	x,#220
1101  01f7 ad76          	call	LC004
1102  01f9               L441:
1103                     ; 221   assert_param(IS_TIM2_IC_SELECTION_OK(TIM2_ICSelection));
1105  01f9 7b05          	ld	a,(OFST+5,sp)
1106  01fb a101          	cp	a,#1
1107  01fd 270d          	jreq	L451
1108  01ff a102          	cp	a,#2
1109  0201 2709          	jreq	L451
1110  0203 a103          	cp	a,#3
1111  0205 2705          	jreq	L451
1112  0207 ae00dd        	ldw	x,#221
1113  020a ad63          	call	LC004
1114  020c               L451:
1115                     ; 222   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_ICPrescaler));
1117  020c 7b06          	ld	a,(OFST+6,sp)
1118  020e 2711          	jreq	L461
1119  0210 a104          	cp	a,#4
1120  0212 270d          	jreq	L461
1121  0214 a108          	cp	a,#8
1122  0216 2709          	jreq	L461
1123  0218 a10c          	cp	a,#12
1124  021a 2705          	jreq	L461
1125  021c ae00de        	ldw	x,#222
1126  021f ad4e          	call	LC004
1127  0221               L461:
1128                     ; 223   assert_param(IS_TIM2_IC_FILTER_OK(TIM2_ICFilter));
1130  0221 7b07          	ld	a,(OFST+7,sp)
1131  0223 a110          	cp	a,#16
1132  0225 2505          	jrult	L271
1133  0227 ae00df        	ldw	x,#223
1134  022a ad43          	call	LC004
1135  022c               L271:
1136                     ; 225   if (TIM2_Channel == TIM2_CHANNEL_1)
1138  022c 7b01          	ld	a,(OFST+1,sp)
1139  022e 2614          	jrne	L304
1140                     ; 228     TI1_Config((uint8_t)TIM2_ICPolarity,
1140                     ; 229                (uint8_t)TIM2_ICSelection,
1140                     ; 230                (uint8_t)TIM2_ICFilter);
1142  0230 7b07          	ld	a,(OFST+7,sp)
1143  0232 88            	push	a
1144  0233 7b06          	ld	a,(OFST+6,sp)
1145  0235 97            	ld	xl,a
1146  0236 7b03          	ld	a,(OFST+3,sp)
1147  0238 95            	ld	xh,a
1148  0239 cd08c9        	call	L3_TI1_Config
1150  023c 84            	pop	a
1151                     ; 233     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1153  023d 7b06          	ld	a,(OFST+6,sp)
1154  023f cd0709        	call	_TIM2_SetIC1Prescaler
1157  0242 2029          	jra	L504
1158  0244               L304:
1159                     ; 235   else if (TIM2_Channel == TIM2_CHANNEL_2)
1161  0244 4a            	dec	a
1162  0245 2614          	jrne	L704
1163                     ; 238     TI2_Config((uint8_t)TIM2_ICPolarity,
1163                     ; 239                (uint8_t)TIM2_ICSelection,
1163                     ; 240                (uint8_t)TIM2_ICFilter);
1165  0247 7b07          	ld	a,(OFST+7,sp)
1166  0249 88            	push	a
1167  024a 7b06          	ld	a,(OFST+6,sp)
1168  024c 97            	ld	xl,a
1169  024d 7b03          	ld	a,(OFST+3,sp)
1170  024f 95            	ld	xh,a
1171  0250 cd08f9        	call	L5_TI2_Config
1173  0253 84            	pop	a
1174                     ; 243     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1176  0254 7b06          	ld	a,(OFST+6,sp)
1177  0256 cd0733        	call	_TIM2_SetIC2Prescaler
1180  0259 2012          	jra	L504
1181  025b               L704:
1182                     ; 248     TI3_Config((uint8_t)TIM2_ICPolarity,
1182                     ; 249                (uint8_t)TIM2_ICSelection,
1182                     ; 250                (uint8_t)TIM2_ICFilter);
1184  025b 7b07          	ld	a,(OFST+7,sp)
1185  025d 88            	push	a
1186  025e 7b06          	ld	a,(OFST+6,sp)
1187  0260 97            	ld	xl,a
1188  0261 7b03          	ld	a,(OFST+3,sp)
1189  0263 95            	ld	xh,a
1190  0264 cd0929        	call	L7_TI3_Config
1192  0267 84            	pop	a
1193                     ; 253     TIM2_SetIC3Prescaler(TIM2_ICPrescaler);
1195  0268 7b06          	ld	a,(OFST+6,sp)
1196  026a cd075d        	call	_TIM2_SetIC3Prescaler
1198  026d               L504:
1199                     ; 255 }
1202  026d 85            	popw	x
1203  026e 81            	ret	
1204  026f               LC004:
1205  026f 89            	pushw	x
1206  0270 5f            	clrw	x
1207  0271 89            	pushw	x
1208  0272 ae0000        	ldw	x,#L702
1209  0275 cd0000        	call	_assert_failed
1211  0278 5b04          	addw	sp,#4
1212  027a 81            	ret	
1309                     ; 266 void TIM2_PWMIConfig(TIM2_Channel_TypeDef TIM2_Channel,
1309                     ; 267                      TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
1309                     ; 268                      TIM2_ICSelection_TypeDef TIM2_ICSelection,
1309                     ; 269                      TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
1309                     ; 270                      uint8_t TIM2_ICFilter)
1309                     ; 271 {
1310                     	switch	.text
1311  027b               _TIM2_PWMIConfig:
1313  027b 89            	pushw	x
1314  027c 89            	pushw	x
1315       00000002      OFST:	set	2
1318                     ; 272   uint8_t icpolarity = (uint8_t)TIM2_ICPOLARITY_RISING;
1320                     ; 273   uint8_t icselection = (uint8_t)TIM2_ICSELECTION_DIRECTTI;
1322                     ; 276   assert_param(IS_TIM2_PWMI_CHANNEL_OK(TIM2_Channel));
1324  027d 9e            	ld	a,xh
1325  027e 4d            	tnz	a
1326  027f 270a          	jreq	L022
1327  0281 9e            	ld	a,xh
1328  0282 4a            	dec	a
1329  0283 2706          	jreq	L022
1330  0285 ae0114        	ldw	x,#276
1331  0288 cd032e        	call	LC005
1332  028b               L022:
1333                     ; 277   assert_param(IS_TIM2_IC_POLARITY_OK(TIM2_ICPolarity));
1335  028b 7b04          	ld	a,(OFST+2,sp)
1336  028d 270a          	jreq	L032
1337  028f a144          	cp	a,#68
1338  0291 2706          	jreq	L032
1339  0293 ae0115        	ldw	x,#277
1340  0296 cd032e        	call	LC005
1341  0299               L032:
1342                     ; 278   assert_param(IS_TIM2_IC_SELECTION_OK(TIM2_ICSelection));
1344  0299 7b07          	ld	a,(OFST+5,sp)
1345  029b a101          	cp	a,#1
1346  029d 270e          	jreq	L042
1347  029f a102          	cp	a,#2
1348  02a1 270a          	jreq	L042
1349  02a3 a103          	cp	a,#3
1350  02a5 2706          	jreq	L042
1351  02a7 ae0116        	ldw	x,#278
1352  02aa cd032e        	call	LC005
1353  02ad               L042:
1354                     ; 279   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_ICPrescaler));
1356  02ad 7b08          	ld	a,(OFST+6,sp)
1357  02af 2711          	jreq	L052
1358  02b1 a104          	cp	a,#4
1359  02b3 270d          	jreq	L052
1360  02b5 a108          	cp	a,#8
1361  02b7 2709          	jreq	L052
1362  02b9 a10c          	cp	a,#12
1363  02bb 2705          	jreq	L052
1364  02bd ae0117        	ldw	x,#279
1365  02c0 ad6c          	call	LC005
1366  02c2               L052:
1367                     ; 282   if (TIM2_ICPolarity != TIM2_ICPOLARITY_FALLING)
1369  02c2 7b04          	ld	a,(OFST+2,sp)
1370  02c4 a144          	cp	a,#68
1371  02c6 2706          	jreq	L164
1372                     ; 284     icpolarity = (uint8_t)TIM2_ICPOLARITY_FALLING;
1374  02c8 a644          	ld	a,#68
1375  02ca 6b01          	ld	(OFST-1,sp),a
1378  02cc 2002          	jra	L364
1379  02ce               L164:
1380                     ; 288     icpolarity = (uint8_t)TIM2_ICPOLARITY_RISING;
1382  02ce 0f01          	clr	(OFST-1,sp)
1384  02d0               L364:
1385                     ; 292   if (TIM2_ICSelection == TIM2_ICSELECTION_DIRECTTI)
1387  02d0 7b07          	ld	a,(OFST+5,sp)
1388  02d2 4a            	dec	a
1389  02d3 2604          	jrne	L564
1390                     ; 294     icselection = (uint8_t)TIM2_ICSELECTION_INDIRECTTI;
1392  02d5 a602          	ld	a,#2
1394  02d7 2002          	jra	L764
1395  02d9               L564:
1396                     ; 298     icselection = (uint8_t)TIM2_ICSELECTION_DIRECTTI;
1398  02d9 a601          	ld	a,#1
1399  02db               L764:
1400  02db 6b02          	ld	(OFST+0,sp),a
1402                     ; 301   if (TIM2_Channel == TIM2_CHANNEL_1)
1404  02dd 7b03          	ld	a,(OFST+1,sp)
1405  02df 2626          	jrne	L174
1406                     ; 304     TI1_Config((uint8_t)TIM2_ICPolarity, (uint8_t)TIM2_ICSelection,
1406                     ; 305                (uint8_t)TIM2_ICFilter);
1408  02e1 7b09          	ld	a,(OFST+7,sp)
1409  02e3 88            	push	a
1410  02e4 7b08          	ld	a,(OFST+6,sp)
1411  02e6 97            	ld	xl,a
1412  02e7 7b05          	ld	a,(OFST+3,sp)
1413  02e9 95            	ld	xh,a
1414  02ea cd08c9        	call	L3_TI1_Config
1416  02ed 84            	pop	a
1417                     ; 308     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1419  02ee 7b08          	ld	a,(OFST+6,sp)
1420  02f0 cd0709        	call	_TIM2_SetIC1Prescaler
1422                     ; 311     TI2_Config(icpolarity, icselection, TIM2_ICFilter);
1424  02f3 7b09          	ld	a,(OFST+7,sp)
1425  02f5 88            	push	a
1426  02f6 7b03          	ld	a,(OFST+1,sp)
1427  02f8 97            	ld	xl,a
1428  02f9 7b02          	ld	a,(OFST+0,sp)
1429  02fb 95            	ld	xh,a
1430  02fc cd08f9        	call	L5_TI2_Config
1432  02ff 84            	pop	a
1433                     ; 314     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1435  0300 7b08          	ld	a,(OFST+6,sp)
1436  0302 cd0733        	call	_TIM2_SetIC2Prescaler
1439  0305 2024          	jra	L374
1440  0307               L174:
1441                     ; 319     TI2_Config((uint8_t)TIM2_ICPolarity, (uint8_t)TIM2_ICSelection,
1441                     ; 320                (uint8_t)TIM2_ICFilter);
1443  0307 7b09          	ld	a,(OFST+7,sp)
1444  0309 88            	push	a
1445  030a 7b08          	ld	a,(OFST+6,sp)
1446  030c 97            	ld	xl,a
1447  030d 7b05          	ld	a,(OFST+3,sp)
1448  030f 95            	ld	xh,a
1449  0310 cd08f9        	call	L5_TI2_Config
1451  0313 84            	pop	a
1452                     ; 323     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1454  0314 7b08          	ld	a,(OFST+6,sp)
1455  0316 cd0733        	call	_TIM2_SetIC2Prescaler
1457                     ; 326     TI1_Config((uint8_t)icpolarity, icselection, (uint8_t)TIM2_ICFilter);
1459  0319 7b09          	ld	a,(OFST+7,sp)
1460  031b 88            	push	a
1461  031c 7b03          	ld	a,(OFST+1,sp)
1462  031e 97            	ld	xl,a
1463  031f 7b02          	ld	a,(OFST+0,sp)
1464  0321 95            	ld	xh,a
1465  0322 cd08c9        	call	L3_TI1_Config
1467  0325 84            	pop	a
1468                     ; 329     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1470  0326 7b08          	ld	a,(OFST+6,sp)
1471  0328 cd0709        	call	_TIM2_SetIC1Prescaler
1473  032b               L374:
1474                     ; 331 }
1477  032b 5b04          	addw	sp,#4
1478  032d 81            	ret	
1479  032e               LC005:
1480  032e 89            	pushw	x
1481  032f 5f            	clrw	x
1482  0330 89            	pushw	x
1483  0331 ae0000        	ldw	x,#L702
1484  0334 cd0000        	call	_assert_failed
1486  0337 5b04          	addw	sp,#4
1487  0339 81            	ret	
1543                     ; 339 void TIM2_Cmd(FunctionalState NewState)
1543                     ; 340 {
1544                     	switch	.text
1545  033a               _TIM2_Cmd:
1547  033a 88            	push	a
1548       00000000      OFST:	set	0
1551                     ; 342   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1553  033b 4d            	tnz	a
1554  033c 2711          	jreq	L203
1555  033e 4a            	dec	a
1556  033f 270e          	jreq	L203
1557  0341 ae0156        	ldw	x,#342
1558  0344 89            	pushw	x
1559  0345 5f            	clrw	x
1560  0346 89            	pushw	x
1561  0347 ae0000        	ldw	x,#L702
1562  034a cd0000        	call	_assert_failed
1564  034d 5b04          	addw	sp,#4
1565  034f               L203:
1566                     ; 345   if (NewState != DISABLE)
1568  034f 7b01          	ld	a,(OFST+1,sp)
1569  0351 2706          	jreq	L325
1570                     ; 347     TIM2->CR1 |= (uint8_t)TIM2_CR1_CEN;
1572  0353 72105300      	bset	21248,#0
1574  0357 2004          	jra	L525
1575  0359               L325:
1576                     ; 351     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_CEN);
1578  0359 72115300      	bres	21248,#0
1579  035d               L525:
1580                     ; 353 }
1583  035d 84            	pop	a
1584  035e 81            	ret	
1664                     ; 368 void TIM2_ITConfig(TIM2_IT_TypeDef TIM2_IT, FunctionalState NewState)
1664                     ; 369 {
1665                     	switch	.text
1666  035f               _TIM2_ITConfig:
1668  035f 89            	pushw	x
1669       00000000      OFST:	set	0
1672                     ; 371   assert_param(IS_TIM2_IT_OK(TIM2_IT));
1674  0360 9e            	ld	a,xh
1675  0361 4d            	tnz	a
1676  0362 2705          	jreq	L013
1677  0364 9e            	ld	a,xh
1678  0365 a110          	cp	a,#16
1679  0367 2505          	jrult	L213
1680  0369               L013:
1681  0369 ae0173        	ldw	x,#371
1682  036c ad22          	call	LC006
1683  036e               L213:
1684                     ; 372   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1686  036e 7b02          	ld	a,(OFST+2,sp)
1687  0370 2708          	jreq	L223
1688  0372 4a            	dec	a
1689  0373 2705          	jreq	L223
1690  0375 ae0174        	ldw	x,#372
1691  0378 ad16          	call	LC006
1692  037a               L223:
1693                     ; 374   if (NewState != DISABLE)
1695  037a 7b02          	ld	a,(OFST+2,sp)
1696  037c 2707          	jreq	L565
1697                     ; 377     TIM2->IER |= (uint8_t)TIM2_IT;
1699  037e c65303        	ld	a,21251
1700  0381 1a01          	or	a,(OFST+1,sp)
1702  0383 2006          	jra	L765
1703  0385               L565:
1704                     ; 382     TIM2->IER &= (uint8_t)(~TIM2_IT);
1706  0385 7b01          	ld	a,(OFST+1,sp)
1707  0387 43            	cpl	a
1708  0388 c45303        	and	a,21251
1709  038b               L765:
1710  038b c75303        	ld	21251,a
1711                     ; 384 }
1714  038e 85            	popw	x
1715  038f 81            	ret	
1716  0390               LC006:
1717  0390 89            	pushw	x
1718  0391 5f            	clrw	x
1719  0392 89            	pushw	x
1720  0393 ae0000        	ldw	x,#L702
1721  0396 cd0000        	call	_assert_failed
1723  0399 5b04          	addw	sp,#4
1724  039b 81            	ret	
1761                     ; 392 void TIM2_UpdateDisableConfig(FunctionalState NewState)
1761                     ; 393 {
1762                     	switch	.text
1763  039c               _TIM2_UpdateDisableConfig:
1765  039c 88            	push	a
1766       00000000      OFST:	set	0
1769                     ; 395   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1771  039d 4d            	tnz	a
1772  039e 2711          	jreq	L433
1773  03a0 4a            	dec	a
1774  03a1 270e          	jreq	L433
1775  03a3 ae018b        	ldw	x,#395
1776  03a6 89            	pushw	x
1777  03a7 5f            	clrw	x
1778  03a8 89            	pushw	x
1779  03a9 ae0000        	ldw	x,#L702
1780  03ac cd0000        	call	_assert_failed
1782  03af 5b04          	addw	sp,#4
1783  03b1               L433:
1784                     ; 398   if (NewState != DISABLE)
1786  03b1 7b01          	ld	a,(OFST+1,sp)
1787  03b3 2706          	jreq	L706
1788                     ; 400     TIM2->CR1 |= (uint8_t)TIM2_CR1_UDIS;
1790  03b5 72125300      	bset	21248,#1
1792  03b9 2004          	jra	L116
1793  03bb               L706:
1794                     ; 404     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_UDIS);
1796  03bb 72135300      	bres	21248,#1
1797  03bf               L116:
1798                     ; 406 }
1801  03bf 84            	pop	a
1802  03c0 81            	ret	
1861                     ; 416 void TIM2_UpdateRequestConfig(TIM2_UpdateSource_TypeDef TIM2_UpdateSource)
1861                     ; 417 {
1862                     	switch	.text
1863  03c1               _TIM2_UpdateRequestConfig:
1865  03c1 88            	push	a
1866       00000000      OFST:	set	0
1869                     ; 419   assert_param(IS_TIM2_UPDATE_SOURCE_OK(TIM2_UpdateSource));
1871  03c2 4d            	tnz	a
1872  03c3 2711          	jreq	L643
1873  03c5 4a            	dec	a
1874  03c6 270e          	jreq	L643
1875  03c8 ae01a3        	ldw	x,#419
1876  03cb 89            	pushw	x
1877  03cc 5f            	clrw	x
1878  03cd 89            	pushw	x
1879  03ce ae0000        	ldw	x,#L702
1880  03d1 cd0000        	call	_assert_failed
1882  03d4 5b04          	addw	sp,#4
1883  03d6               L643:
1884                     ; 422   if (TIM2_UpdateSource != TIM2_UPDATESOURCE_GLOBAL)
1886  03d6 7b01          	ld	a,(OFST+1,sp)
1887  03d8 2706          	jreq	L146
1888                     ; 424     TIM2->CR1 |= (uint8_t)TIM2_CR1_URS;
1890  03da 72145300      	bset	21248,#2
1892  03de 2004          	jra	L346
1893  03e0               L146:
1894                     ; 428     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_URS);
1896  03e0 72155300      	bres	21248,#2
1897  03e4               L346:
1898                     ; 430 }
1901  03e4 84            	pop	a
1902  03e5 81            	ret	
1960                     ; 440 void TIM2_SelectOnePulseMode(TIM2_OPMode_TypeDef TIM2_OPMode)
1960                     ; 441 {
1961                     	switch	.text
1962  03e6               _TIM2_SelectOnePulseMode:
1964  03e6 88            	push	a
1965       00000000      OFST:	set	0
1968                     ; 443   assert_param(IS_TIM2_OPM_MODE_OK(TIM2_OPMode));
1970  03e7 a101          	cp	a,#1
1971  03e9 2711          	jreq	L063
1972  03eb 4d            	tnz	a
1973  03ec 270e          	jreq	L063
1974  03ee ae01bb        	ldw	x,#443
1975  03f1 89            	pushw	x
1976  03f2 5f            	clrw	x
1977  03f3 89            	pushw	x
1978  03f4 ae0000        	ldw	x,#L702
1979  03f7 cd0000        	call	_assert_failed
1981  03fa 5b04          	addw	sp,#4
1982  03fc               L063:
1983                     ; 446   if (TIM2_OPMode != TIM2_OPMODE_REPETITIVE)
1985  03fc 7b01          	ld	a,(OFST+1,sp)
1986  03fe 2706          	jreq	L376
1987                     ; 448     TIM2->CR1 |= (uint8_t)TIM2_CR1_OPM;
1989  0400 72165300      	bset	21248,#3
1991  0404 2004          	jra	L576
1992  0406               L376:
1993                     ; 452     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_OPM);
1995  0406 72175300      	bres	21248,#3
1996  040a               L576:
1997                     ; 454 }
2000  040a 84            	pop	a
2001  040b 81            	ret	
2070                     ; 484 void TIM2_PrescalerConfig(TIM2_Prescaler_TypeDef Prescaler,
2070                     ; 485                           TIM2_PSCReloadMode_TypeDef TIM2_PSCReloadMode)
2070                     ; 486 {
2071                     	switch	.text
2072  040c               _TIM2_PrescalerConfig:
2074  040c 89            	pushw	x
2075       00000000      OFST:	set	0
2078                     ; 488   assert_param(IS_TIM2_PRESCALER_RELOAD_OK(TIM2_PSCReloadMode));
2080  040d 9f            	ld	a,xl
2081  040e 4d            	tnz	a
2082  040f 2709          	jreq	L273
2083  0411 9f            	ld	a,xl
2084  0412 4a            	dec	a
2085  0413 2705          	jreq	L273
2086  0415 ae01e8        	ldw	x,#488
2087  0418 ad51          	call	LC007
2088  041a               L273:
2089                     ; 489   assert_param(IS_TIM2_PRESCALER_OK(Prescaler));
2091  041a 7b01          	ld	a,(OFST+1,sp)
2092  041c 2743          	jreq	L204
2093  041e a101          	cp	a,#1
2094  0420 273f          	jreq	L204
2095  0422 a102          	cp	a,#2
2096  0424 273b          	jreq	L204
2097  0426 a103          	cp	a,#3
2098  0428 2737          	jreq	L204
2099  042a a104          	cp	a,#4
2100  042c 2733          	jreq	L204
2101  042e a105          	cp	a,#5
2102  0430 272f          	jreq	L204
2103  0432 a106          	cp	a,#6
2104  0434 272b          	jreq	L204
2105  0436 a107          	cp	a,#7
2106  0438 2727          	jreq	L204
2107  043a a108          	cp	a,#8
2108  043c 2723          	jreq	L204
2109  043e a109          	cp	a,#9
2110  0440 271f          	jreq	L204
2111  0442 a10a          	cp	a,#10
2112  0444 271b          	jreq	L204
2113  0446 a10b          	cp	a,#11
2114  0448 2717          	jreq	L204
2115  044a a10c          	cp	a,#12
2116  044c 2713          	jreq	L204
2117  044e a10d          	cp	a,#13
2118  0450 270f          	jreq	L204
2119  0452 a10e          	cp	a,#14
2120  0454 270b          	jreq	L204
2121  0456 a10f          	cp	a,#15
2122  0458 2707          	jreq	L204
2123  045a ae01e9        	ldw	x,#489
2124  045d ad0c          	call	LC007
2125  045f 7b01          	ld	a,(OFST+1,sp)
2126  0461               L204:
2127                     ; 492   TIM2->PSCR = (uint8_t)Prescaler;
2129  0461 c7530e        	ld	21262,a
2130                     ; 495   TIM2->EGR = (uint8_t)TIM2_PSCReloadMode;
2132  0464 7b02          	ld	a,(OFST+2,sp)
2133  0466 c75306        	ld	21254,a
2134                     ; 496 }
2137  0469 85            	popw	x
2138  046a 81            	ret	
2139  046b               LC007:
2140  046b 89            	pushw	x
2141  046c 5f            	clrw	x
2142  046d 89            	pushw	x
2143  046e ae0000        	ldw	x,#L702
2144  0471 cd0000        	call	_assert_failed
2146  0474 5b04          	addw	sp,#4
2147  0476 81            	ret	
2206                     ; 507 void TIM2_ForcedOC1Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
2206                     ; 508 {
2207                     	switch	.text
2208  0477               _TIM2_ForcedOC1Config:
2210  0477 88            	push	a
2211       00000000      OFST:	set	0
2214                     ; 510   assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
2216  0478 a150          	cp	a,#80
2217  047a 2712          	jreq	L414
2218  047c a140          	cp	a,#64
2219  047e 270e          	jreq	L414
2220  0480 ae01fe        	ldw	x,#510
2221  0483 89            	pushw	x
2222  0484 5f            	clrw	x
2223  0485 89            	pushw	x
2224  0486 ae0000        	ldw	x,#L702
2225  0489 cd0000        	call	_assert_failed
2227  048c 5b04          	addw	sp,#4
2228  048e               L414:
2229                     ; 513   TIM2->CCMR1  =  (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM))  
2229                     ; 514                             | (uint8_t)TIM2_ForcedAction);
2231  048e c65307        	ld	a,21255
2232  0491 a48f          	and	a,#143
2233  0493 1a01          	or	a,(OFST+1,sp)
2234  0495 c75307        	ld	21255,a
2235                     ; 515 }
2238  0498 84            	pop	a
2239  0499 81            	ret	
2276                     ; 526 void TIM2_ForcedOC2Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
2276                     ; 527 {
2277                     	switch	.text
2278  049a               _TIM2_ForcedOC2Config:
2280  049a 88            	push	a
2281       00000000      OFST:	set	0
2284                     ; 529   assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
2286  049b a150          	cp	a,#80
2287  049d 2712          	jreq	L624
2288  049f a140          	cp	a,#64
2289  04a1 270e          	jreq	L624
2290  04a3 ae0211        	ldw	x,#529
2291  04a6 89            	pushw	x
2292  04a7 5f            	clrw	x
2293  04a8 89            	pushw	x
2294  04a9 ae0000        	ldw	x,#L702
2295  04ac cd0000        	call	_assert_failed
2297  04af 5b04          	addw	sp,#4
2298  04b1               L624:
2299                     ; 532   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM))  
2299                     ; 533                           | (uint8_t)TIM2_ForcedAction);
2301  04b1 c65308        	ld	a,21256
2302  04b4 a48f          	and	a,#143
2303  04b6 1a01          	or	a,(OFST+1,sp)
2304  04b8 c75308        	ld	21256,a
2305                     ; 534 }
2308  04bb 84            	pop	a
2309  04bc 81            	ret	
2346                     ; 545 void TIM2_ForcedOC3Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
2346                     ; 546 {
2347                     	switch	.text
2348  04bd               _TIM2_ForcedOC3Config:
2350  04bd 88            	push	a
2351       00000000      OFST:	set	0
2354                     ; 548   assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
2356  04be a150          	cp	a,#80
2357  04c0 2712          	jreq	L044
2358  04c2 a140          	cp	a,#64
2359  04c4 270e          	jreq	L044
2360  04c6 ae0224        	ldw	x,#548
2361  04c9 89            	pushw	x
2362  04ca 5f            	clrw	x
2363  04cb 89            	pushw	x
2364  04cc ae0000        	ldw	x,#L702
2365  04cf cd0000        	call	_assert_failed
2367  04d2 5b04          	addw	sp,#4
2368  04d4               L044:
2369                     ; 551   TIM2->CCMR3  =  (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM))
2369                     ; 552                             | (uint8_t)TIM2_ForcedAction);
2371  04d4 c65309        	ld	a,21257
2372  04d7 a48f          	and	a,#143
2373  04d9 1a01          	or	a,(OFST+1,sp)
2374  04db c75309        	ld	21257,a
2375                     ; 553 }
2378  04de 84            	pop	a
2379  04df 81            	ret	
2416                     ; 561 void TIM2_ARRPreloadConfig(FunctionalState NewState)
2416                     ; 562 {
2417                     	switch	.text
2418  04e0               _TIM2_ARRPreloadConfig:
2420  04e0 88            	push	a
2421       00000000      OFST:	set	0
2424                     ; 564   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2426  04e1 4d            	tnz	a
2427  04e2 2711          	jreq	L254
2428  04e4 4a            	dec	a
2429  04e5 270e          	jreq	L254
2430  04e7 ae0234        	ldw	x,#564
2431  04ea 89            	pushw	x
2432  04eb 5f            	clrw	x
2433  04ec 89            	pushw	x
2434  04ed ae0000        	ldw	x,#L702
2435  04f0 cd0000        	call	_assert_failed
2437  04f3 5b04          	addw	sp,#4
2438  04f5               L254:
2439                     ; 567   if (NewState != DISABLE)
2441  04f5 7b01          	ld	a,(OFST+1,sp)
2442  04f7 2706          	jreq	L1301
2443                     ; 569     TIM2->CR1 |= (uint8_t)TIM2_CR1_ARPE;
2445  04f9 721e5300      	bset	21248,#7
2447  04fd 2004          	jra	L3301
2448  04ff               L1301:
2449                     ; 573     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_ARPE);
2451  04ff 721f5300      	bres	21248,#7
2452  0503               L3301:
2453                     ; 575 }
2456  0503 84            	pop	a
2457  0504 81            	ret	
2494                     ; 583 void TIM2_OC1PreloadConfig(FunctionalState NewState)
2494                     ; 584 {
2495                     	switch	.text
2496  0505               _TIM2_OC1PreloadConfig:
2498  0505 88            	push	a
2499       00000000      OFST:	set	0
2502                     ; 586   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2504  0506 4d            	tnz	a
2505  0507 2711          	jreq	L464
2506  0509 4a            	dec	a
2507  050a 270e          	jreq	L464
2508  050c ae024a        	ldw	x,#586
2509  050f 89            	pushw	x
2510  0510 5f            	clrw	x
2511  0511 89            	pushw	x
2512  0512 ae0000        	ldw	x,#L702
2513  0515 cd0000        	call	_assert_failed
2515  0518 5b04          	addw	sp,#4
2516  051a               L464:
2517                     ; 589   if (NewState != DISABLE)
2519  051a 7b01          	ld	a,(OFST+1,sp)
2520  051c 2706          	jreq	L3501
2521                     ; 591     TIM2->CCMR1 |= (uint8_t)TIM2_CCMR_OCxPE;
2523  051e 72165307      	bset	21255,#3
2525  0522 2004          	jra	L5501
2526  0524               L3501:
2527                     ; 595     TIM2->CCMR1 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2529  0524 72175307      	bres	21255,#3
2530  0528               L5501:
2531                     ; 597 }
2534  0528 84            	pop	a
2535  0529 81            	ret	
2572                     ; 605 void TIM2_OC2PreloadConfig(FunctionalState NewState)
2572                     ; 606 {
2573                     	switch	.text
2574  052a               _TIM2_OC2PreloadConfig:
2576  052a 88            	push	a
2577       00000000      OFST:	set	0
2580                     ; 608   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2582  052b 4d            	tnz	a
2583  052c 2711          	jreq	L674
2584  052e 4a            	dec	a
2585  052f 270e          	jreq	L674
2586  0531 ae0260        	ldw	x,#608
2587  0534 89            	pushw	x
2588  0535 5f            	clrw	x
2589  0536 89            	pushw	x
2590  0537 ae0000        	ldw	x,#L702
2591  053a cd0000        	call	_assert_failed
2593  053d 5b04          	addw	sp,#4
2594  053f               L674:
2595                     ; 611   if (NewState != DISABLE)
2597  053f 7b01          	ld	a,(OFST+1,sp)
2598  0541 2706          	jreq	L5701
2599                     ; 613     TIM2->CCMR2 |= (uint8_t)TIM2_CCMR_OCxPE;
2601  0543 72165308      	bset	21256,#3
2603  0547 2004          	jra	L7701
2604  0549               L5701:
2605                     ; 617     TIM2->CCMR2 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2607  0549 72175308      	bres	21256,#3
2608  054d               L7701:
2609                     ; 619 }
2612  054d 84            	pop	a
2613  054e 81            	ret	
2650                     ; 627 void TIM2_OC3PreloadConfig(FunctionalState NewState)
2650                     ; 628 {
2651                     	switch	.text
2652  054f               _TIM2_OC3PreloadConfig:
2654  054f 88            	push	a
2655       00000000      OFST:	set	0
2658                     ; 630   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2660  0550 4d            	tnz	a
2661  0551 2711          	jreq	L015
2662  0553 4a            	dec	a
2663  0554 270e          	jreq	L015
2664  0556 ae0276        	ldw	x,#630
2665  0559 89            	pushw	x
2666  055a 5f            	clrw	x
2667  055b 89            	pushw	x
2668  055c ae0000        	ldw	x,#L702
2669  055f cd0000        	call	_assert_failed
2671  0562 5b04          	addw	sp,#4
2672  0564               L015:
2673                     ; 633   if (NewState != DISABLE)
2675  0564 7b01          	ld	a,(OFST+1,sp)
2676  0566 2706          	jreq	L7111
2677                     ; 635     TIM2->CCMR3 |= (uint8_t)TIM2_CCMR_OCxPE;
2679  0568 72165309      	bset	21257,#3
2681  056c 2004          	jra	L1211
2682  056e               L7111:
2683                     ; 639     TIM2->CCMR3 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2685  056e 72175309      	bres	21257,#3
2686  0572               L1211:
2687                     ; 641 }
2690  0572 84            	pop	a
2691  0573 81            	ret	
2765                     ; 653 void TIM2_GenerateEvent(TIM2_EventSource_TypeDef TIM2_EventSource)
2765                     ; 654 {
2766                     	switch	.text
2767  0574               _TIM2_GenerateEvent:
2769  0574 88            	push	a
2770       00000000      OFST:	set	0
2773                     ; 656   assert_param(IS_TIM2_EVENT_SOURCE_OK(TIM2_EventSource));
2775  0575 4d            	tnz	a
2776  0576 260e          	jrne	L025
2777  0578 ae0290        	ldw	x,#656
2778  057b 89            	pushw	x
2779  057c 5f            	clrw	x
2780  057d 89            	pushw	x
2781  057e ae0000        	ldw	x,#L702
2782  0581 cd0000        	call	_assert_failed
2784  0584 5b04          	addw	sp,#4
2785  0586               L025:
2786                     ; 659   TIM2->EGR = (uint8_t)TIM2_EventSource;
2788  0586 7b01          	ld	a,(OFST+1,sp)
2789  0588 c75306        	ld	21254,a
2790                     ; 660 }
2793  058b 84            	pop	a
2794  058c 81            	ret	
2831                     ; 670 void TIM2_OC1PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
2831                     ; 671 {
2832                     	switch	.text
2833  058d               _TIM2_OC1PolarityConfig:
2835  058d 88            	push	a
2836       00000000      OFST:	set	0
2839                     ; 673   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
2841  058e 4d            	tnz	a
2842  058f 2712          	jreq	L235
2843  0591 a122          	cp	a,#34
2844  0593 270e          	jreq	L235
2845  0595 ae02a1        	ldw	x,#673
2846  0598 89            	pushw	x
2847  0599 5f            	clrw	x
2848  059a 89            	pushw	x
2849  059b ae0000        	ldw	x,#L702
2850  059e cd0000        	call	_assert_failed
2852  05a1 5b04          	addw	sp,#4
2853  05a3               L235:
2854                     ; 676   if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
2856  05a3 7b01          	ld	a,(OFST+1,sp)
2857  05a5 2706          	jreq	L3711
2858                     ; 678     TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC1P;
2860  05a7 7212530a      	bset	21258,#1
2862  05ab 2004          	jra	L5711
2863  05ad               L3711:
2864                     ; 682     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1P);
2866  05ad 7213530a      	bres	21258,#1
2867  05b1               L5711:
2868                     ; 684 }
2871  05b1 84            	pop	a
2872  05b2 81            	ret	
2909                     ; 694 void TIM2_OC2PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
2909                     ; 695 {
2910                     	switch	.text
2911  05b3               _TIM2_OC2PolarityConfig:
2913  05b3 88            	push	a
2914       00000000      OFST:	set	0
2917                     ; 697   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
2919  05b4 4d            	tnz	a
2920  05b5 2712          	jreq	L445
2921  05b7 a122          	cp	a,#34
2922  05b9 270e          	jreq	L445
2923  05bb ae02b9        	ldw	x,#697
2924  05be 89            	pushw	x
2925  05bf 5f            	clrw	x
2926  05c0 89            	pushw	x
2927  05c1 ae0000        	ldw	x,#L702
2928  05c4 cd0000        	call	_assert_failed
2930  05c7 5b04          	addw	sp,#4
2931  05c9               L445:
2932                     ; 700   if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
2934  05c9 7b01          	ld	a,(OFST+1,sp)
2935  05cb 2706          	jreq	L5121
2936                     ; 702     TIM2->CCER1 |= TIM2_CCER1_CC2P;
2938  05cd 721a530a      	bset	21258,#5
2940  05d1 2004          	jra	L7121
2941  05d3               L5121:
2942                     ; 706     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2P);
2944  05d3 721b530a      	bres	21258,#5
2945  05d7               L7121:
2946                     ; 708 }
2949  05d7 84            	pop	a
2950  05d8 81            	ret	
2987                     ; 718 void TIM2_OC3PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
2987                     ; 719 {
2988                     	switch	.text
2989  05d9               _TIM2_OC3PolarityConfig:
2991  05d9 88            	push	a
2992       00000000      OFST:	set	0
2995                     ; 721   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
2997  05da 4d            	tnz	a
2998  05db 2712          	jreq	L655
2999  05dd a122          	cp	a,#34
3000  05df 270e          	jreq	L655
3001  05e1 ae02d1        	ldw	x,#721
3002  05e4 89            	pushw	x
3003  05e5 5f            	clrw	x
3004  05e6 89            	pushw	x
3005  05e7 ae0000        	ldw	x,#L702
3006  05ea cd0000        	call	_assert_failed
3008  05ed 5b04          	addw	sp,#4
3009  05ef               L655:
3010                     ; 724   if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
3012  05ef 7b01          	ld	a,(OFST+1,sp)
3013  05f1 2706          	jreq	L7321
3014                     ; 726     TIM2->CCER2 |= (uint8_t)TIM2_CCER2_CC3P;
3016  05f3 7212530b      	bset	21259,#1
3018  05f7 2004          	jra	L1421
3019  05f9               L7321:
3020                     ; 730     TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3P);
3022  05f9 7213530b      	bres	21259,#1
3023  05fd               L1421:
3024                     ; 732 }
3027  05fd 84            	pop	a
3028  05fe 81            	ret	
3074                     ; 745 void TIM2_CCxCmd(TIM2_Channel_TypeDef TIM2_Channel, FunctionalState NewState)
3074                     ; 746 {
3075                     	switch	.text
3076  05ff               _TIM2_CCxCmd:
3078  05ff 89            	pushw	x
3079       00000000      OFST:	set	0
3082                     ; 748   assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
3084  0600 9e            	ld	a,xh
3085  0601 4d            	tnz	a
3086  0602 270e          	jreq	L075
3087  0604 9e            	ld	a,xh
3088  0605 4a            	dec	a
3089  0606 270a          	jreq	L075
3090  0608 9e            	ld	a,xh
3091  0609 a102          	cp	a,#2
3092  060b 2705          	jreq	L075
3093  060d ae02ec        	ldw	x,#748
3094  0610 ad43          	call	LC008
3095  0612               L075:
3096                     ; 749   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
3098  0612 7b02          	ld	a,(OFST+2,sp)
3099  0614 2708          	jreq	L006
3100  0616 4a            	dec	a
3101  0617 2705          	jreq	L006
3102  0619 ae02ed        	ldw	x,#749
3103  061c ad37          	call	LC008
3104  061e               L006:
3105                     ; 751   if (TIM2_Channel == TIM2_CHANNEL_1)
3107  061e 7b01          	ld	a,(OFST+1,sp)
3108  0620 2610          	jrne	L5621
3109                     ; 754     if (NewState != DISABLE)
3111  0622 7b02          	ld	a,(OFST+2,sp)
3112  0624 2706          	jreq	L7621
3113                     ; 756       TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC1E;
3115  0626 7210530a      	bset	21258,#0
3117  062a 2027          	jra	L3721
3118  062c               L7621:
3119                     ; 760       TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
3121  062c 7211530a      	bres	21258,#0
3122  0630 2021          	jra	L3721
3123  0632               L5621:
3124                     ; 764   else if (TIM2_Channel == TIM2_CHANNEL_2)
3126  0632 4a            	dec	a
3127  0633 2610          	jrne	L5721
3128                     ; 767     if (NewState != DISABLE)
3130  0635 7b02          	ld	a,(OFST+2,sp)
3131  0637 2706          	jreq	L7721
3132                     ; 769       TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC2E;
3134  0639 7218530a      	bset	21258,#4
3136  063d 2014          	jra	L3721
3137  063f               L7721:
3138                     ; 773       TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
3140  063f 7219530a      	bres	21258,#4
3141  0643 200e          	jra	L3721
3142  0645               L5721:
3143                     ; 779     if (NewState != DISABLE)
3145  0645 7b02          	ld	a,(OFST+2,sp)
3146  0647 2706          	jreq	L5031
3147                     ; 781       TIM2->CCER2 |= (uint8_t)TIM2_CCER2_CC3E;
3149  0649 7210530b      	bset	21259,#0
3151  064d 2004          	jra	L3721
3152  064f               L5031:
3153                     ; 785       TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3E);
3155  064f 7211530b      	bres	21259,#0
3156  0653               L3721:
3157                     ; 788 }
3160  0653 85            	popw	x
3161  0654 81            	ret	
3162  0655               LC008:
3163  0655 89            	pushw	x
3164  0656 5f            	clrw	x
3165  0657 89            	pushw	x
3166  0658 ae0000        	ldw	x,#L702
3167  065b cd0000        	call	_assert_failed
3169  065e 5b04          	addw	sp,#4
3170  0660 81            	ret	
3216                     ; 810 void TIM2_SelectOCxM(TIM2_Channel_TypeDef TIM2_Channel, TIM2_OCMode_TypeDef TIM2_OCMode)
3216                     ; 811 {
3217                     	switch	.text
3218  0661               _TIM2_SelectOCxM:
3220  0661 89            	pushw	x
3221       00000000      OFST:	set	0
3224                     ; 813   assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
3226  0662 9e            	ld	a,xh
3227  0663 4d            	tnz	a
3228  0664 270e          	jreq	L216
3229  0666 9e            	ld	a,xh
3230  0667 4a            	dec	a
3231  0668 270a          	jreq	L216
3232  066a 9e            	ld	a,xh
3233  066b a102          	cp	a,#2
3234  066d 2705          	jreq	L216
3235  066f ae032d        	ldw	x,#813
3236  0672 ad5c          	call	LC009
3237  0674               L216:
3238                     ; 814   assert_param(IS_TIM2_OCM_OK(TIM2_OCMode));
3240  0674 7b02          	ld	a,(OFST+2,sp)
3241  0676 2721          	jreq	L226
3242  0678 a110          	cp	a,#16
3243  067a 271d          	jreq	L226
3244  067c a120          	cp	a,#32
3245  067e 2719          	jreq	L226
3246  0680 a130          	cp	a,#48
3247  0682 2715          	jreq	L226
3248  0684 a160          	cp	a,#96
3249  0686 2711          	jreq	L226
3250  0688 a170          	cp	a,#112
3251  068a 270d          	jreq	L226
3252  068c a150          	cp	a,#80
3253  068e 2709          	jreq	L226
3254  0690 a140          	cp	a,#64
3255  0692 2705          	jreq	L226
3256  0694 ae032e        	ldw	x,#814
3257  0697 ad37          	call	LC009
3258  0699               L226:
3259                     ; 816   if (TIM2_Channel == TIM2_CHANNEL_1)
3261  0699 7b01          	ld	a,(OFST+1,sp)
3262  069b 2610          	jrne	L3331
3263                     ; 819     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
3265  069d 7211530a      	bres	21258,#0
3266                     ; 822     TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM))
3266                     ; 823                             | (uint8_t)TIM2_OCMode);
3268  06a1 c65307        	ld	a,21255
3269  06a4 a48f          	and	a,#143
3270  06a6 1a02          	or	a,(OFST+2,sp)
3271  06a8 c75307        	ld	21255,a
3273  06ab 2021          	jra	L5331
3274  06ad               L3331:
3275                     ; 825   else if (TIM2_Channel == TIM2_CHANNEL_2)
3277  06ad 4a            	dec	a
3278  06ae 2610          	jrne	L7331
3279                     ; 828     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
3281  06b0 7219530a      	bres	21258,#4
3282                     ; 831     TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM))
3282                     ; 832                             | (uint8_t)TIM2_OCMode);
3284  06b4 c65308        	ld	a,21256
3285  06b7 a48f          	and	a,#143
3286  06b9 1a02          	or	a,(OFST+2,sp)
3287  06bb c75308        	ld	21256,a
3289  06be 200e          	jra	L5331
3290  06c0               L7331:
3291                     ; 837     TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3E);
3293  06c0 7211530b      	bres	21259,#0
3294                     ; 840     TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM))
3294                     ; 841                             | (uint8_t)TIM2_OCMode);
3296  06c4 c65309        	ld	a,21257
3297  06c7 a48f          	and	a,#143
3298  06c9 1a02          	or	a,(OFST+2,sp)
3299  06cb c75309        	ld	21257,a
3300  06ce               L5331:
3301                     ; 843 }
3304  06ce 85            	popw	x
3305  06cf 81            	ret	
3306  06d0               LC009:
3307  06d0 89            	pushw	x
3308  06d1 5f            	clrw	x
3309  06d2 89            	pushw	x
3310  06d3 ae0000        	ldw	x,#L702
3311  06d6 cd0000        	call	_assert_failed
3313  06d9 5b04          	addw	sp,#4
3314  06db 81            	ret	
3348                     ; 851 void TIM2_SetCounter(uint16_t Counter)
3348                     ; 852 {
3349                     	switch	.text
3350  06dc               _TIM2_SetCounter:
3354                     ; 854   TIM2->CNTRH = (uint8_t)(Counter >> 8);
3356  06dc 9e            	ld	a,xh
3357  06dd c7530c        	ld	21260,a
3358                     ; 855   TIM2->CNTRL = (uint8_t)(Counter);
3360  06e0 9f            	ld	a,xl
3361  06e1 c7530d        	ld	21261,a
3362                     ; 856 }
3365  06e4 81            	ret	
3399                     ; 864 void TIM2_SetAutoreload(uint16_t Autoreload)
3399                     ; 865 {
3400                     	switch	.text
3401  06e5               _TIM2_SetAutoreload:
3405                     ; 867   TIM2->ARRH = (uint8_t)(Autoreload >> 8);
3407  06e5 9e            	ld	a,xh
3408  06e6 c7530f        	ld	21263,a
3409                     ; 868   TIM2->ARRL = (uint8_t)(Autoreload);
3411  06e9 9f            	ld	a,xl
3412  06ea c75310        	ld	21264,a
3413                     ; 869 }
3416  06ed 81            	ret	
3450                     ; 877 void TIM2_SetCompare1(uint16_t Compare1)
3450                     ; 878 {
3451                     	switch	.text
3452  06ee               _TIM2_SetCompare1:
3456                     ; 880   TIM2->CCR1H = (uint8_t)(Compare1 >> 8);
3458  06ee 9e            	ld	a,xh
3459  06ef c75311        	ld	21265,a
3460                     ; 881   TIM2->CCR1L = (uint8_t)(Compare1);
3462  06f2 9f            	ld	a,xl
3463  06f3 c75312        	ld	21266,a
3464                     ; 882 }
3467  06f6 81            	ret	
3501                     ; 890 void TIM2_SetCompare2(uint16_t Compare2)
3501                     ; 891 {
3502                     	switch	.text
3503  06f7               _TIM2_SetCompare2:
3507                     ; 893   TIM2->CCR2H = (uint8_t)(Compare2 >> 8);
3509  06f7 9e            	ld	a,xh
3510  06f8 c75313        	ld	21267,a
3511                     ; 894   TIM2->CCR2L = (uint8_t)(Compare2);
3513  06fb 9f            	ld	a,xl
3514  06fc c75314        	ld	21268,a
3515                     ; 895 }
3518  06ff 81            	ret	
3552                     ; 903 void TIM2_SetCompare3(uint16_t Compare3)
3552                     ; 904 {
3553                     	switch	.text
3554  0700               _TIM2_SetCompare3:
3558                     ; 906   TIM2->CCR3H = (uint8_t)(Compare3 >> 8);
3560  0700 9e            	ld	a,xh
3561  0701 c75315        	ld	21269,a
3562                     ; 907   TIM2->CCR3L = (uint8_t)(Compare3);
3564  0704 9f            	ld	a,xl
3565  0705 c75316        	ld	21270,a
3566                     ; 908 }
3569  0708 81            	ret	
3606                     ; 920 void TIM2_SetIC1Prescaler(TIM2_ICPSC_TypeDef TIM2_IC1Prescaler)
3606                     ; 921 {
3607                     	switch	.text
3608  0709               _TIM2_SetIC1Prescaler:
3610  0709 88            	push	a
3611       00000000      OFST:	set	0
3614                     ; 923   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC1Prescaler));
3616  070a 4d            	tnz	a
3617  070b 271a          	jreq	L646
3618  070d a104          	cp	a,#4
3619  070f 2716          	jreq	L646
3620  0711 a108          	cp	a,#8
3621  0713 2712          	jreq	L646
3622  0715 a10c          	cp	a,#12
3623  0717 270e          	jreq	L646
3624  0719 ae039b        	ldw	x,#923
3625  071c 89            	pushw	x
3626  071d 5f            	clrw	x
3627  071e 89            	pushw	x
3628  071f ae0000        	ldw	x,#L702
3629  0722 cd0000        	call	_assert_failed
3631  0725 5b04          	addw	sp,#4
3632  0727               L646:
3633                     ; 926   TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_ICxPSC))
3633                     ; 927                           | (uint8_t)TIM2_IC1Prescaler);
3635  0727 c65307        	ld	a,21255
3636  072a a4f3          	and	a,#243
3637  072c 1a01          	or	a,(OFST+1,sp)
3638  072e c75307        	ld	21255,a
3639                     ; 928 }
3642  0731 84            	pop	a
3643  0732 81            	ret	
3680                     ; 940 void TIM2_SetIC2Prescaler(TIM2_ICPSC_TypeDef TIM2_IC2Prescaler)
3680                     ; 941 {
3681                     	switch	.text
3682  0733               _TIM2_SetIC2Prescaler:
3684  0733 88            	push	a
3685       00000000      OFST:	set	0
3688                     ; 943   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC2Prescaler));
3690  0734 4d            	tnz	a
3691  0735 271a          	jreq	L066
3692  0737 a104          	cp	a,#4
3693  0739 2716          	jreq	L066
3694  073b a108          	cp	a,#8
3695  073d 2712          	jreq	L066
3696  073f a10c          	cp	a,#12
3697  0741 270e          	jreq	L066
3698  0743 ae03af        	ldw	x,#943
3699  0746 89            	pushw	x
3700  0747 5f            	clrw	x
3701  0748 89            	pushw	x
3702  0749 ae0000        	ldw	x,#L702
3703  074c cd0000        	call	_assert_failed
3705  074f 5b04          	addw	sp,#4
3706  0751               L066:
3707                     ; 946   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_ICxPSC))
3707                     ; 947                           | (uint8_t)TIM2_IC2Prescaler);
3709  0751 c65308        	ld	a,21256
3710  0754 a4f3          	and	a,#243
3711  0756 1a01          	or	a,(OFST+1,sp)
3712  0758 c75308        	ld	21256,a
3713                     ; 948 }
3716  075b 84            	pop	a
3717  075c 81            	ret	
3754                     ; 960 void TIM2_SetIC3Prescaler(TIM2_ICPSC_TypeDef TIM2_IC3Prescaler)
3754                     ; 961 {
3755                     	switch	.text
3756  075d               _TIM2_SetIC3Prescaler:
3758  075d 88            	push	a
3759       00000000      OFST:	set	0
3762                     ; 964   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC3Prescaler));
3764  075e 4d            	tnz	a
3765  075f 271a          	jreq	L276
3766  0761 a104          	cp	a,#4
3767  0763 2716          	jreq	L276
3768  0765 a108          	cp	a,#8
3769  0767 2712          	jreq	L276
3770  0769 a10c          	cp	a,#12
3771  076b 270e          	jreq	L276
3772  076d ae03c4        	ldw	x,#964
3773  0770 89            	pushw	x
3774  0771 5f            	clrw	x
3775  0772 89            	pushw	x
3776  0773 ae0000        	ldw	x,#L702
3777  0776 cd0000        	call	_assert_failed
3779  0779 5b04          	addw	sp,#4
3780  077b               L276:
3781                     ; 966   TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_ICxPSC))
3781                     ; 967                           | (uint8_t)TIM2_IC3Prescaler);
3783  077b c65309        	ld	a,21257
3784  077e a4f3          	and	a,#243
3785  0780 1a01          	or	a,(OFST+1,sp)
3786  0782 c75309        	ld	21257,a
3787                     ; 968 }
3790  0785 84            	pop	a
3791  0786 81            	ret	
3843                     ; 975 uint16_t TIM2_GetCapture1(void)
3843                     ; 976 {
3844                     	switch	.text
3845  0787               _TIM2_GetCapture1:
3847  0787 5204          	subw	sp,#4
3848       00000004      OFST:	set	4
3851                     ; 978   uint16_t tmpccr1 = 0;
3853                     ; 979   uint8_t tmpccr1l=0, tmpccr1h=0;
3857                     ; 981   tmpccr1h = TIM2->CCR1H;
3859  0789 c65311        	ld	a,21265
3860  078c 6b02          	ld	(OFST-2,sp),a
3862                     ; 982   tmpccr1l = TIM2->CCR1L;
3864  078e c65312        	ld	a,21266
3865  0791 6b01          	ld	(OFST-3,sp),a
3867                     ; 984   tmpccr1 = (uint16_t)(tmpccr1l);
3869  0793 5f            	clrw	x
3870  0794 97            	ld	xl,a
3871  0795 1f03          	ldw	(OFST-1,sp),x
3873                     ; 985   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
3875  0797 5f            	clrw	x
3876  0798 7b02          	ld	a,(OFST-2,sp)
3877  079a 97            	ld	xl,a
3878  079b 7b04          	ld	a,(OFST+0,sp)
3879  079d 01            	rrwa	x,a
3880  079e 1a03          	or	a,(OFST-1,sp)
3881  07a0 01            	rrwa	x,a
3883                     ; 987   return (uint16_t)tmpccr1;
3887  07a1 5b04          	addw	sp,#4
3888  07a3 81            	ret	
3940                     ; 995 uint16_t TIM2_GetCapture2(void)
3940                     ; 996 {
3941                     	switch	.text
3942  07a4               _TIM2_GetCapture2:
3944  07a4 5204          	subw	sp,#4
3945       00000004      OFST:	set	4
3948                     ; 998   uint16_t tmpccr2 = 0;
3950                     ; 999   uint8_t tmpccr2l=0, tmpccr2h=0;
3954                     ; 1001   tmpccr2h = TIM2->CCR2H;
3956  07a6 c65313        	ld	a,21267
3957  07a9 6b02          	ld	(OFST-2,sp),a
3959                     ; 1002   tmpccr2l = TIM2->CCR2L;
3961  07ab c65314        	ld	a,21268
3962  07ae 6b01          	ld	(OFST-3,sp),a
3964                     ; 1004   tmpccr2 = (uint16_t)(tmpccr2l);
3966  07b0 5f            	clrw	x
3967  07b1 97            	ld	xl,a
3968  07b2 1f03          	ldw	(OFST-1,sp),x
3970                     ; 1005   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
3972  07b4 5f            	clrw	x
3973  07b5 7b02          	ld	a,(OFST-2,sp)
3974  07b7 97            	ld	xl,a
3975  07b8 7b04          	ld	a,(OFST+0,sp)
3976  07ba 01            	rrwa	x,a
3977  07bb 1a03          	or	a,(OFST-1,sp)
3978  07bd 01            	rrwa	x,a
3980                     ; 1007   return (uint16_t)tmpccr2;
3984  07be 5b04          	addw	sp,#4
3985  07c0 81            	ret	
4037                     ; 1015 uint16_t TIM2_GetCapture3(void)
4037                     ; 1016 {
4038                     	switch	.text
4039  07c1               _TIM2_GetCapture3:
4041  07c1 5204          	subw	sp,#4
4042       00000004      OFST:	set	4
4045                     ; 1018   uint16_t tmpccr3 = 0;
4047                     ; 1019   uint8_t tmpccr3l=0, tmpccr3h=0;
4051                     ; 1021   tmpccr3h = TIM2->CCR3H;
4053  07c3 c65315        	ld	a,21269
4054  07c6 6b02          	ld	(OFST-2,sp),a
4056                     ; 1022   tmpccr3l = TIM2->CCR3L;
4058  07c8 c65316        	ld	a,21270
4059  07cb 6b01          	ld	(OFST-3,sp),a
4061                     ; 1024   tmpccr3 = (uint16_t)(tmpccr3l);
4063  07cd 5f            	clrw	x
4064  07ce 97            	ld	xl,a
4065  07cf 1f03          	ldw	(OFST-1,sp),x
4067                     ; 1025   tmpccr3 |= (uint16_t)((uint16_t)tmpccr3h << 8);
4069  07d1 5f            	clrw	x
4070  07d2 7b02          	ld	a,(OFST-2,sp)
4071  07d4 97            	ld	xl,a
4072  07d5 7b04          	ld	a,(OFST+0,sp)
4073  07d7 01            	rrwa	x,a
4074  07d8 1a03          	or	a,(OFST-1,sp)
4075  07da 01            	rrwa	x,a
4077                     ; 1027   return (uint16_t)tmpccr3;
4081  07db 5b04          	addw	sp,#4
4082  07dd 81            	ret	
4116                     ; 1035 uint16_t TIM2_GetCounter(void)
4116                     ; 1036 {
4117                     	switch	.text
4118  07de               _TIM2_GetCounter:
4120  07de 89            	pushw	x
4121       00000002      OFST:	set	2
4124                     ; 1037   uint16_t tmpcntr = 0;
4126                     ; 1039   tmpcntr =  ((uint16_t)TIM2->CNTRH << 8);
4128  07df c6530c        	ld	a,21260
4129  07e2 97            	ld	xl,a
4130  07e3 4f            	clr	a
4131  07e4 02            	rlwa	x,a
4132  07e5 1f01          	ldw	(OFST-1,sp),x
4134                     ; 1041   return (uint16_t)( tmpcntr| (uint16_t)(TIM2->CNTRL));
4136  07e7 c6530d        	ld	a,21261
4137  07ea 5f            	clrw	x
4138  07eb 97            	ld	xl,a
4139  07ec 01            	rrwa	x,a
4140  07ed 1a02          	or	a,(OFST+0,sp)
4141  07ef 01            	rrwa	x,a
4142  07f0 1a01          	or	a,(OFST-1,sp)
4143  07f2 01            	rrwa	x,a
4146  07f3 5b02          	addw	sp,#2
4147  07f5 81            	ret	
4171                     ; 1049 TIM2_Prescaler_TypeDef TIM2_GetPrescaler(void)
4171                     ; 1050 {
4172                     	switch	.text
4173  07f6               _TIM2_GetPrescaler:
4177                     ; 1052   return (TIM2_Prescaler_TypeDef)(TIM2->PSCR);
4179  07f6 c6530e        	ld	a,21262
4182  07f9 81            	ret	
4322                     ; 1068 FlagStatus TIM2_GetFlagStatus(TIM2_FLAG_TypeDef TIM2_FLAG)
4322                     ; 1069 {
4323                     	switch	.text
4324  07fa               _TIM2_GetFlagStatus:
4326  07fa 89            	pushw	x
4327  07fb 89            	pushw	x
4328       00000002      OFST:	set	2
4331                     ; 1070   FlagStatus bitstatus = RESET;
4333                     ; 1071   uint8_t tim2_flag_l = 0, tim2_flag_h = 0;
4337                     ; 1074   assert_param(IS_TIM2_GET_FLAG_OK(TIM2_FLAG));
4339  07fc a30001        	cpw	x,#1
4340  07ff 272c          	jreq	L617
4341  0801 a30002        	cpw	x,#2
4342  0804 2727          	jreq	L617
4343  0806 a30004        	cpw	x,#4
4344  0809 2722          	jreq	L617
4345  080b a30008        	cpw	x,#8
4346  080e 271d          	jreq	L617
4347  0810 a30200        	cpw	x,#512
4348  0813 2718          	jreq	L617
4349  0815 a30400        	cpw	x,#1024
4350  0818 2713          	jreq	L617
4351  081a a30800        	cpw	x,#2048
4352  081d 270e          	jreq	L617
4353  081f ae0432        	ldw	x,#1074
4354  0822 89            	pushw	x
4355  0823 5f            	clrw	x
4356  0824 89            	pushw	x
4357  0825 ae0000        	ldw	x,#L702
4358  0828 cd0000        	call	_assert_failed
4360  082b 5b04          	addw	sp,#4
4361  082d               L617:
4362                     ; 1076   tim2_flag_l = (uint8_t)(TIM2->SR1 & (uint8_t)TIM2_FLAG);
4364  082d c65304        	ld	a,21252
4365  0830 1404          	and	a,(OFST+2,sp)
4366  0832 6b01          	ld	(OFST-1,sp),a
4368                     ; 1077   tim2_flag_h = (uint8_t)((uint16_t)TIM2_FLAG >> 8);
4370  0834 7b03          	ld	a,(OFST+1,sp)
4371  0836 6b02          	ld	(OFST+0,sp),a
4373                     ; 1079   if ((tim2_flag_l | (uint8_t)(TIM2->SR2 & tim2_flag_h)) != (uint8_t)RESET )
4375  0838 c45305        	and	a,21253
4376  083b 1a01          	or	a,(OFST-1,sp)
4377  083d 2702          	jreq	L7371
4378                     ; 1081     bitstatus = SET;
4380  083f a601          	ld	a,#1
4383  0841               L7371:
4384                     ; 1085     bitstatus = RESET;
4387                     ; 1087   return (FlagStatus)bitstatus;
4391  0841 5b04          	addw	sp,#4
4392  0843 81            	ret	
4428                     ; 1103 void TIM2_ClearFlag(TIM2_FLAG_TypeDef TIM2_FLAG)
4428                     ; 1104 {
4429                     	switch	.text
4430  0844               _TIM2_ClearFlag:
4432  0844 89            	pushw	x
4433       00000000      OFST:	set	0
4436                     ; 1106   assert_param(IS_TIM2_CLEAR_FLAG_OK(TIM2_FLAG));
4438  0845 01            	rrwa	x,a
4439  0846 a4f0          	and	a,#240
4440  0848 01            	rrwa	x,a
4441  0849 a4f1          	and	a,#241
4442  084b 01            	rrwa	x,a
4443  084c 5d            	tnzw	x
4444  084d 2604          	jrne	L427
4445  084f 1e01          	ldw	x,(OFST+1,sp)
4446  0851 260e          	jrne	L627
4447  0853               L427:
4448  0853 ae0452        	ldw	x,#1106
4449  0856 89            	pushw	x
4450  0857 5f            	clrw	x
4451  0858 89            	pushw	x
4452  0859 ae0000        	ldw	x,#L702
4453  085c cd0000        	call	_assert_failed
4455  085f 5b04          	addw	sp,#4
4456  0861               L627:
4457                     ; 1109   TIM2->SR1 = (uint8_t)(~((uint8_t)(TIM2_FLAG)));
4459  0861 7b02          	ld	a,(OFST+2,sp)
4460  0863 43            	cpl	a
4461  0864 c75304        	ld	21252,a
4462                     ; 1110   TIM2->SR2 = (uint8_t)(~((uint8_t)((uint8_t)TIM2_FLAG >> 8)));
4464  0867 35ff5305      	mov	21253,#255
4465                     ; 1111 }
4468  086b 85            	popw	x
4469  086c 81            	ret	
4534                     ; 1123 ITStatus TIM2_GetITStatus(TIM2_IT_TypeDef TIM2_IT)
4534                     ; 1124 {
4535                     	switch	.text
4536  086d               _TIM2_GetITStatus:
4538  086d 88            	push	a
4539  086e 89            	pushw	x
4540       00000002      OFST:	set	2
4543                     ; 1125   ITStatus bitstatus = RESET;
4545                     ; 1126   uint8_t TIM2_itStatus = 0, TIM2_itEnable = 0;
4549                     ; 1129   assert_param(IS_TIM2_GET_IT_OK(TIM2_IT));
4551  086f a101          	cp	a,#1
4552  0871 271a          	jreq	L047
4553  0873 a102          	cp	a,#2
4554  0875 2716          	jreq	L047
4555  0877 a104          	cp	a,#4
4556  0879 2712          	jreq	L047
4557  087b a108          	cp	a,#8
4558  087d 270e          	jreq	L047
4559  087f ae0469        	ldw	x,#1129
4560  0882 89            	pushw	x
4561  0883 5f            	clrw	x
4562  0884 89            	pushw	x
4563  0885 ae0000        	ldw	x,#L702
4564  0888 cd0000        	call	_assert_failed
4566  088b 5b04          	addw	sp,#4
4567  088d               L047:
4568                     ; 1131   TIM2_itStatus = (uint8_t)(TIM2->SR1 & TIM2_IT);
4570  088d c65304        	ld	a,21252
4571  0890 1403          	and	a,(OFST+1,sp)
4572  0892 6b01          	ld	(OFST-1,sp),a
4574                     ; 1133   TIM2_itEnable = (uint8_t)(TIM2->IER & TIM2_IT);
4576  0894 c65303        	ld	a,21251
4577  0897 1403          	and	a,(OFST+1,sp)
4578  0899 6b02          	ld	(OFST+0,sp),a
4580                     ; 1135   if ((TIM2_itStatus != (uint8_t)RESET ) && (TIM2_itEnable != (uint8_t)RESET ))
4582  089b 7b01          	ld	a,(OFST-1,sp)
4583  089d 2708          	jreq	L3102
4585  089f 7b02          	ld	a,(OFST+0,sp)
4586  08a1 2704          	jreq	L3102
4587                     ; 1137     bitstatus = SET;
4589  08a3 a601          	ld	a,#1
4592  08a5 2001          	jra	L5102
4593  08a7               L3102:
4594                     ; 1141     bitstatus = RESET;
4596  08a7 4f            	clr	a
4598  08a8               L5102:
4599                     ; 1143   return (ITStatus)(bitstatus);
4603  08a8 5b03          	addw	sp,#3
4604  08aa 81            	ret	
4641                     ; 1156 void TIM2_ClearITPendingBit(TIM2_IT_TypeDef TIM2_IT)
4641                     ; 1157 {
4642                     	switch	.text
4643  08ab               _TIM2_ClearITPendingBit:
4645  08ab 88            	push	a
4646       00000000      OFST:	set	0
4649                     ; 1159   assert_param(IS_TIM2_IT_OK(TIM2_IT));
4651  08ac 4d            	tnz	a
4652  08ad 2704          	jreq	L647
4653  08af a110          	cp	a,#16
4654  08b1 250e          	jrult	L057
4655  08b3               L647:
4656  08b3 ae0487        	ldw	x,#1159
4657  08b6 89            	pushw	x
4658  08b7 5f            	clrw	x
4659  08b8 89            	pushw	x
4660  08b9 ae0000        	ldw	x,#L702
4661  08bc cd0000        	call	_assert_failed
4663  08bf 5b04          	addw	sp,#4
4664  08c1               L057:
4665                     ; 1162   TIM2->SR1 = (uint8_t)(~TIM2_IT);
4667  08c1 7b01          	ld	a,(OFST+1,sp)
4668  08c3 43            	cpl	a
4669  08c4 c75304        	ld	21252,a
4670                     ; 1163 }
4673  08c7 84            	pop	a
4674  08c8 81            	ret	
4726                     ; 1181 static void TI1_Config(uint8_t TIM2_ICPolarity,
4726                     ; 1182                        uint8_t TIM2_ICSelection,
4726                     ; 1183                        uint8_t TIM2_ICFilter)
4726                     ; 1184 {
4727                     	switch	.text
4728  08c9               L3_TI1_Config:
4730  08c9 89            	pushw	x
4731  08ca 88            	push	a
4732       00000001      OFST:	set	1
4735                     ; 1186   TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
4737  08cb 7211530a      	bres	21258,#0
4738                     ; 1189   TIM2->CCMR1  = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~(uint8_t)( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF )))
4738                     ; 1190                            | (uint8_t)(((TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
4740  08cf 7b06          	ld	a,(OFST+5,sp)
4741  08d1 97            	ld	xl,a
4742  08d2 a610          	ld	a,#16
4743  08d4 42            	mul	x,a
4744  08d5 9f            	ld	a,xl
4745  08d6 1a03          	or	a,(OFST+2,sp)
4746  08d8 6b01          	ld	(OFST+0,sp),a
4748  08da c65307        	ld	a,21255
4749  08dd a40c          	and	a,#12
4750  08df 1a01          	or	a,(OFST+0,sp)
4751  08e1 c75307        	ld	21255,a
4752                     ; 1193   if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
4754  08e4 7b02          	ld	a,(OFST+1,sp)
4755  08e6 2706          	jreq	L3602
4756                     ; 1195     TIM2->CCER1 |= TIM2_CCER1_CC1P;
4758  08e8 7212530a      	bset	21258,#1
4760  08ec 2004          	jra	L5602
4761  08ee               L3602:
4762                     ; 1199     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1P);
4764  08ee 7213530a      	bres	21258,#1
4765  08f2               L5602:
4766                     ; 1202   TIM2->CCER1 |= TIM2_CCER1_CC1E;
4768  08f2 7210530a      	bset	21258,#0
4769                     ; 1203 }
4772  08f6 5b03          	addw	sp,#3
4773  08f8 81            	ret	
4825                     ; 1221 static void TI2_Config(uint8_t TIM2_ICPolarity,
4825                     ; 1222                        uint8_t TIM2_ICSelection,
4825                     ; 1223                        uint8_t TIM2_ICFilter)
4825                     ; 1224 {
4826                     	switch	.text
4827  08f9               L5_TI2_Config:
4829  08f9 89            	pushw	x
4830  08fa 88            	push	a
4831       00000001      OFST:	set	1
4834                     ; 1226   TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
4836  08fb 7219530a      	bres	21258,#4
4837                     ; 1229   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~(uint8_t)( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF ))) 
4837                     ; 1230                           | (uint8_t)(( (TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
4839  08ff 7b06          	ld	a,(OFST+5,sp)
4840  0901 97            	ld	xl,a
4841  0902 a610          	ld	a,#16
4842  0904 42            	mul	x,a
4843  0905 9f            	ld	a,xl
4844  0906 1a03          	or	a,(OFST+2,sp)
4845  0908 6b01          	ld	(OFST+0,sp),a
4847  090a c65308        	ld	a,21256
4848  090d a40c          	and	a,#12
4849  090f 1a01          	or	a,(OFST+0,sp)
4850  0911 c75308        	ld	21256,a
4851                     ; 1234   if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
4853  0914 7b02          	ld	a,(OFST+1,sp)
4854  0916 2706          	jreq	L5112
4855                     ; 1236     TIM2->CCER1 |= TIM2_CCER1_CC2P;
4857  0918 721a530a      	bset	21258,#5
4859  091c 2004          	jra	L7112
4860  091e               L5112:
4861                     ; 1240     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2P);
4863  091e 721b530a      	bres	21258,#5
4864  0922               L7112:
4865                     ; 1244   TIM2->CCER1 |= TIM2_CCER1_CC2E;
4867  0922 7218530a      	bset	21258,#4
4868                     ; 1245 }
4871  0926 5b03          	addw	sp,#3
4872  0928 81            	ret	
4924                     ; 1261 static void TI3_Config(uint8_t TIM2_ICPolarity, uint8_t TIM2_ICSelection,
4924                     ; 1262                        uint8_t TIM2_ICFilter)
4924                     ; 1263 {
4925                     	switch	.text
4926  0929               L7_TI3_Config:
4928  0929 89            	pushw	x
4929  092a 88            	push	a
4930       00000001      OFST:	set	1
4933                     ; 1265   TIM2->CCER2 &=  (uint8_t)(~TIM2_CCER2_CC3E);
4935  092b 7211530b      	bres	21259,#0
4936                     ; 1268   TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF))) 
4936                     ; 1269                           | (uint8_t)(( (TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
4938  092f 7b06          	ld	a,(OFST+5,sp)
4939  0931 97            	ld	xl,a
4940  0932 a610          	ld	a,#16
4941  0934 42            	mul	x,a
4942  0935 9f            	ld	a,xl
4943  0936 1a03          	or	a,(OFST+2,sp)
4944  0938 6b01          	ld	(OFST+0,sp),a
4946  093a c65309        	ld	a,21257
4947  093d a40c          	and	a,#12
4948  093f 1a01          	or	a,(OFST+0,sp)
4949  0941 c75309        	ld	21257,a
4950                     ; 1273   if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
4952  0944 7b02          	ld	a,(OFST+1,sp)
4953  0946 2706          	jreq	L7412
4954                     ; 1275     TIM2->CCER2 |= TIM2_CCER2_CC3P;
4956  0948 7212530b      	bset	21259,#1
4958  094c 2004          	jra	L1512
4959  094e               L7412:
4960                     ; 1279     TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3P);
4962  094e 7213530b      	bres	21259,#1
4963  0952               L1512:
4964                     ; 1282   TIM2->CCER2 |= TIM2_CCER2_CC3E;
4966  0952 7210530b      	bset	21259,#0
4967                     ; 1283 }
4970  0956 5b03          	addw	sp,#3
4971  0958 81            	ret	
4984                     	xdef	_TIM2_ClearITPendingBit
4985                     	xdef	_TIM2_GetITStatus
4986                     	xdef	_TIM2_ClearFlag
4987                     	xdef	_TIM2_GetFlagStatus
4988                     	xdef	_TIM2_GetPrescaler
4989                     	xdef	_TIM2_GetCounter
4990                     	xdef	_TIM2_GetCapture3
4991                     	xdef	_TIM2_GetCapture2
4992                     	xdef	_TIM2_GetCapture1
4993                     	xdef	_TIM2_SetIC3Prescaler
4994                     	xdef	_TIM2_SetIC2Prescaler
4995                     	xdef	_TIM2_SetIC1Prescaler
4996                     	xdef	_TIM2_SetCompare3
4997                     	xdef	_TIM2_SetCompare2
4998                     	xdef	_TIM2_SetCompare1
4999                     	xdef	_TIM2_SetAutoreload
5000                     	xdef	_TIM2_SetCounter
5001                     	xdef	_TIM2_SelectOCxM
5002                     	xdef	_TIM2_CCxCmd
5003                     	xdef	_TIM2_OC3PolarityConfig
5004                     	xdef	_TIM2_OC2PolarityConfig
5005                     	xdef	_TIM2_OC1PolarityConfig
5006                     	xdef	_TIM2_GenerateEvent
5007                     	xdef	_TIM2_OC3PreloadConfig
5008                     	xdef	_TIM2_OC2PreloadConfig
5009                     	xdef	_TIM2_OC1PreloadConfig
5010                     	xdef	_TIM2_ARRPreloadConfig
5011                     	xdef	_TIM2_ForcedOC3Config
5012                     	xdef	_TIM2_ForcedOC2Config
5013                     	xdef	_TIM2_ForcedOC1Config
5014                     	xdef	_TIM2_PrescalerConfig
5015                     	xdef	_TIM2_SelectOnePulseMode
5016                     	xdef	_TIM2_UpdateRequestConfig
5017                     	xdef	_TIM2_UpdateDisableConfig
5018                     	xdef	_TIM2_ITConfig
5019                     	xdef	_TIM2_Cmd
5020                     	xdef	_TIM2_PWMIConfig
5021                     	xdef	_TIM2_ICInit
5022                     	xdef	_TIM2_OC3Init
5023                     	xdef	_TIM2_OC2Init
5024                     	xdef	_TIM2_OC1Init
5025                     	xdef	_TIM2_TimeBaseInit
5026                     	xdef	_TIM2_DeInit
5027                     	xref	_assert_failed
5028                     .const:	section	.text
5029  0000               L702:
5030  0000 2e2e5c2e2e5c  	dc.b	"..\..\stm8s_spl\li"
5031  0012 627261726965  	dc.b	"braries\stm8s_stdp"
5032  0024 65726970685f  	dc.b	"eriph_driver\src\s"
5033  0036 746d38735f74  	dc.b	"tm8s_tim2.c",0
5053                     	end
