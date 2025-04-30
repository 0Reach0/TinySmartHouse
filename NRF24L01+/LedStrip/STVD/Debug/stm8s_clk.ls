   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.3 - 22 Aug 2024
   4                     ; Optimizer V4.6.3 - 22 Aug 2024
  18                     .const:	section	.text
  19  0000               _HSIDivFactor:
  20  0000 01            	dc.b	1
  21  0001 02            	dc.b	2
  22  0002 04            	dc.b	4
  23  0003 08            	dc.b	8
  24  0004               _CLKPrescTable:
  25  0004 01            	dc.b	1
  26  0005 02            	dc.b	2
  27  0006 04            	dc.b	4
  28  0007 08            	dc.b	8
  29  0008 0a            	dc.b	10
  30  0009 10            	dc.b	16
  31  000a 14            	dc.b	20
  32  000b 28            	dc.b	40
  61                     ; 72 void CLK_DeInit(void)
  61                     ; 73 {
  63                     	switch	.text
  64  0000               _CLK_DeInit:
  68                     ; 74   CLK->ICKR = CLK_ICKR_RESET_VALUE;
  70  0000 350150c0      	mov	20672,#1
  71                     ; 75   CLK->ECKR = CLK_ECKR_RESET_VALUE;
  73  0004 725f50c1      	clr	20673
  74                     ; 76   CLK->SWR  = CLK_SWR_RESET_VALUE;
  76  0008 35e150c4      	mov	20676,#225
  77                     ; 77   CLK->SWCR = CLK_SWCR_RESET_VALUE;
  79  000c 725f50c5      	clr	20677
  80                     ; 78   CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
  82  0010 351850c6      	mov	20678,#24
  83                     ; 79   CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
  85  0014 35ff50c7      	mov	20679,#255
  86                     ; 80   CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
  88  0018 35ff50ca      	mov	20682,#255
  89                     ; 81   CLK->CSSR = CLK_CSSR_RESET_VALUE;
  91  001c 725f50c8      	clr	20680
  92                     ; 82   CLK->CCOR = CLK_CCOR_RESET_VALUE;
  94  0020 725f50c9      	clr	20681
  96  0024               L52:
  97                     ; 83   while ((CLK->CCOR & CLK_CCOR_CCOEN)!= 0)
  99  0024 720050c9fb    	btjt	20681,#0,L52
 100                     ; 85   CLK->CCOR = CLK_CCOR_RESET_VALUE;
 102  0029 725f50c9      	clr	20681
 103                     ; 86   CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
 105  002d 725f50cc      	clr	20684
 106                     ; 87   CLK->SWIMCCR = CLK_SWIMCCR_RESET_VALUE;
 108  0031 725f50cd      	clr	20685
 109                     ; 88 }
 112  0035 81            	ret	
 169                     ; 99 void CLK_FastHaltWakeUpCmd(FunctionalState NewState)
 169                     ; 100 {
 170                     	switch	.text
 171  0036               _CLK_FastHaltWakeUpCmd:
 173  0036 88            	push	a
 174       00000000      OFST:	set	0
 177                     ; 102   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 179  0037 4d            	tnz	a
 180  0038 2711          	jreq	L41
 181  003a 4a            	dec	a
 182  003b 270e          	jreq	L41
 183  003d ae0066        	ldw	x,#102
 184  0040 89            	pushw	x
 185  0041 5f            	clrw	x
 186  0042 89            	pushw	x
 187  0043 ae000c        	ldw	x,#L75
 188  0046 cd0000        	call	_assert_failed
 190  0049 5b04          	addw	sp,#4
 191  004b               L41:
 192                     ; 104   if (NewState != DISABLE)
 194  004b 7b01          	ld	a,(OFST+1,sp)
 195  004d 2706          	jreq	L16
 196                     ; 107     CLK->ICKR |= CLK_ICKR_FHWU;
 198  004f 721450c0      	bset	20672,#2
 200  0053 2004          	jra	L36
 201  0055               L16:
 202                     ; 112     CLK->ICKR &= (uint8_t)(~CLK_ICKR_FHWU);
 204  0055 721550c0      	bres	20672,#2
 205  0059               L36:
 206                     ; 114 }
 209  0059 84            	pop	a
 210  005a 81            	ret	
 246                     ; 121 void CLK_HSECmd(FunctionalState NewState)
 246                     ; 122 {
 247                     	switch	.text
 248  005b               _CLK_HSECmd:
 250  005b 88            	push	a
 251       00000000      OFST:	set	0
 254                     ; 124   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 256  005c 4d            	tnz	a
 257  005d 2711          	jreq	L62
 258  005f 4a            	dec	a
 259  0060 270e          	jreq	L62
 260  0062 ae007c        	ldw	x,#124
 261  0065 89            	pushw	x
 262  0066 5f            	clrw	x
 263  0067 89            	pushw	x
 264  0068 ae000c        	ldw	x,#L75
 265  006b cd0000        	call	_assert_failed
 267  006e 5b04          	addw	sp,#4
 268  0070               L62:
 269                     ; 126   if (NewState != DISABLE)
 271  0070 7b01          	ld	a,(OFST+1,sp)
 272  0072 2706          	jreq	L301
 273                     ; 129     CLK->ECKR |= CLK_ECKR_HSEEN;
 275  0074 721050c1      	bset	20673,#0
 277  0078 2004          	jra	L501
 278  007a               L301:
 279                     ; 134     CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
 281  007a 721150c1      	bres	20673,#0
 282  007e               L501:
 283                     ; 136 }
 286  007e 84            	pop	a
 287  007f 81            	ret	
 323                     ; 143 void CLK_HSICmd(FunctionalState NewState)
 323                     ; 144 {
 324                     	switch	.text
 325  0080               _CLK_HSICmd:
 327  0080 88            	push	a
 328       00000000      OFST:	set	0
 331                     ; 146   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 333  0081 4d            	tnz	a
 334  0082 2711          	jreq	L04
 335  0084 4a            	dec	a
 336  0085 270e          	jreq	L04
 337  0087 ae0092        	ldw	x,#146
 338  008a 89            	pushw	x
 339  008b 5f            	clrw	x
 340  008c 89            	pushw	x
 341  008d ae000c        	ldw	x,#L75
 342  0090 cd0000        	call	_assert_failed
 344  0093 5b04          	addw	sp,#4
 345  0095               L04:
 346                     ; 148   if (NewState != DISABLE)
 348  0095 7b01          	ld	a,(OFST+1,sp)
 349  0097 2706          	jreq	L521
 350                     ; 151     CLK->ICKR |= CLK_ICKR_HSIEN;
 352  0099 721050c0      	bset	20672,#0
 354  009d 2004          	jra	L721
 355  009f               L521:
 356                     ; 156     CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
 358  009f 721150c0      	bres	20672,#0
 359  00a3               L721:
 360                     ; 158 }
 363  00a3 84            	pop	a
 364  00a4 81            	ret	
 400                     ; 166 void CLK_LSICmd(FunctionalState NewState)
 400                     ; 167 {
 401                     	switch	.text
 402  00a5               _CLK_LSICmd:
 404  00a5 88            	push	a
 405       00000000      OFST:	set	0
 408                     ; 169   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 410  00a6 4d            	tnz	a
 411  00a7 2711          	jreq	L25
 412  00a9 4a            	dec	a
 413  00aa 270e          	jreq	L25
 414  00ac ae00a9        	ldw	x,#169
 415  00af 89            	pushw	x
 416  00b0 5f            	clrw	x
 417  00b1 89            	pushw	x
 418  00b2 ae000c        	ldw	x,#L75
 419  00b5 cd0000        	call	_assert_failed
 421  00b8 5b04          	addw	sp,#4
 422  00ba               L25:
 423                     ; 171   if (NewState != DISABLE)
 425  00ba 7b01          	ld	a,(OFST+1,sp)
 426  00bc 2706          	jreq	L741
 427                     ; 174     CLK->ICKR |= CLK_ICKR_LSIEN;
 429  00be 721650c0      	bset	20672,#3
 431  00c2 2004          	jra	L151
 432  00c4               L741:
 433                     ; 179     CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
 435  00c4 721750c0      	bres	20672,#3
 436  00c8               L151:
 437                     ; 181 }
 440  00c8 84            	pop	a
 441  00c9 81            	ret	
 477                     ; 189 void CLK_CCOCmd(FunctionalState NewState)
 477                     ; 190 {
 478                     	switch	.text
 479  00ca               _CLK_CCOCmd:
 481  00ca 88            	push	a
 482       00000000      OFST:	set	0
 485                     ; 192   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 487  00cb 4d            	tnz	a
 488  00cc 2711          	jreq	L46
 489  00ce 4a            	dec	a
 490  00cf 270e          	jreq	L46
 491  00d1 ae00c0        	ldw	x,#192
 492  00d4 89            	pushw	x
 493  00d5 5f            	clrw	x
 494  00d6 89            	pushw	x
 495  00d7 ae000c        	ldw	x,#L75
 496  00da cd0000        	call	_assert_failed
 498  00dd 5b04          	addw	sp,#4
 499  00df               L46:
 500                     ; 194   if (NewState != DISABLE)
 502  00df 7b01          	ld	a,(OFST+1,sp)
 503  00e1 2706          	jreq	L171
 504                     ; 197     CLK->CCOR |= CLK_CCOR_CCOEN;
 506  00e3 721050c9      	bset	20681,#0
 508  00e7 2004          	jra	L371
 509  00e9               L171:
 510                     ; 202     CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOEN);
 512  00e9 721150c9      	bres	20681,#0
 513  00ed               L371:
 514                     ; 204 }
 517  00ed 84            	pop	a
 518  00ee 81            	ret	
 554                     ; 213 void CLK_ClockSwitchCmd(FunctionalState NewState)
 554                     ; 214 {
 555                     	switch	.text
 556  00ef               _CLK_ClockSwitchCmd:
 558  00ef 88            	push	a
 559       00000000      OFST:	set	0
 562                     ; 216   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 564  00f0 4d            	tnz	a
 565  00f1 2711          	jreq	L67
 566  00f3 4a            	dec	a
 567  00f4 270e          	jreq	L67
 568  00f6 ae00d8        	ldw	x,#216
 569  00f9 89            	pushw	x
 570  00fa 5f            	clrw	x
 571  00fb 89            	pushw	x
 572  00fc ae000c        	ldw	x,#L75
 573  00ff cd0000        	call	_assert_failed
 575  0102 5b04          	addw	sp,#4
 576  0104               L67:
 577                     ; 218   if (NewState != DISABLE )
 579  0104 7b01          	ld	a,(OFST+1,sp)
 580  0106 2706          	jreq	L312
 581                     ; 221     CLK->SWCR |= CLK_SWCR_SWEN;
 583  0108 721250c5      	bset	20677,#1
 585  010c 2004          	jra	L512
 586  010e               L312:
 587                     ; 226     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWEN);
 589  010e 721350c5      	bres	20677,#1
 590  0112               L512:
 591                     ; 228 }
 594  0112 84            	pop	a
 595  0113 81            	ret	
 632                     ; 238 void CLK_SlowActiveHaltWakeUpCmd(FunctionalState NewState)
 632                     ; 239 {
 633                     	switch	.text
 634  0114               _CLK_SlowActiveHaltWakeUpCmd:
 636  0114 88            	push	a
 637       00000000      OFST:	set	0
 640                     ; 241   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 642  0115 4d            	tnz	a
 643  0116 2711          	jreq	L011
 644  0118 4a            	dec	a
 645  0119 270e          	jreq	L011
 646  011b ae00f1        	ldw	x,#241
 647  011e 89            	pushw	x
 648  011f 5f            	clrw	x
 649  0120 89            	pushw	x
 650  0121 ae000c        	ldw	x,#L75
 651  0124 cd0000        	call	_assert_failed
 653  0127 5b04          	addw	sp,#4
 654  0129               L011:
 655                     ; 243   if (NewState != DISABLE)
 657  0129 7b01          	ld	a,(OFST+1,sp)
 658  012b 2706          	jreq	L532
 659                     ; 246     CLK->ICKR |= CLK_ICKR_SWUAH;
 661  012d 721a50c0      	bset	20672,#5
 663  0131 2004          	jra	L732
 664  0133               L532:
 665                     ; 251     CLK->ICKR &= (uint8_t)(~CLK_ICKR_SWUAH);
 667  0133 721b50c0      	bres	20672,#5
 668  0137               L732:
 669                     ; 253 }
 672  0137 84            	pop	a
 673  0138 81            	ret	
 833                     ; 263 void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
 833                     ; 264 {
 834                     	switch	.text
 835  0139               _CLK_PeripheralClockConfig:
 837  0139 89            	pushw	x
 838       00000000      OFST:	set	0
 841                     ; 266   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 843  013a 9f            	ld	a,xl
 844  013b 4d            	tnz	a
 845  013c 270a          	jreq	L221
 846  013e 9f            	ld	a,xl
 847  013f 4a            	dec	a
 848  0140 2706          	jreq	L221
 849  0142 ae010a        	ldw	x,#266
 850  0145 cd01cb        	call	LC004
 851  0148               L221:
 852                     ; 267   assert_param(IS_CLK_PERIPHERAL_OK(CLK_Peripheral));
 854  0148 7b01          	ld	a,(OFST+1,sp)
 855  014a 272f          	jreq	L231
 856  014c a101          	cp	a,#1
 857  014e 272b          	jreq	L231
 858  0150 a103          	cp	a,#3
 859  0152 2727          	jreq	L231
 860  0154 a104          	cp	a,#4
 861  0156 2723          	jreq	L231
 862  0158 a105          	cp	a,#5
 863  015a 271f          	jreq	L231
 864  015c a104          	cp	a,#4
 865  015e 271b          	jreq	L231
 866  0160 a106          	cp	a,#6
 867  0162 2717          	jreq	L231
 868  0164 a107          	cp	a,#7
 869  0166 2713          	jreq	L231
 870  0168 a117          	cp	a,#23
 871  016a 270f          	jreq	L231
 872  016c a113          	cp	a,#19
 873  016e 270b          	jreq	L231
 874  0170 a112          	cp	a,#18
 875  0172 2707          	jreq	L231
 876  0174 ae010b        	ldw	x,#267
 877  0177 ad52          	call	LC004
 878  0179 7b01          	ld	a,(OFST+1,sp)
 879  017b               L231:
 880                     ; 269   if (((uint8_t)CLK_Peripheral & (uint8_t)0x10) == 0x00)
 882  017b a510          	bcp	a,#16
 883  017d 2622          	jrne	L323
 884                     ; 271     if (NewState != DISABLE)
 886  017f 0d02          	tnz	(OFST+2,sp)
 887  0181 270d          	jreq	L523
 888                     ; 274       CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
 890  0183 ad3e          	call	LC003
 891  0185 2704          	jreq	L631
 892  0187               L041:
 893  0187 48            	sll	a
 894  0188 5a            	decw	x
 895  0189 26fc          	jrne	L041
 896  018b               L631:
 897  018b ca50c7        	or	a,20679
 899  018e 200c          	jp	LC002
 900  0190               L523:
 901                     ; 279       CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
 903  0190 ad31          	call	LC003
 904  0192 2704          	jreq	L241
 905  0194               L441:
 906  0194 48            	sll	a
 907  0195 5a            	decw	x
 908  0196 26fc          	jrne	L441
 909  0198               L241:
 910  0198 43            	cpl	a
 911  0199 c450c7        	and	a,20679
 912  019c               LC002:
 913  019c c750c7        	ld	20679,a
 914  019f 2020          	jra	L133
 915  01a1               L323:
 916                     ; 284     if (NewState != DISABLE)
 918  01a1 0d02          	tnz	(OFST+2,sp)
 919  01a3 270d          	jreq	L333
 920                     ; 287       CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
 922  01a5 ad1c          	call	LC003
 923  01a7 2704          	jreq	L641
 924  01a9               L051:
 925  01a9 48            	sll	a
 926  01aa 5a            	decw	x
 927  01ab 26fc          	jrne	L051
 928  01ad               L641:
 929  01ad ca50ca        	or	a,20682
 931  01b0 200c          	jp	LC001
 932  01b2               L333:
 933                     ; 292       CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
 935  01b2 ad0f          	call	LC003
 936  01b4 2704          	jreq	L251
 937  01b6               L451:
 938  01b6 48            	sll	a
 939  01b7 5a            	decw	x
 940  01b8 26fc          	jrne	L451
 941  01ba               L251:
 942  01ba 43            	cpl	a
 943  01bb c450ca        	and	a,20682
 944  01be               LC001:
 945  01be c750ca        	ld	20682,a
 946  01c1               L133:
 947                     ; 295 }
 950  01c1 85            	popw	x
 951  01c2 81            	ret	
 952  01c3               LC003:
 953  01c3 a40f          	and	a,#15
 954  01c5 5f            	clrw	x
 955  01c6 97            	ld	xl,a
 956  01c7 a601          	ld	a,#1
 957  01c9 5d            	tnzw	x
 958  01ca 81            	ret	
 959  01cb               LC004:
 960  01cb 89            	pushw	x
 961  01cc 5f            	clrw	x
 962  01cd 89            	pushw	x
 963  01ce ae000c        	ldw	x,#L75
 964  01d1 cd0000        	call	_assert_failed
 966  01d4 5b04          	addw	sp,#4
 967  01d6 81            	ret	
