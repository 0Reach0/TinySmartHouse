   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.3 - 22 Aug 2024
   4                     ; Optimizer V4.6.3 - 22 Aug 2024
  46                     ; 50 void SPI_DeInit(void)
  46                     ; 51 {
  48                     	switch	.text
  49  0000               _SPI_DeInit:
  53                     ; 52   SPI->CR1    = SPI_CR1_RESET_VALUE;
  55  0000 725f5200      	clr	20992
  56                     ; 53   SPI->CR2    = SPI_CR2_RESET_VALUE;
  58  0004 725f5201      	clr	20993
  59                     ; 54   SPI->ICR    = SPI_ICR_RESET_VALUE;
  61  0008 725f5202      	clr	20994
  62                     ; 55   SPI->SR     = SPI_SR_RESET_VALUE;
  64  000c 35025203      	mov	20995,#2
  65                     ; 56   SPI->CRCPR  = SPI_CRCPR_RESET_VALUE;
  67  0010 35075205      	mov	20997,#7
  68                     ; 57 }
  71  0014 81            	ret	
 388                     ; 78 void SPI_Init(SPI_FirstBit_TypeDef FirstBit, SPI_BaudRatePrescaler_TypeDef BaudRatePrescaler, SPI_Mode_TypeDef Mode, SPI_ClockPolarity_TypeDef ClockPolarity, SPI_ClockPhase_TypeDef ClockPhase, SPI_DataDirection_TypeDef Data_Direction, SPI_NSS_TypeDef Slave_Management, uint8_t CRCPolynomial)
 388                     ; 79 {
 389                     	switch	.text
 390  0015               _SPI_Init:
 392  0015 89            	pushw	x
 393  0016 88            	push	a
 394       00000001      OFST:	set	1
 397                     ; 81   assert_param(IS_SPI_FIRSTBIT_OK(FirstBit));
 399  0017 9e            	ld	a,xh
 400  0018 4d            	tnz	a
 401  0019 270b          	jreq	L41
 402  001b 9e            	ld	a,xh
 403  001c a180          	cp	a,#128
 404  001e 2706          	jreq	L41
 405  0020 ae0051        	ldw	x,#81
 406  0023 cd00d5        	call	LC001
 407  0026               L41:
 408                     ; 82   assert_param(IS_SPI_BAUDRATE_PRESCALER_OK(BaudRatePrescaler));
 410  0026 7b03          	ld	a,(OFST+2,sp)
 411  0028 2722          	jreq	L42
 412  002a a108          	cp	a,#8
 413  002c 271e          	jreq	L42
 414  002e a110          	cp	a,#16
 415  0030 271a          	jreq	L42
 416  0032 a118          	cp	a,#24
 417  0034 2716          	jreq	L42
 418  0036 a120          	cp	a,#32
 419  0038 2712          	jreq	L42
 420  003a a128          	cp	a,#40
 421  003c 270e          	jreq	L42
 422  003e a130          	cp	a,#48
 423  0040 270a          	jreq	L42
 424  0042 a138          	cp	a,#56
 425  0044 2706          	jreq	L42
 426  0046 ae0052        	ldw	x,#82
 427  0049 cd00d5        	call	LC001
 428  004c               L42:
 429                     ; 83   assert_param(IS_SPI_MODE_OK(Mode));
 431  004c 7b06          	ld	a,(OFST+5,sp)
 432  004e a104          	cp	a,#4
 433  0050 2708          	jreq	L43
 434  0052 4d            	tnz	a
 435  0053 2705          	jreq	L43
 436  0055 ae0053        	ldw	x,#83
 437  0058 ad7b          	call	LC001
 438  005a               L43:
 439                     ; 84   assert_param(IS_SPI_POLARITY_OK(ClockPolarity));
 441  005a 7b07          	ld	a,(OFST+6,sp)
 442  005c 2709          	jreq	L44
 443  005e a102          	cp	a,#2
 444  0060 2705          	jreq	L44
 445  0062 ae0054        	ldw	x,#84
 446  0065 ad6e          	call	LC001
 447  0067               L44:
 448                     ; 85   assert_param(IS_SPI_PHASE_OK(ClockPhase));
 450  0067 7b08          	ld	a,(OFST+7,sp)
 451  0069 2708          	jreq	L45
 452  006b 4a            	dec	a
 453  006c 2705          	jreq	L45
 454  006e ae0055        	ldw	x,#85
 455  0071 ad62          	call	LC001
 456  0073               L45:
 457                     ; 86   assert_param(IS_SPI_DATA_DIRECTION_OK(Data_Direction));
 459  0073 7b09          	ld	a,(OFST+8,sp)
 460  0075 2711          	jreq	L46
 461  0077 a104          	cp	a,#4
 462  0079 270d          	jreq	L46
 463  007b a180          	cp	a,#128
 464  007d 2709          	jreq	L46
 465  007f a1c0          	cp	a,#192
 466  0081 2705          	jreq	L46
 467  0083 ae0056        	ldw	x,#86
 468  0086 ad4d          	call	LC001
 469  0088               L46:
 470                     ; 87   assert_param(IS_SPI_SLAVEMANAGEMENT_OK(Slave_Management));
 472  0088 7b0a          	ld	a,(OFST+9,sp)
 473  008a a102          	cp	a,#2
 474  008c 2708          	jreq	L47
 475  008e 4d            	tnz	a
 476  008f 2705          	jreq	L47
 477  0091 ae0057        	ldw	x,#87
 478  0094 ad3f          	call	LC001
 479  0096               L47:
 480                     ; 88   assert_param(IS_SPI_CRC_POLYNOMIAL_OK(CRCPolynomial));
 482  0096 7b0b          	ld	a,(OFST+10,sp)
 483  0098 2605          	jrne	L201
 484  009a ae0058        	ldw	x,#88
 485  009d ad36          	call	LC001
 486  009f               L201:
 487                     ; 91   SPI->CR1 = (uint8_t)((uint8_t)((uint8_t)FirstBit | BaudRatePrescaler) |
 487                     ; 92                        (uint8_t)((uint8_t)ClockPolarity | ClockPhase));
 489  009f 7b07          	ld	a,(OFST+6,sp)
 490  00a1 1a08          	or	a,(OFST+7,sp)
 491  00a3 6b01          	ld	(OFST+0,sp),a
 493  00a5 7b02          	ld	a,(OFST+1,sp)
 494  00a7 1a03          	or	a,(OFST+2,sp)
 495  00a9 1a01          	or	a,(OFST+0,sp)
 496  00ab c75200        	ld	20992,a
 497                     ; 95   SPI->CR2 = (uint8_t)((uint8_t)(Data_Direction) | (uint8_t)(Slave_Management));
 499  00ae 7b09          	ld	a,(OFST+8,sp)
 500  00b0 1a0a          	or	a,(OFST+9,sp)
 501  00b2 c75201        	ld	20993,a
 502                     ; 97   if (Mode == SPI_MODE_MASTER)
 504  00b5 7b06          	ld	a,(OFST+5,sp)
 505  00b7 a104          	cp	a,#4
 506  00b9 2606          	jrne	L502
 507                     ; 99     SPI->CR2 |= (uint8_t)SPI_CR2_SSI;
 509  00bb 72105201      	bset	20993,#0
 511  00bf 2004          	jra	L702
 512  00c1               L502:
 513                     ; 103     SPI->CR2 &= (uint8_t)~(SPI_CR2_SSI);
 515  00c1 72115201      	bres	20993,#0
 516  00c5               L702:
 517                     ; 107   SPI->CR1 |= (uint8_t)(Mode);
 519  00c5 c65200        	ld	a,20992
 520  00c8 1a06          	or	a,(OFST+5,sp)
 521  00ca c75200        	ld	20992,a
 522                     ; 110   SPI->CRCPR = (uint8_t)CRCPolynomial;
 524  00cd 7b0b          	ld	a,(OFST+10,sp)
 525  00cf c75205        	ld	20997,a
 526                     ; 111 }
 529  00d2 5b03          	addw	sp,#3
 530  00d4 81            	ret	
 531  00d5               LC001:
 532  00d5 89            	pushw	x
 533  00d6 5f            	clrw	x
 534  00d7 89            	pushw	x
 535  00d8 ae0000        	ldw	x,#L302
 536  00db cd0000        	call	_assert_failed
 538  00de 5b04          	addw	sp,#4
 539  00e0 81            	ret	
 595                     ; 119 void SPI_Cmd(FunctionalState NewState)
 595                     ; 120 {
 596                     	switch	.text
 597  00e1               _SPI_Cmd:
 599  00e1 88            	push	a
 600       00000000      OFST:	set	0
 603                     ; 122   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 605  00e2 4d            	tnz	a
 606  00e3 2711          	jreq	L411
 607  00e5 4a            	dec	a
 608  00e6 270e          	jreq	L411
 609  00e8 ae007a        	ldw	x,#122
 610  00eb 89            	pushw	x
 611  00ec 5f            	clrw	x
 612  00ed 89            	pushw	x
 613  00ee ae0000        	ldw	x,#L302
 614  00f1 cd0000        	call	_assert_failed
 616  00f4 5b04          	addw	sp,#4
 617  00f6               L411:
 618                     ; 124   if (NewState != DISABLE)
 620  00f6 7b01          	ld	a,(OFST+1,sp)
 621  00f8 2706          	jreq	L732
 622                     ; 126     SPI->CR1 |= SPI_CR1_SPE; /* Enable the SPI peripheral*/
 624  00fa 721c5200      	bset	20992,#6
 626  00fe 2004          	jra	L142
 627  0100               L732:
 628                     ; 130     SPI->CR1 &= (uint8_t)(~SPI_CR1_SPE); /* Disable the SPI peripheral*/
 630  0100 721d5200      	bres	20992,#6
 631  0104               L142:
 632                     ; 132 }
 635  0104 84            	pop	a
 636  0105 81            	ret	
 746                     ; 141 void SPI_ITConfig(SPI_IT_TypeDef SPI_IT, FunctionalState NewState)
 746                     ; 142 {
 747                     	switch	.text
 748  0106               _SPI_ITConfig:
 750  0106 89            	pushw	x
 751  0107 88            	push	a
 752       00000001      OFST:	set	1
 755                     ; 143   uint8_t itpos = 0;
 757                     ; 145   assert_param(IS_SPI_CONFIG_IT_OK(SPI_IT));
 759  0108 9e            	ld	a,xh
 760  0109 a117          	cp	a,#23
 761  010b 2714          	jreq	L621
 762  010d 9e            	ld	a,xh
 763  010e a106          	cp	a,#6
 764  0110 270f          	jreq	L621
 765  0112 9e            	ld	a,xh
 766  0113 a105          	cp	a,#5
 767  0115 270a          	jreq	L621
 768  0117 9e            	ld	a,xh
 769  0118 a134          	cp	a,#52
 770  011a 2705          	jreq	L621
 771  011c ae0091        	ldw	x,#145
 772  011f ad32          	call	LC002
 773  0121               L621:
 774                     ; 146   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 776  0121 7b03          	ld	a,(OFST+2,sp)
 777  0123 2708          	jreq	L631
 778  0125 4a            	dec	a
 779  0126 2705          	jreq	L631
 780  0128 ae0092        	ldw	x,#146
 781  012b ad26          	call	LC002
 782  012d               L631:
 783                     ; 149   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)SPI_IT & (uint8_t)0x0F));
 785  012d 7b02          	ld	a,(OFST+1,sp)
 786  012f a40f          	and	a,#15
 787  0131 5f            	clrw	x
 788  0132 97            	ld	xl,a
 789  0133 a601          	ld	a,#1
 790  0135 5d            	tnzw	x
 791  0136 2704          	jreq	L241
 792  0138               L441:
 793  0138 48            	sll	a
 794  0139 5a            	decw	x
 795  013a 26fc          	jrne	L441
 796  013c               L241:
 797  013c 6b01          	ld	(OFST+0,sp),a
 799                     ; 151   if (NewState != DISABLE)
 801  013e 0d03          	tnz	(OFST+2,sp)
 802  0140 2707          	jreq	L313
 803                     ; 153     SPI->ICR |= itpos; /* Enable interrupt*/
 805  0142 c65202        	ld	a,20994
 806  0145 1a01          	or	a,(OFST+0,sp)
 808  0147 2004          	jra	L513
 809  0149               L313:
 810                     ; 157     SPI->ICR &= (uint8_t)(~itpos); /* Disable interrupt*/
 812  0149 43            	cpl	a
 813  014a c45202        	and	a,20994
 814  014d               L513:
 815  014d c75202        	ld	20994,a
 816                     ; 159 }
 819  0150 5b03          	addw	sp,#3
 820  0152 81            	ret	
 821  0153               LC002:
 822  0153 89            	pushw	x
 823  0154 5f            	clrw	x
 824  0155 89            	pushw	x
 825  0156 ae0000        	ldw	x,#L302
 826  0159 cd0000        	call	_assert_failed
 828  015c 5b04          	addw	sp,#4
 829  015e 81            	ret	
 863                     ; 166 void SPI_SendData(uint8_t Data)
 863                     ; 167 {
 864                     	switch	.text
 865  015f               _SPI_SendData:
 869                     ; 168   SPI->DR = Data; /* Write in the DR register the data to be sent*/
 871  015f c75204        	ld	20996,a
 872                     ; 169 }
 875  0162 81            	ret	
 898                     ; 176 uint8_t SPI_ReceiveData(void)
 898                     ; 177 {
 899                     	switch	.text
 900  0163               _SPI_ReceiveData:
 904                     ; 178   return ((uint8_t)SPI->DR); /* Return the data in the DR register*/
 906  0163 c65204        	ld	a,20996
 909  0166 81            	ret	
 946                     ; 187 void SPI_NSSInternalSoftwareCmd(FunctionalState NewState)
 946                     ; 188 {
 947                     	switch	.text
 948  0167               _SPI_NSSInternalSoftwareCmd:
 950  0167 88            	push	a
 951       00000000      OFST:	set	0
 954                     ; 190   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 956  0168 4d            	tnz	a
 957  0169 2711          	jreq	L061
 958  016b 4a            	dec	a
 959  016c 270e          	jreq	L061
 960  016e ae00be        	ldw	x,#190
 961  0171 89            	pushw	x
 962  0172 5f            	clrw	x
 963  0173 89            	pushw	x
 964  0174 ae0000        	ldw	x,#L302
 965  0177 cd0000        	call	_assert_failed
 967  017a 5b04          	addw	sp,#4
 968  017c               L061:
 969                     ; 192   if (NewState != DISABLE)
 971  017c 7b01          	ld	a,(OFST+1,sp)
 972  017e 2706          	jreq	L363
 973                     ; 194     SPI->CR2 |= SPI_CR2_SSI; /* Set NSS pin internally by software*/
 975  0180 72105201      	bset	20993,#0
 977  0184 2004          	jra	L563
 978  0186               L363:
 979                     ; 198     SPI->CR2 &= (uint8_t)(~SPI_CR2_SSI); /* Reset NSS pin internally by software*/
 981  0186 72115201      	bres	20993,#0
 982  018a               L563:
 983                     ; 200 }
 986  018a 84            	pop	a
 987  018b 81            	ret	
1010                     ; 207 void SPI_TransmitCRC(void)
1010                     ; 208 {
1011                     	switch	.text
1012  018c               _SPI_TransmitCRC:
1016                     ; 209   SPI->CR2 |= SPI_CR2_CRCNEXT; /* Enable the CRC transmission*/
1018  018c 72185201      	bset	20993,#4
1019                     ; 210 }
1022  0190 81            	ret	
1059                     ; 218 void SPI_CalculateCRCCmd(FunctionalState NewState)
1059                     ; 219 {
1060                     	switch	.text
1061  0191               _SPI_CalculateCRCCmd:
1063  0191 88            	push	a
1064       00000000      OFST:	set	0
1067                     ; 221   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1069  0192 4d            	tnz	a
1070  0193 2711          	jreq	L471
1071  0195 4a            	dec	a
1072  0196 270e          	jreq	L471
1073  0198 ae00dd        	ldw	x,#221
1074  019b 89            	pushw	x
1075  019c 5f            	clrw	x
1076  019d 89            	pushw	x
1077  019e ae0000        	ldw	x,#L302
1078  01a1 cd0000        	call	_assert_failed
1080  01a4 5b04          	addw	sp,#4
1081  01a6               L471:
1082                     ; 223   if (NewState != DISABLE)
1084  01a6 7b01          	ld	a,(OFST+1,sp)
1085  01a8 2706          	jreq	L514
1086                     ; 225     SPI->CR2 |= SPI_CR2_CRCEN; /* Enable the CRC calculation*/
1088  01aa 721a5201      	bset	20993,#5
1090  01ae 2004          	jra	L714
1091  01b0               L514:
1092                     ; 229     SPI->CR2 &= (uint8_t)(~SPI_CR2_CRCEN); /* Disable the CRC calculation*/
1094  01b0 721b5201      	bres	20993,#5
1095  01b4               L714:
1096                     ; 231 }
1099  01b4 84            	pop	a
1100  01b5 81            	ret	
1165                     ; 238 uint8_t SPI_GetCRC(SPI_CRC_TypeDef SPI_CRC)
1165                     ; 239 {
1166                     	switch	.text
1167  01b6               _SPI_GetCRC:
1169  01b6 88            	push	a
1170  01b7 88            	push	a
1171       00000001      OFST:	set	1
1174                     ; 240   uint8_t crcreg = 0;
1176                     ; 243   assert_param(IS_SPI_CRC_OK(SPI_CRC));
1178  01b8 a101          	cp	a,#1
1179  01ba 2711          	jreq	L602
1180  01bc 4d            	tnz	a
1181  01bd 270e          	jreq	L602
1182  01bf ae00f3        	ldw	x,#243
1183  01c2 89            	pushw	x
1184  01c3 5f            	clrw	x
1185  01c4 89            	pushw	x
1186  01c5 ae0000        	ldw	x,#L302
1187  01c8 cd0000        	call	_assert_failed
1189  01cb 5b04          	addw	sp,#4
1190  01cd               L602:
1191                     ; 245   if (SPI_CRC != SPI_CRC_RX)
1193  01cd 7b02          	ld	a,(OFST+1,sp)
1194  01cf 2705          	jreq	L354
1195                     ; 247     crcreg = SPI->TXCRCR;  /* Get the Tx CRC register*/
1197  01d1 c65207        	ld	a,20999
1200  01d4 2003          	jra	L554
1201  01d6               L354:
1202                     ; 251     crcreg = SPI->RXCRCR; /* Get the Rx CRC register*/
1204  01d6 c65206        	ld	a,20998
1206  01d9               L554:
1207                     ; 255   return crcreg;
1211  01d9 85            	popw	x
1212  01da 81            	ret	
1237                     ; 263 void SPI_ResetCRC(void)
1237                     ; 264 {
1238                     	switch	.text
1239  01db               _SPI_ResetCRC:
1243                     ; 267   SPI_CalculateCRCCmd(ENABLE);
1245  01db a601          	ld	a,#1
1246  01dd adb2          	call	_SPI_CalculateCRCCmd
1248                     ; 270   SPI_Cmd(ENABLE);
1250  01df a601          	ld	a,#1
1252                     ; 271 }
1255  01e1 cc00e1        	jp	_SPI_Cmd
1279                     ; 278 uint8_t SPI_GetCRCPolynomial(void)
1279                     ; 279 {
1280                     	switch	.text
1281  01e4               _SPI_GetCRCPolynomial:
1285                     ; 280   return SPI->CRCPR; /* Return the CRC polynomial register */
1287  01e4 c65205        	ld	a,20997
1290  01e7 81            	ret	
1347                     ; 288 void SPI_BiDirectionalLineConfig(SPI_Direction_TypeDef SPI_Direction)
1347                     ; 289 {
1348                     	switch	.text
1349  01e8               _SPI_BiDirectionalLineConfig:
1351  01e8 88            	push	a
1352       00000000      OFST:	set	0
1355                     ; 291   assert_param(IS_SPI_DIRECTION_OK(SPI_Direction));
1357  01e9 4d            	tnz	a
1358  01ea 2711          	jreq	L032
1359  01ec 4a            	dec	a
1360  01ed 270e          	jreq	L032
1361  01ef ae0123        	ldw	x,#291
1362  01f2 89            	pushw	x
1363  01f3 5f            	clrw	x
1364  01f4 89            	pushw	x
1365  01f5 ae0000        	ldw	x,#L302
1366  01f8 cd0000        	call	_assert_failed
1368  01fb 5b04          	addw	sp,#4
1369  01fd               L032:
1370                     ; 293   if (SPI_Direction != SPI_DIRECTION_RX)
1372  01fd 7b01          	ld	a,(OFST+1,sp)
1373  01ff 2706          	jreq	L525
1374                     ; 295     SPI->CR2 |= SPI_CR2_BDOE; /* Set the Tx only mode*/
1376  0201 721c5201      	bset	20993,#6
1378  0205 2004          	jra	L725
1379  0207               L525:
1380                     ; 299     SPI->CR2 &= (uint8_t)(~SPI_CR2_BDOE); /* Set the Rx only mode*/
1382  0207 721d5201      	bres	20993,#6
1383  020b               L725:
1384                     ; 301 }
1387  020b 84            	pop	a
1388  020c 81            	ret	
1510                     ; 311 FlagStatus SPI_GetFlagStatus(SPI_Flag_TypeDef SPI_FLAG)
1510                     ; 312 {
1511                     	switch	.text
1512  020d               _SPI_GetFlagStatus:
1514  020d 88            	push	a
1515  020e 88            	push	a
1516       00000001      OFST:	set	1
1519                     ; 313   FlagStatus status = RESET;
1521                     ; 315   assert_param(IS_SPI_FLAGS_OK(SPI_FLAG));
1523  020f a140          	cp	a,#64
1524  0211 2726          	jreq	L242
1525  0213 a120          	cp	a,#32
1526  0215 2722          	jreq	L242
1527  0217 a110          	cp	a,#16
1528  0219 271e          	jreq	L242
1529  021b a108          	cp	a,#8
1530  021d 271a          	jreq	L242
1531  021f a102          	cp	a,#2
1532  0221 2716          	jreq	L242
1533  0223 a101          	cp	a,#1
1534  0225 2712          	jreq	L242
1535  0227 a180          	cp	a,#128
1536  0229 270e          	jreq	L242
1537  022b ae013b        	ldw	x,#315
1538  022e 89            	pushw	x
1539  022f 5f            	clrw	x
1540  0230 89            	pushw	x
1541  0231 ae0000        	ldw	x,#L302
1542  0234 cd0000        	call	_assert_failed
1544  0237 5b04          	addw	sp,#4
1545  0239               L242:
1546                     ; 318   if ((SPI->SR & (uint8_t)SPI_FLAG) != (uint8_t)RESET)
1548  0239 c65203        	ld	a,20995
1549  023c 1502          	bcp	a,(OFST+1,sp)
1550  023e 2704          	jreq	L506
1551                     ; 320     status = SET; /* SPI_FLAG is set */
1553  0240 a601          	ld	a,#1
1556  0242 2001          	jra	L706
1557  0244               L506:
1558                     ; 324     status = RESET; /* SPI_FLAG is reset*/
1560  0244 4f            	clr	a
1562  0245               L706:
1563                     ; 328   return status;
1567  0245 85            	popw	x
1568  0246 81            	ret	
1604                     ; 346 void SPI_ClearFlag(SPI_Flag_TypeDef SPI_FLAG)
1604                     ; 347 {
1605                     	switch	.text
1606  0247               _SPI_ClearFlag:
1608  0247 88            	push	a
1609       00000000      OFST:	set	0
1612                     ; 348   assert_param(IS_SPI_CLEAR_FLAGS_OK(SPI_FLAG));
1614  0248 a110          	cp	a,#16
1615  024a 2712          	jreq	L452
1616  024c a108          	cp	a,#8
1617  024e 270e          	jreq	L452
1618  0250 ae015c        	ldw	x,#348
1619  0253 89            	pushw	x
1620  0254 5f            	clrw	x
1621  0255 89            	pushw	x
1622  0256 ae0000        	ldw	x,#L302
1623  0259 cd0000        	call	_assert_failed
1625  025c 5b04          	addw	sp,#4
1626  025e               L452:
1627                     ; 350   SPI->SR = (uint8_t)(~SPI_FLAG);
1629  025e 7b01          	ld	a,(OFST+1,sp)
1630  0260 43            	cpl	a
1631  0261 c75203        	ld	20995,a
1632                     ; 351 }
1635  0264 84            	pop	a
1636  0265 81            	ret	
1719                     ; 366 ITStatus SPI_GetITStatus(SPI_IT_TypeDef SPI_IT)
1719                     ; 367 {
1720                     	switch	.text
1721  0266               _SPI_GetITStatus:
1723  0266 88            	push	a
1724  0267 89            	pushw	x
1725       00000002      OFST:	set	2
1728                     ; 368   ITStatus pendingbitstatus = RESET;
1730                     ; 369   uint8_t itpos = 0;
1732                     ; 370   uint8_t itmask1 = 0;
1734                     ; 371   uint8_t itmask2 = 0;
1736                     ; 372   uint8_t enablestatus = 0;
1738                     ; 373   assert_param(IS_SPI_GET_IT_OK(SPI_IT));
1740  0268 a165          	cp	a,#101
1741  026a 2722          	jreq	L662
1742  026c a155          	cp	a,#85
1743  026e 271e          	jreq	L662
1744  0270 a145          	cp	a,#69
1745  0272 271a          	jreq	L662
1746  0274 a134          	cp	a,#52
1747  0276 2716          	jreq	L662
1748  0278 a117          	cp	a,#23
1749  027a 2712          	jreq	L662
1750  027c a106          	cp	a,#6
1751  027e 270e          	jreq	L662
1752  0280 ae0175        	ldw	x,#373
1753  0283 89            	pushw	x
1754  0284 5f            	clrw	x
1755  0285 89            	pushw	x
1756  0286 ae0000        	ldw	x,#L302
1757  0289 cd0000        	call	_assert_failed
1759  028c 5b04          	addw	sp,#4
1760  028e               L662:
1761                     ; 375   itpos = (uint8_t)((uint8_t)1 << ((uint8_t)SPI_IT & (uint8_t)0x0F));
1763  028e 7b03          	ld	a,(OFST+1,sp)
1764  0290 a40f          	and	a,#15
1765  0292 5f            	clrw	x
1766  0293 97            	ld	xl,a
1767  0294 a601          	ld	a,#1
1768  0296 5d            	tnzw	x
1769  0297 2704          	jreq	L272
1770  0299               L472:
1771  0299 48            	sll	a
1772  029a 5a            	decw	x
1773  029b 26fc          	jrne	L472
1774  029d               L272:
1775  029d 6b01          	ld	(OFST-1,sp),a
1777                     ; 378   itmask1 = (uint8_t)((uint8_t)SPI_IT >> (uint8_t)4);
1779  029f 7b03          	ld	a,(OFST+1,sp)
1780  02a1 4e            	swap	a
1781  02a2 a40f          	and	a,#15
1782  02a4 6b02          	ld	(OFST+0,sp),a
1784                     ; 380   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
1786  02a6 5f            	clrw	x
1787  02a7 97            	ld	xl,a
1788  02a8 a601          	ld	a,#1
1789  02aa 5d            	tnzw	x
1790  02ab 2704          	jreq	L672
1791  02ad               L003:
1792  02ad 48            	sll	a
1793  02ae 5a            	decw	x
1794  02af 26fc          	jrne	L003
1795  02b1               L672:
1797                     ; 382   enablestatus = (uint8_t)((uint8_t)SPI->SR & itmask2);
1799  02b1 c45203        	and	a,20995
1800  02b4 6b02          	ld	(OFST+0,sp),a
1802                     ; 384   if (((SPI->ICR & itpos) != RESET) && enablestatus)
1804  02b6 c65202        	ld	a,20994
1805  02b9 1501          	bcp	a,(OFST-1,sp)
1806  02bb 2708          	jreq	L176
1808  02bd 7b02          	ld	a,(OFST+0,sp)
1809  02bf 2704          	jreq	L176
1810                     ; 387     pendingbitstatus = SET;
1812  02c1 a601          	ld	a,#1
1815  02c3 2001          	jra	L376
1816  02c5               L176:
1817                     ; 392     pendingbitstatus = RESET;
1819  02c5 4f            	clr	a
1821  02c6               L376:
1822                     ; 395   return  pendingbitstatus;
1826  02c6 5b03          	addw	sp,#3
1827  02c8 81            	ret	
1873                     ; 412 void SPI_ClearITPendingBit(SPI_IT_TypeDef SPI_IT)
1873                     ; 413 {
1874                     	switch	.text
1875  02c9               _SPI_ClearITPendingBit:
1877  02c9 88            	push	a
1878  02ca 88            	push	a
1879       00000001      OFST:	set	1
1882                     ; 414   uint8_t itpos = 0;
1884                     ; 415   assert_param(IS_SPI_CLEAR_IT_OK(SPI_IT));
1886  02cb a145          	cp	a,#69
1887  02cd 2712          	jreq	L013
1888  02cf a134          	cp	a,#52
1889  02d1 270e          	jreq	L013
1890  02d3 ae019f        	ldw	x,#415
1891  02d6 89            	pushw	x
1892  02d7 5f            	clrw	x
1893  02d8 89            	pushw	x
1894  02d9 ae0000        	ldw	x,#L302
1895  02dc cd0000        	call	_assert_failed
1897  02df 5b04          	addw	sp,#4
1898  02e1               L013:
1899                     ; 420   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)(SPI_IT & (uint8_t)0xF0) >> 4));
1901  02e1 7b02          	ld	a,(OFST+1,sp)
1902  02e3 4e            	swap	a
1903  02e4 a40f          	and	a,#15
1904  02e6 5f            	clrw	x
1905  02e7 97            	ld	xl,a
1906  02e8 a601          	ld	a,#1
1907  02ea 5d            	tnzw	x
1908  02eb 2704          	jreq	L413
1909  02ed               L613:
1910  02ed 48            	sll	a
1911  02ee 5a            	decw	x
1912  02ef 26fc          	jrne	L613
1913  02f1               L413:
1915                     ; 422   SPI->SR = (uint8_t)(~itpos);
1917  02f1 43            	cpl	a
1918  02f2 c75203        	ld	20995,a
1919                     ; 424 }
1922  02f5 85            	popw	x
1923  02f6 81            	ret	
1936                     	xdef	_SPI_ClearITPendingBit
1937                     	xdef	_SPI_GetITStatus
1938                     	xdef	_SPI_ClearFlag
1939                     	xdef	_SPI_GetFlagStatus
1940                     	xdef	_SPI_BiDirectionalLineConfig
1941                     	xdef	_SPI_GetCRCPolynomial
1942                     	xdef	_SPI_ResetCRC
1943                     	xdef	_SPI_GetCRC
1944                     	xdef	_SPI_CalculateCRCCmd
1945                     	xdef	_SPI_TransmitCRC
1946                     	xdef	_SPI_NSSInternalSoftwareCmd
1947                     	xdef	_SPI_ReceiveData
1948                     	xdef	_SPI_SendData
1949                     	xdef	_SPI_ITConfig
1950                     	xdef	_SPI_Cmd
1951                     	xdef	_SPI_Init
1952                     	xdef	_SPI_DeInit
1953                     	xref	_assert_failed
1954                     .const:	section	.text
1955  0000               L302:
1956  0000 2e2e5c2e2e5c  	dc.b	"..\..\stm8s_spl\li"
1957  0012 627261726965  	dc.b	"braries\stm8s_stdp"
1958  0024 65726970685f  	dc.b	"eriph_driver\src\s"
1959  0036 746d38735f73  	dc.b	"tm8s_spi.c",0
1979                     	end
