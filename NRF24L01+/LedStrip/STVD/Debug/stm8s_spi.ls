   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.3 - 22 Aug 2024
   4                     ; Optimizer V4.6.3 - 22 Aug 2024
  47                     ; 50 void SPI_DeInit(void)
  47                     ; 51 {
  49                     	switch	.text
  50  0000               _SPI_DeInit:
  54                     ; 52   SPI->CR1    = SPI_CR1_RESET_VALUE;
  56  0000 725f5200      	clr	20992
  57                     ; 53   SPI->CR2    = SPI_CR2_RESET_VALUE;
  59  0004 725f5201      	clr	20993
  60                     ; 54   SPI->ICR    = SPI_ICR_RESET_VALUE;
  62  0008 725f5202      	clr	20994
  63                     ; 55   SPI->SR     = SPI_SR_RESET_VALUE;
  65  000c 35025203      	mov	20995,#2
  66                     ; 56   SPI->CRCPR  = SPI_CRCPR_RESET_VALUE;
  68  0010 35075205      	mov	20997,#7
  69                     ; 57 }
  72  0014 81            	ret	
 389                     ; 78 void SPI_Init(SPI_FirstBit_TypeDef FirstBit, SPI_BaudRatePrescaler_TypeDef BaudRatePrescaler, SPI_Mode_TypeDef Mode, SPI_ClockPolarity_TypeDef ClockPolarity, SPI_ClockPhase_TypeDef ClockPhase, SPI_DataDirection_TypeDef Data_Direction, SPI_NSS_TypeDef Slave_Management, uint8_t CRCPolynomial)
 389                     ; 79 {
 390                     	switch	.text
 391  0015               _SPI_Init:
 393  0015 89            	pushw	x
 394  0016 88            	push	a
 395       00000001      OFST:	set	1
 398                     ; 81   assert_param(IS_SPI_FIRSTBIT_OK(FirstBit));
 400  0017 9e            	ld	a,xh
 401  0018 4d            	tnz	a
 402  0019 270b          	jreq	L41
 403  001b 9e            	ld	a,xh
 404  001c a180          	cp	a,#128
 405  001e 2706          	jreq	L41
 406  0020 ae0051        	ldw	x,#81
 407  0023 cd00d5        	call	LC001
 408  0026               L41:
 409                     ; 82   assert_param(IS_SPI_BAUDRATE_PRESCALER_OK(BaudRatePrescaler));
 411  0026 7b03          	ld	a,(OFST+2,sp)
 412  0028 2722          	jreq	L42
 413  002a a108          	cp	a,#8
 414  002c 271e          	jreq	L42
 415  002e a110          	cp	a,#16
 416  0030 271a          	jreq	L42
 417  0032 a118          	cp	a,#24
 418  0034 2716          	jreq	L42
 419  0036 a120          	cp	a,#32
 420  0038 2712          	jreq	L42
 421  003a a128          	cp	a,#40
 422  003c 270e          	jreq	L42
 423  003e a130          	cp	a,#48
 424  0040 270a          	jreq	L42
 425  0042 a138          	cp	a,#56
 426  0044 2706          	jreq	L42
 427  0046 ae0052        	ldw	x,#82
 428  0049 cd00d5        	call	LC001
 429  004c               L42:
 430                     ; 83   assert_param(IS_SPI_MODE_OK(Mode));
 432  004c 7b06          	ld	a,(OFST+5,sp)
 433  004e a104          	cp	a,#4
 434  0050 2708          	jreq	L43
 435  0052 4d            	tnz	a
 436  0053 2705          	jreq	L43
 437  0055 ae0053        	ldw	x,#83
 438  0058 ad7b          	call	LC001
 439  005a               L43:
 440                     ; 84   assert_param(IS_SPI_POLARITY_OK(ClockPolarity));
 442  005a 7b07          	ld	a,(OFST+6,sp)
 443  005c 2709          	jreq	L44
 444  005e a102          	cp	a,#2
 445  0060 2705          	jreq	L44
 446  0062 ae0054        	ldw	x,#84
 447  0065 ad6e          	call	LC001
 448  0067               L44:
 449                     ; 85   assert_param(IS_SPI_PHASE_OK(ClockPhase));
 451  0067 7b08          	ld	a,(OFST+7,sp)
 452  0069 2708          	jreq	L45
 453  006b 4a            	dec	a
 454  006c 2705          	jreq	L45
 455  006e ae0055        	ldw	x,#85
 456  0071 ad62          	call	LC001
 457  0073               L45:
 458                     ; 86   assert_param(IS_SPI_DATA_DIRECTION_OK(Data_Direction));
 460  0073 7b09          	ld	a,(OFST+8,sp)
 461  0075 2711          	jreq	L46
 462  0077 a104          	cp	a,#4
 463  0079 270d          	jreq	L46
 464  007b a180          	cp	a,#128
 465  007d 2709          	jreq	L46
 466  007f a1c0          	cp	a,#192
 467  0081 2705          	jreq	L46
 468  0083 ae0056        	ldw	x,#86
 469  0086 ad4d          	call	LC001
 470  0088               L46:
 471                     ; 87   assert_param(IS_SPI_SLAVEMANAGEMENT_OK(Slave_Management));
 473  0088 7b0a          	ld	a,(OFST+9,sp)
 474  008a a102          	cp	a,#2
 475  008c 2708          	jreq	L47
 476  008e 4d            	tnz	a
 477  008f 2705          	jreq	L47
 478  0091 ae0057        	ldw	x,#87
 479  0094 ad3f          	call	LC001
 480  0096               L47:
 481                     ; 88   assert_param(IS_SPI_CRC_POLYNOMIAL_OK(CRCPolynomial));
 483  0096 7b0b          	ld	a,(OFST+10,sp)
 484  0098 2605          	jrne	L201
 485  009a ae0058        	ldw	x,#88
 486  009d ad36          	call	LC001
 487  009f               L201:
 488                     ; 91   SPI->CR1 = (uint8_t)((uint8_t)((uint8_t)FirstBit | BaudRatePrescaler) |
 488                     ; 92                        (uint8_t)((uint8_t)ClockPolarity | ClockPhase));
 490  009f 7b07          	ld	a,(OFST+6,sp)
 491  00a1 1a08          	or	a,(OFST+7,sp)
 492  00a3 6b01          	ld	(OFST+0,sp),a
 494  00a5 7b02          	ld	a,(OFST+1,sp)
 495  00a7 1a03          	or	a,(OFST+2,sp)
 496  00a9 1a01          	or	a,(OFST+0,sp)
 497  00ab c75200        	ld	20992,a
 498                     ; 95   SPI->CR2 = (uint8_t)((uint8_t)(Data_Direction) | (uint8_t)(Slave_Management));
 500  00ae 7b09          	ld	a,(OFST+8,sp)
 501  00b0 1a0a          	or	a,(OFST+9,sp)
 502  00b2 c75201        	ld	20993,a
 503                     ; 97   if (Mode == SPI_MODE_MASTER)
 505  00b5 7b06          	ld	a,(OFST+5,sp)
 506  00b7 a104          	cp	a,#4
 507  00b9 2606          	jrne	L502
 508                     ; 99     SPI->CR2 |= (uint8_t)SPI_CR2_SSI;
 510  00bb 72105201      	bset	20993,#0
 512  00bf 2004          	jra	L702
 513  00c1               L502:
 514                     ; 103     SPI->CR2 &= (uint8_t)~(SPI_CR2_SSI);
 516  00c1 72115201      	bres	20993,#0
 517  00c5               L702:
 518                     ; 107   SPI->CR1 |= (uint8_t)(Mode);
 520  00c5 c65200        	ld	a,20992
 521  00c8 1a06          	or	a,(OFST+5,sp)
 522  00ca c75200        	ld	20992,a
 523                     ; 110   SPI->CRCPR = (uint8_t)CRCPolynomial;
 525  00cd 7b0b          	ld	a,(OFST+10,sp)
 526  00cf c75205        	ld	20997,a
 527                     ; 111 }
 530  00d2 5b03          	addw	sp,#3
 531  00d4 81            	ret	
 532  00d5               LC001:
 533  00d5 89            	pushw	x
 534  00d6 5f            	clrw	x
 535  00d7 89            	pushw	x
 536  00d8 ae0000        	ldw	x,#L302
 537  00db cd0000        	call	_assert_failed
 539  00de 5b04          	addw	sp,#4
 540  00e0 81            	ret	
 596                     ; 119 void SPI_Cmd(FunctionalState NewState)
 596                     ; 120 {
 597                     	switch	.text
 598  00e1               _SPI_Cmd:
 600  00e1 88            	push	a
 601       00000000      OFST:	set	0
 604                     ; 122   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 606  00e2 4d            	tnz	a
 607  00e3 2711          	jreq	L411
 608  00e5 4a            	dec	a
 609  00e6 270e          	jreq	L411
 610  00e8 ae007a        	ldw	x,#122
 611  00eb 89            	pushw	x
 612  00ec 5f            	clrw	x
 613  00ed 89            	pushw	x
 614  00ee ae0000        	ldw	x,#L302
 615  00f1 cd0000        	call	_assert_failed
 617  00f4 5b04          	addw	sp,#4
 618  00f6               L411:
 619                     ; 124   if (NewState != DISABLE)
 621  00f6 7b01          	ld	a,(OFST+1,sp)
 622  00f8 2706          	jreq	L732
 623                     ; 126     SPI->CR1 |= SPI_CR1_SPE; /* Enable the SPI peripheral*/
 625  00fa 721c5200      	bset	20992,#6
 627  00fe 2004          	jra	L142
 628  0100               L732:
 629                     ; 130     SPI->CR1 &= (uint8_t)(~SPI_CR1_SPE); /* Disable the SPI peripheral*/
 631  0100 721d5200      	bres	20992,#6
 632  0104               L142:
 633                     ; 132 }
 636  0104 84            	pop	a
 637  0105 81            	ret	
 747                     ; 141 void SPI_ITConfig(SPI_IT_TypeDef SPI_IT, FunctionalState NewState)
 747                     ; 142 {
 748                     	switch	.text
 749  0106               _SPI_ITConfig:
 751  0106 89            	pushw	x
 752  0107 88            	push	a
 753       00000001      OFST:	set	1
 756                     ; 143   uint8_t itpos = 0;
 758                     ; 145   assert_param(IS_SPI_CONFIG_IT_OK(SPI_IT));
 760  0108 9e            	ld	a,xh
 761  0109 a117          	cp	a,#23
 762  010b 2714          	jreq	L621
 763  010d 9e            	ld	a,xh
 764  010e a106          	cp	a,#6
 765  0110 270f          	jreq	L621
 766  0112 9e            	ld	a,xh
 767  0113 a105          	cp	a,#5
 768  0115 270a          	jreq	L621
 769  0117 9e            	ld	a,xh
 770  0118 a134          	cp	a,#52
 771  011a 2705          	jreq	L621
 772  011c ae0091        	ldw	x,#145
 773  011f ad32          	call	LC002
 774  0121               L621:
 775                     ; 146   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 777  0121 7b03          	ld	a,(OFST+2,sp)
 778  0123 2708          	jreq	L631
 779  0125 4a            	dec	a
 780  0126 2705          	jreq	L631
 781  0128 ae0092        	ldw	x,#146
 782  012b ad26          	call	LC002
 783  012d               L631:
 784                     ; 149   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)SPI_IT & (uint8_t)0x0F));
 786  012d 7b02          	ld	a,(OFST+1,sp)
 787  012f a40f          	and	a,#15
 788  0131 5f            	clrw	x
 789  0132 97            	ld	xl,a
 790  0133 a601          	ld	a,#1
 791  0135 5d            	tnzw	x
 792  0136 2704          	jreq	L241
 793  0138               L441:
 794  0138 48            	sll	a
 795  0139 5a            	decw	x
 796  013a 26fc          	jrne	L441
 797  013c               L241:
 798  013c 6b01          	ld	(OFST+0,sp),a
 800                     ; 151   if (NewState != DISABLE)
 802  013e 0d03          	tnz	(OFST+2,sp)
 803  0140 2707          	jreq	L313
 804                     ; 153     SPI->ICR |= itpos; /* Enable interrupt*/
 806  0142 c65202        	ld	a,20994
 807  0145 1a01          	or	a,(OFST+0,sp)
 809  0147 2004          	jra	L513
 810  0149               L313:
 811                     ; 157     SPI->ICR &= (uint8_t)(~itpos); /* Disable interrupt*/
 813  0149 43            	cpl	a
 814  014a c45202        	and	a,20994
 815  014d               L513:
 816  014d c75202        	ld	20994,a
 817                     ; 159 }
 820  0150 5b03          	addw	sp,#3
 821  0152 81            	ret	
 822  0153               LC002:
 823  0153 89            	pushw	x
 824  0154 5f            	clrw	x
 825  0155 89            	pushw	x
 826  0156 ae0000        	ldw	x,#L302
 827  0159 cd0000        	call	_assert_failed
 829  015c 5b04          	addw	sp,#4
 830  015e 81            	ret	
 864                     ; 166 void SPI_SendData(uint8_t Data)
 864                     ; 167 {
 865                     	switch	.text
 866  015f               _SPI_SendData:
 870                     ; 168   SPI->DR = Data; /* Write in the DR register the data to be sent*/
 872  015f c75204        	ld	20996,a
 873                     ; 169 }
 876  0162 81            	ret	
 899                     ; 176 uint8_t SPI_ReceiveData(void)
 899                     ; 177 {
 900                     	switch	.text
 901  0163               _SPI_ReceiveData:
 905                     ; 178   return ((uint8_t)SPI->DR); /* Return the data in the DR register*/
 907  0163 c65204        	ld	a,20996
 910  0166 81            	ret	
 947                     ; 187 void SPI_NSSInternalSoftwareCmd(FunctionalState NewState)
 947                     ; 188 {
 948                     	switch	.text
 949  0167               _SPI_NSSInternalSoftwareCmd:
 951  0167 88            	push	a
 952       00000000      OFST:	set	0
 955                     ; 190   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 957  0168 4d            	tnz	a
 958  0169 2711          	jreq	L061
 959  016b 4a            	dec	a
 960  016c 270e          	jreq	L061
 961  016e ae00be        	ldw	x,#190
 962  0171 89            	pushw	x
 963  0172 5f            	clrw	x
 964  0173 89            	pushw	x
 965  0174 ae0000        	ldw	x,#L302
 966  0177 cd0000        	call	_assert_failed
 968  017a 5b04          	addw	sp,#4
 969  017c               L061:
 970                     ; 192   if (NewState != DISABLE)
 972  017c 7b01          	ld	a,(OFST+1,sp)
 973  017e 2706          	jreq	L363
 974                     ; 194     SPI->CR2 |= SPI_CR2_SSI; /* Set NSS pin internally by software*/
 976  0180 72105201      	bset	20993,#0
 978  0184 2004          	jra	L563
 979  0186               L363:
 980                     ; 198     SPI->CR2 &= (uint8_t)(~SPI_CR2_SSI); /* Reset NSS pin internally by software*/
 982  0186 72115201      	bres	20993,#0
 983  018a               L563:
 984                     ; 200 }
 987  018a 84            	pop	a
 988  018b 81            	ret	
1011                     ; 207 void SPI_TransmitCRC(void)
1011                     ; 208 {
1012                     	switch	.text
1013  018c               _SPI_TransmitCRC:
1017                     ; 209   SPI->CR2 |= SPI_CR2_CRCNEXT; /* Enable the CRC transmission*/
1019  018c 72185201      	bset	20993,#4
1020                     ; 210 }
1023  0190 81            	ret	
1060                     ; 218 void SPI_CalculateCRCCmd(FunctionalState NewState)
1060                     ; 219 {
1061                     	switch	.text
1062  0191               _SPI_CalculateCRCCmd:
1064  0191 88            	push	a
1065       00000000      OFST:	set	0
1068                     ; 221   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1070  0192 4d            	tnz	a
1071  0193 2711          	jreq	L471
1072  0195 4a            	dec	a
1073  0196 270e          	jreq	L471
1074  0198 ae00dd        	ldw	x,#221
1075  019b 89            	pushw	x
1076  019c 5f            	clrw	x
1077  019d 89            	pushw	x
1078  019e ae0000        	ldw	x,#L302
1079  01a1 cd0000        	call	_assert_failed
1081  01a4 5b04          	addw	sp,#4
1082  01a6               L471:
1083                     ; 223   if (NewState != DISABLE)
1085  01a6 7b01          	ld	a,(OFST+1,sp)
1086  01a8 2706          	jreq	L514
1087                     ; 225     SPI->CR2 |= SPI_CR2_CRCEN; /* Enable the CRC calculation*/
1089  01aa 721a5201      	bset	20993,#5
1091  01ae 2004          	jra	L714
1092  01b0               L514:
1093                     ; 229     SPI->CR2 &= (uint8_t)(~SPI_CR2_CRCEN); /* Disable the CRC calculation*/
1095  01b0 721b5201      	bres	20993,#5
1096  01b4               L714:
1097                     ; 231 }
1100  01b4 84            	pop	a
1101  01b5 81            	ret	
1166                     ; 238 uint8_t SPI_GetCRC(SPI_CRC_TypeDef SPI_CRC)
1166                     ; 239 {
1167                     	switch	.text
1168  01b6               _SPI_GetCRC:
1170  01b6 88            	push	a
1171  01b7 88            	push	a
1172       00000001      OFST:	set	1
1175                     ; 240   uint8_t crcreg = 0;
1177                     ; 243   assert_param(IS_SPI_CRC_OK(SPI_CRC));
1179  01b8 a101          	cp	a,#1
1180  01ba 2711          	jreq	L602
1181  01bc 4d            	tnz	a
1182  01bd 270e          	jreq	L602
1183  01bf ae00f3        	ldw	x,#243
1184  01c2 89            	pushw	x
1185  01c3 5f            	clrw	x
1186  01c4 89            	pushw	x
1187  01c5 ae0000        	ldw	x,#L302
1188  01c8 cd0000        	call	_assert_failed
1190  01cb 5b04          	addw	sp,#4
1191  01cd               L602:
1192                     ; 245   if (SPI_CRC != SPI_CRC_RX)
1194  01cd 7b02          	ld	a,(OFST+1,sp)
1195  01cf 2705          	jreq	L354
1196                     ; 247     crcreg = SPI->TXCRCR;  /* Get the Tx CRC register*/
1198  01d1 c65207        	ld	a,20999
1201  01d4 2003          	jra	L554
1202  01d6               L354:
1203                     ; 251     crcreg = SPI->RXCRCR; /* Get the Rx CRC register*/
1205  01d6 c65206        	ld	a,20998
1207  01d9               L554:
1208                     ; 255   return crcreg;
1212  01d9 85            	popw	x
1213  01da 81            	ret	
1238                     ; 263 void SPI_ResetCRC(void)
1238                     ; 264 {
1239                     	switch	.text
1240  01db               _SPI_ResetCRC:
1244                     ; 267   SPI_CalculateCRCCmd(ENABLE);
1246  01db a601          	ld	a,#1
1247  01dd adb2          	call	_SPI_CalculateCRCCmd
1249                     ; 270   SPI_Cmd(ENABLE);
1251  01df a601          	ld	a,#1
1253                     ; 271 }
1256  01e1 cc00e1        	jp	_SPI_Cmd
1280                     ; 278 uint8_t SPI_GetCRCPolynomial(void)
1280                     ; 279 {
1281                     	switch	.text
1282  01e4               _SPI_GetCRCPolynomial:
1286                     ; 280   return SPI->CRCPR; /* Return the CRC polynomial register */
1288  01e4 c65205        	ld	a,20997
1291  01e7 81            	ret	
1348                     ; 288 void SPI_BiDirectionalLineConfig(SPI_Direction_TypeDef SPI_Direction)
1348                     ; 289 {
1349                     	switch	.text
1350  01e8               _SPI_BiDirectionalLineConfig:
1352  01e8 88            	push	a
1353       00000000      OFST:	set	0
1356                     ; 291   assert_param(IS_SPI_DIRECTION_OK(SPI_Direction));
1358  01e9 4d            	tnz	a
1359  01ea 2711          	jreq	L032
1360  01ec 4a            	dec	a
1361  01ed 270e          	jreq	L032
1362  01ef ae0123        	ldw	x,#291
1363  01f2 89            	pushw	x
1364  01f3 5f            	clrw	x
1365  01f4 89            	pushw	x
1366  01f5 ae0000        	ldw	x,#L302
1367  01f8 cd0000        	call	_assert_failed
1369  01fb 5b04          	addw	sp,#4
1370  01fd               L032:
1371                     ; 293   if (SPI_Direction != SPI_DIRECTION_RX)
1373  01fd 7b01          	ld	a,(OFST+1,sp)
1374  01ff 2706          	jreq	L525
1375                     ; 295     SPI->CR2 |= SPI_CR2_BDOE; /* Set the Tx only mode*/
1377  0201 721c5201      	bset	20993,#6
1379  0205 2004          	jra	L725
1380  0207               L525:
1381                     ; 299     SPI->CR2 &= (uint8_t)(~SPI_CR2_BDOE); /* Set the Rx only mode*/
1383  0207 721d5201      	bres	20993,#6
1384  020b               L725:
1385                     ; 301 }
1388  020b 84            	pop	a
1389  020c 81            	ret	
1511                     ; 311 FlagStatus SPI_GetFlagStatus(SPI_Flag_TypeDef SPI_FLAG)
1511                     ; 312 {
1512                     	switch	.text
1513  020d               _SPI_GetFlagStatus:
1515  020d 88            	push	a
1516  020e 88            	push	a
1517       00000001      OFST:	set	1
1520                     ; 313   FlagStatus status = RESET;
1522                     ; 315   assert_param(IS_SPI_FLAGS_OK(SPI_FLAG));
1524  020f a140          	cp	a,#64
1525  0211 2726          	jreq	L242
1526  0213 a120          	cp	a,#32
1527  0215 2722          	jreq	L242
1528  0217 a110          	cp	a,#16
1529  0219 271e          	jreq	L242
1530  021b a108          	cp	a,#8
1531  021d 271a          	jreq	L242
1532  021f a102          	cp	a,#2
1533  0221 2716          	jreq	L242
1534  0223 a101          	cp	a,#1
1535  0225 2712          	jreq	L242
1536  0227 a180          	cp	a,#128
1537  0229 270e          	jreq	L242
1538  022b ae013b        	ldw	x,#315
1539  022e 89            	pushw	x
1540  022f 5f            	clrw	x
1541  0230 89            	pushw	x
1542  0231 ae0000        	ldw	x,#L302
1543  0234 cd0000        	call	_assert_failed
1545  0237 5b04          	addw	sp,#4
1546  0239               L242:
1547                     ; 318   if ((SPI->SR & (uint8_t)SPI_FLAG) != (uint8_t)RESET)
1549  0239 c65203        	ld	a,20995
1550  023c 1502          	bcp	a,(OFST+1,sp)
1551  023e 2704          	jreq	L506
1552                     ; 320     status = SET; /* SPI_FLAG is set */
1554  0240 a601          	ld	a,#1
1557  0242 2001          	jra	L706
1558  0244               L506:
1559                     ; 324     status = RESET; /* SPI_FLAG is reset*/
1561  0244 4f            	clr	a
1563  0245               L706:
1564                     ; 328   return status;
1568  0245 85            	popw	x
1569  0246 81            	ret	
1605                     ; 346 void SPI_ClearFlag(SPI_Flag_TypeDef SPI_FLAG)
1605                     ; 347 {
1606                     	switch	.text
1607  0247               _SPI_ClearFlag:
1609  0247 88            	push	a
1610       00000000      OFST:	set	0
1613                     ; 348   assert_param(IS_SPI_CLEAR_FLAGS_OK(SPI_FLAG));
1615  0248 a110          	cp	a,#16
1616  024a 2712          	jreq	L452
1617  024c a108          	cp	a,#8
1618  024e 270e          	jreq	L452
1619  0250 ae015c        	ldw	x,#348
1620  0253 89            	pushw	x
1621  0254 5f            	clrw	x
1622  0255 89            	pushw	x
1623  0256 ae0000        	ldw	x,#L302
1624  0259 cd0000        	call	_assert_failed
1626  025c 5b04          	addw	sp,#4
1627  025e               L452:
1628                     ; 350   SPI->SR = (uint8_t)(~SPI_FLAG);
1630  025e 7b01          	ld	a,(OFST+1,sp)
1631  0260 43            	cpl	a
1632  0261 c75203        	ld	20995,a
1633                     ; 351 }
1636  0264 84            	pop	a
1637  0265 81            	ret	
1720                     ; 366 ITStatus SPI_GetITStatus(SPI_IT_TypeDef SPI_IT)
1720                     ; 367 {
1721                     	switch	.text
1722  0266               _SPI_GetITStatus:
1724  0266 88            	push	a
1725  0267 89            	pushw	x
1726       00000002      OFST:	set	2
1729                     ; 368   ITStatus pendingbitstatus = RESET;
1731                     ; 369   uint8_t itpos = 0;
1733                     ; 370   uint8_t itmask1 = 0;
1735                     ; 371   uint8_t itmask2 = 0;
1737                     ; 372   uint8_t enablestatus = 0;
1739                     ; 373   assert_param(IS_SPI_GET_IT_OK(SPI_IT));
1741  0268 a165          	cp	a,#101
1742  026a 2722          	jreq	L662
1743  026c a155          	cp	a,#85
1744  026e 271e          	jreq	L662
1745  0270 a145          	cp	a,#69
1746  0272 271a          	jreq	L662
1747  0274 a134          	cp	a,#52
1748  0276 2716          	jreq	L662
1749  0278 a117          	cp	a,#23
1750  027a 2712          	jreq	L662
1751  027c a106          	cp	a,#6
1752  027e 270e          	jreq	L662
1753  0280 ae0175        	ldw	x,#373
1754  0283 89            	pushw	x
1755  0284 5f            	clrw	x
1756  0285 89            	pushw	x
1757  0286 ae0000        	ldw	x,#L302
1758  0289 cd0000        	call	_assert_failed
1760  028c 5b04          	addw	sp,#4
1761  028e               L662:
1762                     ; 375   itpos = (uint8_t)((uint8_t)1 << ((uint8_t)SPI_IT & (uint8_t)0x0F));
1764  028e 7b03          	ld	a,(OFST+1,sp)
1765  0290 a40f          	and	a,#15
1766  0292 5f            	clrw	x
1767  0293 97            	ld	xl,a
1768  0294 a601          	ld	a,#1
1769  0296 5d            	tnzw	x
1770  0297 2704          	jreq	L272
1771  0299               L472:
1772  0299 48            	sll	a
1773  029a 5a            	decw	x
1774  029b 26fc          	jrne	L472
1775  029d               L272:
1776  029d 6b01          	ld	(OFST-1,sp),a
1778                     ; 378   itmask1 = (uint8_t)((uint8_t)SPI_IT >> (uint8_t)4);
1780  029f 7b03          	ld	a,(OFST+1,sp)
1781  02a1 4e            	swap	a
1782  02a2 a40f          	and	a,#15
1783  02a4 6b02          	ld	(OFST+0,sp),a
1785                     ; 380   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
1787  02a6 5f            	clrw	x
1788  02a7 97            	ld	xl,a
1789  02a8 a601          	ld	a,#1
1790  02aa 5d            	tnzw	x
1791  02ab 2704          	jreq	L672
1792  02ad               L003:
1793  02ad 48            	sll	a
1794  02ae 5a            	decw	x
1795  02af 26fc          	jrne	L003
1796  02b1               L672:
1798                     ; 382   enablestatus = (uint8_t)((uint8_t)SPI->SR & itmask2);
1800  02b1 c45203        	and	a,20995
1801  02b4 6b02          	ld	(OFST+0,sp),a
1803                     ; 384   if (((SPI->ICR & itpos) != RESET) && enablestatus)
1805  02b6 c65202        	ld	a,20994
1806  02b9 1501          	bcp	a,(OFST-1,sp)
1807  02bb 2708          	jreq	L176
1809  02bd 7b02          	ld	a,(OFST+0,sp)
1810  02bf 2704          	jreq	L176
1811                     ; 387     pendingbitstatus = SET;
1813  02c1 a601          	ld	a,#1
1816  02c3 2001          	jra	L376
1817  02c5               L176:
1818                     ; 392     pendingbitstatus = RESET;
1820  02c5 4f            	clr	a
1822  02c6               L376:
1823                     ; 395   return  pendingbitstatus;
1827  02c6 5b03          	addw	sp,#3
1828  02c8 81            	ret	
1874                     ; 412 void SPI_ClearITPendingBit(SPI_IT_TypeDef SPI_IT)
1874                     ; 413 {
1875                     	switch	.text
1876  02c9               _SPI_ClearITPendingBit:
1878  02c9 88            	push	a
1879  02ca 88            	push	a
1880       00000001      OFST:	set	1
1883                     ; 414   uint8_t itpos = 0;
1885                     ; 415   assert_param(IS_SPI_CLEAR_IT_OK(SPI_IT));
1887  02cb a145          	cp	a,#69
1888  02cd 2712          	jreq	L013
1889  02cf a134          	cp	a,#52
1890  02d1 270e          	jreq	L013
1891  02d3 ae019f        	ldw	x,#415
1892  02d6 89            	pushw	x
1893  02d7 5f            	clrw	x
1894  02d8 89            	pushw	x
1895  02d9 ae0000        	ldw	x,#L302
1896  02dc cd0000        	call	_assert_failed
1898  02df 5b04          	addw	sp,#4
1899  02e1               L013:
1900                     ; 420   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)(SPI_IT & (uint8_t)0xF0) >> 4));
1902  02e1 7b02          	ld	a,(OFST+1,sp)
1903  02e3 4e            	swap	a
1904  02e4 a40f          	and	a,#15
1905  02e6 5f            	clrw	x
1906  02e7 97            	ld	xl,a
1907  02e8 a601          	ld	a,#1
1908  02ea 5d            	tnzw	x
1909  02eb 2704          	jreq	L413
1910  02ed               L613:
1911  02ed 48            	sll	a
1912  02ee 5a            	decw	x
1913  02ef 26fc          	jrne	L613
1914  02f1               L413:
1916                     ; 422   SPI->SR = (uint8_t)(~itpos);
1918  02f1 43            	cpl	a
1919  02f2 c75203        	ld	20995,a
1920                     ; 424 }
1923  02f5 85            	popw	x
1924  02f6 81            	ret	
1937                     	xdef	_SPI_ClearITPendingBit
1938                     	xdef	_SPI_GetITStatus
1939                     	xdef	_SPI_ClearFlag
1940                     	xdef	_SPI_GetFlagStatus
1941                     	xdef	_SPI_BiDirectionalLineConfig
1942                     	xdef	_SPI_GetCRCPolynomial
1943                     	xdef	_SPI_ResetCRC
1944                     	xdef	_SPI_GetCRC
1945                     	xdef	_SPI_CalculateCRCCmd
1946                     	xdef	_SPI_TransmitCRC
1947                     	xdef	_SPI_NSSInternalSoftwareCmd
1948                     	xdef	_SPI_ReceiveData
1949                     	xdef	_SPI_SendData
1950                     	xdef	_SPI_ITConfig
1951                     	xdef	_SPI_Cmd
1952                     	xdef	_SPI_Init
1953                     	xdef	_SPI_DeInit
1954                     	xref	_assert_failed
1955                     .const:	section	.text
1956  0000               L302:
1957  0000 2e2e5c2e2e5c  	dc.b	"..\..\stm8s_spl\li"
1958  0012 627261726965  	dc.b	"braries\stm8s_stdp"
1959  0024 65726970685f  	dc.b	"eriph_driver\src\s"
1960  0036 746d38735f73  	dc.b	"tm8s_spi.c",0
1980                     	end
