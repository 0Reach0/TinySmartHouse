   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.3 - 22 Aug 2024
   4                     ; Optimizer V4.6.3 - 22 Aug 2024
  47                     ; 52 void TIM2_DeInit(void)
  47                     ; 53 {
  49                     	switch	.text
  50  0000               _TIM2_DeInit:
  54                     ; 54   TIM2->CR1 = (uint8_t)TIM2_CR1_RESET_VALUE;
  56  0000 725f5300      	clr	21248
  57                     ; 55   TIM2->IER = (uint8_t)TIM2_IER_RESET_VALUE;
  59  0004 725f5303      	clr	21251
  60                     ; 56   TIM2->SR2 = (uint8_t)TIM2_SR2_RESET_VALUE;
  62  0008 725f5305      	clr	21253
  63                     ; 59   TIM2->CCER1 = (uint8_t)TIM2_CCER1_RESET_VALUE;
  65  000c 725f530a      	clr	21258
  66                     ; 60   TIM2->CCER2 = (uint8_t)TIM2_CCER2_RESET_VALUE;
  68  0010 725f530b      	clr	21259
  69                     ; 64   TIM2->CCER1 = (uint8_t)TIM2_CCER1_RESET_VALUE;
  71  0014 725f530a      	clr	21258
  72                     ; 65   TIM2->CCER2 = (uint8_t)TIM2_CCER2_RESET_VALUE;
  74  0018 725f530b      	clr	21259
  75                     ; 66   TIM2->CCMR1 = (uint8_t)TIM2_CCMR1_RESET_VALUE;
  77  001c 725f5307      	clr	21255
  78                     ; 67   TIM2->CCMR2 = (uint8_t)TIM2_CCMR2_RESET_VALUE;
  80  0020 725f5308      	clr	21256
  81                     ; 68   TIM2->CCMR3 = (uint8_t)TIM2_CCMR3_RESET_VALUE;
  83  0024 725f5309      	clr	21257
  84                     ; 69   TIM2->CNTRH = (uint8_t)TIM2_CNTRH_RESET_VALUE;
  86  0028 725f530c      	clr	21260
  87                     ; 70   TIM2->CNTRL = (uint8_t)TIM2_CNTRL_RESET_VALUE;
  89  002c 725f530d      	clr	21261
  90                     ; 71   TIM2->PSCR = (uint8_t)TIM2_PSCR_RESET_VALUE;
  92  0030 725f530e      	clr	21262
  93                     ; 72   TIM2->ARRH  = (uint8_t)TIM2_ARRH_RESET_VALUE;
  95  0034 35ff530f      	mov	21263,#255
  96                     ; 73   TIM2->ARRL  = (uint8_t)TIM2_ARRL_RESET_VALUE;
  98  0038 35ff5310      	mov	21264,#255
  99                     ; 74   TIM2->CCR1H = (uint8_t)TIM2_CCR1H_RESET_VALUE;
 101  003c 725f5311      	clr	21265
 102                     ; 75   TIM2->CCR1L = (uint8_t)TIM2_CCR1L_RESET_VALUE;
 104  0040 725f5312      	clr	21266
 105                     ; 76   TIM2->CCR2H = (uint8_t)TIM2_CCR2H_RESET_VALUE;
 107  0044 725f5313      	clr	21267
 108                     ; 77   TIM2->CCR2L = (uint8_t)TIM2_CCR2L_RESET_VALUE;
 110  0048 725f5314      	clr	21268
 111                     ; 78   TIM2->CCR3H = (uint8_t)TIM2_CCR3H_RESET_VALUE;
 113  004c 725f5315      	clr	21269
 114                     ; 79   TIM2->CCR3L = (uint8_t)TIM2_CCR3L_RESET_VALUE;
 116  0050 725f5316      	clr	21270
 117                     ; 80   TIM2->SR1 = (uint8_t)TIM2_SR1_RESET_VALUE;
 119  0054 725f5304      	clr	21252
 120                     ; 81 }
 123  0058 81            	ret	
 291                     ; 89 void TIM2_TimeBaseInit( TIM2_Prescaler_TypeDef TIM2_Prescaler,
 291                     ; 90                         uint16_t TIM2_Period)
 291                     ; 91 {
 292                     	switch	.text
 293  0059               _TIM2_TimeBaseInit:
 295       ffffffff      OFST: set -1
 298                     ; 93   TIM2->PSCR = (uint8_t)(TIM2_Prescaler);
 300  0059 c7530e        	ld	21262,a
 301                     ; 95   TIM2->ARRH = (uint8_t)(TIM2_Period >> 8);
 303  005c 7b03          	ld	a,(OFST+4,sp)
 304  005e c7530f        	ld	21263,a
 305                     ; 96   TIM2->ARRL = (uint8_t)(TIM2_Period);
 307  0061 7b04          	ld	a,(OFST+5,sp)
 308  0063 c75310        	ld	21264,a
 309                     ; 97 }
 312  0066 81            	ret	
 470                     ; 108 void TIM2_OC1Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 470                     ; 109                   TIM2_OutputState_TypeDef TIM2_OutputState,
 470                     ; 110                   uint16_t TIM2_Pulse,
 470                     ; 111                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 470                     ; 112 {
 471                     	switch	.text
 472  0067               _TIM2_OC1Init:
 474  0067 89            	pushw	x
 475  0068 88            	push	a
 476       00000001      OFST:	set	1
 479                     ; 114   assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 481  0069 9e            	ld	a,xh
 482  006a 4d            	tnz	a
 483  006b 271e          	jreq	L61
 484  006d 9e            	ld	a,xh
 485  006e a110          	cp	a,#16
 486  0070 2719          	jreq	L61
 487  0072 9e            	ld	a,xh
 488  0073 a120          	cp	a,#32
 489  0075 2714          	jreq	L61
 490  0077 9e            	ld	a,xh
 491  0078 a130          	cp	a,#48
 492  007a 270f          	jreq	L61
 493  007c 9e            	ld	a,xh
 494  007d a160          	cp	a,#96
 495  007f 270a          	jreq	L61
 496  0081 9e            	ld	a,xh
 497  0082 a170          	cp	a,#112
 498  0084 2705          	jreq	L61
 499  0086 ae0072        	ldw	x,#114
 500  0089 ad4b          	call	LC001
 501  008b               L61:
 502                     ; 115   assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 504  008b 7b03          	ld	a,(OFST+2,sp)
 505  008d 2709          	jreq	L62
 506  008f a111          	cp	a,#17
 507  0091 2705          	jreq	L62
 508  0093 ae0073        	ldw	x,#115
 509  0096 ad3e          	call	LC001
 510  0098               L62:
 511                     ; 116   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 513  0098 7b08          	ld	a,(OFST+7,sp)
 514  009a 2709          	jreq	L63
 515  009c a122          	cp	a,#34
 516  009e 2705          	jreq	L63
 517  00a0 ae0074        	ldw	x,#116
 518  00a3 ad31          	call	LC001
 519  00a5               L63:
 520                     ; 119   TIM2->CCER1 &= (uint8_t)(~( TIM2_CCER1_CC1E | TIM2_CCER1_CC1P));
 522  00a5 c6530a        	ld	a,21258
 523  00a8 a4fc          	and	a,#252
 524  00aa c7530a        	ld	21258,a
 525                     ; 121   TIM2->CCER1 |= (uint8_t)((uint8_t)(TIM2_OutputState & TIM2_CCER1_CC1E ) | 
 525                     ; 122                            (uint8_t)(TIM2_OCPolarity & TIM2_CCER1_CC1P));
 527  00ad 7b08          	ld	a,(OFST+7,sp)
 528  00af a402          	and	a,#2
 529  00b1 6b01          	ld	(OFST+0,sp),a
 531  00b3 7b03          	ld	a,(OFST+2,sp)
 532  00b5 a401          	and	a,#1
 533  00b7 1a01          	or	a,(OFST+0,sp)
 534  00b9 ca530a        	or	a,21258
 535  00bc c7530a        	ld	21258,a
 536                     ; 125   TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM)) |
 536                     ; 126                           (uint8_t)TIM2_OCMode);
 538  00bf c65307        	ld	a,21255
 539  00c2 a48f          	and	a,#143
 540  00c4 1a02          	or	a,(OFST+1,sp)
 541  00c6 c75307        	ld	21255,a
 542                     ; 129   TIM2->CCR1H = (uint8_t)(TIM2_Pulse >> 8);
 544  00c9 7b06          	ld	a,(OFST+5,sp)
 545  00cb c75311        	ld	21265,a
 546                     ; 130   TIM2->CCR1L = (uint8_t)(TIM2_Pulse);
 548  00ce 7b07          	ld	a,(OFST+6,sp)
 549  00d0 c75312        	ld	21266,a
 550                     ; 131 }
 553  00d3 5b03          	addw	sp,#3
 554  00d5 81            	ret	
 555  00d6               LC001:
 556  00d6 89            	pushw	x
 557  00d7 5f            	clrw	x
 558  00d8 89            	pushw	x
 559  00d9 ae0000        	ldw	x,#L702
 560  00dc cd0000        	call	_assert_failed
 562  00df 5b04          	addw	sp,#4
 563  00e1 81            	ret	
 628                     ; 142 void TIM2_OC2Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 628                     ; 143                   TIM2_OutputState_TypeDef TIM2_OutputState,
 628                     ; 144                   uint16_t TIM2_Pulse,
 628                     ; 145                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 628                     ; 146 {
 629                     	switch	.text
 630  00e2               _TIM2_OC2Init:
 632  00e2 89            	pushw	x
 633  00e3 88            	push	a
 634       00000001      OFST:	set	1
 637                     ; 148   assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 639  00e4 9e            	ld	a,xh
 640  00e5 4d            	tnz	a
 641  00e6 271e          	jreq	L05
 642  00e8 9e            	ld	a,xh
 643  00e9 a110          	cp	a,#16
 644  00eb 2719          	jreq	L05
 645  00ed 9e            	ld	a,xh
 646  00ee a120          	cp	a,#32
 647  00f0 2714          	jreq	L05
 648  00f2 9e            	ld	a,xh
 649  00f3 a130          	cp	a,#48
 650  00f5 270f          	jreq	L05
 651  00f7 9e            	ld	a,xh
 652  00f8 a160          	cp	a,#96
 653  00fa 270a          	jreq	L05
 654  00fc 9e            	ld	a,xh
 655  00fd a170          	cp	a,#112
 656  00ff 2705          	jreq	L05
 657  0101 ae0094        	ldw	x,#148
 658  0104 ad4b          	call	LC002
 659  0106               L05:
 660                     ; 149   assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 662  0106 7b03          	ld	a,(OFST+2,sp)
 663  0108 2709          	jreq	L06
 664  010a a111          	cp	a,#17
 665  010c 2705          	jreq	L06
 666  010e ae0095        	ldw	x,#149
 667  0111 ad3e          	call	LC002
 668  0113               L06:
 669                     ; 150   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 671  0113 7b08          	ld	a,(OFST+7,sp)
 672  0115 2709          	jreq	L07
 673  0117 a122          	cp	a,#34
 674  0119 2705          	jreq	L07
 675  011b ae0096        	ldw	x,#150
 676  011e ad31          	call	LC002
 677  0120               L07:
 678                     ; 154   TIM2->CCER1 &= (uint8_t)(~( TIM2_CCER1_CC2E |  TIM2_CCER1_CC2P ));
 680  0120 c6530a        	ld	a,21258
 681  0123 a4cf          	and	a,#207
 682  0125 c7530a        	ld	21258,a
 683                     ; 156   TIM2->CCER1 |= (uint8_t)((uint8_t)(TIM2_OutputState  & TIM2_CCER1_CC2E ) |
 683                     ; 157                            (uint8_t)(TIM2_OCPolarity & TIM2_CCER1_CC2P));
 685  0128 7b08          	ld	a,(OFST+7,sp)
 686  012a a420          	and	a,#32
 687  012c 6b01          	ld	(OFST+0,sp),a
 689  012e 7b03          	ld	a,(OFST+2,sp)
 690  0130 a410          	and	a,#16
 691  0132 1a01          	or	a,(OFST+0,sp)
 692  0134 ca530a        	or	a,21258
 693  0137 c7530a        	ld	21258,a
 694                     ; 161   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM)) | 
 694                     ; 162                           (uint8_t)TIM2_OCMode);
 696  013a c65308        	ld	a,21256
 697  013d a48f          	and	a,#143
 698  013f 1a02          	or	a,(OFST+1,sp)
 699  0141 c75308        	ld	21256,a
 700                     ; 166   TIM2->CCR2H = (uint8_t)(TIM2_Pulse >> 8);
 702  0144 7b06          	ld	a,(OFST+5,sp)
 703  0146 c75313        	ld	21267,a
 704                     ; 167   TIM2->CCR2L = (uint8_t)(TIM2_Pulse);
 706  0149 7b07          	ld	a,(OFST+6,sp)
 707  014b c75314        	ld	21268,a
 708                     ; 168 }
 711  014e 5b03          	addw	sp,#3
 712  0150 81            	ret	
 713  0151               LC002:
 714  0151 89            	pushw	x
 715  0152 5f            	clrw	x
 716  0153 89            	pushw	x
 717  0154 ae0000        	ldw	x,#L702
 718  0157 cd0000        	call	_assert_failed
 720  015a 5b04          	addw	sp,#4
 721  015c 81            	ret	
 786                     ; 179 void TIM2_OC3Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 786                     ; 180                   TIM2_OutputState_TypeDef TIM2_OutputState,
 786                     ; 181                   uint16_t TIM2_Pulse,
 786                     ; 182                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 786                     ; 183 {
 787                     	switch	.text
 788  015d               _TIM2_OC3Init:
 790  015d 89            	pushw	x
 791  015e 88            	push	a
 792       00000001      OFST:	set	1
 795                     ; 185   assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 797  015f 9e            	ld	a,xh
 798  0160 4d            	tnz	a
 799  0161 271e          	jreq	L201
 800  0163 9e            	ld	a,xh
 801  0164 a110          	cp	a,#16
 802  0166 2719          	jreq	L201
 803  0168 9e            	ld	a,xh
 804  0169 a120          	cp	a,#32
 805  016b 2714          	jreq	L201
 806  016d 9e            	ld	a,xh
 807  016e a130          	cp	a,#48
 808  0170 270f          	jreq	L201
 809  0172 9e            	ld	a,xh
 810  0173 a160          	cp	a,#96
 811  0175 270a          	jreq	L201
 812  0177 9e            	ld	a,xh
 813  0178 a170          	cp	a,#112
 814  017a 2705          	jreq	L201
 815  017c ae00b9        	ldw	x,#185
 816  017f ad4b          	call	LC003
 817  0181               L201:
 818                     ; 186   assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 820  0181 7b03          	ld	a,(OFST+2,sp)
 821  0183 2709          	jreq	L211
 822  0185 a111          	cp	a,#17
 823  0187 2705          	jreq	L211
 824  0189 ae00ba        	ldw	x,#186
 825  018c ad3e          	call	LC003
 826  018e               L211:
 827                     ; 187   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 829  018e 7b08          	ld	a,(OFST+7,sp)
 830  0190 2709          	jreq	L221
 831  0192 a122          	cp	a,#34
 832  0194 2705          	jreq	L221
 833  0196 ae00bb        	ldw	x,#187
 834  0199 ad31          	call	LC003
 835  019b               L221:
 836                     ; 189   TIM2->CCER2 &= (uint8_t)(~( TIM2_CCER2_CC3E  | TIM2_CCER2_CC3P));
 838  019b c6530b        	ld	a,21259
 839  019e a4fc          	and	a,#252
 840  01a0 c7530b        	ld	21259,a
 841                     ; 191   TIM2->CCER2 |= (uint8_t)((uint8_t)(TIM2_OutputState & TIM2_CCER2_CC3E) |  
 841                     ; 192                            (uint8_t)(TIM2_OCPolarity & TIM2_CCER2_CC3P));
 843  01a3 7b08          	ld	a,(OFST+7,sp)
 844  01a5 a402          	and	a,#2
 845  01a7 6b01          	ld	(OFST+0,sp),a
 847  01a9 7b03          	ld	a,(OFST+2,sp)
 848  01ab a401          	and	a,#1
 849  01ad 1a01          	or	a,(OFST+0,sp)
 850  01af ca530b        	or	a,21259
 851  01b2 c7530b        	ld	21259,a
 852                     ; 195   TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM)) |
 852                     ; 196                           (uint8_t)TIM2_OCMode);
 854  01b5 c65309        	ld	a,21257
 855  01b8 a48f          	and	a,#143
 856  01ba 1a02          	or	a,(OFST+1,sp)
 857  01bc c75309        	ld	21257,a
 858                     ; 199   TIM2->CCR3H = (uint8_t)(TIM2_Pulse >> 8);
 860  01bf 7b06          	ld	a,(OFST+5,sp)
 861  01c1 c75315        	ld	21269,a
 862                     ; 200   TIM2->CCR3L = (uint8_t)(TIM2_Pulse);
 864  01c4 7b07          	ld	a,(OFST+6,sp)
 865  01c6 c75316        	ld	21270,a
 866                     ; 201 }
 869  01c9 5b03          	addw	sp,#3
 870  01cb 81            	ret	
 871  01cc               LC003:
 872  01cc 89            	pushw	x
 873  01cd 5f            	clrw	x
 874  01ce 89            	pushw	x
 875  01cf ae0000        	ldw	x,#L702
 876  01d2 cd0000        	call	_assert_failed
 878  01d5 5b04          	addw	sp,#4
 879  01d7 81            	ret	
