   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.3 - 22 Aug 2024
   4                     ; Optimizer V4.6.3 - 22 Aug 2024
  19                     .const:	section	.text
  20  0000               _HSIDivFactor:
  21  0000 01            	dc.b	1
  22  0001 02            	dc.b	2
  23  0002 04            	dc.b	4
  24  0003 08            	dc.b	8
  25  0004               _CLKPrescTable:
  26  0004 01            	dc.b	1
  27  0005 02            	dc.b	2
  28  0006 04            	dc.b	4
  29  0007 08            	dc.b	8
  30  0008 0a            	dc.b	10
  31  0009 10            	dc.b	16
  32  000a 14            	dc.b	20
  33  000b 28            	dc.b	40
  62                     ; 72 void CLK_DeInit(void)
  62                     ; 73 {
  64                     	switch	.text
  65  0000               _CLK_DeInit:
  69                     ; 74   CLK->ICKR = CLK_ICKR_RESET_VALUE;
  71  0000 350150c0      	mov	20672,#1
  72                     ; 75   CLK->ECKR = CLK_ECKR_RESET_VALUE;
  74  0004 725f50c1      	clr	20673
  75                     ; 76   CLK->SWR  = CLK_SWR_RESET_VALUE;
  77  0008 35e150c4      	mov	20676,#225
  78                     ; 77   CLK->SWCR = CLK_SWCR_RESET_VALUE;
  80  000c 725f50c5      	clr	20677
  81                     ; 78   CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
  83  0010 351850c6      	mov	20678,#24
  84                     ; 79   CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
  86  0014 35ff50c7      	mov	20679,#255
  87                     ; 80   CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
  89  0018 35ff50ca      	mov	20682,#255
  90                     ; 81   CLK->CSSR = CLK_CSSR_RESET_VALUE;
  92  001c 725f50c8      	clr	20680
  93                     ; 82   CLK->CCOR = CLK_CCOR_RESET_VALUE;
  95  0020 725f50c9      	clr	20681
  97  0024               L52:
  98                     ; 83   while ((CLK->CCOR & CLK_CCOR_CCOEN)!= 0)
 100  0024 720050c9fb    	btjt	20681,#0,L52
 101                     ; 85   CLK->CCOR = CLK_CCOR_RESET_VALUE;
 103  0029 725f50c9      	clr	20681
 104                     ; 86   CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
 106  002d 725f50cc      	clr	20684
 107                     ; 87   CLK->SWIMCCR = CLK_SWIMCCR_RESET_VALUE;
 109  0031 725f50cd      	clr	20685
 110                     ; 88 }
 113  0035 81            	ret	
 170                     ; 99 void CLK_FastHaltWakeUpCmd(FunctionalState NewState)
 170                     ; 100 {
 171                     	switch	.text
 172  0036               _CLK_FastHaltWakeUpCmd:
 174  0036 88            	push	a
 175       00000000      OFST:	set	0
 178                     ; 102   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 180  0037 4d            	tnz	a
 181  0038 2711          	jreq	L41
 182  003a 4a            	dec	a
 183  003b 270e          	jreq	L41
 184  003d ae0066        	ldw	x,#102
 185  0040 89            	pushw	x
 186  0041 5f            	clrw	x
 187  0042 89            	pushw	x
 188  0043 ae000c        	ldw	x,#L75
 189  0046 cd0000        	call	_assert_failed
 191  0049 5b04          	addw	sp,#4
 192  004b               L41:
 193                     ; 104   if (NewState != DISABLE)
 195  004b 7b01          	ld	a,(OFST+1,sp)
 196  004d 2706          	jreq	L16
 197                     ; 107     CLK->ICKR |= CLK_ICKR_FHWU;
 199  004f 721450c0      	bset	20672,#2
 201  0053 2004          	jra	L36
 202  0055               L16:
 203                     ; 112     CLK->ICKR &= (uint8_t)(~CLK_ICKR_FHWU);
 205  0055 721550c0      	bres	20672,#2
 206  0059               L36:
 207                     ; 114 }
 210  0059 84            	pop	a
 211  005a 81            	ret	
 247                     ; 121 void CLK_HSECmd(FunctionalState NewState)
 247                     ; 122 {
 248                     	switch	.text
 249  005b               _CLK_HSECmd:
 251  005b 88            	push	a
 252       00000000      OFST:	set	0
 255                     ; 124   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 257  005c 4d            	tnz	a
 258  005d 2711          	jreq	L62
 259  005f 4a            	dec	a
 260  0060 270e          	jreq	L62
 261  0062 ae007c        	ldw	x,#124
 262  0065 89            	pushw	x
 263  0066 5f            	clrw	x
 264  0067 89            	pushw	x
 265  0068 ae000c        	ldw	x,#L75
 266  006b cd0000        	call	_assert_failed
 268  006e 5b04          	addw	sp,#4
 269  0070               L62:
 270                     ; 126   if (NewState != DISABLE)
 272  0070 7b01          	ld	a,(OFST+1,sp)
 273  0072 2706          	jreq	L301
 274                     ; 129     CLK->ECKR |= CLK_ECKR_HSEEN;
 276  0074 721050c1      	bset	20673,#0
 278  0078 2004          	jra	L501
 279  007a               L301:
 280                     ; 134     CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
 282  007a 721150c1      	bres	20673,#0
 283  007e               L501:
 284                     ; 136 }
 287  007e 84            	pop	a
 288  007f 81            	ret	
 324                     ; 143 void CLK_HSICmd(FunctionalState NewState)
 324                     ; 144 {
 325                     	switch	.text
 326  0080               _CLK_HSICmd:
 328  0080 88            	push	a
 329       00000000      OFST:	set	0
 332                     ; 146   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 334  0081 4d            	tnz	a
 335  0082 2711          	jreq	L04
 336  0084 4a            	dec	a
 337  0085 270e          	jreq	L04
 338  0087 ae0092        	ldw	x,#146
 339  008a 89            	pushw	x
 340  008b 5f            	clrw	x
 341  008c 89            	pushw	x
 342  008d ae000c        	ldw	x,#L75
 343  0090 cd0000        	call	_assert_failed
 345  0093 5b04          	addw	sp,#4
 346  0095               L04:
 347                     ; 148   if (NewState != DISABLE)
 349  0095 7b01          	ld	a,(OFST+1,sp)
 350  0097 2706          	jreq	L521
 351                     ; 151     CLK->ICKR |= CLK_ICKR_HSIEN;
 353  0099 721050c0      	bset	20672,#0
 355  009d 2004          	jra	L721
 356  009f               L521:
 357                     ; 156     CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
 359  009f 721150c0      	bres	20672,#0
 360  00a3               L721:
 361                     ; 158 }
 364  00a3 84            	pop	a
 365  00a4 81            	ret	
 401                     ; 166 void CLK_LSICmd(FunctionalState NewState)
 401                     ; 167 {
 402                     	switch	.text
 403  00a5               _CLK_LSICmd:
 405  00a5 88            	push	a
 406       00000000      OFST:	set	0
 409                     ; 169   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 411  00a6 4d            	tnz	a
 412  00a7 2711          	jreq	L25
 413  00a9 4a            	dec	a
 414  00aa 270e          	jreq	L25
 415  00ac ae00a9        	ldw	x,#169
 416  00af 89            	pushw	x
 417  00b0 5f            	clrw	x
 418  00b1 89            	pushw	x
 419  00b2 ae000c        	ldw	x,#L75
 420  00b5 cd0000        	call	_assert_failed
 422  00b8 5b04          	addw	sp,#4
 423  00ba               L25:
 424                     ; 171   if (NewState != DISABLE)
 426  00ba 7b01          	ld	a,(OFST+1,sp)
 427  00bc 2706          	jreq	L741
 428                     ; 174     CLK->ICKR |= CLK_ICKR_LSIEN;
 430  00be 721650c0      	bset	20672,#3
 432  00c2 2004          	jra	L151
 433  00c4               L741:
 434                     ; 179     CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
 436  00c4 721750c0      	bres	20672,#3
 437  00c8               L151:
 438                     ; 181 }
 441  00c8 84            	pop	a
 442  00c9 81            	ret	
 478                     ; 189 void CLK_CCOCmd(FunctionalState NewState)
 478                     ; 190 {
 479                     	switch	.text
 480  00ca               _CLK_CCOCmd:
 482  00ca 88            	push	a
 483       00000000      OFST:	set	0
 486                     ; 192   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 488  00cb 4d            	tnz	a
 489  00cc 2711          	jreq	L46
 490  00ce 4a            	dec	a
 491  00cf 270e          	jreq	L46
 492  00d1 ae00c0        	ldw	x,#192
 493  00d4 89            	pushw	x
 494  00d5 5f            	clrw	x
 495  00d6 89            	pushw	x
 496  00d7 ae000c        	ldw	x,#L75
 497  00da cd0000        	call	_assert_failed
 499  00dd 5b04          	addw	sp,#4
 500  00df               L46:
 501                     ; 194   if (NewState != DISABLE)
 503  00df 7b01          	ld	a,(OFST+1,sp)
 504  00e1 2706          	jreq	L171
 505                     ; 197     CLK->CCOR |= CLK_CCOR_CCOEN;
 507  00e3 721050c9      	bset	20681,#0
 509  00e7 2004          	jra	L371
 510  00e9               L171:
 511                     ; 202     CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOEN);
 513  00e9 721150c9      	bres	20681,#0
 514  00ed               L371:
 515                     ; 204 }
 518  00ed 84            	pop	a
 519  00ee 81            	ret	
 555                     ; 213 void CLK_ClockSwitchCmd(FunctionalState NewState)
 555                     ; 214 {
 556                     	switch	.text
 557  00ef               _CLK_ClockSwitchCmd:
 559  00ef 88            	push	a
 560       00000000      OFST:	set	0
 563                     ; 216   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 565  00f0 4d            	tnz	a
 566  00f1 2711          	jreq	L67
 567  00f3 4a            	dec	a
 568  00f4 270e          	jreq	L67
 569  00f6 ae00d8        	ldw	x,#216
 570  00f9 89            	pushw	x
 571  00fa 5f            	clrw	x
 572  00fb 89            	pushw	x
 573  00fc ae000c        	ldw	x,#L75
 574  00ff cd0000        	call	_assert_failed
 576  0102 5b04          	addw	sp,#4
 577  0104               L67:
 578                     ; 218   if (NewState != DISABLE )
 580  0104 7b01          	ld	a,(OFST+1,sp)
 581  0106 2706          	jreq	L312
 582                     ; 221     CLK->SWCR |= CLK_SWCR_SWEN;
 584  0108 721250c5      	bset	20677,#1
 586  010c 2004          	jra	L512
 587  010e               L312:
 588                     ; 226     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWEN);
 590  010e 721350c5      	bres	20677,#1
 591  0112               L512:
 592                     ; 228 }
 595  0112 84            	pop	a
 596  0113 81            	ret	
 633                     ; 238 void CLK_SlowActiveHaltWakeUpCmd(FunctionalState NewState)
 633                     ; 239 {
 634                     	switch	.text
 635  0114               _CLK_SlowActiveHaltWakeUpCmd:
 637  0114 88            	push	a
 638       00000000      OFST:	set	0
 641                     ; 241   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 643  0115 4d            	tnz	a
 644  0116 2711          	jreq	L011
 645  0118 4a            	dec	a
 646  0119 270e          	jreq	L011
 647  011b ae00f1        	ldw	x,#241
 648  011e 89            	pushw	x
 649  011f 5f            	clrw	x
 650  0120 89            	pushw	x
 651  0121 ae000c        	ldw	x,#L75
 652  0124 cd0000        	call	_assert_failed
 654  0127 5b04          	addw	sp,#4
 655  0129               L011:
 656                     ; 243   if (NewState != DISABLE)
 658  0129 7b01          	ld	a,(OFST+1,sp)
 659  012b 2706          	jreq	L532
 660                     ; 246     CLK->ICKR |= CLK_ICKR_SWUAH;
 662  012d 721a50c0      	bset	20672,#5
 664  0131 2004          	jra	L732
 665  0133               L532:
 666                     ; 251     CLK->ICKR &= (uint8_t)(~CLK_ICKR_SWUAH);
 668  0133 721b50c0      	bres	20672,#5
 669  0137               L732:
 670                     ; 253 }
 673  0137 84            	pop	a
 674  0138 81            	ret	
 834                     ; 263 void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
 834                     ; 264 {
 835                     	switch	.text
 836  0139               _CLK_PeripheralClockConfig:
 838  0139 89            	pushw	x
 839       00000000      OFST:	set	0
 842                     ; 266   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 844  013a 9f            	ld	a,xl
 845  013b 4d            	tnz	a
 846  013c 270a          	jreq	L221
 847  013e 9f            	ld	a,xl
 848  013f 4a            	dec	a
 849  0140 2706          	jreq	L221
 850  0142 ae010a        	ldw	x,#266
 851  0145 cd01cb        	call	LC004
 852  0148               L221:
 853                     ; 267   assert_param(IS_CLK_PERIPHERAL_OK(CLK_Peripheral));
 855  0148 7b01          	ld	a,(OFST+1,sp)
 856  014a 272f          	jreq	L231
 857  014c a101          	cp	a,#1
 858  014e 272b          	jreq	L231
 859  0150 a103          	cp	a,#3
 860  0152 2727          	jreq	L231
 861  0154 a104          	cp	a,#4
 862  0156 2723          	jreq	L231
 863  0158 a105          	cp	a,#5
 864  015a 271f          	jreq	L231
 865  015c a104          	cp	a,#4
 866  015e 271b          	jreq	L231
 867  0160 a106          	cp	a,#6
 868  0162 2717          	jreq	L231
 869  0164 a107          	cp	a,#7
 870  0166 2713          	jreq	L231
 871  0168 a117          	cp	a,#23
 872  016a 270f          	jreq	L231
 873  016c a113          	cp	a,#19
 874  016e 270b          	jreq	L231
 875  0170 a112          	cp	a,#18
 876  0172 2707          	jreq	L231
 877  0174 ae010b        	ldw	x,#267
 878  0177 ad52          	call	LC004
 879  0179 7b01          	ld	a,(OFST+1,sp)
 880  017b               L231:
 881                     ; 269   if (((uint8_t)CLK_Peripheral & (uint8_t)0x10) == 0x00)
 883  017b a510          	bcp	a,#16
 884  017d 2622          	jrne	L323
 885                     ; 271     if (NewState != DISABLE)
 887  017f 0d02          	tnz	(OFST+2,sp)
 888  0181 270d          	jreq	L523
 889                     ; 274       CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
 891  0183 ad3e          	call	LC003
 892  0185 2704          	jreq	L631
 893  0187               L041:
 894  0187 48            	sll	a
 895  0188 5a            	decw	x
 896  0189 26fc          	jrne	L041
 897  018b               L631:
 898  018b ca50c7        	or	a,20679
 900  018e 200c          	jp	LC002
 901  0190               L523:
 902                     ; 279       CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
 904  0190 ad31          	call	LC003
 905  0192 2704          	jreq	L241
 906  0194               L441:
 907  0194 48            	sll	a
 908  0195 5a            	decw	x
 909  0196 26fc          	jrne	L441
 910  0198               L241:
 911  0198 43            	cpl	a
 912  0199 c450c7        	and	a,20679
 913  019c               LC002:
 914  019c c750c7        	ld	20679,a
 915  019f 2020          	jra	L133
 916  01a1               L323:
 917                     ; 284     if (NewState != DISABLE)
 919  01a1 0d02          	tnz	(OFST+2,sp)
 920  01a3 270d          	jreq	L333
 921                     ; 287       CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
 923  01a5 ad1c          	call	LC003
 924  01a7 2704          	jreq	L641
 925  01a9               L051:
 926  01a9 48            	sll	a
 927  01aa 5a            	decw	x
 928  01ab 26fc          	jrne	L051
 929  01ad               L641:
 930  01ad ca50ca        	or	a,20682
 932  01b0 200c          	jp	LC001
 933  01b2               L333:
 934                     ; 292       CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
 936  01b2 ad0f          	call	LC003
 937  01b4 2704          	jreq	L251
 938  01b6               L451:
 939  01b6 48            	sll	a
 940  01b7 5a            	decw	x
 941  01b8 26fc          	jrne	L451
 942  01ba               L251:
 943  01ba 43            	cpl	a
 944  01bb c450ca        	and	a,20682
 945  01be               LC001:
 946  01be c750ca        	ld	20682,a
 947  01c1               L133:
 948                     ; 295 }
 951  01c1 85            	popw	x
 952  01c2 81            	ret	
 953  01c3               LC003:
 954  01c3 a40f          	and	a,#15
 955  01c5 5f            	clrw	x
 956  01c6 97            	ld	xl,a
 957  01c7 a601          	ld	a,#1
 958  01c9 5d            	tnzw	x
 959  01ca 81            	ret	
 960  01cb               LC004:
 961  01cb 89            	pushw	x
 962  01cc 5f            	clrw	x
 963  01cd 89            	pushw	x
 964  01ce ae000c        	ldw	x,#L75
 965  01d1 cd0000        	call	_assert_failed
 967  01d4 5b04          	addw	sp,#4
 968  01d6 81            	ret	
