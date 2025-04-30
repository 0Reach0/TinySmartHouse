   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.3 - 22 Aug 2024
  64                     ; 6 void delay(uint16_t n) {
  66                     	switch	.text
  67  0000               _delay:
  69  0000 89            	pushw	x
  70  0001 89            	pushw	x
  71       00000002      OFST:	set	2
  74                     ; 7     uint16_t i = 0;
  76                     ; 8     for (i = 0; i < n; i++) {
  78  0002 5f            	clrw	x
  79  0003 1f01          	ldw	(OFST-1,sp),x
  82  0005 2008          	jra	L73
  83  0007               L33:
  84                     ; 9         __asm("nop");
  87  0007 9d            nop
  89                     ; 8     for (i = 0; i < n; i++) {
  91  0008 1e01          	ldw	x,(OFST-1,sp)
  92  000a 1c0001        	addw	x,#1
  93  000d 1f01          	ldw	(OFST-1,sp),x
  95  000f               L73:
  98  000f 1e01          	ldw	x,(OFST-1,sp)
  99  0011 1303          	cpw	x,(OFST+1,sp)
 100  0013 25f2          	jrult	L33
 101                     ; 11 }
 104  0015 5b04          	addw	sp,#4
 105  0017 81            	ret
 129                     ; 15 void cs_high(void) {
 130                     	switch	.text
 131  0018               _cs_high:
 135                     ; 16     GPIO_WriteHigh(CSN_PIN);
 137  0018 4b10          	push	#16
 138  001a ae500a        	ldw	x,#20490
 139  001d cd0000        	call	_GPIO_WriteHigh
 141  0020 84            	pop	a
 142                     ; 17 }
 145  0021 81            	ret
 169                     ; 19 void cs_low(void) {
 170                     	switch	.text
 171  0022               _cs_low:
 175                     ; 20     GPIO_WriteLow(CSN_PIN);
 177  0022 4b10          	push	#16
 178  0024 ae500a        	ldw	x,#20490
 179  0027 cd0000        	call	_GPIO_WriteLow
 181  002a 84            	pop	a
 182                     ; 21 }
 185  002b 81            	ret
 209                     ; 23 void ce_high(void) {
 210                     	switch	.text
 211  002c               _ce_high:
 215                     ; 24     GPIO_WriteHigh(CE_PIN);
 217  002c 4b08          	push	#8
 218  002e ae500a        	ldw	x,#20490
 219  0031 cd0000        	call	_GPIO_WriteHigh
 221  0034 84            	pop	a
 222                     ; 25 }
 225  0035 81            	ret
 249                     ; 27 void ce_low(void) {
 250                     	switch	.text
 251  0036               _ce_low:
 255                     ; 28     GPIO_WriteLow(CE_PIN);
 257  0036 4b08          	push	#8
 258  0038 ae500a        	ldw	x,#20490
 259  003b cd0000        	call	_GPIO_WriteLow
 261  003e 84            	pop	a
 262                     ; 29 }
 265  003f 81            	ret
 289                     ; 31 void reset_status(void) {
 290                     	switch	.text
 291  0040               _reset_status:
 295                     ; 32     write_register(STATUS_REGISTER, 0x70);
 297  0040 ae0770        	ldw	x,#1904
 298  0043 cd00d7        	call	_write_register
 300                     ; 33 }
 303  0046 81            	ret
 330                     ; 35 void flush_tx(void) {
 331                     	switch	.text
 332  0047               _flush_tx:
 336                     ; 36     cs_low();
 338  0047 add9          	call	_cs_low
 340                     ; 37     SPI_SendData(FLUSH_TX);
 342  0049 a6e1          	ld	a,#225
 343  004b cd0000        	call	_SPI_SendData
 345                     ; 38     delay(10);
 347  004e ae000a        	ldw	x,#10
 348  0051 adad          	call	_delay
 350                     ; 39     cs_high();
 352  0053 adc3          	call	_cs_high
 354                     ; 40 }
 357  0055 81            	ret
 384                     ; 42 void flush_rx(void) {
 385                     	switch	.text
 386  0056               _flush_rx:
 390                     ; 43     cs_low();
 392  0056 adca          	call	_cs_low
 394                     ; 44     SPI_SendData(FLUSH_RX);
 396  0058 a6e2          	ld	a,#226
 397  005a cd0000        	call	_SPI_SendData
 399                     ; 45     delay(10);
 401  005d ae000a        	ldw	x,#10
 402  0060 ad9e          	call	_delay
 404                     ; 46     cs_high();
 406  0062 adb4          	call	_cs_high
 408                     ; 47 }
 411  0064 81            	ret
 436                     ; 52 void SPI_Init_NRF(void) {
 437                     	switch	.text
 438  0065               _SPI_Init_NRF:
 442                     ; 53     SPI_Init(SPI_FIRSTBIT_MSB, SPI_BAUDRATEPRESCALER_8, SPI_MODE_MASTER,
 442                     ; 54              SPI_CLOCKPOLARITY_LOW, SPI_CLOCKPHASE_1EDGE, SPI_DATADIRECTION_2LINES_FULLDUPLEX,
 442                     ; 55              SPI_NSS_SOFT, 0x07);
 444  0065 4b07          	push	#7
 445  0067 4b02          	push	#2
 446  0069 4b00          	push	#0
 447  006b 4b00          	push	#0
 448  006d 4b00          	push	#0
 449  006f 4b04          	push	#4
 450  0071 ae0010        	ldw	x,#16
 451  0074 cd0000        	call	_SPI_Init
 453  0077 5b06          	addw	sp,#6
 454                     ; 56     SPI_Cmd(ENABLE);
 456  0079 a601          	ld	a,#1
 457  007b cd0000        	call	_SPI_Cmd
 459                     ; 57 }
 462  007e 81            	ret
 487                     ; 59 void SPI_DeInit_NRF(void){
 488                     	switch	.text
 489  007f               _SPI_DeInit_NRF:
 493                     ; 60 		SPI_DeInit();
 495  007f cd0000        	call	_SPI_DeInit
 497                     ; 61 		SPI_Cmd(DISABLE);
 499  0082 4f            	clr	a
 500  0083 cd0000        	call	_SPI_Cmd
 502                     ; 62 }
 505  0086 81            	ret
 563                     ; 67 uint8_t read_register(uint8_t reg) {
 564                     	switch	.text
 565  0087               _read_register:
 567  0087 88            	push	a
 568       00000001      OFST:	set	1
 571                     ; 68     uint8_t command = R_REGISTER | reg;
 573  0088 6b01          	ld	(OFST+0,sp),a
 575                     ; 69     uint8_t data = 0;
 577                     ; 71     cs_low();
 579  008a ad96          	call	_cs_low
 581                     ; 72     SPI_SendData(command);
 583  008c 7b01          	ld	a,(OFST+0,sp)
 584  008e cd0000        	call	_SPI_SendData
 586                     ; 73 		delay(10);
 588  0091 ae000a        	ldw	x,#10
 589  0094 cd0000        	call	_delay
 592  0097               L302:
 593                     ; 74     while (SPI_GetFlagStatus(SPI_FLAG_TXE) == RESET); // ???????? ???????? ???????
 595  0097 a602          	ld	a,#2
 596  0099 cd0000        	call	_SPI_GetFlagStatus
 598  009c 4d            	tnz	a
 599  009d 27f8          	jreq	L302
 601  009f               L112:
 602                     ; 75     while (SPI_GetFlagStatus(SPI_FLAG_RXNE) == RESET); // ???????? ????????? ??????
 604  009f a601          	ld	a,#1
 605  00a1 cd0000        	call	_SPI_GetFlagStatus
 607  00a4 4d            	tnz	a
 608  00a5 27f8          	jreq	L112
 609                     ; 76     data = SPI_ReceiveData();
 611  00a7 cd0000        	call	_SPI_ReceiveData
 613                     ; 77 		delay(10);
 615  00aa ae000a        	ldw	x,#10
 616  00ad cd0000        	call	_delay
 618                     ; 78 		SPI_SendData(0x0);
 620  00b0 4f            	clr	a
 621  00b1 cd0000        	call	_SPI_SendData
 623                     ; 79 		delay(10);
 625  00b4 ae000a        	ldw	x,#10
 626  00b7 cd0000        	call	_delay
 629  00ba               L712:
 630                     ; 80 		while (SPI_GetFlagStatus(SPI_FLAG_TXE) == RESET); 
 632  00ba a602          	ld	a,#2
 633  00bc cd0000        	call	_SPI_GetFlagStatus
 635  00bf 4d            	tnz	a
 636  00c0 27f8          	jreq	L712
 638  00c2               L522:
 639                     ; 81 		while (SPI_GetFlagStatus(SPI_FLAG_RXNE) == RESET); // ???????? ????????? ??????
 641  00c2 a601          	ld	a,#1
 642  00c4 cd0000        	call	_SPI_GetFlagStatus
 644  00c7 4d            	tnz	a
 645  00c8 27f8          	jreq	L522
 646                     ; 82 		data = SPI_ReceiveData();
 648  00ca cd0000        	call	_SPI_ReceiveData
 650  00cd 6b01          	ld	(OFST+0,sp),a
 652                     ; 84 cs_high();
 654  00cf cd0018        	call	_cs_high
 656                     ; 86     return data;
 658  00d2 7b01          	ld	a,(OFST+0,sp)
 661  00d4 5b01          	addw	sp,#1
 662  00d6 81            	ret
 719                     ; 89 void write_register(uint8_t reg, uint8_t value) {
 720                     	switch	.text
 721  00d7               _write_register:
 723  00d7 89            	pushw	x
 724  00d8 88            	push	a
 725       00000001      OFST:	set	1
 728                     ; 90     uint8_t command = W_REGISTER | reg;
 730  00d9 9e            	ld	a,xh
 731  00da aa20          	or	a,#32
 732  00dc 6b01          	ld	(OFST+0,sp),a
 734                     ; 92     cs_low();
 736  00de cd0022        	call	_cs_low
 738                     ; 93     SPI_SendData(command);
 740  00e1 7b01          	ld	a,(OFST+0,sp)
 741  00e3 cd0000        	call	_SPI_SendData
 744  00e6               L162:
 745                     ; 94     while (SPI_GetFlagStatus(SPI_FLAG_TXE) == RESET);
 747  00e6 a602          	ld	a,#2
 748  00e8 cd0000        	call	_SPI_GetFlagStatus
 750  00eb 4d            	tnz	a
 751  00ec 27f8          	jreq	L162
 752                     ; 95     SPI_SendData(value);
 754  00ee 7b03          	ld	a,(OFST+2,sp)
 755  00f0 cd0000        	call	_SPI_SendData
 758  00f3               L762:
 759                     ; 96     while (SPI_GetFlagStatus(SPI_FLAG_TXE) == RESET);
 761  00f3 a602          	ld	a,#2
 762  00f5 cd0000        	call	_SPI_GetFlagStatus
 764  00f8 4d            	tnz	a
 765  00f9 27f8          	jreq	L762
 766                     ; 97 		delay(10);
 768  00fb ae000a        	ldw	x,#10
 769  00fe cd0000        	call	_delay
 771                     ; 98     cs_high();
 773  0101 cd0018        	call	_cs_high
 775                     ; 99 }
 778  0104 5b03          	addw	sp,#3
 779  0106 81            	ret
 856                     ; 105 void read_registerN(uint8_t reg, uint8_t *buf, uint8_t len) {
 857                     	switch	.text
 858  0107               _read_registerN:
 860  0107 88            	push	a
 861  0108 88            	push	a
 862       00000001      OFST:	set	1
 865                     ; 106     uint8_t command = R_REGISTER | reg;
 867  0109 6b01          	ld	(OFST+0,sp),a
 869                     ; 109     cs_low();
 871  010b cd0022        	call	_cs_low
 873                     ; 111     SPI_SendData(command);
 875  010e 7b01          	ld	a,(OFST+0,sp)
 876  0110 cd0000        	call	_SPI_SendData
 879  0113               L333:
 880                     ; 112     while (SPI_GetFlagStatus(SPI_FLAG_TXE) == RESET);
 882  0113 a602          	ld	a,#2
 883  0115 cd0000        	call	_SPI_GetFlagStatus
 885  0118 4d            	tnz	a
 886  0119 27f8          	jreq	L333
 887                     ; 113 		delay(10);
 889  011b ae000a        	ldw	x,#10
 890  011e cd0000        	call	_delay
 893  0121               L143:
 894                     ; 114     while (SPI_GetFlagStatus(SPI_FLAG_RXNE) == RESET);
 896  0121 a601          	ld	a,#1
 897  0123 cd0000        	call	_SPI_GetFlagStatus
 899  0126 4d            	tnz	a
 900  0127 27f8          	jreq	L143
 901                     ; 115     SPI_ReceiveData();
 903  0129 cd0000        	call	_SPI_ReceiveData
 905                     ; 116     for (i = 0; i < len; i++) {
 907  012c 0f01          	clr	(OFST+0,sp)
 910  012e 202a          	jra	L153
 911  0130               L543:
 912                     ; 117         delay(10);
 914  0130 ae000a        	ldw	x,#10
 915  0133 cd0000        	call	_delay
 917                     ; 118         SPI_SendData(0xFF);
 919  0136 a6ff          	ld	a,#255
 920  0138 cd0000        	call	_SPI_SendData
 923  013b               L753:
 924                     ; 119         while (SPI_GetFlagStatus(SPI_FLAG_TXE) == RESET);
 926  013b a602          	ld	a,#2
 927  013d cd0000        	call	_SPI_GetFlagStatus
 929  0140 4d            	tnz	a
 930  0141 27f8          	jreq	L753
 932  0143               L563:
 933                     ; 120         while (SPI_GetFlagStatus(SPI_FLAG_RXNE) == RESET);
 935  0143 a601          	ld	a,#1
 936  0145 cd0000        	call	_SPI_GetFlagStatus
 938  0148 4d            	tnz	a
 939  0149 27f8          	jreq	L563
 940                     ; 121         buf[i] = SPI_ReceiveData();
 942  014b 7b01          	ld	a,(OFST+0,sp)
 943  014d 5f            	clrw	x
 944  014e 97            	ld	xl,a
 945  014f 72fb05        	addw	x,(OFST+4,sp)
 946  0152 89            	pushw	x
 947  0153 cd0000        	call	_SPI_ReceiveData
 949  0156 85            	popw	x
 950  0157 f7            	ld	(x),a
 951                     ; 116     for (i = 0; i < len; i++) {
 953  0158 0c01          	inc	(OFST+0,sp)
 955  015a               L153:
 958  015a 7b01          	ld	a,(OFST+0,sp)
 959  015c 1107          	cp	a,(OFST+6,sp)
 960  015e 25d0          	jrult	L543
 961                     ; 123 		delay(10);
 963  0160 ae000a        	ldw	x,#10
 964  0163 cd0000        	call	_delay
 966                     ; 124     cs_high();
 968  0166 cd0018        	call	_cs_high
 970                     ; 125 			delay(10);
 972  0169 ae000a        	ldw	x,#10
 973  016c cd0000        	call	_delay
 975                     ; 126 }
 978  016f 85            	popw	x
 979  0170 81            	ret
1055                     ; 128 void write_registerN(uint8_t reg, const uint8_t *buf, uint8_t len) {
1056                     	switch	.text
1057  0171               _write_registerN:
1059  0171 88            	push	a
1060  0172 88            	push	a
1061       00000001      OFST:	set	1
1064                     ; 129     uint8_t command = W_REGISTER | reg;
1066  0173 aa20          	or	a,#32
1067  0175 6b01          	ld	(OFST+0,sp),a
1069                     ; 132     cs_low();
1071  0177 cd0022        	call	_cs_low
1073                     ; 133     SPI_SendData(command);
1075  017a 7b01          	ld	a,(OFST+0,sp)
1076  017c cd0000        	call	_SPI_SendData
1079  017f               L134:
1080                     ; 134     while (SPI_GetFlagStatus(SPI_FLAG_TXE) == RESET);
1082  017f a602          	ld	a,#2
1083  0181 cd0000        	call	_SPI_GetFlagStatus
1085  0184 4d            	tnz	a
1086  0185 27f8          	jreq	L134
1087                     ; 136     for (i = 0; i < len; i++) {
1089  0187 0f01          	clr	(OFST+0,sp)
1092  0189 201b          	jra	L144
1093  018b               L534:
1094                     ; 137         delay(10);
1096  018b ae000a        	ldw	x,#10
1097  018e cd0000        	call	_delay
1099                     ; 138         SPI_SendData(buf[i]);
1101  0191 7b01          	ld	a,(OFST+0,sp)
1102  0193 5f            	clrw	x
1103  0194 97            	ld	xl,a
1104  0195 72fb05        	addw	x,(OFST+4,sp)
1105  0198 f6            	ld	a,(x)
1106  0199 cd0000        	call	_SPI_SendData
1109  019c               L744:
1110                     ; 139         while (SPI_GetFlagStatus(SPI_FLAG_TXE) == RESET);
1112  019c a602          	ld	a,#2
1113  019e cd0000        	call	_SPI_GetFlagStatus
1115  01a1 4d            	tnz	a
1116  01a2 27f8          	jreq	L744
1117                     ; 136     for (i = 0; i < len; i++) {
1119  01a4 0c01          	inc	(OFST+0,sp)
1121  01a6               L144:
1124  01a6 7b01          	ld	a,(OFST+0,sp)
1125  01a8 1107          	cp	a,(OFST+6,sp)
1126  01aa 25df          	jrult	L534
1127                     ; 141 		delay(10);
1129  01ac ae000a        	ldw	x,#10
1130  01af cd0000        	call	_delay
1132                     ; 142     cs_high();
1134  01b2 cd0018        	call	_cs_high
1136                     ; 143 			delay(10);
1138  01b5 ae000a        	ldw	x,#10
1139  01b8 cd0000        	call	_delay
1141                     ; 144 }
1144  01bb 85            	popw	x
1145  01bc 81            	ret
1217                     ; 152 void tx_send(const uint8_t *data, uint8_t len) {
1218                     	switch	.text
1219  01bd               _tx_send:
1221  01bd 89            	pushw	x
1222  01be 88            	push	a
1223       00000001      OFST:	set	1
1226                     ; 156     flush_tx();
1228  01bf cd0047        	call	_flush_tx
1230                     ; 158     cs_low();
1232  01c2 cd0022        	call	_cs_low
1234                     ; 159     SPI_SendData(W_TX_PAYLOAD);
1236  01c5 a6a0          	ld	a,#160
1237  01c7 cd0000        	call	_SPI_SendData
1239                     ; 160 				delay(10);
1241  01ca ae000a        	ldw	x,#10
1242  01cd cd0000        	call	_delay
1245  01d0               L705:
1246                     ; 161     while (SPI_GetFlagStatus(SPI_FLAG_TXE) == RESET);
1248  01d0 a602          	ld	a,#2
1249  01d2 cd0000        	call	_SPI_GetFlagStatus
1251  01d5 4d            	tnz	a
1252  01d6 27f8          	jreq	L705
1253                     ; 162     for (i = 0; i < len; i++) {
1255  01d8 0f01          	clr	(OFST+0,sp)
1258  01da 201b          	jra	L715
1259  01dc               L315:
1260                     ; 163         delay(10);
1262  01dc ae000a        	ldw	x,#10
1263  01df cd0000        	call	_delay
1265                     ; 164         SPI_SendData(data[i]);
1267  01e2 7b01          	ld	a,(OFST+0,sp)
1268  01e4 5f            	clrw	x
1269  01e5 97            	ld	xl,a
1270  01e6 72fb02        	addw	x,(OFST+1,sp)
1271  01e9 f6            	ld	a,(x)
1272  01ea cd0000        	call	_SPI_SendData
1275  01ed               L525:
1276                     ; 165         while (SPI_GetFlagStatus(SPI_FLAG_TXE) == RESET);
1278  01ed a602          	ld	a,#2
1279  01ef cd0000        	call	_SPI_GetFlagStatus
1281  01f2 4d            	tnz	a
1282  01f3 27f8          	jreq	L525
1283                     ; 162     for (i = 0; i < len; i++) {
1285  01f5 0c01          	inc	(OFST+0,sp)
1287  01f7               L715:
1290  01f7 7b01          	ld	a,(OFST+0,sp)
1291  01f9 1106          	cp	a,(OFST+5,sp)
1292  01fb 25df          	jrult	L315
1293                     ; 167     delay(10);
1295  01fd ae000a        	ldw	x,#10
1296  0200 cd0000        	call	_delay
1298                     ; 168     cs_high();
1300  0203 cd0018        	call	_cs_high
1302                     ; 170     ce_high();
1304  0206 cd002c        	call	_ce_high
1306                     ; 171     delay(10);
1308  0209 ae000a        	ldw	x,#10
1309  020c cd0000        	call	_delay
1311                     ; 172     ce_low();
1313  020f cd0036        	call	_ce_low
1315  0212               L135:
1316                     ; 175         status = read_register(STATUS_REGISTER);
1318  0212 a607          	ld	a,#7
1319  0214 cd0087        	call	_read_register
1321  0217 6b01          	ld	(OFST+0,sp),a
1323                     ; 176     } while (!(status & (1 << 5)) && !(status & (1 << 4)));
1325  0219 7b01          	ld	a,(OFST+0,sp)
1326  021b a520          	bcp	a,#32
1327  021d 2606          	jrne	L735
1329  021f 7b01          	ld	a,(OFST+0,sp)
1330  0221 a510          	bcp	a,#16
1331  0223 27ed          	jreq	L135
1332  0225               L735:
1333                     ; 178     write_register(STATUS_REGISTER, 0x70);
1335  0225 ae0770        	ldw	x,#1904
1336  0228 cd00d7        	call	_write_register
1338                     ; 179 }
1341  022b 5b03          	addw	sp,#3
1342  022d 81            	ret
1402                     ; 181 void rx_read(uint8_t *buf, uint8_t len) {
1403                     	switch	.text
1404  022e               _rx_read:
1406  022e 89            	pushw	x
1407  022f 88            	push	a
1408       00000001      OFST:	set	1
1411                     ; 185     cs_low();
1413  0230 cd0022        	call	_cs_low
1415                     ; 186     SPI_SendData(R_RX_PAYLOAD);
1417  0233 a661          	ld	a,#97
1418  0235 cd0000        	call	_SPI_SendData
1420                     ; 187     delay(10);
1422  0238 ae000a        	ldw	x,#10
1423  023b cd0000        	call	_delay
1426  023e               L175:
1427                     ; 188     while (SPI_GetFlagStatus(SPI_FLAG_RXNE) == RESET);
1429  023e a601          	ld	a,#1
1430  0240 cd0000        	call	_SPI_GetFlagStatus
1432  0243 4d            	tnz	a
1433  0244 27f8          	jreq	L175
1434                     ; 189     SPI_ReceiveData();
1436  0246 cd0000        	call	_SPI_ReceiveData
1439  0249               L775:
1440                     ; 190     while (SPI_GetFlagStatus(SPI_FLAG_TXE) == RESET);
1442  0249 a602          	ld	a,#2
1443  024b cd0000        	call	_SPI_GetFlagStatus
1445  024e 4d            	tnz	a
1446  024f 27f8          	jreq	L775
1447                     ; 191     for (i = 0; i < len; i++) {
1449  0251 0f01          	clr	(OFST+0,sp)
1452  0253 2021          	jra	L706
1453  0255               L306:
1454                     ; 192         delay(10);
1456  0255 ae000a        	ldw	x,#10
1457  0258 cd0000        	call	_delay
1459                     ; 193         SPI_SendData(0x00);
1461  025b 4f            	clr	a
1462  025c cd0000        	call	_SPI_SendData
1465  025f               L516:
1466                     ; 194         while (SPI_GetFlagStatus(SPI_FLAG_RXNE) == RESET);
1468  025f a601          	ld	a,#1
1469  0261 cd0000        	call	_SPI_GetFlagStatus
1471  0264 4d            	tnz	a
1472  0265 27f8          	jreq	L516
1473                     ; 195         buf[i] = SPI_ReceiveData();
1475  0267 7b01          	ld	a,(OFST+0,sp)
1476  0269 5f            	clrw	x
1477  026a 97            	ld	xl,a
1478  026b 72fb02        	addw	x,(OFST+1,sp)
1479  026e 89            	pushw	x
1480  026f cd0000        	call	_SPI_ReceiveData
1482  0272 85            	popw	x
1483  0273 f7            	ld	(x),a
1484                     ; 191     for (i = 0; i < len; i++) {
1486  0274 0c01          	inc	(OFST+0,sp)
1488  0276               L706:
1491  0276 7b01          	ld	a,(OFST+0,sp)
1492  0278 1106          	cp	a,(OFST+5,sp)
1493  027a 25d9          	jrult	L306
1494                     ; 197     cs_high();
1496  027c cd0018        	call	_cs_high
1498                     ; 199     write_register(STATUS_REGISTER, 0x70);
1500  027f ae0770        	ldw	x,#1904
1501  0282 cd00d7        	call	_write_register
1503                     ; 200 }
1506  0285 5b03          	addw	sp,#3
1507  0287 81            	ret
1534                     ; 206 void rx_init(void) {
1535                     	switch	.text
1536  0288               _rx_init:
1540                     ; 207     GPIO_Init(CSN_PIN, GPIO_MODE_OUT_PP_HIGH_FAST);
1542  0288 4bf0          	push	#240
1543  028a 4b10          	push	#16
1544  028c ae500a        	ldw	x,#20490
1545  028f cd0000        	call	_GPIO_Init
1547  0292 85            	popw	x
1548                     ; 208     GPIO_Init(CE_PIN, GPIO_MODE_OUT_PP_HIGH_FAST);
1550  0293 4bf0          	push	#240
1551  0295 4b08          	push	#8
1552  0297 ae500a        	ldw	x,#20490
1553  029a cd0000        	call	_GPIO_Init
1555  029d 85            	popw	x
1556                     ; 211     write_register(CONFIG_REGISTER, DEFAULT_CONFIG_RX);
1558  029e ae000f        	ldw	x,#15
1559  02a1 cd00d7        	call	_write_register
1561                     ; 212     delay(10);
1563  02a4 ae000a        	ldw	x,#10
1564  02a7 cd0000        	call	_delay
1566                     ; 213     write_register(EN_AA_REGISTER, DEFAULT_EN_AA);
1568  02aa ae0101        	ldw	x,#257
1569  02ad cd00d7        	call	_write_register
1571                     ; 214     delay(10);
1573  02b0 ae000a        	ldw	x,#10
1574  02b3 cd0000        	call	_delay
1576                     ; 215     write_register(EN_RXADDR_REGISTER, DEFAULT_EN_RXADDR);
1578  02b6 ae0201        	ldw	x,#513
1579  02b9 cd00d7        	call	_write_register
1581                     ; 216     delay(10);
1583  02bc ae000a        	ldw	x,#10
1584  02bf cd0000        	call	_delay
1586                     ; 217     write_register(SETUP_AW_REGISTER, DEFAULT_SETUP_AW);
1588  02c2 ae0303        	ldw	x,#771
1589  02c5 cd00d7        	call	_write_register
1591                     ; 218     delay(10);
1593  02c8 ae000a        	ldw	x,#10
1594  02cb cd0000        	call	_delay
1596                     ; 219     write_register(RF_CH_REGISTER, 120); 
1598  02ce ae0578        	ldw	x,#1400
1599  02d1 cd00d7        	call	_write_register
1601                     ; 220     delay(10);
1603  02d4 ae000a        	ldw	x,#10
1604  02d7 cd0000        	call	_delay
1606                     ; 221     write_register(RF_SETUP_REGISTER, DEFAULT_RF_SETUP);
1608  02da ae0608        	ldw	x,#1544
1609  02dd cd00d7        	call	_write_register
1611                     ; 222     delay(10);
1613  02e0 ae000a        	ldw	x,#10
1614  02e3 cd0000        	call	_delay
1616                     ; 223     write_register(STATUS_REGISTER, DEFAULT_STATUS);
1618  02e6 ae0770        	ldw	x,#1904
1619  02e9 cd00d7        	call	_write_register
1621                     ; 224 		delay(10);
1623  02ec ae000a        	ldw	x,#10
1624  02ef cd0000        	call	_delay
1626                     ; 225 		flush_tx();
1628  02f2 cd0047        	call	_flush_tx
1630                     ; 226 		delay(10);
1632  02f5 ae000a        	ldw	x,#10
1633  02f8 cd0000        	call	_delay
1635                     ; 228 }
1638  02fb 81            	ret
1665                     ; 231 void tx_init(void) {
1666                     	switch	.text
1667  02fc               _tx_init:
1671                     ; 232     GPIO_Init(CSN_PIN, GPIO_MODE_OUT_PP_HIGH_FAST);
1673  02fc 4bf0          	push	#240
1674  02fe 4b10          	push	#16
1675  0300 ae500a        	ldw	x,#20490
1676  0303 cd0000        	call	_GPIO_Init
1678  0306 85            	popw	x
1679                     ; 233     GPIO_Init(CE_PIN, GPIO_MODE_OUT_PP_HIGH_FAST);
1681  0307 4bf0          	push	#240
1682  0309 4b08          	push	#8
1683  030b ae500a        	ldw	x,#20490
1684  030e cd0000        	call	_GPIO_Init
1686  0311 85            	popw	x
1687                     ; 235     write_register(CONFIG_REGISTER, DEFAULT_CONFIG_TX); 
1689  0312 ae000e        	ldw	x,#14
1690  0315 cd00d7        	call	_write_register
1692                     ; 236     delay(10);
1694  0318 ae000a        	ldw	x,#10
1695  031b cd0000        	call	_delay
1697                     ; 237     write_register(SETUP_AW_REGISTER, DEFAULT_SETUP_AW); 
1699  031e ae0303        	ldw	x,#771
1700  0321 cd00d7        	call	_write_register
1702                     ; 238     delay(10);
1704  0324 ae000a        	ldw	x,#10
1705  0327 cd0000        	call	_delay
1707                     ; 239     write_register(SETUP_RETR_REGISTER, DEFAULT_SETUP_RETR); 
1709  032a ae0401        	ldw	x,#1025
1710  032d cd00d7        	call	_write_register
1712                     ; 240     delay(10);
1714  0330 ae000a        	ldw	x,#10
1715  0333 cd0000        	call	_delay
1717                     ; 241     write_register(RF_CH_REGISTER, 120); 
1719  0336 ae0578        	ldw	x,#1400
1720  0339 cd00d7        	call	_write_register
1722                     ; 242     delay(10);
1724  033c ae000a        	ldw	x,#10
1725  033f cd0000        	call	_delay
1727                     ; 243     write_register(RF_SETUP_REGISTER, DEFAULT_RF_SETUP); 
1729  0342 ae0608        	ldw	x,#1544
1730  0345 cd00d7        	call	_write_register
1732                     ; 244     delay(10);
1734  0348 ae000a        	ldw	x,#10
1735  034b cd0000        	call	_delay
1737                     ; 245     write_register(STATUS_REGISTER, DEFAULT_STATUS);
1739  034e ae0770        	ldw	x,#1904
1740  0351 cd00d7        	call	_write_register
1742                     ; 246 	delay(10);
1744  0354 ae000a        	ldw	x,#10
1745  0357 cd0000        	call	_delay
1747                     ; 247 	flush_tx();
1749  035a cd0047        	call	_flush_tx
1751                     ; 248 	delay(10);
1753  035d ae000a        	ldw	x,#10
1754  0360 cd0000        	call	_delay
1756                     ; 249 }
1759  0363 81            	ret
1785                     ; 252 void nrf_deinit(void)
1785                     ; 253 {
1786                     	switch	.text
1787  0364               _nrf_deinit:
1791                     ; 254 		GPIO_DeInit(GPIOC);
1793  0364 ae500a        	ldw	x,#20490
1794  0367 cd0000        	call	_GPIO_DeInit
1796                     ; 256     write_register(CONFIG_REGISTER, RESET_CONFIG); 
1798  036a ae0008        	ldw	x,#8
1799  036d cd00d7        	call	_write_register
1801                     ; 257     delay(10);
1803  0370 ae000a        	ldw	x,#10
1804  0373 cd0000        	call	_delay
1806                     ; 258     write_register(SETUP_AW_REGISTER, RESET_SETUP_AW); 
1808  0376 ae0303        	ldw	x,#771
1809  0379 cd00d7        	call	_write_register
1811                     ; 259     delay(10);
1813  037c ae000a        	ldw	x,#10
1814  037f cd0000        	call	_delay
1816                     ; 260     write_register(SETUP_RETR_REGISTER, RESET_SETUP_RETR); 
1818  0382 ae0403        	ldw	x,#1027
1819  0385 cd00d7        	call	_write_register
1821                     ; 261     delay(10);
1823  0388 ae000a        	ldw	x,#10
1824  038b cd0000        	call	_delay
1826                     ; 262     write_register(RF_CH_REGISTER, RESET_RF_CH); 
1828  038e ae0502        	ldw	x,#1282
1829  0391 cd00d7        	call	_write_register
1831                     ; 263     delay(10);
1833  0394 ae000a        	ldw	x,#10
1834  0397 cd0000        	call	_delay
1836                     ; 264     write_register(RF_SETUP_REGISTER, RESET_RF_SETUP); 
1838  039a ae060f        	ldw	x,#1551
1839  039d cd00d7        	call	_write_register
1841                     ; 265     delay(10);
1843  03a0 ae000a        	ldw	x,#10
1844  03a3 cd0000        	call	_delay
1846                     ; 266     write_register(STATUS_REGISTER, RESET_STATUS);
1848  03a6 ae0770        	ldw	x,#1904
1849  03a9 cd00d7        	call	_write_register
1851                     ; 267 		delay(10);
1853  03ac ae000a        	ldw	x,#10
1854  03af cd0000        	call	_delay
1856                     ; 269 }
1859  03b2 81            	ret
1895                     ; 272 uint8_t test_tx(void) {
1896                     	switch	.text
1897  03b3               _test_tx:
1899  03b3 88            	push	a
1900       00000001      OFST:	set	1
1903                     ; 275     reg = read_register(STATUS_REGISTER);
1905  03b4 a607          	ld	a,#7
1906  03b6 cd0087        	call	_read_register
1908  03b9 6b01          	ld	(OFST+0,sp),a
1910                     ; 276 		delay(10);
1912  03bb ae000a        	ldw	x,#10
1913  03be cd0000        	call	_delay
1915                     ; 277     delay(10);
1917  03c1 ae000a        	ldw	x,#10
1918  03c4 cd0000        	call	_delay
1920                     ; 278     if (reg != 0x0e) {
1922  03c7 7b01          	ld	a,(OFST+0,sp)
1923  03c9 a10e          	cp	a,#14
1924  03cb 2705          	jreq	L766
1925                     ; 279         return 1;
1927  03cd a601          	ld	a,#1
1930  03cf 5b01          	addw	sp,#1
1931  03d1 81            	ret
1932  03d2               L766:
1933                     ; 282 		reg = read_register(CONFIG_REGISTER);
1935  03d2 4f            	clr	a
1936  03d3 cd0087        	call	_read_register
1938  03d6 6b01          	ld	(OFST+0,sp),a
1940                     ; 283     delay(10);
1942  03d8 ae000a        	ldw	x,#10
1943  03db cd0000        	call	_delay
1945                     ; 284     if (reg != DEFAULT_CONFIG_TX) {
1947  03de 7b01          	ld	a,(OFST+0,sp)
1948  03e0 a10e          	cp	a,#14
1949  03e2 2705          	jreq	L176
1950                     ; 285         return 1;
1952  03e4 a601          	ld	a,#1
1955  03e6 5b01          	addw	sp,#1
1956  03e8 81            	ret
1957  03e9               L176:
1958                     ; 288     reg = read_register(SETUP_AW_REGISTER);
1960  03e9 a603          	ld	a,#3
1961  03eb cd0087        	call	_read_register
1963  03ee 6b01          	ld	(OFST+0,sp),a
1965                     ; 289     delay(10);
1967  03f0 ae000a        	ldw	x,#10
1968  03f3 cd0000        	call	_delay
1970                     ; 290     if (reg != DEFAULT_SETUP_AW) {
1972  03f6 7b01          	ld	a,(OFST+0,sp)
1973  03f8 a103          	cp	a,#3
1974  03fa 2705          	jreq	L376
1975                     ; 291         return 1;
1977  03fc a601          	ld	a,#1
1980  03fe 5b01          	addw	sp,#1
1981  0400 81            	ret
1982  0401               L376:
1983                     ; 294     reg = read_register(SETUP_RETR_REGISTER);
1985  0401 a604          	ld	a,#4
1986  0403 cd0087        	call	_read_register
1988  0406 6b01          	ld	(OFST+0,sp),a
1990                     ; 295     delay(10);
1992  0408 ae000a        	ldw	x,#10
1993  040b cd0000        	call	_delay
1995                     ; 296     if (reg != DEFAULT_SETUP_RETR) {
1997  040e 7b01          	ld	a,(OFST+0,sp)
1998  0410 a101          	cp	a,#1
1999  0412 2705          	jreq	L576
2000                     ; 297         return 1;
2002  0414 a601          	ld	a,#1
2005  0416 5b01          	addw	sp,#1
2006  0418 81            	ret
2007  0419               L576:
2008                     ; 300     reg = read_register(RF_CH_REGISTER);
2010  0419 a605          	ld	a,#5
2011  041b cd0087        	call	_read_register
2013  041e 6b01          	ld	(OFST+0,sp),a
2015                     ; 301     delay(10);
2017  0420 ae000a        	ldw	x,#10
2018  0423 cd0000        	call	_delay
2020                     ; 302     if (reg != 120) {
2022  0426 7b01          	ld	a,(OFST+0,sp)
2023  0428 a178          	cp	a,#120
2024  042a 2705          	jreq	L776
2025                     ; 303         return 1;
2027  042c a601          	ld	a,#1
2030  042e 5b01          	addw	sp,#1
2031  0430 81            	ret
2032  0431               L776:
2033                     ; 306     reg = read_register(RF_SETUP_REGISTER);
2035  0431 a606          	ld	a,#6
2036  0433 cd0087        	call	_read_register
2038  0436 6b01          	ld	(OFST+0,sp),a
2040                     ; 307     delay(10);
2042  0438 ae000a        	ldw	x,#10
2043  043b cd0000        	call	_delay
2045                     ; 308     if (reg != DEFAULT_RF_SETUP) {
2047  043e 7b01          	ld	a,(OFST+0,sp)
2048  0440 a108          	cp	a,#8
2049  0442 2705          	jreq	L107
2050                     ; 309         return 1;
2052  0444 a601          	ld	a,#1
2055  0446 5b01          	addw	sp,#1
2056  0448 81            	ret
2057  0449               L107:
2058                     ; 312     return 0;
2060  0449 4f            	clr	a
2063  044a 5b01          	addw	sp,#1
2064  044c 81            	ret
2100                     ; 315 uint8_t test_rx(void) {
2101                     	switch	.text
2102  044d               _test_rx:
2104  044d 88            	push	a
2105       00000001      OFST:	set	1
2108                     ; 318     reg = read_register(CONFIG_REGISTER);
2110  044e 4f            	clr	a
2111  044f cd0087        	call	_read_register
2113  0452 6b01          	ld	(OFST+0,sp),a
2115                     ; 319     delay(10);
2117  0454 ae000a        	ldw	x,#10
2118  0457 cd0000        	call	_delay
2120                     ; 320     if (reg != DEFAULT_CONFIG_RX) {
2122  045a 7b01          	ld	a,(OFST+0,sp)
2123  045c a10f          	cp	a,#15
2124  045e 2705          	jreq	L127
2125                     ; 321         return 1;
2127  0460 a601          	ld	a,#1
2130  0462 5b01          	addw	sp,#1
2131  0464 81            	ret
2132  0465               L127:
2133                     ; 324     reg = read_register(EN_AA_REGISTER);
2135  0465 a601          	ld	a,#1
2136  0467 cd0087        	call	_read_register
2138  046a 6b01          	ld	(OFST+0,sp),a
2140                     ; 325     delay(10);
2142  046c ae000a        	ldw	x,#10
2143  046f cd0000        	call	_delay
2145                     ; 326     if (reg != DEFAULT_EN_AA) {
2147  0472 7b01          	ld	a,(OFST+0,sp)
2148  0474 a101          	cp	a,#1
2149  0476 2705          	jreq	L327
2150                     ; 327         return 1;
2152  0478 a601          	ld	a,#1
2155  047a 5b01          	addw	sp,#1
2156  047c 81            	ret
2157  047d               L327:
2158                     ; 330     reg = read_register(EN_RXADDR_REGISTER);
2160  047d a602          	ld	a,#2
2161  047f cd0087        	call	_read_register
2163  0482 6b01          	ld	(OFST+0,sp),a
2165                     ; 331     if (reg != DEFAULT_EN_RXADDR) {
2167  0484 7b01          	ld	a,(OFST+0,sp)
2168  0486 a101          	cp	a,#1
2169  0488 2705          	jreq	L527
2170                     ; 332         return 1;
2172  048a a601          	ld	a,#1
2175  048c 5b01          	addw	sp,#1
2176  048e 81            	ret
2177  048f               L527:
2178                     ; 335     reg = read_register(SETUP_AW_REGISTER);
2180  048f a603          	ld	a,#3
2181  0491 cd0087        	call	_read_register
2183  0494 6b01          	ld	(OFST+0,sp),a
2185                     ; 336     delay(10);
2187  0496 ae000a        	ldw	x,#10
2188  0499 cd0000        	call	_delay
2190                     ; 337     if (reg != DEFAULT_SETUP_AW) {
2192  049c 7b01          	ld	a,(OFST+0,sp)
2193  049e a103          	cp	a,#3
2194  04a0 2705          	jreq	L727
2195                     ; 338         return 1;
2197  04a2 a601          	ld	a,#1
2200  04a4 5b01          	addw	sp,#1
2201  04a6 81            	ret
2202  04a7               L727:
2203                     ; 341     reg = read_register(RF_CH_REGISTER);
2205  04a7 a605          	ld	a,#5
2206  04a9 cd0087        	call	_read_register
2208  04ac 6b01          	ld	(OFST+0,sp),a
2210                     ; 342     delay(10);
2212  04ae ae000a        	ldw	x,#10
2213  04b1 cd0000        	call	_delay
2215                     ; 343     if (reg != 120) {
2217  04b4 7b01          	ld	a,(OFST+0,sp)
2218  04b6 a178          	cp	a,#120
2219  04b8 2705          	jreq	L137
2220                     ; 344         return 1;
2222  04ba a601          	ld	a,#1
2225  04bc 5b01          	addw	sp,#1
2226  04be 81            	ret
2227  04bf               L137:
2228                     ; 347     reg = read_register(RF_SETUP_REGISTER);
2230  04bf a606          	ld	a,#6
2231  04c1 cd0087        	call	_read_register
2233  04c4 6b01          	ld	(OFST+0,sp),a
2235                     ; 348     delay(10);
2237  04c6 ae000a        	ldw	x,#10
2238  04c9 cd0000        	call	_delay
2240                     ; 349     if (reg != DEFAULT_RF_SETUP) {
2242  04cc 7b01          	ld	a,(OFST+0,sp)
2243  04ce a108          	cp	a,#8
2244  04d0 2705          	jreq	L337
2245                     ; 350         return 1;
2247  04d2 a601          	ld	a,#1
2250  04d4 5b01          	addw	sp,#1
2251  04d6 81            	ret
2252  04d7               L337:
2253                     ; 353     reg = read_register(STATUS_REGISTER);
2255  04d7 a607          	ld	a,#7
2256  04d9 cd0087        	call	_read_register
2258  04dc 6b01          	ld	(OFST+0,sp),a
2260                     ; 354     if (reg != 0x0e) {
2262  04de 7b01          	ld	a,(OFST+0,sp)
2263  04e0 a10e          	cp	a,#14
2264  04e2 2705          	jreq	L537
2265                     ; 355         return 1;
2267  04e4 a601          	ld	a,#1
2270  04e6 5b01          	addw	sp,#1
2271  04e8 81            	ret
2272  04e9               L537:
2273                     ; 357 	return 0;
2275  04e9 4f            	clr	a
2278  04ea 5b01          	addw	sp,#1
2279  04ec 81            	ret
2314                     	switch	.ubsct
2315  0000               _rxaddr:
2316  0000 0000          	ds.b	2
2317                     	xdef	_rxaddr
2318  0002               _txaddr:
2319  0002 0000          	ds.b	2
2320                     	xdef	_txaddr
2321                     	xdef	_test_rx
2322                     	xdef	_test_tx
2323                     	xdef	_SPI_DeInit_NRF
2324                     	xdef	_SPI_Init_NRF
2325                     	xdef	_rx_read
2326                     	xdef	_tx_send
2327                     	xdef	_nrf_deinit
2328                     	xdef	_rx_init
2329                     	xdef	_tx_init
2330                     	xdef	_write_registerN
2331                     	xdef	_read_registerN
2332                     	xdef	_write_register
2333                     	xdef	_read_register
2334                     	xdef	_reset_status
2335                     	xdef	_flush_tx
2336                     	xdef	_flush_rx
2337                     	xdef	_ce_low
2338                     	xdef	_ce_high
2339                     	xdef	_cs_low
2340                     	xdef	_cs_high
2341                     	xdef	_delay
2342                     	xref	_SPI_GetFlagStatus
2343                     	xref	_SPI_ReceiveData
2344                     	xref	_SPI_SendData
2345                     	xref	_SPI_Cmd
2346                     	xref	_SPI_Init
2347                     	xref	_SPI_DeInit
2348                     	xref	_GPIO_WriteLow
2349                     	xref	_GPIO_WriteHigh
2350                     	xref	_GPIO_Init
2351                     	xref	_GPIO_DeInit
2371                     	end