1073                     ; 212 void TIM2_ICInit(TIM2_Channel_TypeDef TIM2_Channel,
1073                     ; 213                  TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
1073                     ; 214                  TIM2_ICSelection_TypeDef TIM2_ICSelection,
1073                     ; 215                  TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
1073                     ; 216                  uint8_t TIM2_ICFilter)
1073                     ; 217 {
1074                     	switch	.text
1075  01d8               _TIM2_ICInit:
1077  01d8 89            	pushw	x
1078       00000000      OFST:	set	0
1081                     ; 219   assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
1083  01d9 9e            	ld	a,xh
1084  01da 4d            	tnz	a
1085  01db 270f          	jreq	L431
1086  01dd 9e            	ld	a,xh
1087  01de 4a            	dec	a
1088  01df 270b          	jreq	L431
1089  01e1 9e            	ld	a,xh
1090  01e2 a102          	cp	a,#2
1091  01e4 2706          	jreq	L431
1092  01e6 ae00db        	ldw	x,#219
1093  01e9 cd026f        	call	LC004
1094  01ec               L431:
1095                     ; 220   assert_param(IS_TIM2_IC_POLARITY_OK(TIM2_ICPolarity));
1097  01ec 7b02          	ld	a,(OFST+2,sp)
1098  01ee 2709          	jreq	L441
1099  01f0 a144          	cp	a,#68
1100  01f2 2705          	jreq	L441
1101  01f4 ae00dc        	ldw	x,#220
1102  01f7 ad76          	call	LC004
1103  01f9               L441:
1104                     ; 221   assert_param(IS_TIM2_IC_SELECTION_OK(TIM2_ICSelection));
1106  01f9 7b05          	ld	a,(OFST+5,sp)
1107  01fb a101          	cp	a,#1
1108  01fd 270d          	jreq	L451
1109  01ff a102          	cp	a,#2
1110  0201 2709          	jreq	L451
1111  0203 a103          	cp	a,#3
1112  0205 2705          	jreq	L451
1113  0207 ae00dd        	ldw	x,#221
1114  020a ad63          	call	LC004
1115  020c               L451:
1116                     ; 222   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_ICPrescaler));
1118  020c 7b06          	ld	a,(OFST+6,sp)
1119  020e 2711          	jreq	L461
1120  0210 a104          	cp	a,#4
1121  0212 270d          	jreq	L461
1122  0214 a108          	cp	a,#8
1123  0216 2709          	jreq	L461
1124  0218 a10c          	cp	a,#12
1125  021a 2705          	jreq	L461
1126  021c ae00de        	ldw	x,#222
1127  021f ad4e          	call	LC004
1128  0221               L461:
1129                     ; 223   assert_param(IS_TIM2_IC_FILTER_OK(TIM2_ICFilter));
1131  0221 7b07          	ld	a,(OFST+7,sp)
1132  0223 a110          	cp	a,#16
1133  0225 2505          	jrult	L271
1134  0227 ae00df        	ldw	x,#223
1135  022a ad43          	call	LC004
1136  022c               L271:
1137                     ; 225   if (TIM2_Channel == TIM2_CHANNEL_1)
1139  022c 7b01          	ld	a,(OFST+1,sp)
1140  022e 2614          	jrne	L304
1141                     ; 228     TI1_Config((uint8_t)TIM2_ICPolarity,
1141                     ; 229                (uint8_t)TIM2_ICSelection,
1141                     ; 230                (uint8_t)TIM2_ICFilter);
1143  0230 7b07          	ld	a,(OFST+7,sp)
1144  0232 88            	push	a
1145  0233 7b06          	ld	a,(OFST+6,sp)
1146  0235 97            	ld	xl,a
1147  0236 7b03          	ld	a,(OFST+3,sp)
1148  0238 95            	ld	xh,a
1149  0239 cd08c9        	call	L3_TI1_Config
1151  023c 84            	pop	a
1152                     ; 233     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1154  023d 7b06          	ld	a,(OFST+6,sp)
1155  023f cd0709        	call	_TIM2_SetIC1Prescaler
1158  0242 2029          	jra	L504
1159  0244               L304:
1160                     ; 235   else if (TIM2_Channel == TIM2_CHANNEL_2)
1162  0244 4a            	dec	a
1163  0245 2614          	jrne	L704
1164                     ; 238     TI2_Config((uint8_t)TIM2_ICPolarity,
1164                     ; 239                (uint8_t)TIM2_ICSelection,
1164                     ; 240                (uint8_t)TIM2_ICFilter);
1166  0247 7b07          	ld	a,(OFST+7,sp)
1167  0249 88            	push	a
1168  024a 7b06          	ld	a,(OFST+6,sp)
1169  024c 97            	ld	xl,a
1170  024d 7b03          	ld	a,(OFST+3,sp)
1171  024f 95            	ld	xh,a
1172  0250 cd08f9        	call	L5_TI2_Config
1174  0253 84            	pop	a
1175                     ; 243     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1177  0254 7b06          	ld	a,(OFST+6,sp)
1178  0256 cd0733        	call	_TIM2_SetIC2Prescaler
1181  0259 2012          	jra	L504
1182  025b               L704:
1183                     ; 248     TI3_Config((uint8_t)TIM2_ICPolarity,
1183                     ; 249                (uint8_t)TIM2_ICSelection,
1183                     ; 250                (uint8_t)TIM2_ICFilter);
1185  025b 7b07          	ld	a,(OFST+7,sp)
1186  025d 88            	push	a
1187  025e 7b06          	ld	a,(OFST+6,sp)
1188  0260 97            	ld	xl,a
1189  0261 7b03          	ld	a,(OFST+3,sp)
1190  0263 95            	ld	xh,a
1191  0264 cd0929        	call	L7_TI3_Config
1193  0267 84            	pop	a
1194                     ; 253     TIM2_SetIC3Prescaler(TIM2_ICPrescaler);
1196  0268 7b06          	ld	a,(OFST+6,sp)
1197  026a cd075d        	call	_TIM2_SetIC3Prescaler
1199  026d               L504:
1200                     ; 255 }
1203  026d 85            	popw	x
1204  026e 81            	ret	
1205  026f               LC004:
1206  026f 89            	pushw	x
1207  0270 5f            	clrw	x
1208  0271 89            	pushw	x
1209  0272 ae0000        	ldw	x,#L702
1210  0275 cd0000        	call	_assert_failed
1212  0278 5b04          	addw	sp,#4
1213  027a 81            	ret	
1310                     ; 266 void TIM2_PWMIConfig(TIM2_Channel_TypeDef TIM2_Channel,
1310                     ; 267                      TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
1310                     ; 268                      TIM2_ICSelection_TypeDef TIM2_ICSelection,
1310                     ; 269                      TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
1310                     ; 270                      uint8_t TIM2_ICFilter)
1310                     ; 271 {
1311                     	switch	.text
1312  027b               _TIM2_PWMIConfig:
1314  027b 89            	pushw	x
1315  027c 89            	pushw	x
1316       00000002      OFST:	set	2
1319                     ; 272   uint8_t icpolarity = (uint8_t)TIM2_ICPOLARITY_RISING;
1321                     ; 273   uint8_t icselection = (uint8_t)TIM2_ICSELECTION_DIRECTTI;
1323                     ; 276   assert_param(IS_TIM2_PWMI_CHANNEL_OK(TIM2_Channel));
1325  027d 9e            	ld	a,xh
1326  027e 4d            	tnz	a
1327  027f 270a          	jreq	L022
1328  0281 9e            	ld	a,xh
1329  0282 4a            	dec	a
1330  0283 2706          	jreq	L022
1331  0285 ae0114        	ldw	x,#276
1332  0288 cd032e        	call	LC005
1333  028b               L022:
1334                     ; 277   assert_param(IS_TIM2_IC_POLARITY_OK(TIM2_ICPolarity));
1336  028b 7b04          	ld	a,(OFST+2,sp)
1337  028d 270a          	jreq	L032
1338  028f a144          	cp	a,#68
1339  0291 2706          	jreq	L032
1340  0293 ae0115        	ldw	x,#277
1341  0296 cd032e        	call	LC005
1342  0299               L032:
1343                     ; 278   assert_param(IS_TIM2_IC_SELECTION_OK(TIM2_ICSelection));
1345  0299 7b07          	ld	a,(OFST+5,sp)
1346  029b a101          	cp	a,#1
1347  029d 270e          	jreq	L042
1348  029f a102          	cp	a,#2
1349  02a1 270a          	jreq	L042
1350  02a3 a103          	cp	a,#3
1351  02a5 2706          	jreq	L042
1352  02a7 ae0116        	ldw	x,#278
1353  02aa cd032e        	call	LC005
1354  02ad               L042:
1355                     ; 279   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_ICPrescaler));
1357  02ad 7b08          	ld	a,(OFST+6,sp)
1358  02af 2711          	jreq	L052
1359  02b1 a104          	cp	a,#4
1360  02b3 270d          	jreq	L052
1361  02b5 a108          	cp	a,#8
1362  02b7 2709          	jreq	L052
1363  02b9 a10c          	cp	a,#12
1364  02bb 2705          	jreq	L052
1365  02bd ae0117        	ldw	x,#279
1366  02c0 ad6c          	call	LC005
1367  02c2               L052:
1368                     ; 282   if (TIM2_ICPolarity != TIM2_ICPOLARITY_FALLING)
1370  02c2 7b04          	ld	a,(OFST+2,sp)
1371  02c4 a144          	cp	a,#68
1372  02c6 2706          	jreq	L164
1373                     ; 284     icpolarity = (uint8_t)TIM2_ICPOLARITY_FALLING;
1375  02c8 a644          	ld	a,#68
1376  02ca 6b01          	ld	(OFST-1,sp),a
1379  02cc 2002          	jra	L364
1380  02ce               L164:
1381                     ; 288     icpolarity = (uint8_t)TIM2_ICPOLARITY_RISING;
1383  02ce 0f01          	clr	(OFST-1,sp)
1385  02d0               L364:
1386                     ; 292   if (TIM2_ICSelection == TIM2_ICSELECTION_DIRECTTI)
1388  02d0 7b07          	ld	a,(OFST+5,sp)
1389  02d2 4a            	dec	a
1390  02d3 2604          	jrne	L564
1391                     ; 294     icselection = (uint8_t)TIM2_ICSELECTION_INDIRECTTI;
1393  02d5 a602          	ld	a,#2
1395  02d7 2002          	jra	L764
1396  02d9               L564:
1397                     ; 298     icselection = (uint8_t)TIM2_ICSELECTION_DIRECTTI;
1399  02d9 a601          	ld	a,#1
1400  02db               L764:
1401  02db 6b02          	ld	(OFST+0,sp),a
1403                     ; 301   if (TIM2_Channel == TIM2_CHANNEL_1)
1405  02dd 7b03          	ld	a,(OFST+1,sp)
1406  02df 2626          	jrne	L174
1407                     ; 304     TI1_Config((uint8_t)TIM2_ICPolarity, (uint8_t)TIM2_ICSelection,
1407                     ; 305                (uint8_t)TIM2_ICFilter);
1409  02e1 7b09          	ld	a,(OFST+7,sp)
1410  02e3 88            	push	a
1411  02e4 7b08          	ld	a,(OFST+6,sp)
1412  02e6 97            	ld	xl,a
1413  02e7 7b05          	ld	a,(OFST+3,sp)
1414  02e9 95            	ld	xh,a
1415  02ea cd08c9        	call	L3_TI1_Config
1417  02ed 84            	pop	a
1418                     ; 308     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1420  02ee 7b08          	ld	a,(OFST+6,sp)
1421  02f0 cd0709        	call	_TIM2_SetIC1Prescaler
1423                     ; 311     TI2_Config(icpolarity, icselection, TIM2_ICFilter);
1425  02f3 7b09          	ld	a,(OFST+7,sp)
1426  02f5 88            	push	a
1427  02f6 7b03          	ld	a,(OFST+1,sp)
1428  02f8 97            	ld	xl,a
1429  02f9 7b02          	ld	a,(OFST+0,sp)
1430  02fb 95            	ld	xh,a
1431  02fc cd08f9        	call	L5_TI2_Config
1433  02ff 84            	pop	a
1434                     ; 314     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1436  0300 7b08          	ld	a,(OFST+6,sp)
1437  0302 cd0733        	call	_TIM2_SetIC2Prescaler
1440  0305 2024          	jra	L374
1441  0307               L174:
1442                     ; 319     TI2_Config((uint8_t)TIM2_ICPolarity, (uint8_t)TIM2_ICSelection,
1442                     ; 320                (uint8_t)TIM2_ICFilter);
1444  0307 7b09          	ld	a,(OFST+7,sp)
1445  0309 88            	push	a
1446  030a 7b08          	ld	a,(OFST+6,sp)
1447  030c 97            	ld	xl,a
1448  030d 7b05          	ld	a,(OFST+3,sp)
1449  030f 95            	ld	xh,a
1450  0310 cd08f9        	call	L5_TI2_Config
1452  0313 84            	pop	a
1453                     ; 323     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1455  0314 7b08          	ld	a,(OFST+6,sp)
1456  0316 cd0733        	call	_TIM2_SetIC2Prescaler
1458                     ; 326     TI1_Config((uint8_t)icpolarity, icselection, (uint8_t)TIM2_ICFilter);
1460  0319 7b09          	ld	a,(OFST+7,sp)
1461  031b 88            	push	a
1462  031c 7b03          	ld	a,(OFST+1,sp)
1463  031e 97            	ld	xl,a
1464  031f 7b02          	ld	a,(OFST+0,sp)
1465  0321 95            	ld	xh,a
1466  0322 cd08c9        	call	L3_TI1_Config
1468  0325 84            	pop	a
1469                     ; 329     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1471  0326 7b08          	ld	a,(OFST+6,sp)
1472  0328 cd0709        	call	_TIM2_SetIC1Prescaler
1474  032b               L374:
1475                     ; 331 }
1478  032b 5b04          	addw	sp,#4
1479  032d 81            	ret	
1480  032e               LC005:
1481  032e 89            	pushw	x
1482  032f 5f            	clrw	x
1483  0330 89            	pushw	x
1484  0331 ae0000        	ldw	x,#L702
1485  0334 cd0000        	call	_assert_failed
1487  0337 5b04          	addw	sp,#4
1488  0339 81            	ret	
1544                     ; 339 void TIM2_Cmd(FunctionalState NewState)
1544                     ; 340 {
1545                     	switch	.text
1546  033a               _TIM2_Cmd:
1548  033a 88            	push	a
1549       00000000      OFST:	set	0
1552                     ; 342   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1554  033b 4d            	tnz	a
1555  033c 2711          	jreq	L203
1556  033e 4a            	dec	a
1557  033f 270e          	jreq	L203
1558  0341 ae0156        	ldw	x,#342
1559  0344 89            	pushw	x
1560  0345 5f            	clrw	x
1561  0346 89            	pushw	x
1562  0347 ae0000        	ldw	x,#L702
1563  034a cd0000        	call	_assert_failed
1565  034d 5b04          	addw	sp,#4
1566  034f               L203:
1567                     ; 345   if (NewState != DISABLE)
1569  034f 7b01          	ld	a,(OFST+1,sp)
1570  0351 2706          	jreq	L325
1571                     ; 347     TIM2->CR1 |= (uint8_t)TIM2_CR1_CEN;
1573  0353 72105300      	bset	21248,#0
1575  0357 2004          	jra	L525
1576  0359               L325:
1577                     ; 351     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_CEN);
1579  0359 72115300      	bres	21248,#0
1580  035d               L525:
1581                     ; 353 }
1584  035d 84            	pop	a
1585  035e 81            	ret	
1665                     ; 368 void TIM2_ITConfig(TIM2_IT_TypeDef TIM2_IT, FunctionalState NewState)
1665                     ; 369 {
1666                     	switch	.text
1667  035f               _TIM2_ITConfig:
1669  035f 89            	pushw	x
1670       00000000      OFST:	set	0
1673                     ; 371   assert_param(IS_TIM2_IT_OK(TIM2_IT));
1675  0360 9e            	ld	a,xh
1676  0361 4d            	tnz	a
1677  0362 2705          	jreq	L013
1678  0364 9e            	ld	a,xh
1679  0365 a110          	cp	a,#16
1680  0367 2505          	jrult	L213
1681  0369               L013:
1682  0369 ae0173        	ldw	x,#371
1683  036c ad22          	call	LC006
1684  036e               L213:
1685                     ; 372   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1687  036e 7b02          	ld	a,(OFST+2,sp)
1688  0370 2708          	jreq	L223
1689  0372 4a            	dec	a
1690  0373 2705          	jreq	L223
1691  0375 ae0174        	ldw	x,#372
1692  0378 ad16          	call	LC006
1693  037a               L223:
1694                     ; 374   if (NewState != DISABLE)
1696  037a 7b02          	ld	a,(OFST+2,sp)
1697  037c 2707          	jreq	L565
1698                     ; 377     TIM2->IER |= (uint8_t)TIM2_IT;
1700  037e c65303        	ld	a,21251
1701  0381 1a01          	or	a,(OFST+1,sp)
1703  0383 2006          	jra	L765
1704  0385               L565:
1705                     ; 382     TIM2->IER &= (uint8_t)(~TIM2_IT);
1707  0385 7b01          	ld	a,(OFST+1,sp)
1708  0387 43            	cpl	a
1709  0388 c45303        	and	a,21251
1710  038b               L765:
1711  038b c75303        	ld	21251,a
1712                     ; 384 }
1715  038e 85            	popw	x
1716  038f 81            	ret	
1717  0390               LC006:
1718  0390 89            	pushw	x
1719  0391 5f            	clrw	x
1720  0392 89            	pushw	x
1721  0393 ae0000        	ldw	x,#L702
1722  0396 cd0000        	call	_assert_failed
1724  0399 5b04          	addw	sp,#4
1725  039b 81            	ret	
1762                     ; 392 void TIM2_UpdateDisableConfig(FunctionalState NewState)
1762                     ; 393 {
1763                     	switch	.text
1764  039c               _TIM2_UpdateDisableConfig:
1766  039c 88            	push	a
1767       00000000      OFST:	set	0
1770                     ; 395   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1772  039d 4d            	tnz	a
1773  039e 2711          	jreq	L433
1774  03a0 4a            	dec	a
1775  03a1 270e          	jreq	L433
1776  03a3 ae018b        	ldw	x,#395
1777  03a6 89            	pushw	x
1778  03a7 5f            	clrw	x
1779  03a8 89            	pushw	x
1780  03a9 ae0000        	ldw	x,#L702
1781  03ac cd0000        	call	_assert_failed
1783  03af 5b04          	addw	sp,#4
1784  03b1               L433:
1785                     ; 398   if (NewState != DISABLE)
1787  03b1 7b01          	ld	a,(OFST+1,sp)
1788  03b3 2706          	jreq	L706
1789                     ; 400     TIM2->CR1 |= (uint8_t)TIM2_CR1_UDIS;
1791  03b5 72125300      	bset	21248,#1
1793  03b9 2004          	jra	L116
1794  03bb               L706:
1795                     ; 404     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_UDIS);
1797  03bb 72135300      	bres	21248,#1
1798  03bf               L116:
1799                     ; 406 }
1802  03bf 84            	pop	a
1803  03c0 81            	ret	
1862                     ; 416 void TIM2_UpdateRequestConfig(TIM2_UpdateSource_TypeDef TIM2_UpdateSource)
1862                     ; 417 {
1863                     	switch	.text
1864  03c1               _TIM2_UpdateRequestConfig:
1866  03c1 88            	push	a
1867       00000000      OFST:	set	0
1870                     ; 419   assert_param(IS_TIM2_UPDATE_SOURCE_OK(TIM2_UpdateSource));
1872  03c2 4d            	tnz	a
1873  03c3 2711          	jreq	L643
1874  03c5 4a            	dec	a
1875  03c6 270e          	jreq	L643
1876  03c8 ae01a3        	ldw	x,#419
1877  03cb 89            	pushw	x
1878  03cc 5f            	clrw	x
1879  03cd 89            	pushw	x
1880  03ce ae0000        	ldw	x,#L702
1881  03d1 cd0000        	call	_assert_failed
1883  03d4 5b04          	addw	sp,#4
1884  03d6               L643:
1885                     ; 422   if (TIM2_UpdateSource != TIM2_UPDATESOURCE_GLOBAL)
1887  03d6 7b01          	ld	a,(OFST+1,sp)
1888  03d8 2706          	jreq	L146
1889                     ; 424     TIM2->CR1 |= (uint8_t)TIM2_CR1_URS;
1891  03da 72145300      	bset	21248,#2
1893  03de 2004          	jra	L346
1894  03e0               L146:
1895                     ; 428     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_URS);
1897  03e0 72155300      	bres	21248,#2
1898  03e4               L346:
1899                     ; 430 }
1902  03e4 84            	pop	a
1903  03e5 81            	ret	
1961                     ; 440 void TIM2_SelectOnePulseMode(TIM2_OPMode_TypeDef TIM2_OPMode)
1961                     ; 441 {
1962                     	switch	.text
1963  03e6               _TIM2_SelectOnePulseMode:
1965  03e6 88            	push	a
1966       00000000      OFST:	set	0
1969                     ; 443   assert_param(IS_TIM2_OPM_MODE_OK(TIM2_OPMode));
1971  03e7 a101          	cp	a,#1
1972  03e9 2711          	jreq	L063
1973  03eb 4d            	tnz	a
1974  03ec 270e          	jreq	L063
1975  03ee ae01bb        	ldw	x,#443
1976  03f1 89            	pushw	x
1977  03f2 5f            	clrw	x
1978  03f3 89            	pushw	x
1979  03f4 ae0000        	ldw	x,#L702
1980  03f7 cd0000        	call	_assert_failed
1982  03fa 5b04          	addw	sp,#4
1983  03fc               L063:
1984                     ; 446   if (TIM2_OPMode != TIM2_OPMODE_REPETITIVE)
1986  03fc 7b01          	ld	a,(OFST+1,sp)
1987  03fe 2706          	jreq	L376
1988                     ; 448     TIM2->CR1 |= (uint8_t)TIM2_CR1_OPM;
1990  0400 72165300      	bset	21248,#3
1992  0404 2004          	jra	L576
1993  0406               L376:
1994                     ; 452     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_OPM);
1996  0406 72175300      	bres	21248,#3
1997  040a               L576:
1998                     ; 454 }
2001  040a 84            	pop	a
2002  040b 81            	ret	
2071                     ; 484 void TIM2_PrescalerConfig(TIM2_Prescaler_TypeDef Prescaler,
2071                     ; 485                           TIM2_PSCReloadMode_TypeDef TIM2_PSCReloadMode)
2071                     ; 486 {
2072                     	switch	.text
2073  040c               _TIM2_PrescalerConfig:
2075  040c 89            	pushw	x
2076       00000000      OFST:	set	0
2079                     ; 488   assert_param(IS_TIM2_PRESCALER_RELOAD_OK(TIM2_PSCReloadMode));
2081  040d 9f            	ld	a,xl
2082  040e 4d            	tnz	a
2083  040f 2709          	jreq	L273
2084  0411 9f            	ld	a,xl
2085  0412 4a            	dec	a
2086  0413 2705          	jreq	L273
2087  0415 ae01e8        	ldw	x,#488
2088  0418 ad51          	call	LC007
2089  041a               L273:
2090                     ; 489   assert_param(IS_TIM2_PRESCALER_OK(Prescaler));
2092  041a 7b01          	ld	a,(OFST+1,sp)
2093  041c 2743          	jreq	L204
2094  041e a101          	cp	a,#1
2095  0420 273f          	jreq	L204
2096  0422 a102          	cp	a,#2
2097  0424 273b          	jreq	L204
2098  0426 a103          	cp	a,#3
2099  0428 2737          	jreq	L204
2100  042a a104          	cp	a,#4
2101  042c 2733          	jreq	L204
2102  042e a105          	cp	a,#5
2103  0430 272f          	jreq	L204
2104  0432 a106          	cp	a,#6
2105  0434 272b          	jreq	L204
2106  0436 a107          	cp	a,#7
2107  0438 2727          	jreq	L204
2108  043a a108          	cp	a,#8
2109  043c 2723          	jreq	L204
2110  043e a109          	cp	a,#9
2111  0440 271f          	jreq	L204
2112  0442 a10a          	cp	a,#10
2113  0444 271b          	jreq	L204
2114  0446 a10b          	cp	a,#11
2115  0448 2717          	jreq	L204
2116  044a a10c          	cp	a,#12
2117  044c 2713          	jreq	L204
2118  044e a10d          	cp	a,#13
2119  0450 270f          	jreq	L204
2120  0452 a10e          	cp	a,#14
2121  0454 270b          	jreq	L204
2122  0456 a10f          	cp	a,#15
2123  0458 2707          	jreq	L204
2124  045a ae01e9        	ldw	x,#489
2125  045d ad0c          	call	LC007
2126  045f 7b01          	ld	a,(OFST+1,sp)
2127  0461               L204:
2128                     ; 492   TIM2->PSCR = (uint8_t)Prescaler;
2130  0461 c7530e        	ld	21262,a
2131                     ; 495   TIM2->EGR = (uint8_t)TIM2_PSCReloadMode;
2133  0464 7b02          	ld	a,(OFST+2,sp)
2134  0466 c75306        	ld	21254,a
2135                     ; 496 }
2138  0469 85            	popw	x
2139  046a 81            	ret	
2140  046b               LC007:
2141  046b 89            	pushw	x
2142  046c 5f            	clrw	x
2143  046d 89            	pushw	x
2144  046e ae0000        	ldw	x,#L702
2145  0471 cd0000        	call	_assert_failed
2147  0474 5b04          	addw	sp,#4
2148  0476 81            	ret	
2207                     ; 507 void TIM2_ForcedOC1Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
2207                     ; 508 {
2208                     	switch	.text
2209  0477               _TIM2_ForcedOC1Config:
2211  0477 88            	push	a
2212       00000000      OFST:	set	0
2215                     ; 510   assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
2217  0478 a150          	cp	a,#80
2218  047a 2712          	jreq	L414
2219  047c a140          	cp	a,#64
2220  047e 270e          	jreq	L414
2221  0480 ae01fe        	ldw	x,#510
2222  0483 89            	pushw	x
2223  0484 5f            	clrw	x
2224  0485 89            	pushw	x
2225  0486 ae0000        	ldw	x,#L702
2226  0489 cd0000        	call	_assert_failed
2228  048c 5b04          	addw	sp,#4
2229  048e               L414:
2230                     ; 513   TIM2->CCMR1  =  (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM))  
2230                     ; 514                             | (uint8_t)TIM2_ForcedAction);
2232  048e c65307        	ld	a,21255
2233  0491 a48f          	and	a,#143
2234  0493 1a01          	or	a,(OFST+1,sp)
2235  0495 c75307        	ld	21255,a
2236                     ; 515 }
2239  0498 84            	pop	a
2240  0499 81            	ret	
2277                     ; 526 void TIM2_ForcedOC2Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
2277                     ; 527 {
2278                     	switch	.text
2279  049a               _TIM2_ForcedOC2Config:
2281  049a 88            	push	a
2282       00000000      OFST:	set	0
2285                     ; 529   assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
2287  049b a150          	cp	a,#80
2288  049d 2712          	jreq	L624
2289  049f a140          	cp	a,#64
2290  04a1 270e          	jreq	L624
2291  04a3 ae0211        	ldw	x,#529
2292  04a6 89            	pushw	x
2293  04a7 5f            	clrw	x
2294  04a8 89            	pushw	x
2295  04a9 ae0000        	ldw	x,#L702
2296  04ac cd0000        	call	_assert_failed
2298  04af 5b04          	addw	sp,#4
2299  04b1               L624:
2300                     ; 532   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM))  
2300                     ; 533                           | (uint8_t)TIM2_ForcedAction);
2302  04b1 c65308        	ld	a,21256
2303  04b4 a48f          	and	a,#143
2304  04b6 1a01          	or	a,(OFST+1,sp)
2305  04b8 c75308        	ld	21256,a
2306                     ; 534 }
2309  04bb 84            	pop	a
2310  04bc 81            	ret	
2347                     ; 545 void TIM2_ForcedOC3Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
2347                     ; 546 {
2348                     	switch	.text
2349  04bd               _TIM2_ForcedOC3Config:
2351  04bd 88            	push	a
2352       00000000      OFST:	set	0
2355                     ; 548   assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
2357  04be a150          	cp	a,#80
2358  04c0 2712          	jreq	L044
2359  04c2 a140          	cp	a,#64
2360  04c4 270e          	jreq	L044
2361  04c6 ae0224        	ldw	x,#548
2362  04c9 89            	pushw	x
2363  04ca 5f            	clrw	x
2364  04cb 89            	pushw	x
2365  04cc ae0000        	ldw	x,#L702
2366  04cf cd0000        	call	_assert_failed
2368  04d2 5b04          	addw	sp,#4
2369  04d4               L044:
2370                     ; 551   TIM2->CCMR3  =  (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM))
2370                     ; 552                             | (uint8_t)TIM2_ForcedAction);
2372  04d4 c65309        	ld	a,21257
2373  04d7 a48f          	and	a,#143
2374  04d9 1a01          	or	a,(OFST+1,sp)
2375  04db c75309        	ld	21257,a
2376                     ; 553 }
2379  04de 84            	pop	a
2380  04df 81            	ret	
2417                     ; 561 void TIM2_ARRPreloadConfig(FunctionalState NewState)
2417                     ; 562 {
2418                     	switch	.text
2419  04e0               _TIM2_ARRPreloadConfig:
2421  04e0 88            	push	a
2422       00000000      OFST:	set	0
2425                     ; 564   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2427  04e1 4d            	tnz	a
2428  04e2 2711          	jreq	L254
2429  04e4 4a            	dec	a
2430  04e5 270e          	jreq	L254
2431  04e7 ae0234        	ldw	x,#564
2432  04ea 89            	pushw	x
2433  04eb 5f            	clrw	x
2434  04ec 89            	pushw	x
2435  04ed ae0000        	ldw	x,#L702
2436  04f0 cd0000        	call	_assert_failed
2438  04f3 5b04          	addw	sp,#4
2439  04f5               L254:
2440                     ; 567   if (NewState != DISABLE)
2442  04f5 7b01          	ld	a,(OFST+1,sp)
2443  04f7 2706          	jreq	L1301
2444                     ; 569     TIM2->CR1 |= (uint8_t)TIM2_CR1_ARPE;
2446  04f9 721e5300      	bset	21248,#7
2448  04fd 2004          	jra	L3301
2449  04ff               L1301:
2450                     ; 573     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_ARPE);
2452  04ff 721f5300      	bres	21248,#7
2453  0503               L3301:
2454                     ; 575 }
2457  0503 84            	pop	a
2458  0504 81            	ret	
2495                     ; 583 void TIM2_OC1PreloadConfig(FunctionalState NewState)
2495                     ; 584 {
2496                     	switch	.text
2497  0505               _TIM2_OC1PreloadConfig:
2499  0505 88            	push	a
2500       00000000      OFST:	set	0
2503                     ; 586   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2505  0506 4d            	tnz	a
2506  0507 2711          	jreq	L464
2507  0509 4a            	dec	a
2508  050a 270e          	jreq	L464
2509  050c ae024a        	ldw	x,#586
2510  050f 89            	pushw	x
2511  0510 5f            	clrw	x
2512  0511 89            	pushw	x
2513  0512 ae0000        	ldw	x,#L702
2514  0515 cd0000        	call	_assert_failed
2516  0518 5b04          	addw	sp,#4
2517  051a               L464:
2518                     ; 589   if (NewState != DISABLE)
2520  051a 7b01          	ld	a,(OFST+1,sp)
2521  051c 2706          	jreq	L3501
2522                     ; 591     TIM2->CCMR1 |= (uint8_t)TIM2_CCMR_OCxPE;
2524  051e 72165307      	bset	21255,#3
2526  0522 2004          	jra	L5501
2527  0524               L3501:
2528                     ; 595     TIM2->CCMR1 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2530  0524 72175307      	bres	21255,#3
2531  0528               L5501:
2532                     ; 597 }
2535  0528 84            	pop	a
2536  0529 81            	ret	
2573                     ; 605 void TIM2_OC2PreloadConfig(FunctionalState NewState)
2573                     ; 606 {
2574                     	switch	.text
2575  052a               _TIM2_OC2PreloadConfig:
2577  052a 88            	push	a
2578       00000000      OFST:	set	0
2581                     ; 608   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2583  052b 4d            	tnz	a
2584  052c 2711          	jreq	L674
2585  052e 4a            	dec	a
2586  052f 270e          	jreq	L674
2587  0531 ae0260        	ldw	x,#608
2588  0534 89            	pushw	x
2589  0535 5f            	clrw	x
2590  0536 89            	pushw	x
2591  0537 ae0000        	ldw	x,#L702
2592  053a cd0000        	call	_assert_failed
2594  053d 5b04          	addw	sp,#4
2595  053f               L674:
2596                     ; 611   if (NewState != DISABLE)
2598  053f 7b01          	ld	a,(OFST+1,sp)
2599  0541 2706          	jreq	L5701
2600                     ; 613     TIM2->CCMR2 |= (uint8_t)TIM2_CCMR_OCxPE;
2602  0543 72165308      	bset	21256,#3
2604  0547 2004          	jra	L7701
2605  0549               L5701:
2606                     ; 617     TIM2->CCMR2 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2608  0549 72175308      	bres	21256,#3
2609  054d               L7701:
2610                     ; 619 }
2613  054d 84            	pop	a
2614  054e 81            	ret	
2651                     ; 627 void TIM2_OC3PreloadConfig(FunctionalState NewState)
2651                     ; 628 {
2652                     	switch	.text
2653  054f               _TIM2_OC3PreloadConfig:
2655  054f 88            	push	a
2656       00000000      OFST:	set	0
2659                     ; 630   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2661  0550 4d            	tnz	a
2662  0551 2711          	jreq	L015
2663  0553 4a            	dec	a
2664  0554 270e          	jreq	L015
2665  0556 ae0276        	ldw	x,#630
2666  0559 89            	pushw	x
2667  055a 5f            	clrw	x
2668  055b 89            	pushw	x
2669  055c ae0000        	ldw	x,#L702
2670  055f cd0000        	call	_assert_failed
2672  0562 5b04          	addw	sp,#4
2673  0564               L015:
2674                     ; 633   if (NewState != DISABLE)
2676  0564 7b01          	ld	a,(OFST+1,sp)
2677  0566 2706          	jreq	L7111
2678                     ; 635     TIM2->CCMR3 |= (uint8_t)TIM2_CCMR_OCxPE;
2680  0568 72165309      	bset	21257,#3
2682  056c 2004          	jra	L1211
2683  056e               L7111:
2684                     ; 639     TIM2->CCMR3 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2686  056e 72175309      	bres	21257,#3
2687  0572               L1211:
2688                     ; 641 }
2691  0572 84            	pop	a
2692  0573 81            	ret	
2766                     ; 653 void TIM2_GenerateEvent(TIM2_EventSource_TypeDef TIM2_EventSource)
2766                     ; 654 {
2767                     	switch	.text
2768  0574               _TIM2_GenerateEvent:
2770  0574 88            	push	a
2771       00000000      OFST:	set	0
2774                     ; 656   assert_param(IS_TIM2_EVENT_SOURCE_OK(TIM2_EventSource));
2776  0575 4d            	tnz	a
2777  0576 260e          	jrne	L025
2778  0578 ae0290        	ldw	x,#656
2779  057b 89            	pushw	x
2780  057c 5f            	clrw	x
2781  057d 89            	pushw	x
2782  057e ae0000        	ldw	x,#L702
2783  0581 cd0000        	call	_assert_failed
2785  0584 5b04          	addw	sp,#4
2786  0586               L025:
2787                     ; 659   TIM2->EGR = (uint8_t)TIM2_EventSource;
2789  0586 7b01          	ld	a,(OFST+1,sp)
2790  0588 c75306        	ld	21254,a
2791                     ; 660 }
2794  058b 84            	pop	a
2795  058c 81            	ret	
2832                     ; 670 void TIM2_OC1PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
2832                     ; 671 {
2833                     	switch	.text
2834  058d               _TIM2_OC1PolarityConfig:
2836  058d 88            	push	a
2837       00000000      OFST:	set	0
2840                     ; 673   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
2842  058e 4d            	tnz	a
2843  058f 2712          	jreq	L235
2844  0591 a122          	cp	a,#34
2845  0593 270e          	jreq	L235
2846  0595 ae02a1        	ldw	x,#673
2847  0598 89            	pushw	x
2848  0599 5f            	clrw	x
2849  059a 89            	pushw	x
2850  059b ae0000        	ldw	x,#L702
2851  059e cd0000        	call	_assert_failed
2853  05a1 5b04          	addw	sp,#4
2854  05a3               L235:
2855                     ; 676   if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
2857  05a3 7b01          	ld	a,(OFST+1,sp)
2858  05a5 2706          	jreq	L3711
2859                     ; 678     TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC1P;
2861  05a7 7212530a      	bset	21258,#1
2863  05ab 2004          	jra	L5711
2864  05ad               L3711:
2865                     ; 682     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1P);
2867  05ad 7213530a      	bres	21258,#1
2868  05b1               L5711:
2869                     ; 684 }
2872  05b1 84            	pop	a
2873  05b2 81            	ret	
2910                     ; 694 void TIM2_OC2PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
2910                     ; 695 {
2911                     	switch	.text
2912  05b3               _TIM2_OC2PolarityConfig:
2914  05b3 88            	push	a
2915       00000000      OFST:	set	0
2918                     ; 697   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
2920  05b4 4d            	tnz	a
2921  05b5 2712          	jreq	L445
2922  05b7 a122          	cp	a,#34
2923  05b9 270e          	jreq	L445
2924  05bb ae02b9        	ldw	x,#697
2925  05be 89            	pushw	x
2926  05bf 5f            	clrw	x
2927  05c0 89            	pushw	x
2928  05c1 ae0000        	ldw	x,#L702
2929  05c4 cd0000        	call	_assert_failed
2931  05c7 5b04          	addw	sp,#4
2932  05c9               L445:
2933                     ; 700   if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
2935  05c9 7b01          	ld	a,(OFST+1,sp)
2936  05cb 2706          	jreq	L5121
2937                     ; 702     TIM2->CCER1 |= TIM2_CCER1_CC2P;
2939  05cd 721a530a      	bset	21258,#5
2941  05d1 2004          	jra	L7121
2942  05d3               L5121:
2943                     ; 706     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2P);
2945  05d3 721b530a      	bres	21258,#5
2946  05d7               L7121:
2947                     ; 708 }
2950  05d7 84            	pop	a
2951  05d8 81            	ret	
2988                     ; 718 void TIM2_OC3PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
2988                     ; 719 {
2989                     	switch	.text
2990  05d9               _TIM2_OC3PolarityConfig:
2992  05d9 88            	push	a
2993       00000000      OFST:	set	0
2996                     ; 721   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
2998  05da 4d            	tnz	a
2999  05db 2712          	jreq	L655
3000  05dd a122          	cp	a,#34
3001  05df 270e          	jreq	L655
3002  05e1 ae02d1        	ldw	x,#721
3003  05e4 89            	pushw	x
3004  05e5 5f            	clrw	x
3005  05e6 89            	pushw	x
3006  05e7 ae0000        	ldw	x,#L702
3007  05ea cd0000        	call	_assert_failed
3009  05ed 5b04          	addw	sp,#4
3010  05ef               L655:
3011                     ; 724   if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
3013  05ef 7b01          	ld	a,(OFST+1,sp)
3014  05f1 2706          	jreq	L7321
3015                     ; 726     TIM2->CCER2 |= (uint8_t)TIM2_CCER2_CC3P;
3017  05f3 7212530b      	bset	21259,#1
3019  05f7 2004          	jra	L1421
3020  05f9               L7321:
3021                     ; 730     TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3P);
3023  05f9 7213530b      	bres	21259,#1
3024  05fd               L1421:
3025                     ; 732 }
3028  05fd 84            	pop	a
3029  05fe 81            	ret	
3075                     ; 745 void TIM2_CCxCmd(TIM2_Channel_TypeDef TIM2_Channel, FunctionalState NewState)
3075                     ; 746 {
3076                     	switch	.text
3077  05ff               _TIM2_CCxCmd:
3079  05ff 89            	pushw	x
3080       00000000      OFST:	set	0
3083                     ; 748   assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
3085  0600 9e            	ld	a,xh
3086  0601 4d            	tnz	a
3087  0602 270e          	jreq	L075
3088  0604 9e            	ld	a,xh
3089  0605 4a            	dec	a
3090  0606 270a          	jreq	L075
3091  0608 9e            	ld	a,xh
3092  0609 a102          	cp	a,#2
3093  060b 2705          	jreq	L075
3094  060d ae02ec        	ldw	x,#748
3095  0610 ad43          	call	LC008
3096  0612               L075:
3097                     ; 749   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
3099  0612 7b02          	ld	a,(OFST+2,sp)
3100  0614 2708          	jreq	L006
3101  0616 4a            	dec	a
3102  0617 2705          	jreq	L006
3103  0619 ae02ed        	ldw	x,#749
3104  061c ad37          	call	LC008
3105  061e               L006:
3106                     ; 751   if (TIM2_Channel == TIM2_CHANNEL_1)
3108  061e 7b01          	ld	a,(OFST+1,sp)
3109  0620 2610          	jrne	L5621
3110                     ; 754     if (NewState != DISABLE)
3112  0622 7b02          	ld	a,(OFST+2,sp)
3113  0624 2706          	jreq	L7621
3114                     ; 756       TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC1E;
3116  0626 7210530a      	bset	21258,#0
3118  062a 2027          	jra	L3721
3119  062c               L7621:
3120                     ; 760       TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
3122  062c 7211530a      	bres	21258,#0
3123  0630 2021          	jra	L3721
3124  0632               L5621:
3125                     ; 764   else if (TIM2_Channel == TIM2_CHANNEL_2)
3127  0632 4a            	dec	a
3128  0633 2610          	jrne	L5721
3129                     ; 767     if (NewState != DISABLE)
3131  0635 7b02          	ld	a,(OFST+2,sp)
3132  0637 2706          	jreq	L7721
3133                     ; 769       TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC2E;
3135  0639 7218530a      	bset	21258,#4
3137  063d 2014          	jra	L3721
3138  063f               L7721:
3139                     ; 773       TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
3141  063f 7219530a      	bres	21258,#4
3142  0643 200e          	jra	L3721
3143  0645               L5721:
3144                     ; 779     if (NewState != DISABLE)
3146  0645 7b02          	ld	a,(OFST+2,sp)
3147  0647 2706          	jreq	L5031
3148                     ; 781       TIM2->CCER2 |= (uint8_t)TIM2_CCER2_CC3E;
3150  0649 7210530b      	bset	21259,#0
3152  064d 2004          	jra	L3721
3153  064f               L5031:
3154                     ; 785       TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3E);
3156  064f 7211530b      	bres	21259,#0
3157  0653               L3721:
3158                     ; 788 }
3161  0653 85            	popw	x
3162  0654 81            	ret	
3163  0655               LC008:
3164  0655 89            	pushw	x
3165  0656 5f            	clrw	x
3166  0657 89            	pushw	x
3167  0658 ae0000        	ldw	x,#L702
3168  065b cd0000        	call	_assert_failed
3170  065e 5b04          	addw	sp,#4
3171  0660 81            	ret	
3217                     ; 810 void TIM2_SelectOCxM(TIM2_Channel_TypeDef TIM2_Channel, TIM2_OCMode_TypeDef TIM2_OCMode)
3217                     ; 811 {
3218                     	switch	.text
3219  0661               _TIM2_SelectOCxM:
3221  0661 89            	pushw	x
3222       00000000      OFST:	set	0
3225                     ; 813   assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
3227  0662 9e            	ld	a,xh
3228  0663 4d            	tnz	a
3229  0664 270e          	jreq	L216
3230  0666 9e            	ld	a,xh
3231  0667 4a            	dec	a
3232  0668 270a          	jreq	L216
3233  066a 9e            	ld	a,xh
3234  066b a102          	cp	a,#2
3235  066d 2705          	jreq	L216
3236  066f ae032d        	ldw	x,#813
3237  0672 ad5c          	call	LC009
3238  0674               L216:
3239                     ; 814   assert_param(IS_TIM2_OCM_OK(TIM2_OCMode));
3241  0674 7b02          	ld	a,(OFST+2,sp)
3242  0676 2721          	jreq	L226
3243  0678 a110          	cp	a,#16
3244  067a 271d          	jreq	L226
3245  067c a120          	cp	a,#32
3246  067e 2719          	jreq	L226
3247  0680 a130          	cp	a,#48
3248  0682 2715          	jreq	L226
3249  0684 a160          	cp	a,#96
3250  0686 2711          	jreq	L226
3251  0688 a170          	cp	a,#112
3252  068a 270d          	jreq	L226
3253  068c a150          	cp	a,#80
3254  068e 2709          	jreq	L226
3255  0690 a140          	cp	a,#64
3256  0692 2705          	jreq	L226
3257  0694 ae032e        	ldw	x,#814
3258  0697 ad37          	call	LC009
3259  0699               L226:
3260                     ; 816   if (TIM2_Channel == TIM2_CHANNEL_1)
3262  0699 7b01          	ld	a,(OFST+1,sp)
3263  069b 2610          	jrne	L3331
3264                     ; 819     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
3266  069d 7211530a      	bres	21258,#0
3267                     ; 822     TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM))
3267                     ; 823                             | (uint8_t)TIM2_OCMode);
3269  06a1 c65307        	ld	a,21255
3270  06a4 a48f          	and	a,#143
3271  06a6 1a02          	or	a,(OFST+2,sp)
3272  06a8 c75307        	ld	21255,a
3274  06ab 2021          	jra	L5331
3275  06ad               L3331:
3276                     ; 825   else if (TIM2_Channel == TIM2_CHANNEL_2)
3278  06ad 4a            	dec	a
3279  06ae 2610          	jrne	L7331
3280                     ; 828     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
3282  06b0 7219530a      	bres	21258,#4
3283                     ; 831     TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM))
3283                     ; 832                             | (uint8_t)TIM2_OCMode);
3285  06b4 c65308        	ld	a,21256
3286  06b7 a48f          	and	a,#143
3287  06b9 1a02          	or	a,(OFST+2,sp)
3288  06bb c75308        	ld	21256,a
3290  06be 200e          	jra	L5331
3291  06c0               L7331:
3292                     ; 837     TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3E);
3294  06c0 7211530b      	bres	21259,#0
3295                     ; 840     TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM))
3295                     ; 841                             | (uint8_t)TIM2_OCMode);
3297  06c4 c65309        	ld	a,21257
3298  06c7 a48f          	and	a,#143
3299  06c9 1a02          	or	a,(OFST+2,sp)
3300  06cb c75309        	ld	21257,a
3301  06ce               L5331:
3302                     ; 843 }
3305  06ce 85            	popw	x
3306  06cf 81            	ret	
3307  06d0               LC009:
3308  06d0 89            	pushw	x
3309  06d1 5f            	clrw	x
3310  06d2 89            	pushw	x
3311  06d3 ae0000        	ldw	x,#L702
3312  06d6 cd0000        	call	_assert_failed
3314  06d9 5b04          	addw	sp,#4
3315  06db 81            	ret	
3349                     ; 851 void TIM2_SetCounter(uint16_t Counter)
3349                     ; 852 {
3350                     	switch	.text
3351  06dc               _TIM2_SetCounter:
3355                     ; 854   TIM2->CNTRH = (uint8_t)(Counter >> 8);
3357  06dc 9e            	ld	a,xh
3358  06dd c7530c        	ld	21260,a
3359                     ; 855   TIM2->CNTRL = (uint8_t)(Counter);
3361  06e0 9f            	ld	a,xl
3362  06e1 c7530d        	ld	21261,a
3363                     ; 856 }
3366  06e4 81            	ret	
3400                     ; 864 void TIM2_SetAutoreload(uint16_t Autoreload)
3400                     ; 865 {
3401                     	switch	.text
3402  06e5               _TIM2_SetAutoreload:
3406                     ; 867   TIM2->ARRH = (uint8_t)(Autoreload >> 8);
3408  06e5 9e            	ld	a,xh
3409  06e6 c7530f        	ld	21263,a
3410                     ; 868   TIM2->ARRL = (uint8_t)(Autoreload);
3412  06e9 9f            	ld	a,xl
3413  06ea c75310        	ld	21264,a
3414                     ; 869 }
3417  06ed 81            	ret	
3451                     ; 877 void TIM2_SetCompare1(uint16_t Compare1)
3451                     ; 878 {
3452                     	switch	.text
3453  06ee               _TIM2_SetCompare1:
3457                     ; 880   TIM2->CCR1H = (uint8_t)(Compare1 >> 8);
3459  06ee 9e            	ld	a,xh
3460  06ef c75311        	ld	21265,a
3461                     ; 881   TIM2->CCR1L = (uint8_t)(Compare1);
3463  06f2 9f            	ld	a,xl
3464  06f3 c75312        	ld	21266,a
3465                     ; 882 }
3468  06f6 81            	ret	
3502                     ; 890 void TIM2_SetCompare2(uint16_t Compare2)
3502                     ; 891 {
3503                     	switch	.text
3504  06f7               _TIM2_SetCompare2:
3508                     ; 893   TIM2->CCR2H = (uint8_t)(Compare2 >> 8);
3510  06f7 9e            	ld	a,xh
3511  06f8 c75313        	ld	21267,a
3512                     ; 894   TIM2->CCR2L = (uint8_t)(Compare2);
3514  06fb 9f            	ld	a,xl
3515  06fc c75314        	ld	21268,a
3516                     ; 895 }
3519  06ff 81            	ret	
3553                     ; 903 void TIM2_SetCompare3(uint16_t Compare3)
3553                     ; 904 {
3554                     	switch	.text
3555  0700               _TIM2_SetCompare3:
3559                     ; 906   TIM2->CCR3H = (uint8_t)(Compare3 >> 8);
3561  0700 9e            	ld	a,xh
3562  0701 c75315        	ld	21269,a
3563                     ; 907   TIM2->CCR3L = (uint8_t)(Compare3);
3565  0704 9f            	ld	a,xl
3566  0705 c75316        	ld	21270,a
3567                     ; 908 }
3570  0708 81            	ret	
3607                     ; 920 void TIM2_SetIC1Prescaler(TIM2_ICPSC_TypeDef TIM2_IC1Prescaler)
3607                     ; 921 {
3608                     	switch	.text
3609  0709               _TIM2_SetIC1Prescaler:
3611  0709 88            	push	a
3612       00000000      OFST:	set	0
3615                     ; 923   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC1Prescaler));
3617  070a 4d            	tnz	a
3618  070b 271a          	jreq	L646
3619  070d a104          	cp	a,#4
3620  070f 2716          	jreq	L646
3621  0711 a108          	cp	a,#8
3622  0713 2712          	jreq	L646
3623  0715 a10c          	cp	a,#12
3624  0717 270e          	jreq	L646
3625  0719 ae039b        	ldw	x,#923
3626  071c 89            	pushw	x
3627  071d 5f            	clrw	x
3628  071e 89            	pushw	x
3629  071f ae0000        	ldw	x,#L702
3630  0722 cd0000        	call	_assert_failed
3632  0725 5b04          	addw	sp,#4
3633  0727               L646:
3634                     ; 926   TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_ICxPSC))
3634                     ; 927                           | (uint8_t)TIM2_IC1Prescaler);
3636  0727 c65307        	ld	a,21255
3637  072a a4f3          	and	a,#243
3638  072c 1a01          	or	a,(OFST+1,sp)
3639  072e c75307        	ld	21255,a
3640                     ; 928 }
3643  0731 84            	pop	a
3644  0732 81            	ret	
3681                     ; 940 void TIM2_SetIC2Prescaler(TIM2_ICPSC_TypeDef TIM2_IC2Prescaler)
3681                     ; 941 {
3682                     	switch	.text
3683  0733               _TIM2_SetIC2Prescaler:
3685  0733 88            	push	a
3686       00000000      OFST:	set	0
3689                     ; 943   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC2Prescaler));
3691  0734 4d            	tnz	a
3692  0735 271a          	jreq	L066
3693  0737 a104          	cp	a,#4
3694  0739 2716          	jreq	L066
3695  073b a108          	cp	a,#8
3696  073d 2712          	jreq	L066
3697  073f a10c          	cp	a,#12
3698  0741 270e          	jreq	L066
3699  0743 ae03af        	ldw	x,#943
3700  0746 89            	pushw	x
3701  0747 5f            	clrw	x
3702  0748 89            	pushw	x
3703  0749 ae0000        	ldw	x,#L702
3704  074c cd0000        	call	_assert_failed
3706  074f 5b04          	addw	sp,#4
3707  0751               L066:
3708                     ; 946   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_ICxPSC))
3708                     ; 947                           | (uint8_t)TIM2_IC2Prescaler);
3710  0751 c65308        	ld	a,21256
3711  0754 a4f3          	and	a,#243
3712  0756 1a01          	or	a,(OFST+1,sp)
3713  0758 c75308        	ld	21256,a
3714                     ; 948 }
3717  075b 84            	pop	a
3718  075c 81            	ret	
3755                     ; 960 void TIM2_SetIC3Prescaler(TIM2_ICPSC_TypeDef TIM2_IC3Prescaler)
3755                     ; 961 {
3756                     	switch	.text
3757  075d               _TIM2_SetIC3Prescaler:
3759  075d 88            	push	a
3760       00000000      OFST:	set	0
3763                     ; 964   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC3Prescaler));
3765  075e 4d            	tnz	a
3766  075f 271a          	jreq	L276
3767  0761 a104          	cp	a,#4
3768  0763 2716          	jreq	L276
3769  0765 a108          	cp	a,#8
3770  0767 2712          	jreq	L276
3771  0769 a10c          	cp	a,#12
3772  076b 270e          	jreq	L276
3773  076d ae03c4        	ldw	x,#964
3774  0770 89            	pushw	x
3775  0771 5f            	clrw	x
3776  0772 89            	pushw	x
3777  0773 ae0000        	ldw	x,#L702
3778  0776 cd0000        	call	_assert_failed
3780  0779 5b04          	addw	sp,#4
3781  077b               L276:
3782                     ; 966   TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_ICxPSC))
3782                     ; 967                           | (uint8_t)TIM2_IC3Prescaler);
3784  077b c65309        	ld	a,21257
3785  077e a4f3          	and	a,#243
3786  0780 1a01          	or	a,(OFST+1,sp)
3787  0782 c75309        	ld	21257,a
3788                     ; 968 }
3791  0785 84            	pop	a
3792  0786 81            	ret	
3844                     ; 975 uint16_t TIM2_GetCapture1(void)
3844                     ; 976 {
3845                     	switch	.text
3846  0787               _TIM2_GetCapture1:
3848  0787 5204          	subw	sp,#4
3849       00000004      OFST:	set	4
3852                     ; 978   uint16_t tmpccr1 = 0;
3854                     ; 979   uint8_t tmpccr1l=0, tmpccr1h=0;
3858                     ; 981   tmpccr1h = TIM2->CCR1H;
3860  0789 c65311        	ld	a,21265
3861  078c 6b02          	ld	(OFST-2,sp),a
3863                     ; 982   tmpccr1l = TIM2->CCR1L;
3865  078e c65312        	ld	a,21266
3866  0791 6b01          	ld	(OFST-3,sp),a
3868                     ; 984   tmpccr1 = (uint16_t)(tmpccr1l);
3870  0793 5f            	clrw	x
3871  0794 97            	ld	xl,a
3872  0795 1f03          	ldw	(OFST-1,sp),x
3874                     ; 985   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
3876  0797 5f            	clrw	x
3877  0798 7b02          	ld	a,(OFST-2,sp)
3878  079a 97            	ld	xl,a
3879  079b 7b04          	ld	a,(OFST+0,sp)
3880  079d 01            	rrwa	x,a
3881  079e 1a03          	or	a,(OFST-1,sp)
3882  07a0 01            	rrwa	x,a
3884                     ; 987   return (uint16_t)tmpccr1;
3888  07a1 5b04          	addw	sp,#4
3889  07a3 81            	ret	
3941                     ; 995 uint16_t TIM2_GetCapture2(void)
3941                     ; 996 {
3942                     	switch	.text
3943  07a4               _TIM2_GetCapture2:
3945  07a4 5204          	subw	sp,#4
3946       00000004      OFST:	set	4
3949                     ; 998   uint16_t tmpccr2 = 0;
3951                     ; 999   uint8_t tmpccr2l=0, tmpccr2h=0;
3955                     ; 1001   tmpccr2h = TIM2->CCR2H;
3957  07a6 c65313        	ld	a,21267
3958  07a9 6b02          	ld	(OFST-2,sp),a
3960                     ; 1002   tmpccr2l = TIM2->CCR2L;
3962  07ab c65314        	ld	a,21268
3963  07ae 6b01          	ld	(OFST-3,sp),a
3965                     ; 1004   tmpccr2 = (uint16_t)(tmpccr2l);
3967  07b0 5f            	clrw	x
3968  07b1 97            	ld	xl,a
3969  07b2 1f03          	ldw	(OFST-1,sp),x
3971                     ; 1005   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
3973  07b4 5f            	clrw	x
3974  07b5 7b02          	ld	a,(OFST-2,sp)
3975  07b7 97            	ld	xl,a
3976  07b8 7b04          	ld	a,(OFST+0,sp)
3977  07ba 01            	rrwa	x,a
3978  07bb 1a03          	or	a,(OFST-1,sp)
3979  07bd 01            	rrwa	x,a
3981                     ; 1007   return (uint16_t)tmpccr2;
3985  07be 5b04          	addw	sp,#4
3986  07c0 81            	ret	
4038                     ; 1015 uint16_t TIM2_GetCapture3(void)
4038                     ; 1016 {
4039                     	switch	.text
4040  07c1               _TIM2_GetCapture3:
4042  07c1 5204          	subw	sp,#4
4043       00000004      OFST:	set	4
4046                     ; 1018   uint16_t tmpccr3 = 0;
4048                     ; 1019   uint8_t tmpccr3l=0, tmpccr3h=0;
4052                     ; 1021   tmpccr3h = TIM2->CCR3H;
4054  07c3 c65315        	ld	a,21269
4055  07c6 6b02          	ld	(OFST-2,sp),a
4057                     ; 1022   tmpccr3l = TIM2->CCR3L;
4059  07c8 c65316        	ld	a,21270
4060  07cb 6b01          	ld	(OFST-3,sp),a
4062                     ; 1024   tmpccr3 = (uint16_t)(tmpccr3l);
4064  07cd 5f            	clrw	x
4065  07ce 97            	ld	xl,a
4066  07cf 1f03          	ldw	(OFST-1,sp),x
4068                     ; 1025   tmpccr3 |= (uint16_t)((uint16_t)tmpccr3h << 8);
4070  07d1 5f            	clrw	x
4071  07d2 7b02          	ld	a,(OFST-2,sp)
4072  07d4 97            	ld	xl,a
4073  07d5 7b04          	ld	a,(OFST+0,sp)
4074  07d7 01            	rrwa	x,a
4075  07d8 1a03          	or	a,(OFST-1,sp)
4076  07da 01            	rrwa	x,a
4078                     ; 1027   return (uint16_t)tmpccr3;
4082  07db 5b04          	addw	sp,#4
4083  07dd 81            	ret	
4117                     ; 1035 uint16_t TIM2_GetCounter(void)
4117                     ; 1036 {
4118                     	switch	.text
4119  07de               _TIM2_GetCounter:
4121  07de 89            	pushw	x
4122       00000002      OFST:	set	2
4125                     ; 1037   uint16_t tmpcntr = 0;
4127                     ; 1039   tmpcntr =  ((uint16_t)TIM2->CNTRH << 8);
4129  07df c6530c        	ld	a,21260
4130  07e2 97            	ld	xl,a
4131  07e3 4f            	clr	a
4132  07e4 02            	rlwa	x,a
4133  07e5 1f01          	ldw	(OFST-1,sp),x
4135                     ; 1041   return (uint16_t)( tmpcntr| (uint16_t)(TIM2->CNTRL));
4137  07e7 c6530d        	ld	a,21261
4138  07ea 5f            	clrw	x
4139  07eb 97            	ld	xl,a
4140  07ec 01            	rrwa	x,a
4141  07ed 1a02          	or	a,(OFST+0,sp)
4142  07ef 01            	rrwa	x,a
4143  07f0 1a01          	or	a,(OFST-1,sp)
4144  07f2 01            	rrwa	x,a
4147  07f3 5b02          	addw	sp,#2
4148  07f5 81            	ret	
4172                     ; 1049 TIM2_Prescaler_TypeDef TIM2_GetPrescaler(void)
4172                     ; 1050 {
4173                     	switch	.text
4174  07f6               _TIM2_GetPrescaler:
4178                     ; 1052   return (TIM2_Prescaler_TypeDef)(TIM2->PSCR);
4180  07f6 c6530e        	ld	a,21262
4183  07f9 81            	ret	
4323                     ; 1068 FlagStatus TIM2_GetFlagStatus(TIM2_FLAG_TypeDef TIM2_FLAG)
4323                     ; 1069 {
4324                     	switch	.text
4325  07fa               _TIM2_GetFlagStatus:
4327  07fa 89            	pushw	x
4328  07fb 89            	pushw	x
4329       00000002      OFST:	set	2
4332                     ; 1070   FlagStatus bitstatus = RESET;
4334                     ; 1071   uint8_t tim2_flag_l = 0, tim2_flag_h = 0;
4338                     ; 1074   assert_param(IS_TIM2_GET_FLAG_OK(TIM2_FLAG));
4340  07fc a30001        	cpw	x,#1
4341  07ff 272c          	jreq	L617
4342  0801 a30002        	cpw	x,#2
4343  0804 2727          	jreq	L617
4344  0806 a30004        	cpw	x,#4
4345  0809 2722          	jreq	L617
4346  080b a30008        	cpw	x,#8
4347  080e 271d          	jreq	L617
4348  0810 a30200        	cpw	x,#512
4349  0813 2718          	jreq	L617
4350  0815 a30400        	cpw	x,#1024
4351  0818 2713          	jreq	L617
4352  081a a30800        	cpw	x,#2048
4353  081d 270e          	jreq	L617
4354  081f ae0432        	ldw	x,#1074
4355  0822 89            	pushw	x
4356  0823 5f            	clrw	x
4357  0824 89            	pushw	x
4358  0825 ae0000        	ldw	x,#L702
4359  0828 cd0000        	call	_assert_failed
4361  082b 5b04          	addw	sp,#4
4362  082d               L617:
4363                     ; 1076   tim2_flag_l = (uint8_t)(TIM2->SR1 & (uint8_t)TIM2_FLAG);
4365  082d c65304        	ld	a,21252
4366  0830 1404          	and	a,(OFST+2,sp)
4367  0832 6b01          	ld	(OFST-1,sp),a
4369                     ; 1077   tim2_flag_h = (uint8_t)((uint16_t)TIM2_FLAG >> 8);
4371  0834 7b03          	ld	a,(OFST+1,sp)
4372  0836 6b02          	ld	(OFST+0,sp),a
4374                     ; 1079   if ((tim2_flag_l | (uint8_t)(TIM2->SR2 & tim2_flag_h)) != (uint8_t)RESET )
4376  0838 c45305        	and	a,21253
4377  083b 1a01          	or	a,(OFST-1,sp)
4378  083d 2702          	jreq	L7371
4379                     ; 1081     bitstatus = SET;
4381  083f a601          	ld	a,#1
4384  0841               L7371:
4385                     ; 1085     bitstatus = RESET;
4388                     ; 1087   return (FlagStatus)bitstatus;
4392  0841 5b04          	addw	sp,#4
4393  0843 81            	ret	
4429                     ; 1103 void TIM2_ClearFlag(TIM2_FLAG_TypeDef TIM2_FLAG)
4429                     ; 1104 {
4430                     	switch	.text
4431  0844               _TIM2_ClearFlag:
4433  0844 89            	pushw	x
4434       00000000      OFST:	set	0
4437                     ; 1106   assert_param(IS_TIM2_CLEAR_FLAG_OK(TIM2_FLAG));
4439  0845 01            	rrwa	x,a
4440  0846 a4f0          	and	a,#240
4441  0848 01            	rrwa	x,a
4442  0849 a4f1          	and	a,#241
4443  084b 01            	rrwa	x,a
4444  084c 5d            	tnzw	x
4445  084d 2604          	jrne	L427
4446  084f 1e01          	ldw	x,(OFST+1,sp)
4447  0851 260e          	jrne	L627
4448  0853               L427:
4449  0853 ae0452        	ldw	x,#1106
4450  0856 89            	pushw	x
4451  0857 5f            	clrw	x
4452  0858 89            	pushw	x
4453  0859 ae0000        	ldw	x,#L702
4454  085c cd0000        	call	_assert_failed
4456  085f 5b04          	addw	sp,#4
4457  0861               L627:
4458                     ; 1109   TIM2->SR1 = (uint8_t)(~((uint8_t)(TIM2_FLAG)));
4460  0861 7b02          	ld	a,(OFST+2,sp)
4461  0863 43            	cpl	a
4462  0864 c75304        	ld	21252,a
4463                     ; 1110   TIM2->SR2 = (uint8_t)(~((uint8_t)((uint8_t)TIM2_FLAG >> 8)));
4465  0867 35ff5305      	mov	21253,#255
4466                     ; 1111 }
4469  086b 85            	popw	x
4470  086c 81            	ret	
4535                     ; 1123 ITStatus TIM2_GetITStatus(TIM2_IT_TypeDef TIM2_IT)
4535                     ; 1124 {
4536                     	switch	.text
4537  086d               _TIM2_GetITStatus:
4539  086d 88            	push	a
4540  086e 89            	pushw	x
4541       00000002      OFST:	set	2
4544                     ; 1125   ITStatus bitstatus = RESET;
4546                     ; 1126   uint8_t TIM2_itStatus = 0, TIM2_itEnable = 0;
4550                     ; 1129   assert_param(IS_TIM2_GET_IT_OK(TIM2_IT));
4552  086f a101          	cp	a,#1
4553  0871 271a          	jreq	L047
4554  0873 a102          	cp	a,#2
4555  0875 2716          	jreq	L047
4556  0877 a104          	cp	a,#4
4557  0879 2712          	jreq	L047
4558  087b a108          	cp	a,#8
4559  087d 270e          	jreq	L047
4560  087f ae0469        	ldw	x,#1129
4561  0882 89            	pushw	x
4562  0883 5f            	clrw	x
4563  0884 89            	pushw	x
4564  0885 ae0000        	ldw	x,#L702
4565  0888 cd0000        	call	_assert_failed
4567  088b 5b04          	addw	sp,#4
4568  088d               L047:
4569                     ; 1131   TIM2_itStatus = (uint8_t)(TIM2->SR1 & TIM2_IT);
4571  088d c65304        	ld	a,21252
4572  0890 1403          	and	a,(OFST+1,sp)
4573  0892 6b01          	ld	(OFST-1,sp),a
4575                     ; 1133   TIM2_itEnable = (uint8_t)(TIM2->IER & TIM2_IT);
4577  0894 c65303        	ld	a,21251
4578  0897 1403          	and	a,(OFST+1,sp)
4579  0899 6b02          	ld	(OFST+0,sp),a
4581                     ; 1135   if ((TIM2_itStatus != (uint8_t)RESET ) && (TIM2_itEnable != (uint8_t)RESET ))
4583  089b 7b01          	ld	a,(OFST-1,sp)
4584  089d 2708          	jreq	L3102
4586  089f 7b02          	ld	a,(OFST+0,sp)
4587  08a1 2704          	jreq	L3102
4588                     ; 1137     bitstatus = SET;
4590  08a3 a601          	ld	a,#1
4593  08a5 2001          	jra	L5102
4594  08a7               L3102:
4595                     ; 1141     bitstatus = RESET;
4597  08a7 4f            	clr	a
4599  08a8               L5102:
4600                     ; 1143   return (ITStatus)(bitstatus);
4604  08a8 5b03          	addw	sp,#3
4605  08aa 81            	ret	
4642                     ; 1156 void TIM2_ClearITPendingBit(TIM2_IT_TypeDef TIM2_IT)
4642                     ; 1157 {
4643                     	switch	.text
4644  08ab               _TIM2_ClearITPendingBit:
4646  08ab 88            	push	a
4647       00000000      OFST:	set	0
4650                     ; 1159   assert_param(IS_TIM2_IT_OK(TIM2_IT));
4652  08ac 4d            	tnz	a
4653  08ad 2704          	jreq	L647
4654  08af a110          	cp	a,#16
4655  08b1 250e          	jrult	L057
4656  08b3               L647:
4657  08b3 ae0487        	ldw	x,#1159
4658  08b6 89            	pushw	x
4659  08b7 5f            	clrw	x
4660  08b8 89            	pushw	x
4661  08b9 ae0000        	ldw	x,#L702
4662  08bc cd0000        	call	_assert_failed
4664  08bf 5b04          	addw	sp,#4
4665  08c1               L057:
4666                     ; 1162   TIM2->SR1 = (uint8_t)(~TIM2_IT);
4668  08c1 7b01          	ld	a,(OFST+1,sp)
4669  08c3 43            	cpl	a
4670  08c4 c75304        	ld	21252,a
4671                     ; 1163 }
4674  08c7 84            	pop	a
4675  08c8 81            	ret	
4727                     ; 1181 static void TI1_Config(uint8_t TIM2_ICPolarity,
4727                     ; 1182                        uint8_t TIM2_ICSelection,
4727                     ; 1183                        uint8_t TIM2_ICFilter)
4727                     ; 1184 {
4728                     	switch	.text
4729  08c9               L3_TI1_Config:
4731  08c9 89            	pushw	x
4732  08ca 88            	push	a
4733       00000001      OFST:	set	1
4736                     ; 1186   TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
4738  08cb 7211530a      	bres	21258,#0
4739                     ; 1189   TIM2->CCMR1  = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~(uint8_t)( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF )))
4739                     ; 1190                            | (uint8_t)(((TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
4741  08cf 7b06          	ld	a,(OFST+5,sp)
4742  08d1 97            	ld	xl,a
4743  08d2 a610          	ld	a,#16
4744  08d4 42            	mul	x,a
4745  08d5 9f            	ld	a,xl
4746  08d6 1a03          	or	a,(OFST+2,sp)
4747  08d8 6b01          	ld	(OFST+0,sp),a
4749  08da c65307        	ld	a,21255
4750  08dd a40c          	and	a,#12
4751  08df 1a01          	or	a,(OFST+0,sp)
4752  08e1 c75307        	ld	21255,a
4753                     ; 1193   if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
4755  08e4 7b02          	ld	a,(OFST+1,sp)
4756  08e6 2706          	jreq	L3602
4757                     ; 1195     TIM2->CCER1 |= TIM2_CCER1_CC1P;
4759  08e8 7212530a      	bset	21258,#1
4761  08ec 2004          	jra	L5602
4762  08ee               L3602:
4763                     ; 1199     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1P);
4765  08ee 7213530a      	bres	21258,#1
4766  08f2               L5602:
4767                     ; 1202   TIM2->CCER1 |= TIM2_CCER1_CC1E;
4769  08f2 7210530a      	bset	21258,#0
4770                     ; 1203 }
4773  08f6 5b03          	addw	sp,#3
4774  08f8 81            	ret	
4826                     ; 1221 static void TI2_Config(uint8_t TIM2_ICPolarity,
4826                     ; 1222                        uint8_t TIM2_ICSelection,
4826                     ; 1223                        uint8_t TIM2_ICFilter)
4826                     ; 1224 {
4827                     	switch	.text
4828  08f9               L5_TI2_Config:
4830  08f9 89            	pushw	x
4831  08fa 88            	push	a
4832       00000001      OFST:	set	1
4835                     ; 1226   TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
4837  08fb 7219530a      	bres	21258,#4
4838                     ; 1229   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~(uint8_t)( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF ))) 
4838                     ; 1230                           | (uint8_t)(( (TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
4840  08ff 7b06          	ld	a,(OFST+5,sp)
4841  0901 97            	ld	xl,a
4842  0902 a610          	ld	a,#16
4843  0904 42            	mul	x,a
4844  0905 9f            	ld	a,xl
4845  0906 1a03          	or	a,(OFST+2,sp)
4846  0908 6b01          	ld	(OFST+0,sp),a
4848  090a c65308        	ld	a,21256
4849  090d a40c          	and	a,#12
4850  090f 1a01          	or	a,(OFST+0,sp)
4851  0911 c75308        	ld	21256,a
4852                     ; 1234   if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
4854  0914 7b02          	ld	a,(OFST+1,sp)
4855  0916 2706          	jreq	L5112
4856                     ; 1236     TIM2->CCER1 |= TIM2_CCER1_CC2P;
4858  0918 721a530a      	bset	21258,#5
4860  091c 2004          	jra	L7112
4861  091e               L5112:
4862                     ; 1240     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2P);
4864  091e 721b530a      	bres	21258,#5
4865  0922               L7112:
4866                     ; 1244   TIM2->CCER1 |= TIM2_CCER1_CC2E;
4868  0922 7218530a      	bset	21258,#4
4869                     ; 1245 }
4872  0926 5b03          	addw	sp,#3
4873  0928 81            	ret	
4925                     ; 1261 static void TI3_Config(uint8_t TIM2_ICPolarity, uint8_t TIM2_ICSelection,
4925                     ; 1262                        uint8_t TIM2_ICFilter)
4925                     ; 1263 {
4926                     	switch	.text
4927  0929               L7_TI3_Config:
4929  0929 89            	pushw	x
4930  092a 88            	push	a
4931       00000001      OFST:	set	1
4934                     ; 1265   TIM2->CCER2 &=  (uint8_t)(~TIM2_CCER2_CC3E);
4936  092b 7211530b      	bres	21259,#0
4937                     ; 1268   TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF))) 
4937                     ; 1269                           | (uint8_t)(( (TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
4939  092f 7b06          	ld	a,(OFST+5,sp)
4940  0931 97            	ld	xl,a
4941  0932 a610          	ld	a,#16
4942  0934 42            	mul	x,a
4943  0935 9f            	ld	a,xl
4944  0936 1a03          	or	a,(OFST+2,sp)
4945  0938 6b01          	ld	(OFST+0,sp),a
4947  093a c65309        	ld	a,21257
4948  093d a40c          	and	a,#12
4949  093f 1a01          	or	a,(OFST+0,sp)
4950  0941 c75309        	ld	21257,a
4951                     ; 1273   if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
4953  0944 7b02          	ld	a,(OFST+1,sp)
4954  0946 2706          	jreq	L7412
4955                     ; 1275     TIM2->CCER2 |= TIM2_CCER2_CC3P;
4957  0948 7212530b      	bset	21259,#1
4959  094c 2004          	jra	L1512
4960  094e               L7412:
4961                     ; 1279     TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3P);
4963  094e 7213530b      	bres	21259,#1
4964  0952               L1512:
4965                     ; 1282   TIM2->CCER2 |= TIM2_CCER2_CC3E;
4967  0952 7210530b      	bset	21259,#0
4968                     ; 1283 }
4971  0956 5b03          	addw	sp,#3
4972  0958 81            	ret	
4985                     	xdef	_TIM2_ClearITPendingBit
4986                     	xdef	_TIM2_GetITStatus
4987                     	xdef	_TIM2_ClearFlag
4988                     	xdef	_TIM2_GetFlagStatus
4989                     	xdef	_TIM2_GetPrescaler
4990                     	xdef	_TIM2_GetCounter
4991                     	xdef	_TIM2_GetCapture3
4992                     	xdef	_TIM2_GetCapture2
4993                     	xdef	_TIM2_GetCapture1
4994                     	xdef	_TIM2_SetIC3Prescaler
4995                     	xdef	_TIM2_SetIC2Prescaler
4996                     	xdef	_TIM2_SetIC1Prescaler
4997                     	xdef	_TIM2_SetCompare3
4998                     	xdef	_TIM2_SetCompare2
4999                     	xdef	_TIM2_SetCompare1
5000                     	xdef	_TIM2_SetAutoreload
5001                     	xdef	_TIM2_SetCounter
5002                     	xdef	_TIM2_SelectOCxM
5003                     	xdef	_TIM2_CCxCmd
5004                     	xdef	_TIM2_OC3PolarityConfig
5005                     	xdef	_TIM2_OC2PolarityConfig
5006                     	xdef	_TIM2_OC1PolarityConfig
5007                     	xdef	_TIM2_GenerateEvent
5008                     	xdef	_TIM2_OC3PreloadConfig
5009                     	xdef	_TIM2_OC2PreloadConfig
5010                     	xdef	_TIM2_OC1PreloadConfig
5011                     	xdef	_TIM2_ARRPreloadConfig
5012                     	xdef	_TIM2_ForcedOC3Config
5013                     	xdef	_TIM2_ForcedOC2Config
5014                     	xdef	_TIM2_ForcedOC1Config
5015                     	xdef	_TIM2_PrescalerConfig
5016                     	xdef	_TIM2_SelectOnePulseMode
5017                     	xdef	_TIM2_UpdateRequestConfig
5018                     	xdef	_TIM2_UpdateDisableConfig
5019                     	xdef	_TIM2_ITConfig
5020                     	xdef	_TIM2_Cmd
5021                     	xdef	_TIM2_PWMIConfig
5022                     	xdef	_TIM2_ICInit
5023                     	xdef	_TIM2_OC3Init
5024                     	xdef	_TIM2_OC2Init
5025                     	xdef	_TIM2_OC1Init
5026                     	xdef	_TIM2_TimeBaseInit
5027                     	xdef	_TIM2_DeInit
5028                     	xref	_assert_failed
5029                     .const:	section	.text
5030  0000               L702:
5031  0000 2e2e5c2e2e5c  	dc.b	"..\..\stm8s_spl\li"
5032  0012 627261726965  	dc.b	"braries\stm8s_stdp"
5033  0024 65726970685f  	dc.b	"eriph_driver\src\s"
5034  0036 746d38735f74  	dc.b	"tm8s_tim2.c",0
5054                     	end