1157                     ; 309 ErrorStatus CLK_ClockSwitchConfig(CLK_SwitchMode_TypeDef CLK_SwitchMode, CLK_Source_TypeDef CLK_NewClock, FunctionalState ITState, CLK_CurrentClockState_TypeDef CLK_CurrentClockState)
1157                     ; 310 {
1158                     	switch	.text
1159  01d7               _CLK_ClockSwitchConfig:
1161  01d7 89            	pushw	x
1162  01d8 5204          	subw	sp,#4
1163       00000004      OFST:	set	4
1166                     ; 312   uint16_t DownCounter = CLK_TIMEOUT;
1168  01da aeffff        	ldw	x,#65535
1169  01dd 1f03          	ldw	(OFST-1,sp),x
1171                     ; 313   ErrorStatus Swif = ERROR;
1173                     ; 316   assert_param(IS_CLK_SOURCE_OK(CLK_NewClock));
1175  01df 7b06          	ld	a,(OFST+2,sp)
1176  01e1 a1e1          	cp	a,#225
1177  01e3 270e          	jreq	L461
1178  01e5 a1d2          	cp	a,#210
1179  01e7 270a          	jreq	L461
1180  01e9 a1b4          	cp	a,#180
1181  01eb 2706          	jreq	L461
1182  01ed ae013c        	ldw	x,#316
1183  01f0 cd02b3        	call	LC007
1184  01f3               L461:
1185                     ; 317   assert_param(IS_CLK_SWITCHMODE_OK(CLK_SwitchMode));
1187  01f3 7b05          	ld	a,(OFST+1,sp)
1188  01f5 2709          	jreq	L471
1189  01f7 4a            	dec	a
1190  01f8 2706          	jreq	L471
1191  01fa ae013d        	ldw	x,#317
1192  01fd cd02b3        	call	LC007
1193  0200               L471:
1194                     ; 318   assert_param(IS_FUNCTIONALSTATE_OK(ITState));
1196  0200 7b09          	ld	a,(OFST+5,sp)
1197  0202 2709          	jreq	L402
1198  0204 4a            	dec	a
1199  0205 2706          	jreq	L402
1200  0207 ae013e        	ldw	x,#318
1201  020a cd02b3        	call	LC007
1202  020d               L402:
1203                     ; 319   assert_param(IS_CLK_CURRENTCLOCKSTATE_OK(CLK_CurrentClockState));
1205  020d 7b0a          	ld	a,(OFST+6,sp)
1206  020f 2709          	jreq	L412
1207  0211 4a            	dec	a
1208  0212 2706          	jreq	L412
1209  0214 ae013f        	ldw	x,#319
1210  0217 cd02b3        	call	LC007
1211  021a               L412:
1212                     ; 322   clock_master = (CLK_Source_TypeDef)CLK->CMSR;
1214  021a c650c3        	ld	a,20675
1215  021d 6b01          	ld	(OFST-3,sp),a
1217                     ; 325   if (CLK_SwitchMode == CLK_SWITCHMODE_AUTO)
1219  021f 7b05          	ld	a,(OFST+1,sp)
1220  0221 4a            	dec	a
1221  0222 263d          	jrne	L744
1222                     ; 328     CLK->SWCR |= CLK_SWCR_SWEN;
1224  0224 721250c5      	bset	20677,#1
1225                     ; 331     if (ITState != DISABLE)
1227  0228 7b09          	ld	a,(OFST+5,sp)
1228  022a 2706          	jreq	L154
1229                     ; 333       CLK->SWCR |= CLK_SWCR_SWIEN;
1231  022c 721450c5      	bset	20677,#2
1233  0230 2004          	jra	L354
1234  0232               L154:
1235                     ; 337       CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
1237  0232 721550c5      	bres	20677,#2
1238  0236               L354:
1239                     ; 341     CLK->SWR = (uint8_t)CLK_NewClock;
1241  0236 7b06          	ld	a,(OFST+2,sp)
1242  0238 c750c4        	ld	20676,a
1244  023b 2003          	jra	L164
1245  023d               L554:
1246                     ; 346       DownCounter--;
1248  023d 5a            	decw	x
1249  023e 1f03          	ldw	(OFST-1,sp),x
1251  0240               L164:
1252                     ; 344     while((((CLK->SWCR & CLK_SWCR_SWBSY) != 0 )&& (DownCounter != 0)))
1254  0240 720150c504    	btjf	20677,#0,L564
1256  0245 1e03          	ldw	x,(OFST-1,sp)
1257  0247 26f4          	jrne	L554
1258  0249               L564:
1259                     ; 349     if(DownCounter != 0)
1261  0249 1e03          	ldw	x,(OFST-1,sp)
1262                     ; 351       Swif = SUCCESS;
1264  024b 263d          	jrne	LC006
1265  024d               L764:
1266                     ; 355       Swif = ERROR;
1269  024d 0f02          	clr	(OFST-2,sp)
1271  024f               L374:
1272                     ; 390   if(Swif != ERROR)
1274  024f 275d          	jreq	L715
1275                     ; 393     if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSI))
1277  0251 7b0a          	ld	a,(OFST+6,sp)
1278  0253 263b          	jrne	L125
1280  0255 7b01          	ld	a,(OFST-3,sp)
1281  0257 a1e1          	cp	a,#225
1282  0259 2635          	jrne	L125
1283                     ; 395       CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
1285  025b 721150c0      	bres	20672,#0
1287  025f 204d          	jra	L715
1288  0261               L744:
1289                     ; 361     if (ITState != DISABLE)
1291  0261 7b09          	ld	a,(OFST+5,sp)
1292  0263 2706          	jreq	L574
1293                     ; 363       CLK->SWCR |= CLK_SWCR_SWIEN;
1295  0265 721450c5      	bset	20677,#2
1297  0269 2004          	jra	L774
1298  026b               L574:
1299                     ; 367       CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
1301  026b 721550c5      	bres	20677,#2
1302  026f               L774:
1303                     ; 371     CLK->SWR = (uint8_t)CLK_NewClock;
1305  026f 7b06          	ld	a,(OFST+2,sp)
1306  0271 c750c4        	ld	20676,a
1308  0274 2003          	jra	L505
1309  0276               L105:
1310                     ; 376       DownCounter--;
1312  0276 5a            	decw	x
1313  0277 1f03          	ldw	(OFST-1,sp),x
1315  0279               L505:
1316                     ; 374     while((((CLK->SWCR & CLK_SWCR_SWIF) != 0 ) && (DownCounter != 0)))
1318  0279 720750c504    	btjf	20677,#3,L115
1320  027e 1e03          	ldw	x,(OFST-1,sp)
1321  0280 26f4          	jrne	L105
1322  0282               L115:
1323                     ; 379     if(DownCounter != 0)
1325  0282 1e03          	ldw	x,(OFST-1,sp)
1326  0284 27c7          	jreq	L764
1327                     ; 382       CLK->SWCR |= CLK_SWCR_SWEN;
1329  0286 721250c5      	bset	20677,#1
1330                     ; 383       Swif = SUCCESS;
1332  028a               LC006:
1334  028a a601          	ld	a,#1
1335  028c 6b02          	ld	(OFST-2,sp),a
1338  028e 20bf          	jra	L374
1339                     ; 387       Swif = ERROR;
1340  0290               L125:
1341                     ; 397     else if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_LSI))
1343  0290 7b0a          	ld	a,(OFST+6,sp)
1344  0292 260c          	jrne	L525
1346  0294 7b01          	ld	a,(OFST-3,sp)
1347  0296 a1d2          	cp	a,#210
1348  0298 2606          	jrne	L525
1349                     ; 399       CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
1351  029a 721750c0      	bres	20672,#3
1353  029e 200e          	jra	L715
1354  02a0               L525:
1355                     ; 401     else if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSE))
1357  02a0 7b0a          	ld	a,(OFST+6,sp)
1358  02a2 260a          	jrne	L715
1360  02a4 7b01          	ld	a,(OFST-3,sp)
1361  02a6 a1b4          	cp	a,#180
1362  02a8 2604          	jrne	L715
1363                     ; 403       CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
1365  02aa 721150c1      	bres	20673,#0
1366  02ae               L715:
1367                     ; 406   return(Swif);
1369  02ae 7b02          	ld	a,(OFST-2,sp)
1372  02b0 5b06          	addw	sp,#6
1373  02b2 81            	ret	
1374  02b3               LC007:
1375  02b3 89            	pushw	x
1376  02b4 5f            	clrw	x
1377  02b5 89            	pushw	x
1378  02b6 ae000c        	ldw	x,#L75
1379  02b9 cd0000        	call	_assert_failed
1381  02bc 5b04          	addw	sp,#4
1382  02be 81            	ret	
1521                     ; 415 void CLK_HSIPrescalerConfig(CLK_Prescaler_TypeDef HSIPrescaler)
1521                     ; 416 {
1522                     	switch	.text
1523  02bf               _CLK_HSIPrescalerConfig:
1525  02bf 88            	push	a
1526       00000000      OFST:	set	0
1529                     ; 418   assert_param(IS_CLK_HSIPRESCALER_OK(HSIPrescaler));
1531  02c0 4d            	tnz	a
1532  02c1 271a          	jreq	L622
1533  02c3 a108          	cp	a,#8
1534  02c5 2716          	jreq	L622
1535  02c7 a110          	cp	a,#16
1536  02c9 2712          	jreq	L622
1537  02cb a118          	cp	a,#24
1538  02cd 270e          	jreq	L622
1539  02cf ae01a2        	ldw	x,#418
1540  02d2 89            	pushw	x
1541  02d3 5f            	clrw	x
1542  02d4 89            	pushw	x
1543  02d5 ae000c        	ldw	x,#L75
1544  02d8 cd0000        	call	_assert_failed
1546  02db 5b04          	addw	sp,#4
1547  02dd               L622:
1548                     ; 421   CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
1550  02dd c650c6        	ld	a,20678
1551  02e0 a4e7          	and	a,#231
1552  02e2 c750c6        	ld	20678,a
1553                     ; 424   CLK->CKDIVR |= (uint8_t)HSIPrescaler;
1555  02e5 c650c6        	ld	a,20678
1556  02e8 1a01          	or	a,(OFST+1,sp)
1557  02ea c750c6        	ld	20678,a
1558                     ; 425 }
1561  02ed 84            	pop	a
1562  02ee 81            	ret	
1698                     ; 436 void CLK_CCOConfig(CLK_Output_TypeDef CLK_CCO)
1698                     ; 437 {
1699                     	switch	.text
1700  02ef               _CLK_CCOConfig:
1702  02ef 88            	push	a
1703       00000000      OFST:	set	0
1706                     ; 439   assert_param(IS_CLK_OUTPUT_OK(CLK_CCO));
1708  02f0 4d            	tnz	a
1709  02f1 273e          	jreq	L042
1710  02f3 a104          	cp	a,#4
1711  02f5 273a          	jreq	L042
1712  02f7 a102          	cp	a,#2
1713  02f9 2736          	jreq	L042
1714  02fb a108          	cp	a,#8
1715  02fd 2732          	jreq	L042
1716  02ff a10a          	cp	a,#10
1717  0301 272e          	jreq	L042
1718  0303 a10c          	cp	a,#12
1719  0305 272a          	jreq	L042
1720  0307 a10e          	cp	a,#14
1721  0309 2726          	jreq	L042
1722  030b a110          	cp	a,#16
1723  030d 2722          	jreq	L042
1724  030f a112          	cp	a,#18
1725  0311 271e          	jreq	L042
1726  0313 a114          	cp	a,#20
1727  0315 271a          	jreq	L042
1728  0317 a116          	cp	a,#22
1729  0319 2716          	jreq	L042
1730  031b a118          	cp	a,#24
1731  031d 2712          	jreq	L042
1732  031f a11a          	cp	a,#26
1733  0321 270e          	jreq	L042
1734  0323 ae01b7        	ldw	x,#439
1735  0326 89            	pushw	x
1736  0327 5f            	clrw	x
1737  0328 89            	pushw	x
1738  0329 ae000c        	ldw	x,#L75
1739  032c cd0000        	call	_assert_failed
1741  032f 5b04          	addw	sp,#4
1742  0331               L042:
1743                     ; 442   CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOSEL);
1745  0331 c650c9        	ld	a,20681
1746  0334 a4e1          	and	a,#225
1747  0336 c750c9        	ld	20681,a
1748                     ; 445   CLK->CCOR |= (uint8_t)CLK_CCO;
1750  0339 c650c9        	ld	a,20681
1751  033c 1a01          	or	a,(OFST+1,sp)
1752  033e c750c9        	ld	20681,a
1753                     ; 448   CLK->CCOR |= CLK_CCOR_CCOEN;
1755  0341 721050c9      	bset	20681,#0
1756                     ; 449 }
1759  0345 84            	pop	a
1760  0346 81            	ret	
1826                     ; 459 void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState NewState)
1826                     ; 460 {
1827                     	switch	.text
1828  0347               _CLK_ITConfig:
1830  0347 89            	pushw	x
1831       00000000      OFST:	set	0
1834                     ; 462   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1836  0348 9f            	ld	a,xl
1837  0349 4d            	tnz	a
1838  034a 2709          	jreq	L252
1839  034c 9f            	ld	a,xl
1840  034d 4a            	dec	a
1841  034e 2705          	jreq	L252
1842  0350 ae01ce        	ldw	x,#462
1843  0353 ad3f          	call	LC008
1844  0355               L252:
1845                     ; 463   assert_param(IS_CLK_IT_OK(CLK_IT));
1847  0355 7b01          	ld	a,(OFST+1,sp)
1848  0357 a10c          	cp	a,#12
1849  0359 2709          	jreq	L262
1850  035b a11c          	cp	a,#28
1851  035d 2705          	jreq	L262
1852  035f ae01cf        	ldw	x,#463
1853  0362 ad30          	call	LC008
1854  0364               L262:
1855                     ; 465   if (NewState != DISABLE)
1857  0364 7b02          	ld	a,(OFST+2,sp)
1858  0366 2716          	jreq	L727
1859                     ; 467     switch (CLK_IT)
1861  0368 7b01          	ld	a,(OFST+1,sp)
1863                     ; 475     default:
1863                     ; 476       break;
1864  036a a00c          	sub	a,#12
1865  036c 270a          	jreq	L366
1866  036e a010          	sub	a,#16
1867  0370 2620          	jrne	L537
1868                     ; 469     case CLK_IT_SWIF: /* Enable the clock switch interrupt */
1868                     ; 470       CLK->SWCR |= CLK_SWCR_SWIEN;
1870  0372 721450c5      	bset	20677,#2
1871                     ; 471       break;
1873  0376 201a          	jra	L537
1874  0378               L366:
1875                     ; 472     case CLK_IT_CSSD: /* Enable the clock security system detection interrupt */
1875                     ; 473       CLK->CSSR |= CLK_CSSR_CSSDIE;
1877  0378 721450c8      	bset	20680,#2
1878                     ; 474       break;
1880  037c 2014          	jra	L537
1881                     ; 475     default:
1881                     ; 476       break;
1884  037e               L727:
1885                     ; 481     switch (CLK_IT)
1887  037e 7b01          	ld	a,(OFST+1,sp)
1889                     ; 489     default:
1889                     ; 490       break;
1890  0380 a00c          	sub	a,#12
1891  0382 270a          	jreq	L176
1892  0384 a010          	sub	a,#16
1893  0386 260a          	jrne	L537
1894                     ; 483     case CLK_IT_SWIF: /* Disable the clock switch interrupt */
1894                     ; 484       CLK->SWCR  &= (uint8_t)(~CLK_SWCR_SWIEN);
1896  0388 721550c5      	bres	20677,#2
1897                     ; 485       break;
1899  038c 2004          	jra	L537
1900  038e               L176:
1901                     ; 486     case CLK_IT_CSSD: /* Disable the clock security system detection interrupt */
1901                     ; 487       CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDIE);
1903  038e 721550c8      	bres	20680,#2
1904                     ; 488       break;
1905  0392               L537:
1906                     ; 493 }
1909  0392 85            	popw	x
1910  0393 81            	ret	
1911                     ; 489     default:
1911                     ; 490       break;
1913  0394               LC008:
1914  0394 89            	pushw	x
1915  0395 5f            	clrw	x
1916  0396 89            	pushw	x
1917  0397 ae000c        	ldw	x,#L75
1918  039a cd0000        	call	_assert_failed
1920  039d 5b04          	addw	sp,#4
1921  039f 81            	ret	
1957                     ; 500 void CLK_SYSCLKConfig(CLK_Prescaler_TypeDef CLK_Prescaler)
1957                     ; 501 {
1958                     	switch	.text
1959  03a0               _CLK_SYSCLKConfig:
1961  03a0 88            	push	a
1962       00000000      OFST:	set	0
1965                     ; 503   assert_param(IS_CLK_PRESCALER_OK(CLK_Prescaler));
1967  03a1 4d            	tnz	a
1968  03a2 273a          	jreq	L472
1969  03a4 a108          	cp	a,#8
1970  03a6 2736          	jreq	L472
1971  03a8 a110          	cp	a,#16
1972  03aa 2732          	jreq	L472
1973  03ac a118          	cp	a,#24
1974  03ae 272e          	jreq	L472
1975  03b0 a180          	cp	a,#128
1976  03b2 272a          	jreq	L472
1977  03b4 a181          	cp	a,#129
1978  03b6 2726          	jreq	L472
1979  03b8 a182          	cp	a,#130
1980  03ba 2722          	jreq	L472
1981  03bc a183          	cp	a,#131
1982  03be 271e          	jreq	L472
1983  03c0 a184          	cp	a,#132
1984  03c2 271a          	jreq	L472
1985  03c4 a185          	cp	a,#133
1986  03c6 2716          	jreq	L472
1987  03c8 a186          	cp	a,#134
1988  03ca 2712          	jreq	L472
1989  03cc a187          	cp	a,#135
1990  03ce 270e          	jreq	L472
1991  03d0 ae01f7        	ldw	x,#503
1992  03d3 89            	pushw	x
1993  03d4 5f            	clrw	x
1994  03d5 89            	pushw	x
1995  03d6 ae000c        	ldw	x,#L75
1996  03d9 cd0000        	call	_assert_failed
1998  03dc 5b04          	addw	sp,#4
1999  03de               L472:
2000                     ; 505   if (((uint8_t)CLK_Prescaler & (uint8_t)0x80) == 0x00) /* Bit7 = 0 means HSI divider */
2002  03de 7b01          	ld	a,(OFST+1,sp)
2003  03e0 2b0e          	jrmi	L167
2004                     ; 507     CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
2006  03e2 c650c6        	ld	a,20678
2007  03e5 a4e7          	and	a,#231
2008  03e7 c750c6        	ld	20678,a
2009                     ; 508     CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_HSIDIV);
2011  03ea 7b01          	ld	a,(OFST+1,sp)
2012  03ec a418          	and	a,#24
2014  03ee 200c          	jra	L367
2015  03f0               L167:
2016                     ; 512     CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_CPUDIV);
2018  03f0 c650c6        	ld	a,20678
2019  03f3 a4f8          	and	a,#248
2020  03f5 c750c6        	ld	20678,a
2021                     ; 513     CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_CPUDIV);
2023  03f8 7b01          	ld	a,(OFST+1,sp)
2024  03fa a407          	and	a,#7
2025  03fc               L367:
2026  03fc ca50c6        	or	a,20678
2027  03ff c750c6        	ld	20678,a
2028                     ; 515 }
2031  0402 84            	pop	a
2032  0403 81            	ret	
2089                     ; 523 void CLK_SWIMConfig(CLK_SWIMDivider_TypeDef CLK_SWIMDivider)
2089                     ; 524 {
2090                     	switch	.text
2091  0404               _CLK_SWIMConfig:
2093  0404 88            	push	a
2094       00000000      OFST:	set	0
2097                     ; 526   assert_param(IS_CLK_SWIMDIVIDER_OK(CLK_SWIMDivider));
2099  0405 4d            	tnz	a
2100  0406 2711          	jreq	L603
2101  0408 4a            	dec	a
2102  0409 270e          	jreq	L603
2103  040b ae020e        	ldw	x,#526
2104  040e 89            	pushw	x
2105  040f 5f            	clrw	x
2106  0410 89            	pushw	x
2107  0411 ae000c        	ldw	x,#L75
2108  0414 cd0000        	call	_assert_failed
2110  0417 5b04          	addw	sp,#4
2111  0419               L603:
2112                     ; 528   if (CLK_SWIMDivider != CLK_SWIMDIVIDER_2)
2114  0419 7b01          	ld	a,(OFST+1,sp)
2115  041b 2706          	jreq	L3101
2116                     ; 531     CLK->SWIMCCR |= CLK_SWIMCCR_SWIMDIV;
2118  041d 721050cd      	bset	20685,#0
2120  0421 2004          	jra	L5101
2121  0423               L3101:
2122                     ; 536     CLK->SWIMCCR &= (uint8_t)(~CLK_SWIMCCR_SWIMDIV);
2124  0423 721150cd      	bres	20685,#0
2125  0427               L5101:
2126                     ; 538 }
2129  0427 84            	pop	a
2130  0428 81            	ret	
2154                     ; 547 void CLK_ClockSecuritySystemEnable(void)
2154                     ; 548 {
2155                     	switch	.text
2156  0429               _CLK_ClockSecuritySystemEnable:
2160                     ; 550   CLK->CSSR |= CLK_CSSR_CSSEN;
2162  0429 721050c8      	bset	20680,#0
2163                     ; 551 }
2166  042d 81            	ret	
2191                     ; 559 CLK_Source_TypeDef CLK_GetSYSCLKSource(void)
2191                     ; 560 {
2192                     	switch	.text
2193  042e               _CLK_GetSYSCLKSource:
2197                     ; 561   return((CLK_Source_TypeDef)CLK->CMSR);
2199  042e c650c3        	ld	a,20675
2202  0431 81            	ret	
2265                     ; 569 uint32_t CLK_GetClockFreq(void)
2265                     ; 570 {
2266                     	switch	.text
2267  0432               _CLK_GetClockFreq:
2269  0432 5209          	subw	sp,#9
2270       00000009      OFST:	set	9
2273                     ; 571   uint32_t clockfrequency = 0;
2275                     ; 572   CLK_Source_TypeDef clocksource = CLK_SOURCE_HSI;
2277                     ; 573   uint8_t tmp = 0, presc = 0;
2281                     ; 576   clocksource = (CLK_Source_TypeDef)CLK->CMSR;
2283  0434 c650c3        	ld	a,20675
2284  0437 6b09          	ld	(OFST+0,sp),a
2286                     ; 578   if (clocksource == CLK_SOURCE_HSI)
2288  0439 a1e1          	cp	a,#225
2289  043b 2634          	jrne	L1701
2290                     ; 580     tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_HSIDIV);
2292  043d c650c6        	ld	a,20678
2293  0440 a418          	and	a,#24
2294  0442 44            	srl	a
2295  0443 44            	srl	a
2296  0444 44            	srl	a
2298                     ; 581     tmp = (uint8_t)(tmp >> 3);
2301                     ; 582     presc = HSIDivFactor[tmp];
2303  0445 5f            	clrw	x
2304  0446 97            	ld	xl,a
2305  0447 d60000        	ld	a,(_HSIDivFactor,x)
2306  044a 6b09          	ld	(OFST+0,sp),a
2308                     ; 583     clockfrequency = HSI_VALUE / presc;
2310  044c b703          	ld	c_lreg+3,a
2311  044e 3f02          	clr	c_lreg+2
2312  0450 3f01          	clr	c_lreg+1
2313  0452 3f00          	clr	c_lreg
2314  0454 96            	ldw	x,sp
2315  0455 5c            	incw	x
2316  0456 cd0000        	call	c_rtol
2319  0459 ae2400        	ldw	x,#9216
2320  045c bf02          	ldw	c_lreg+2,x
2321  045e ae00f4        	ldw	x,#244
2322  0461 bf00          	ldw	c_lreg,x
2323  0463 96            	ldw	x,sp
2324  0464 5c            	incw	x
2325  0465 cd0000        	call	c_ludv
2327  0468 96            	ldw	x,sp
2328  0469 1c0005        	addw	x,#OFST-4
2329  046c cd0000        	call	c_rtol
2333  046f 2018          	jra	L3701
2334  0471               L1701:
2335                     ; 585   else if ( clocksource == CLK_SOURCE_LSI)
2337  0471 a1d2          	cp	a,#210
2338  0473 260a          	jrne	L5701
2339                     ; 587     clockfrequency = LSI_VALUE;
2341  0475 aef400        	ldw	x,#62464
2342  0478 1f07          	ldw	(OFST-2,sp),x
2343  047a ae0001        	ldw	x,#1
2345  047d 2008          	jp	LC009
2346  047f               L5701:
2347                     ; 591     clockfrequency = HSE_VALUE;
2349  047f ae2400        	ldw	x,#9216
2350  0482 1f07          	ldw	(OFST-2,sp),x
2351  0484 ae00f4        	ldw	x,#244
2352  0487               LC009:
2353  0487 1f05          	ldw	(OFST-4,sp),x
2355  0489               L3701:
2356                     ; 594   return((uint32_t)clockfrequency);
2358  0489 96            	ldw	x,sp
2359  048a 1c0005        	addw	x,#OFST-4
2360  048d cd0000        	call	c_ltor
2364  0490 5b09          	addw	sp,#9
2365  0492 81            	ret	
2465                     ; 604 void CLK_AdjustHSICalibrationValue(CLK_HSITrimValue_TypeDef CLK_HSICalibrationValue)
2465                     ; 605 {
2466                     	switch	.text
2467  0493               _CLK_AdjustHSICalibrationValue:
2469  0493 88            	push	a
2470       00000000      OFST:	set	0
2473                     ; 607   assert_param(IS_CLK_HSITRIMVALUE_OK(CLK_HSICalibrationValue));
2475  0494 4d            	tnz	a
2476  0495 272a          	jreq	L623
2477  0497 a101          	cp	a,#1
2478  0499 2726          	jreq	L623
2479  049b a102          	cp	a,#2
2480  049d 2722          	jreq	L623
2481  049f a103          	cp	a,#3
2482  04a1 271e          	jreq	L623
2483  04a3 a104          	cp	a,#4
2484  04a5 271a          	jreq	L623
2485  04a7 a105          	cp	a,#5
2486  04a9 2716          	jreq	L623
2487  04ab a106          	cp	a,#6
2488  04ad 2712          	jreq	L623
2489  04af a107          	cp	a,#7
2490  04b1 270e          	jreq	L623
2491  04b3 ae025f        	ldw	x,#607
2492  04b6 89            	pushw	x
2493  04b7 5f            	clrw	x
2494  04b8 89            	pushw	x
2495  04b9 ae000c        	ldw	x,#L75
2496  04bc cd0000        	call	_assert_failed
2498  04bf 5b04          	addw	sp,#4
2499  04c1               L623:
2500                     ; 610   CLK->HSITRIMR = (uint8_t)( (uint8_t)(CLK->HSITRIMR & (uint8_t)(~CLK_HSITRIMR_HSITRIM))|((uint8_t)CLK_HSICalibrationValue));
2502  04c1 c650cc        	ld	a,20684
2503  04c4 a4f8          	and	a,#248
2504  04c6 1a01          	or	a,(OFST+1,sp)
2505  04c8 c750cc        	ld	20684,a
2506                     ; 611 }
2509  04cb 84            	pop	a
2510  04cc 81            	ret	
2534                     ; 622 void CLK_SYSCLKEmergencyClear(void)
2534                     ; 623 {
2535                     	switch	.text
2536  04cd               _CLK_SYSCLKEmergencyClear:
2540                     ; 624   CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWBSY);
2542  04cd 721150c5      	bres	20677,#0
2543                     ; 625 }
2546  04d1 81            	ret	
2700                     ; 634 FlagStatus CLK_GetFlagStatus(CLK_Flag_TypeDef CLK_FLAG)
2700                     ; 635 {
2701                     	switch	.text
2702  04d2               _CLK_GetFlagStatus:
2704  04d2 89            	pushw	x
2705  04d3 5203          	subw	sp,#3
2706       00000003      OFST:	set	3
2709                     ; 636   uint16_t statusreg = 0;
2711                     ; 637   uint8_t tmpreg = 0;
2713                     ; 638   FlagStatus bitstatus = RESET;
2715                     ; 641   assert_param(IS_CLK_FLAG_OK(CLK_FLAG));
2717  04d5 a30110        	cpw	x,#272
2718  04d8 2736          	jreq	L243
2719  04da a30102        	cpw	x,#258
2720  04dd 2731          	jreq	L243
2721  04df a30202        	cpw	x,#514
2722  04e2 272c          	jreq	L243
2723  04e4 a30308        	cpw	x,#776
2724  04e7 2727          	jreq	L243
2725  04e9 a30301        	cpw	x,#769
2726  04ec 2722          	jreq	L243
2727  04ee a30408        	cpw	x,#1032
2728  04f1 271d          	jreq	L243
2729  04f3 a30402        	cpw	x,#1026
2730  04f6 2718          	jreq	L243
2731  04f8 a30504        	cpw	x,#1284
2732  04fb 2713          	jreq	L243
2733  04fd a30502        	cpw	x,#1282
2734  0500 270e          	jreq	L243
2735  0502 ae0281        	ldw	x,#641
2736  0505 89            	pushw	x
2737  0506 5f            	clrw	x
2738  0507 89            	pushw	x
2739  0508 ae000c        	ldw	x,#L75
2740  050b cd0000        	call	_assert_failed
2742  050e 5b04          	addw	sp,#4
2743  0510               L243:
2744                     ; 644   statusreg = (uint16_t)((uint16_t)CLK_FLAG & (uint16_t)0xFF00);
2746  0510 7b04          	ld	a,(OFST+1,sp)
2747  0512 97            	ld	xl,a
2748  0513 4f            	clr	a
2749  0514 02            	rlwa	x,a
2750  0515 1f01          	ldw	(OFST-2,sp),x
2752                     ; 647   if (statusreg == 0x0100) /* The flag to check is in ICKRregister */
2754  0517 a30100        	cpw	x,#256
2755  051a 2605          	jrne	L3421
2756                     ; 649     tmpreg = CLK->ICKR;
2758  051c c650c0        	ld	a,20672
2760  051f 2021          	jra	L5421
2761  0521               L3421:
2762                     ; 651   else if (statusreg == 0x0200) /* The flag to check is in ECKRregister */
2764  0521 a30200        	cpw	x,#512
2765  0524 2605          	jrne	L7421
2766                     ; 653     tmpreg = CLK->ECKR;
2768  0526 c650c1        	ld	a,20673
2770  0529 2017          	jra	L5421
2771  052b               L7421:
2772                     ; 655   else if (statusreg == 0x0300) /* The flag to check is in SWIC register */
2774  052b a30300        	cpw	x,#768
2775  052e 2605          	jrne	L3521
2776                     ; 657     tmpreg = CLK->SWCR;
2778  0530 c650c5        	ld	a,20677
2780  0533 200d          	jra	L5421
2781  0535               L3521:
2782                     ; 659   else if (statusreg == 0x0400) /* The flag to check is in CSS register */
2784  0535 a30400        	cpw	x,#1024
2785  0538 2605          	jrne	L7521
2786                     ; 661     tmpreg = CLK->CSSR;
2788  053a c650c8        	ld	a,20680
2790  053d 2003          	jra	L5421
2791  053f               L7521:
2792                     ; 665     tmpreg = CLK->CCOR;
2794  053f c650c9        	ld	a,20681
2795  0542               L5421:
2796  0542 6b03          	ld	(OFST+0,sp),a
2798                     ; 668   if ((tmpreg & (uint8_t)CLK_FLAG) != (uint8_t)RESET)
2800  0544 7b05          	ld	a,(OFST+2,sp)
2801  0546 1503          	bcp	a,(OFST+0,sp)
2802  0548 2704          	jreq	L3621
2803                     ; 670     bitstatus = SET;
2805  054a a601          	ld	a,#1
2808  054c 2001          	jra	L5621
2809  054e               L3621:
2810                     ; 674     bitstatus = RESET;
2812  054e 4f            	clr	a
2814  054f               L5621:
2815                     ; 678   return((FlagStatus)bitstatus);
2819  054f 5b05          	addw	sp,#5
2820  0551 81            	ret	
2867                     ; 687 ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
2867                     ; 688 {
2868                     	switch	.text
2869  0552               _CLK_GetITStatus:
2871  0552 88            	push	a
2872  0553 88            	push	a
2873       00000001      OFST:	set	1
2876                     ; 689   ITStatus bitstatus = RESET;
2878                     ; 692   assert_param(IS_CLK_IT_OK(CLK_IT));
2880  0554 a10c          	cp	a,#12
2881  0556 2712          	jreq	L453
2882  0558 a11c          	cp	a,#28
2883  055a 270e          	jreq	L453
2884  055c ae02b4        	ldw	x,#692
2885  055f 89            	pushw	x
2886  0560 5f            	clrw	x
2887  0561 89            	pushw	x
2888  0562 ae000c        	ldw	x,#L75
2889  0565 cd0000        	call	_assert_failed
2891  0568 5b04          	addw	sp,#4
2892  056a               L453:
2893                     ; 694   if (CLK_IT == CLK_IT_SWIF)
2895  056a 7b02          	ld	a,(OFST+1,sp)
2896  056c a11c          	cp	a,#28
2897  056e 260b          	jrne	L1131
2898                     ; 697     if ((CLK->SWCR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2900  0570 c650c5        	ld	a,20677
2901  0573 1402          	and	a,(OFST+1,sp)
2902  0575 a10c          	cp	a,#12
2903  0577 260f          	jrne	L1231
2904                     ; 699       bitstatus = SET;
2906  0579 2009          	jp	LC011
2907                     ; 703       bitstatus = RESET;
2908  057b               L1131:
2909                     ; 709     if ((CLK->CSSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2911  057b c650c8        	ld	a,20680
2912  057e 1402          	and	a,(OFST+1,sp)
2913  0580 a10c          	cp	a,#12
2914  0582 2604          	jrne	L1231
2915                     ; 711       bitstatus = SET;
2917  0584               LC011:
2919  0584 a601          	ld	a,#1
2922  0586 2001          	jra	L7131
2923  0588               L1231:
2924                     ; 715       bitstatus = RESET;
2927  0588 4f            	clr	a
2929  0589               L7131:
2930                     ; 720   return bitstatus;
2934  0589 85            	popw	x
2935  058a 81            	ret	
2972                     ; 729 void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
2972                     ; 730 {
2973                     	switch	.text
2974  058b               _CLK_ClearITPendingBit:
2976  058b 88            	push	a
2977       00000000      OFST:	set	0
2980                     ; 732   assert_param(IS_CLK_IT_OK(CLK_IT));
2982  058c a10c          	cp	a,#12
2983  058e 2712          	jreq	L663
2984  0590 a11c          	cp	a,#28
2985  0592 270e          	jreq	L663
2986  0594 ae02dc        	ldw	x,#732
2987  0597 89            	pushw	x
2988  0598 5f            	clrw	x
2989  0599 89            	pushw	x
2990  059a ae000c        	ldw	x,#L75
2991  059d cd0000        	call	_assert_failed
2993  05a0 5b04          	addw	sp,#4
2994  05a2               L663:
2995                     ; 734   if (CLK_IT == (uint8_t)CLK_IT_CSSD)
2997  05a2 7b01          	ld	a,(OFST+1,sp)
2998  05a4 a10c          	cp	a,#12
2999  05a6 2606          	jrne	L3431
3000                     ; 737     CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSD);
3002  05a8 721750c8      	bres	20680,#3
3004  05ac 2004          	jra	L5431
3005  05ae               L3431:
3006                     ; 742     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIF);
3008  05ae 721750c5      	bres	20677,#3
3009  05b2               L5431:
3010                     ; 745 }
3013  05b2 84            	pop	a
3014  05b3 81            	ret	
3049                     	xdef	_CLKPrescTable
3050                     	xdef	_HSIDivFactor
3051                     	xdef	_CLK_ClearITPendingBit
3052                     	xdef	_CLK_GetITStatus
3053                     	xdef	_CLK_GetFlagStatus
3054                     	xdef	_CLK_GetSYSCLKSource
3055                     	xdef	_CLK_GetClockFreq
3056                     	xdef	_CLK_AdjustHSICalibrationValue
3057                     	xdef	_CLK_SYSCLKEmergencyClear
3058                     	xdef	_CLK_ClockSecuritySystemEnable
3059                     	xdef	_CLK_SWIMConfig
3060                     	xdef	_CLK_SYSCLKConfig
3061                     	xdef	_CLK_ITConfig
3062                     	xdef	_CLK_CCOConfig
3063                     	xdef	_CLK_HSIPrescalerConfig
3064                     	xdef	_CLK_ClockSwitchConfig
3065                     	xdef	_CLK_PeripheralClockConfig
3066                     	xdef	_CLK_SlowActiveHaltWakeUpCmd
3067                     	xdef	_CLK_FastHaltWakeUpCmd
3068                     	xdef	_CLK_ClockSwitchCmd
3069                     	xdef	_CLK_CCOCmd
3070                     	xdef	_CLK_LSICmd
3071                     	xdef	_CLK_HSICmd
3072                     	xdef	_CLK_HSECmd
3073                     	xdef	_CLK_DeInit
3074                     	xref	_assert_failed
3075                     	switch	.const
3076  000c               L75:
3077  000c 2e2e5c2e2e5c  	dc.b	"..\..\stm8s_spl\li"
3078  001e 627261726965  	dc.b	"braries\stm8s_stdp"
3079  0030 65726970685f  	dc.b	"eriph_driver\src\s"
3080  0042 746d38735f63  	dc.b	"tm8s_clk.c",0
3081                     	xref.b	c_lreg
3082                     	xref.b	c_x
3102                     	xref	c_ltor
3103                     	xref	c_ludv
3104                     	xref	c_rtol
3105                     	end