1156                     ; 309 ErrorStatus CLK_ClockSwitchConfig(CLK_SwitchMode_TypeDef CLK_SwitchMode, CLK_Source_TypeDef CLK_NewClock, FunctionalState ITState, CLK_CurrentClockState_TypeDef CLK_CurrentClockState)
1156                     ; 310 {
1157                     	switch	.text
1158  01d7               _CLK_ClockSwitchConfig:
1160  01d7 89            	pushw	x
1161  01d8 5204          	subw	sp,#4
1162       00000004      OFST:	set	4
1165                     ; 312   uint16_t DownCounter = CLK_TIMEOUT;
1167  01da aeffff        	ldw	x,#65535
1168  01dd 1f03          	ldw	(OFST-1,sp),x
1170                     ; 313   ErrorStatus Swif = ERROR;
1172                     ; 316   assert_param(IS_CLK_SOURCE_OK(CLK_NewClock));
1174  01df 7b06          	ld	a,(OFST+2,sp)
1175  01e1 a1e1          	cp	a,#225
1176  01e3 270e          	jreq	L461
1177  01e5 a1d2          	cp	a,#210
1178  01e7 270a          	jreq	L461
1179  01e9 a1b4          	cp	a,#180
1180  01eb 2706          	jreq	L461
1181  01ed ae013c        	ldw	x,#316
1182  01f0 cd02b3        	call	LC007
1183  01f3               L461:
1184                     ; 317   assert_param(IS_CLK_SWITCHMODE_OK(CLK_SwitchMode));
1186  01f3 7b05          	ld	a,(OFST+1,sp)
1187  01f5 2709          	jreq	L471
1188  01f7 4a            	dec	a
1189  01f8 2706          	jreq	L471
1190  01fa ae013d        	ldw	x,#317
1191  01fd cd02b3        	call	LC007
1192  0200               L471:
1193                     ; 318   assert_param(IS_FUNCTIONALSTATE_OK(ITState));
1195  0200 7b09          	ld	a,(OFST+5,sp)
1196  0202 2709          	jreq	L402
1197  0204 4a            	dec	a
1198  0205 2706          	jreq	L402
1199  0207 ae013e        	ldw	x,#318
1200  020a cd02b3        	call	LC007
1201  020d               L402:
1202                     ; 319   assert_param(IS_CLK_CURRENTCLOCKSTATE_OK(CLK_CurrentClockState));
1204  020d 7b0a          	ld	a,(OFST+6,sp)
1205  020f 2709          	jreq	L412
1206  0211 4a            	dec	a
1207  0212 2706          	jreq	L412
1208  0214 ae013f        	ldw	x,#319
1209  0217 cd02b3        	call	LC007
1210  021a               L412:
1211                     ; 322   clock_master = (CLK_Source_TypeDef)CLK->CMSR;
1213  021a c650c3        	ld	a,20675
1214  021d 6b01          	ld	(OFST-3,sp),a
1216                     ; 325   if (CLK_SwitchMode == CLK_SWITCHMODE_AUTO)
1218  021f 7b05          	ld	a,(OFST+1,sp)
1219  0221 4a            	dec	a
1220  0222 263d          	jrne	L744
1221                     ; 328     CLK->SWCR |= CLK_SWCR_SWEN;
1223  0224 721250c5      	bset	20677,#1
1224                     ; 331     if (ITState != DISABLE)
1226  0228 7b09          	ld	a,(OFST+5,sp)
1227  022a 2706          	jreq	L154
1228                     ; 333       CLK->SWCR |= CLK_SWCR_SWIEN;
1230  022c 721450c5      	bset	20677,#2
1232  0230 2004          	jra	L354
1233  0232               L154:
1234                     ; 337       CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
1236  0232 721550c5      	bres	20677,#2
1237  0236               L354:
1238                     ; 341     CLK->SWR = (uint8_t)CLK_NewClock;
1240  0236 7b06          	ld	a,(OFST+2,sp)
1241  0238 c750c4        	ld	20676,a
1243  023b 2003          	jra	L164
1244  023d               L554:
1245                     ; 346       DownCounter--;
1247  023d 5a            	decw	x
1248  023e 1f03          	ldw	(OFST-1,sp),x
1250  0240               L164:
1251                     ; 344     while((((CLK->SWCR & CLK_SWCR_SWBSY) != 0 )&& (DownCounter != 0)))
1253  0240 720150c504    	btjf	20677,#0,L564
1255  0245 1e03          	ldw	x,(OFST-1,sp)
1256  0247 26f4          	jrne	L554
1257  0249               L564:
1258                     ; 349     if(DownCounter != 0)
1260  0249 1e03          	ldw	x,(OFST-1,sp)
1261                     ; 351       Swif = SUCCESS;
1263  024b 263d          	jrne	LC006
1264  024d               L764:
1265                     ; 355       Swif = ERROR;
1268  024d 0f02          	clr	(OFST-2,sp)
1270  024f               L374:
1271                     ; 390   if(Swif != ERROR)
1273  024f 275d          	jreq	L715
1274                     ; 393     if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSI))
1276  0251 7b0a          	ld	a,(OFST+6,sp)
1277  0253 263b          	jrne	L125
1279  0255 7b01          	ld	a,(OFST-3,sp)
1280  0257 a1e1          	cp	a,#225
1281  0259 2635          	jrne	L125
1282                     ; 395       CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
1284  025b 721150c0      	bres	20672,#0
1286  025f 204d          	jra	L715
1287  0261               L744:
1288                     ; 361     if (ITState != DISABLE)
1290  0261 7b09          	ld	a,(OFST+5,sp)
1291  0263 2706          	jreq	L574
1292                     ; 363       CLK->SWCR |= CLK_SWCR_SWIEN;
1294  0265 721450c5      	bset	20677,#2
1296  0269 2004          	jra	L774
1297  026b               L574:
1298                     ; 367       CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
1300  026b 721550c5      	bres	20677,#2
1301  026f               L774:
1302                     ; 371     CLK->SWR = (uint8_t)CLK_NewClock;
1304  026f 7b06          	ld	a,(OFST+2,sp)
1305  0271 c750c4        	ld	20676,a
1307  0274 2003          	jra	L505
1308  0276               L105:
1309                     ; 376       DownCounter--;
1311  0276 5a            	decw	x
1312  0277 1f03          	ldw	(OFST-1,sp),x
1314  0279               L505:
1315                     ; 374     while((((CLK->SWCR & CLK_SWCR_SWIF) != 0 ) && (DownCounter != 0)))
1317  0279 720750c504    	btjf	20677,#3,L115
1319  027e 1e03          	ldw	x,(OFST-1,sp)
1320  0280 26f4          	jrne	L105
1321  0282               L115:
1322                     ; 379     if(DownCounter != 0)
1324  0282 1e03          	ldw	x,(OFST-1,sp)
1325  0284 27c7          	jreq	L764
1326                     ; 382       CLK->SWCR |= CLK_SWCR_SWEN;
1328  0286 721250c5      	bset	20677,#1
1329                     ; 383       Swif = SUCCESS;
1331  028a               LC006:
1333  028a a601          	ld	a,#1
1334  028c 6b02          	ld	(OFST-2,sp),a
1337  028e 20bf          	jra	L374
1338                     ; 387       Swif = ERROR;
1339  0290               L125:
1340                     ; 397     else if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_LSI))
1342  0290 7b0a          	ld	a,(OFST+6,sp)
1343  0292 260c          	jrne	L525
1345  0294 7b01          	ld	a,(OFST-3,sp)
1346  0296 a1d2          	cp	a,#210
1347  0298 2606          	jrne	L525
1348                     ; 399       CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
1350  029a 721750c0      	bres	20672,#3
1352  029e 200e          	jra	L715
1353  02a0               L525:
1354                     ; 401     else if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSE))
1356  02a0 7b0a          	ld	a,(OFST+6,sp)
1357  02a2 260a          	jrne	L715
1359  02a4 7b01          	ld	a,(OFST-3,sp)
1360  02a6 a1b4          	cp	a,#180
1361  02a8 2604          	jrne	L715
1362                     ; 403       CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
1364  02aa 721150c1      	bres	20673,#0
1365  02ae               L715:
1366                     ; 406   return(Swif);
1368  02ae 7b02          	ld	a,(OFST-2,sp)
1371  02b0 5b06          	addw	sp,#6
1372  02b2 81            	ret	
1373  02b3               LC007:
1374  02b3 89            	pushw	x
1375  02b4 5f            	clrw	x
1376  02b5 89            	pushw	x
1377  02b6 ae000c        	ldw	x,#L75
1378  02b9 cd0000        	call	_assert_failed
1380  02bc 5b04          	addw	sp,#4
1381  02be 81            	ret	
1520                     ; 415 void CLK_HSIPrescalerConfig(CLK_Prescaler_TypeDef HSIPrescaler)
1520                     ; 416 {
1521                     	switch	.text
1522  02bf               _CLK_HSIPrescalerConfig:
1524  02bf 88            	push	a
1525       00000000      OFST:	set	0
1528                     ; 418   assert_param(IS_CLK_HSIPRESCALER_OK(HSIPrescaler));
1530  02c0 4d            	tnz	a
1531  02c1 271a          	jreq	L622
1532  02c3 a108          	cp	a,#8
1533  02c5 2716          	jreq	L622
1534  02c7 a110          	cp	a,#16
1535  02c9 2712          	jreq	L622
1536  02cb a118          	cp	a,#24
1537  02cd 270e          	jreq	L622
1538  02cf ae01a2        	ldw	x,#418
1539  02d2 89            	pushw	x
1540  02d3 5f            	clrw	x
1541  02d4 89            	pushw	x
1542  02d5 ae000c        	ldw	x,#L75
1543  02d8 cd0000        	call	_assert_failed
1545  02db 5b04          	addw	sp,#4
1546  02dd               L622:
1547                     ; 421   CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
1549  02dd c650c6        	ld	a,20678
1550  02e0 a4e7          	and	a,#231
1551  02e2 c750c6        	ld	20678,a
1552                     ; 424   CLK->CKDIVR |= (uint8_t)HSIPrescaler;
1554  02e5 c650c6        	ld	a,20678
1555  02e8 1a01          	or	a,(OFST+1,sp)
1556  02ea c750c6        	ld	20678,a
1557                     ; 425 }
1560  02ed 84            	pop	a
1561  02ee 81            	ret	
1697                     ; 436 void CLK_CCOConfig(CLK_Output_TypeDef CLK_CCO)
1697                     ; 437 {
1698                     	switch	.text
1699  02ef               _CLK_CCOConfig:
1701  02ef 88            	push	a
1702       00000000      OFST:	set	0
1705                     ; 439   assert_param(IS_CLK_OUTPUT_OK(CLK_CCO));
1707  02f0 4d            	tnz	a
1708  02f1 273e          	jreq	L042
1709  02f3 a104          	cp	a,#4
1710  02f5 273a          	jreq	L042
1711  02f7 a102          	cp	a,#2
1712  02f9 2736          	jreq	L042
1713  02fb a108          	cp	a,#8
1714  02fd 2732          	jreq	L042
1715  02ff a10a          	cp	a,#10
1716  0301 272e          	jreq	L042
1717  0303 a10c          	cp	a,#12
1718  0305 272a          	jreq	L042
1719  0307 a10e          	cp	a,#14
1720  0309 2726          	jreq	L042
1721  030b a110          	cp	a,#16
1722  030d 2722          	jreq	L042
1723  030f a112          	cp	a,#18
1724  0311 271e          	jreq	L042
1725  0313 a114          	cp	a,#20
1726  0315 271a          	jreq	L042
1727  0317 a116          	cp	a,#22
1728  0319 2716          	jreq	L042
1729  031b a118          	cp	a,#24
1730  031d 2712          	jreq	L042
1731  031f a11a          	cp	a,#26
1732  0321 270e          	jreq	L042
1733  0323 ae01b7        	ldw	x,#439
1734  0326 89            	pushw	x
1735  0327 5f            	clrw	x
1736  0328 89            	pushw	x
1737  0329 ae000c        	ldw	x,#L75
1738  032c cd0000        	call	_assert_failed
1740  032f 5b04          	addw	sp,#4
1741  0331               L042:
1742                     ; 442   CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOSEL);
1744  0331 c650c9        	ld	a,20681
1745  0334 a4e1          	and	a,#225
1746  0336 c750c9        	ld	20681,a
1747                     ; 445   CLK->CCOR |= (uint8_t)CLK_CCO;
1749  0339 c650c9        	ld	a,20681
1750  033c 1a01          	or	a,(OFST+1,sp)
1751  033e c750c9        	ld	20681,a
1752                     ; 448   CLK->CCOR |= CLK_CCOR_CCOEN;
1754  0341 721050c9      	bset	20681,#0
1755                     ; 449 }
1758  0345 84            	pop	a
1759  0346 81            	ret	
1825                     ; 459 void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState NewState)
1825                     ; 460 {
1826                     	switch	.text
1827  0347               _CLK_ITConfig:
1829  0347 89            	pushw	x
1830       00000000      OFST:	set	0
1833                     ; 462   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1835  0348 9f            	ld	a,xl
1836  0349 4d            	tnz	a
1837  034a 2709          	jreq	L252
1838  034c 9f            	ld	a,xl
1839  034d 4a            	dec	a
1840  034e 2705          	jreq	L252
1841  0350 ae01ce        	ldw	x,#462
1842  0353 ad3f          	call	LC008
1843  0355               L252:
1844                     ; 463   assert_param(IS_CLK_IT_OK(CLK_IT));
1846  0355 7b01          	ld	a,(OFST+1,sp)
1847  0357 a10c          	cp	a,#12
1848  0359 2709          	jreq	L262
1849  035b a11c          	cp	a,#28
1850  035d 2705          	jreq	L262
1851  035f ae01cf        	ldw	x,#463
1852  0362 ad30          	call	LC008
1853  0364               L262:
1854                     ; 465   if (NewState != DISABLE)
1856  0364 7b02          	ld	a,(OFST+2,sp)
1857  0366 2716          	jreq	L727
1858                     ; 467     switch (CLK_IT)
1860  0368 7b01          	ld	a,(OFST+1,sp)
1862                     ; 475     default:
1862                     ; 476       break;
1863  036a a00c          	sub	a,#12
1864  036c 270a          	jreq	L366
1865  036e a010          	sub	a,#16
1866  0370 2620          	jrne	L537
1867                     ; 469     case CLK_IT_SWIF: /* Enable the clock switch interrupt */
1867                     ; 470       CLK->SWCR |= CLK_SWCR_SWIEN;
1869  0372 721450c5      	bset	20677,#2
1870                     ; 471       break;
1872  0376 201a          	jra	L537
1873  0378               L366:
1874                     ; 472     case CLK_IT_CSSD: /* Enable the clock security system detection interrupt */
1874                     ; 473       CLK->CSSR |= CLK_CSSR_CSSDIE;
1876  0378 721450c8      	bset	20680,#2
1877                     ; 474       break;
1879  037c 2014          	jra	L537
1880                     ; 475     default:
1880                     ; 476       break;
1883  037e               L727:
1884                     ; 481     switch (CLK_IT)
1886  037e 7b01          	ld	a,(OFST+1,sp)
1888                     ; 489     default:
1888                     ; 490       break;
1889  0380 a00c          	sub	a,#12
1890  0382 270a          	jreq	L176
1891  0384 a010          	sub	a,#16
1892  0386 260a          	jrne	L537
1893                     ; 483     case CLK_IT_SWIF: /* Disable the clock switch interrupt */
1893                     ; 484       CLK->SWCR  &= (uint8_t)(~CLK_SWCR_SWIEN);
1895  0388 721550c5      	bres	20677,#2
1896                     ; 485       break;
1898  038c 2004          	jra	L537
1899  038e               L176:
1900                     ; 486     case CLK_IT_CSSD: /* Disable the clock security system detection interrupt */
1900                     ; 487       CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDIE);
1902  038e 721550c8      	bres	20680,#2
1903                     ; 488       break;
1904  0392               L537:
1905                     ; 493 }
1908  0392 85            	popw	x
1909  0393 81            	ret	
1910                     ; 489     default:
1910                     ; 490       break;
1912  0394               LC008:
1913  0394 89            	pushw	x
1914  0395 5f            	clrw	x
1915  0396 89            	pushw	x
1916  0397 ae000c        	ldw	x,#L75
1917  039a cd0000        	call	_assert_failed
1919  039d 5b04          	addw	sp,#4
1920  039f 81            	ret	
1956                     ; 500 void CLK_SYSCLKConfig(CLK_Prescaler_TypeDef CLK_Prescaler)
1956                     ; 501 {
1957                     	switch	.text
1958  03a0               _CLK_SYSCLKConfig:
1960  03a0 88            	push	a
1961       00000000      OFST:	set	0
1964                     ; 503   assert_param(IS_CLK_PRESCALER_OK(CLK_Prescaler));
1966  03a1 4d            	tnz	a
1967  03a2 273a          	jreq	L472
1968  03a4 a108          	cp	a,#8
1969  03a6 2736          	jreq	L472
1970  03a8 a110          	cp	a,#16
1971  03aa 2732          	jreq	L472
1972  03ac a118          	cp	a,#24
1973  03ae 272e          	jreq	L472
1974  03b0 a180          	cp	a,#128
1975  03b2 272a          	jreq	L472
1976  03b4 a181          	cp	a,#129
1977  03b6 2726          	jreq	L472
1978  03b8 a182          	cp	a,#130
1979  03ba 2722          	jreq	L472
1980  03bc a183          	cp	a,#131
1981  03be 271e          	jreq	L472
1982  03c0 a184          	cp	a,#132
1983  03c2 271a          	jreq	L472
1984  03c4 a185          	cp	a,#133
1985  03c6 2716          	jreq	L472
1986  03c8 a186          	cp	a,#134
1987  03ca 2712          	jreq	L472
1988  03cc a187          	cp	a,#135
1989  03ce 270e          	jreq	L472
1990  03d0 ae01f7        	ldw	x,#503
1991  03d3 89            	pushw	x
1992  03d4 5f            	clrw	x
1993  03d5 89            	pushw	x
1994  03d6 ae000c        	ldw	x,#L75
1995  03d9 cd0000        	call	_assert_failed
1997  03dc 5b04          	addw	sp,#4
1998  03de               L472:
1999                     ; 505   if (((uint8_t)CLK_Prescaler & (uint8_t)0x80) == 0x00) /* Bit7 = 0 means HSI divider */
2001  03de 7b01          	ld	a,(OFST+1,sp)
2002  03e0 2b0e          	jrmi	L167
2003                     ; 507     CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
2005  03e2 c650c6        	ld	a,20678
2006  03e5 a4e7          	and	a,#231
2007  03e7 c750c6        	ld	20678,a
2008                     ; 508     CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_HSIDIV);
2010  03ea 7b01          	ld	a,(OFST+1,sp)
2011  03ec a418          	and	a,#24
2013  03ee 200c          	jra	L367
2014  03f0               L167:
2015                     ; 512     CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_CPUDIV);
2017  03f0 c650c6        	ld	a,20678
2018  03f3 a4f8          	and	a,#248
2019  03f5 c750c6        	ld	20678,a
2020                     ; 513     CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_CPUDIV);
2022  03f8 7b01          	ld	a,(OFST+1,sp)
2023  03fa a407          	and	a,#7
2024  03fc               L367:
2025  03fc ca50c6        	or	a,20678
2026  03ff c750c6        	ld	20678,a
2027                     ; 515 }
2030  0402 84            	pop	a
2031  0403 81            	ret	
2088                     ; 523 void CLK_SWIMConfig(CLK_SWIMDivider_TypeDef CLK_SWIMDivider)
2088                     ; 524 {
2089                     	switch	.text
2090  0404               _CLK_SWIMConfig:
2092  0404 88            	push	a
2093       00000000      OFST:	set	0
2096                     ; 526   assert_param(IS_CLK_SWIMDIVIDER_OK(CLK_SWIMDivider));
2098  0405 4d            	tnz	a
2099  0406 2711          	jreq	L603
2100  0408 4a            	dec	a
2101  0409 270e          	jreq	L603
2102  040b ae020e        	ldw	x,#526
2103  040e 89            	pushw	x
2104  040f 5f            	clrw	x
2105  0410 89            	pushw	x
2106  0411 ae000c        	ldw	x,#L75
2107  0414 cd0000        	call	_assert_failed
2109  0417 5b04          	addw	sp,#4
2110  0419               L603:
2111                     ; 528   if (CLK_SWIMDivider != CLK_SWIMDIVIDER_2)
2113  0419 7b01          	ld	a,(OFST+1,sp)
2114  041b 2706          	jreq	L3101
2115                     ; 531     CLK->SWIMCCR |= CLK_SWIMCCR_SWIMDIV;
2117  041d 721050cd      	bset	20685,#0
2119  0421 2004          	jra	L5101
2120  0423               L3101:
2121                     ; 536     CLK->SWIMCCR &= (uint8_t)(~CLK_SWIMCCR_SWIMDIV);
2123  0423 721150cd      	bres	20685,#0
2124  0427               L5101:
2125                     ; 538 }
2128  0427 84            	pop	a
2129  0428 81            	ret	
2153                     ; 547 void CLK_ClockSecuritySystemEnable(void)
2153                     ; 548 {
2154                     	switch	.text
2155  0429               _CLK_ClockSecuritySystemEnable:
2159                     ; 550   CLK->CSSR |= CLK_CSSR_CSSEN;
2161  0429 721050c8      	bset	20680,#0
2162                     ; 551 }
2165  042d 81            	ret	
2190                     ; 559 CLK_Source_TypeDef CLK_GetSYSCLKSource(void)
2190                     ; 560 {
2191                     	switch	.text
2192  042e               _CLK_GetSYSCLKSource:
2196                     ; 561   return((CLK_Source_TypeDef)CLK->CMSR);
2198  042e c650c3        	ld	a,20675
2201  0431 81            	ret	
2264                     ; 569 uint32_t CLK_GetClockFreq(void)
2264                     ; 570 {
2265                     	switch	.text
2266  0432               _CLK_GetClockFreq:
2268  0432 5209          	subw	sp,#9
2269       00000009      OFST:	set	9
2272                     ; 571   uint32_t clockfrequency = 0;
2274                     ; 572   CLK_Source_TypeDef clocksource = CLK_SOURCE_HSI;
2276                     ; 573   uint8_t tmp = 0, presc = 0;
2280                     ; 576   clocksource = (CLK_Source_TypeDef)CLK->CMSR;
2282  0434 c650c3        	ld	a,20675
2283  0437 6b09          	ld	(OFST+0,sp),a
2285                     ; 578   if (clocksource == CLK_SOURCE_HSI)
2287  0439 a1e1          	cp	a,#225
2288  043b 2634          	jrne	L1701
2289                     ; 580     tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_HSIDIV);
2291  043d c650c6        	ld	a,20678
2292  0440 a418          	and	a,#24
2293  0442 44            	srl	a
2294  0443 44            	srl	a
2295  0444 44            	srl	a
2297                     ; 581     tmp = (uint8_t)(tmp >> 3);
2300                     ; 582     presc = HSIDivFactor[tmp];
2302  0445 5f            	clrw	x
2303  0446 97            	ld	xl,a
2304  0447 d60000        	ld	a,(_HSIDivFactor,x)
2305  044a 6b09          	ld	(OFST+0,sp),a
2307                     ; 583     clockfrequency = HSI_VALUE / presc;
2309  044c b703          	ld	c_lreg+3,a
2310  044e 3f02          	clr	c_lreg+2
2311  0450 3f01          	clr	c_lreg+1
2312  0452 3f00          	clr	c_lreg
2313  0454 96            	ldw	x,sp
2314  0455 5c            	incw	x
2315  0456 cd0000        	call	c_rtol
2318  0459 ae2400        	ldw	x,#9216
2319  045c bf02          	ldw	c_lreg+2,x
2320  045e ae00f4        	ldw	x,#244
2321  0461 bf00          	ldw	c_lreg,x
2322  0463 96            	ldw	x,sp
2323  0464 5c            	incw	x
2324  0465 cd0000        	call	c_ludv
2326  0468 96            	ldw	x,sp
2327  0469 1c0005        	addw	x,#OFST-4
2328  046c cd0000        	call	c_rtol
2332  046f 2018          	jra	L3701
2333  0471               L1701:
2334                     ; 585   else if ( clocksource == CLK_SOURCE_LSI)
2336  0471 a1d2          	cp	a,#210
2337  0473 260a          	jrne	L5701
2338                     ; 587     clockfrequency = LSI_VALUE;
2340  0475 aef400        	ldw	x,#62464
2341  0478 1f07          	ldw	(OFST-2,sp),x
2342  047a ae0001        	ldw	x,#1
2344  047d 2008          	jp	LC009
2345  047f               L5701:
2346                     ; 591     clockfrequency = HSE_VALUE;
2348  047f ae2400        	ldw	x,#9216
2349  0482 1f07          	ldw	(OFST-2,sp),x
2350  0484 ae00f4        	ldw	x,#244
2351  0487               LC009:
2352  0487 1f05          	ldw	(OFST-4,sp),x
2354  0489               L3701:
2355                     ; 594   return((uint32_t)clockfrequency);
2357  0489 96            	ldw	x,sp
2358  048a 1c0005        	addw	x,#OFST-4
2359  048d cd0000        	call	c_ltor
2363  0490 5b09          	addw	sp,#9
2364  0492 81            	ret	
2464                     ; 604 void CLK_AdjustHSICalibrationValue(CLK_HSITrimValue_TypeDef CLK_HSICalibrationValue)
2464                     ; 605 {
2465                     	switch	.text
2466  0493               _CLK_AdjustHSICalibrationValue:
2468  0493 88            	push	a
2469       00000000      OFST:	set	0
2472                     ; 607   assert_param(IS_CLK_HSITRIMVALUE_OK(CLK_HSICalibrationValue));
2474  0494 4d            	tnz	a
2475  0495 272a          	jreq	L623
2476  0497 a101          	cp	a,#1
2477  0499 2726          	jreq	L623
2478  049b a102          	cp	a,#2
2479  049d 2722          	jreq	L623
2480  049f a103          	cp	a,#3
2481  04a1 271e          	jreq	L623
2482  04a3 a104          	cp	a,#4
2483  04a5 271a          	jreq	L623
2484  04a7 a105          	cp	a,#5
2485  04a9 2716          	jreq	L623
2486  04ab a106          	cp	a,#6
2487  04ad 2712          	jreq	L623
2488  04af a107          	cp	a,#7
2489  04b1 270e          	jreq	L623
2490  04b3 ae025f        	ldw	x,#607
2491  04b6 89            	pushw	x
2492  04b7 5f            	clrw	x
2493  04b8 89            	pushw	x
2494  04b9 ae000c        	ldw	x,#L75
2495  04bc cd0000        	call	_assert_failed
2497  04bf 5b04          	addw	sp,#4
2498  04c1               L623:
2499                     ; 610   CLK->HSITRIMR = (uint8_t)( (uint8_t)(CLK->HSITRIMR & (uint8_t)(~CLK_HSITRIMR_HSITRIM))|((uint8_t)CLK_HSICalibrationValue));
2501  04c1 c650cc        	ld	a,20684
2502  04c4 a4f8          	and	a,#248
2503  04c6 1a01          	or	a,(OFST+1,sp)
2504  04c8 c750cc        	ld	20684,a
2505                     ; 611 }
2508  04cb 84            	pop	a
2509  04cc 81            	ret	
2533                     ; 622 void CLK_SYSCLKEmergencyClear(void)
2533                     ; 623 {
2534                     	switch	.text
2535  04cd               _CLK_SYSCLKEmergencyClear:
2539                     ; 624   CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWBSY);
2541  04cd 721150c5      	bres	20677,#0
2542                     ; 625 }
2545  04d1 81            	ret	
2699                     ; 634 FlagStatus CLK_GetFlagStatus(CLK_Flag_TypeDef CLK_FLAG)
2699                     ; 635 {
2700                     	switch	.text
2701  04d2               _CLK_GetFlagStatus:
2703  04d2 89            	pushw	x
2704  04d3 5203          	subw	sp,#3
2705       00000003      OFST:	set	3
2708                     ; 636   uint16_t statusreg = 0;
2710                     ; 637   uint8_t tmpreg = 0;
2712                     ; 638   FlagStatus bitstatus = RESET;
2714                     ; 641   assert_param(IS_CLK_FLAG_OK(CLK_FLAG));
2716  04d5 a30110        	cpw	x,#272
2717  04d8 2736          	jreq	L243
2718  04da a30102        	cpw	x,#258
2719  04dd 2731          	jreq	L243
2720  04df a30202        	cpw	x,#514
2721  04e2 272c          	jreq	L243
2722  04e4 a30308        	cpw	x,#776
2723  04e7 2727          	jreq	L243
2724  04e9 a30301        	cpw	x,#769
2725  04ec 2722          	jreq	L243
2726  04ee a30408        	cpw	x,#1032
2727  04f1 271d          	jreq	L243
2728  04f3 a30402        	cpw	x,#1026
2729  04f6 2718          	jreq	L243
2730  04f8 a30504        	cpw	x,#1284
2731  04fb 2713          	jreq	L243
2732  04fd a30502        	cpw	x,#1282
2733  0500 270e          	jreq	L243
2734  0502 ae0281        	ldw	x,#641
2735  0505 89            	pushw	x
2736  0506 5f            	clrw	x
2737  0507 89            	pushw	x
2738  0508 ae000c        	ldw	x,#L75
2739  050b cd0000        	call	_assert_failed
2741  050e 5b04          	addw	sp,#4
2742  0510               L243:
2743                     ; 644   statusreg = (uint16_t)((uint16_t)CLK_FLAG & (uint16_t)0xFF00);
2745  0510 7b04          	ld	a,(OFST+1,sp)
2746  0512 97            	ld	xl,a
2747  0513 4f            	clr	a
2748  0514 02            	rlwa	x,a
2749  0515 1f01          	ldw	(OFST-2,sp),x
2751                     ; 647   if (statusreg == 0x0100) /* The flag to check is in ICKRregister */
2753  0517 a30100        	cpw	x,#256
2754  051a 2605          	jrne	L3421
2755                     ; 649     tmpreg = CLK->ICKR;
2757  051c c650c0        	ld	a,20672
2759  051f 2021          	jra	L5421
2760  0521               L3421:
2761                     ; 651   else if (statusreg == 0x0200) /* The flag to check is in ECKRregister */
2763  0521 a30200        	cpw	x,#512
2764  0524 2605          	jrne	L7421
2765                     ; 653     tmpreg = CLK->ECKR;
2767  0526 c650c1        	ld	a,20673
2769  0529 2017          	jra	L5421
2770  052b               L7421:
2771                     ; 655   else if (statusreg == 0x0300) /* The flag to check is in SWIC register */
2773  052b a30300        	cpw	x,#768
2774  052e 2605          	jrne	L3521
2775                     ; 657     tmpreg = CLK->SWCR;
2777  0530 c650c5        	ld	a,20677
2779  0533 200d          	jra	L5421
2780  0535               L3521:
2781                     ; 659   else if (statusreg == 0x0400) /* The flag to check is in CSS register */
2783  0535 a30400        	cpw	x,#1024
2784  0538 2605          	jrne	L7521
2785                     ; 661     tmpreg = CLK->CSSR;
2787  053a c650c8        	ld	a,20680
2789  053d 2003          	jra	L5421
2790  053f               L7521:
2791                     ; 665     tmpreg = CLK->CCOR;
2793  053f c650c9        	ld	a,20681
2794  0542               L5421:
2795  0542 6b03          	ld	(OFST+0,sp),a
2797                     ; 668   if ((tmpreg & (uint8_t)CLK_FLAG) != (uint8_t)RESET)
2799  0544 7b05          	ld	a,(OFST+2,sp)
2800  0546 1503          	bcp	a,(OFST+0,sp)
2801  0548 2704          	jreq	L3621
2802                     ; 670     bitstatus = SET;
2804  054a a601          	ld	a,#1
2807  054c 2001          	jra	L5621
2808  054e               L3621:
2809                     ; 674     bitstatus = RESET;
2811  054e 4f            	clr	a
2813  054f               L5621:
2814                     ; 678   return((FlagStatus)bitstatus);
2818  054f 5b05          	addw	sp,#5
2819  0551 81            	ret	
2866                     ; 687 ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
2866                     ; 688 {
2867                     	switch	.text
2868  0552               _CLK_GetITStatus:
2870  0552 88            	push	a
2871  0553 88            	push	a
2872       00000001      OFST:	set	1
2875                     ; 689   ITStatus bitstatus = RESET;
2877                     ; 692   assert_param(IS_CLK_IT_OK(CLK_IT));
2879  0554 a10c          	cp	a,#12
2880  0556 2712          	jreq	L453
2881  0558 a11c          	cp	a,#28
2882  055a 270e          	jreq	L453
2883  055c ae02b4        	ldw	x,#692
2884  055f 89            	pushw	x
2885  0560 5f            	clrw	x
2886  0561 89            	pushw	x
2887  0562 ae000c        	ldw	x,#L75
2888  0565 cd0000        	call	_assert_failed
2890  0568 5b04          	addw	sp,#4
2891  056a               L453:
2892                     ; 694   if (CLK_IT == CLK_IT_SWIF)
2894  056a 7b02          	ld	a,(OFST+1,sp)
2895  056c a11c          	cp	a,#28
2896  056e 260b          	jrne	L1131
2897                     ; 697     if ((CLK->SWCR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2899  0570 c650c5        	ld	a,20677
2900  0573 1402          	and	a,(OFST+1,sp)
2901  0575 a10c          	cp	a,#12
2902  0577 260f          	jrne	L1231
2903                     ; 699       bitstatus = SET;
2905  0579 2009          	jp	LC011
2906                     ; 703       bitstatus = RESET;
2907  057b               L1131:
2908                     ; 709     if ((CLK->CSSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2910  057b c650c8        	ld	a,20680
2911  057e 1402          	and	a,(OFST+1,sp)
2912  0580 a10c          	cp	a,#12
2913  0582 2604          	jrne	L1231
2914                     ; 711       bitstatus = SET;
2916  0584               LC011:
2918  0584 a601          	ld	a,#1
2921  0586 2001          	jra	L7131
2922  0588               L1231:
2923                     ; 715       bitstatus = RESET;
2926  0588 4f            	clr	a
2928  0589               L7131:
2929                     ; 720   return bitstatus;
2933  0589 85            	popw	x
2934  058a 81            	ret	
2971                     ; 729 void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
2971                     ; 730 {
2972                     	switch	.text
2973  058b               _CLK_ClearITPendingBit:
2975  058b 88            	push	a
2976       00000000      OFST:	set	0
2979                     ; 732   assert_param(IS_CLK_IT_OK(CLK_IT));
2981  058c a10c          	cp	a,#12
2982  058e 2712          	jreq	L663
2983  0590 a11c          	cp	a,#28
2984  0592 270e          	jreq	L663
2985  0594 ae02dc        	ldw	x,#732
2986  0597 89            	pushw	x
2987  0598 5f            	clrw	x
2988  0599 89            	pushw	x
2989  059a ae000c        	ldw	x,#L75
2990  059d cd0000        	call	_assert_failed
2992  05a0 5b04          	addw	sp,#4
2993  05a2               L663:
2994                     ; 734   if (CLK_IT == (uint8_t)CLK_IT_CSSD)
2996  05a2 7b01          	ld	a,(OFST+1,sp)
2997  05a4 a10c          	cp	a,#12
2998  05a6 2606          	jrne	L3431
2999                     ; 737     CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSD);
3001  05a8 721750c8      	bres	20680,#3
3003  05ac 2004          	jra	L5431
3004  05ae               L3431:
3005                     ; 742     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIF);
3007  05ae 721750c5      	bres	20677,#3
3008  05b2               L5431:
3009                     ; 745 }
3012  05b2 84            	pop	a
3013  05b3 81            	ret	
3048                     	xdef	_CLKPrescTable
3049                     	xdef	_HSIDivFactor
3050                     	xdef	_CLK_ClearITPendingBit
3051                     	xdef	_CLK_GetITStatus
3052                     	xdef	_CLK_GetFlagStatus
3053                     	xdef	_CLK_GetSYSCLKSource
3054                     	xdef	_CLK_GetClockFreq
3055                     	xdef	_CLK_AdjustHSICalibrationValue
3056                     	xdef	_CLK_SYSCLKEmergencyClear
3057                     	xdef	_CLK_ClockSecuritySystemEnable
3058                     	xdef	_CLK_SWIMConfig
3059                     	xdef	_CLK_SYSCLKConfig
3060                     	xdef	_CLK_ITConfig
3061                     	xdef	_CLK_CCOConfig
3062                     	xdef	_CLK_HSIPrescalerConfig
3063                     	xdef	_CLK_ClockSwitchConfig
3064                     	xdef	_CLK_PeripheralClockConfig
3065                     	xdef	_CLK_SlowActiveHaltWakeUpCmd
3066                     	xdef	_CLK_FastHaltWakeUpCmd
3067                     	xdef	_CLK_ClockSwitchCmd
3068                     	xdef	_CLK_CCOCmd
3069                     	xdef	_CLK_LSICmd
3070                     	xdef	_CLK_HSICmd
3071                     	xdef	_CLK_HSECmd
3072                     	xdef	_CLK_DeInit
3073                     	xref	_assert_failed
3074                     	switch	.const
3075  000c               L75:
3076  000c 2e2e5c2e2e5c  	dc.b	"..\..\stm8s_spl\li"
3077  001e 627261726965  	dc.b	"braries\stm8s_stdp"
3078  0030 65726970685f  	dc.b	"eriph_driver\src\s"
3079  0042 746d38735f63  	dc.b	"tm8s_clk.c",0
3080                     	xref.b	c_lreg
3081                     	xref.b	c_x
3101                     	xref	c_ltor
3102                     	xref	c_ludv
3103                     	xref	c_rtol
3104                     	end
