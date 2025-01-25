   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.3 - 22 Aug 2024
  64                     ; 5 void delay(uint16_t n) {
  66                     	switch	.text
  67  0000               _delay:
  69  0000 89            	pushw	x
  70  0001 89            	pushw	x
  71       00000002      OFST:	set	2
  74                     ; 6     uint16_t i = 0;
  76                     ; 7     for (i = 0; i < n; i++) {
  78  0002 5f            	clrw	x
  79  0003 1f01          	ldw	(OFST-1,sp),x
  82  0005 2008          	jra	L73
  83  0007               L33:
  84                     ; 8         __asm("nop");
  87  0007 9d            nop
  89                     ; 7     for (i = 0; i < n; i++) {
  91  0008 1e01          	ldw	x,(OFST-1,sp)
  92  000a 1c0001        	addw	x,#1
  93  000d 1f01          	ldw	(OFST-1,sp),x
  95  000f               L73:
  98  000f 1e01          	ldw	x,(OFST-1,sp)
  99  0011 1303          	cpw	x,(OFST+1,sp)
 100  0013 25f2          	jrult	L33
 101                     ; 10 }
 104  0015 5b04          	addw	sp,#4
 105  0017 81            	ret
 129                     ; 14 void cs_high(void) {
 130                     	switch	.text
 131  0018               _cs_high:
 135                     ; 15     GPIO_WriteHigh(CSN_PIN);
 137  0018 4b10          	push	#16
 138  001a ae500a        	ldw	x,#20490
 139  001d cd0000        	call	_GPIO_WriteHigh
 141  0020 84            	pop	a
 142                     ; 16 }
 145  0021 81            	ret
 169                     ; 18 void cs_low(void) {
 170                     	switch	.text
 171  0022               _cs_low:
 175                     ; 19     GPIO_WriteLow(CSN_PIN);
 177  0022 4b10          	push	#16
 178  0024 ae500a        	ldw	x,#20490
 179  0027 cd0000        	call	_GPIO_WriteLow
 181  002a 84            	pop	a
 182                     ; 20 }
 185  002b 81            	ret
 209                     ; 22 void ce_high(void) {
 210                     	switch	.text
 211  002c               _ce_high:
 215                     ; 23     GPIO_WriteHigh(CE_PIN);
 217  002c 4b08          	push	#8
 218  002e ae500a        	ldw	x,#20490
 219  0031 cd0000        	call	_GPIO_WriteHigh
 221  0034 84            	pop	a
 222                     ; 24 }
 225  0035 81            	ret
 249                     ; 26 void ce_low(void) {
 250                     	switch	.text
 251  0036               _ce_low:
 255                     ; 27     GPIO_WriteLow(CE_PIN);
 257  0036 4b08          	push	#8
 258  0038 ae500a        	ldw	x,#20490
 259  003b cd0000        	call	_GPIO_WriteLow
 261  003e 84            	pop	a
 262                     ; 28 }
 265  003f 81            	ret
 289                     ; 30 void reset_status(void) {
 290                     	switch	.text
 291  0040               _reset_status:
 295                     ; 31     write_register(STATUS_REGISTER, 0x70);
 297  0040 ae0770        	ldw	x,#1904
 298  0043 cd00d7        	call	_write_register
 300                     ; 32 }
 303  0046 81            	ret
 330                     ; 34 void flush_tx(void) {
 331                     	switch	.text
 332  0047               _flush_tx:
 336                     ; 35     cs_low();
 338  0047 add9          	call	_cs_low
 340                     ; 36     SPI_SendData(FLUSH_TX);
 342  0049 a6e1          	ld	a,#225
 343  004b cd0000        	call	_SPI_SendData
 345                     ; 37     delay(10);
 347  004e ae000a        	ldw	x,#10
 348  0051 adad          	call	_delay
 350                     ; 38     cs_high();
 352  0053 adc3          	call	_cs_high
 354                     ; 39 }
 357  0055 81            	ret
 384                     ; 41 void flush_rx(void) {
 385                     	switch	.text
 386  0056               _flush_rx:
 390                     ; 42     cs_low();
 392  0056 adca          	call	_cs_low
 394                     ; 43     SPI_SendData(FLUSH_RX);
 396  0058 a6e2          	ld	a,#226
 397  005a cd0000        	call	_SPI_SendData
 399                     ; 44     delay(10);
 401  005d ae000a        	ldw	x,#10
 402  0060 ad9e          	call	_delay
 404                     ; 45     cs_high();
 406  0062 adb4          	call	_cs_high
 408                     ; 46 }
 411  0064 81            	ret
 436                     ; 51 void SPI_Init_NRF(void) {
 437                     	switch	.text
 438  0065               _SPI_Init_NRF:
 442                     ; 52     SPI_Init(SPI_FIRSTBIT_MSB, SPI_BAUDRATEPRESCALER_8, SPI_MODE_MASTER,
 442                     ; 53              SPI_CLOCKPOLARITY_LOW, SPI_CLOCKPHASE_1EDGE, SPI_DATADIRECTION_2LINES_FULLDUPLEX,
 442                     ; 54              SPI_NSS_SOFT, 0x07);
 444  0065 4b07          	push	#7
 445  0067 4b02          	push	#2
 446  0069 4b00          	push	#0
 447  006b 4b00          	push	#0
 448  006d 4b00          	push	#0
 449  006f 4b04          	push	#4
 450  0071 ae0010        	ldw	x,#16
 451  0074 cd0000        	call	_SPI_Init
 453  0077 5b06          	addw	sp,#6
 454                     ; 55     SPI_Cmd(ENABLE);
 456  0079 a601          	ld	a,#1
 457  007b cd0000        	call	_SPI_Cmd
 459                     ; 56 }
 462  007e 81            	ret
 487                     ; 58 void SPI_DeInit_NRF(void){
 488                     	switch	.text
 489  007f               _SPI_DeInit_NRF:
 493                     ; 59 		SPI_DeInit();
 495  007f cd0000        	call	_SPI_DeInit
 497                     ; 60 		SPI_Cmd(DISABLE);
 499  0082 4f            	clr	a
 500  0083 cd0000        	call	_SPI_Cmd
 502                     ; 61 }
 505  0086 81            	ret
 563                     ; 66 uint8_t read_register(uint8_t reg) {
 564                     	switch	.text
 565  0087               _read_register:
 567  0087 88            	push	a
 568       00000001      OFST:	set	1
 571                     ; 67     uint8_t command = R_REGISTER | reg;
 573  0088 6b01          	ld	(OFST+0,sp),a
 575                     ; 68     uint8_t data = 0;
 577                     ; 70     cs_low();
 579  008a ad96          	call	_cs_low
 581                     ; 71     SPI_SendData(command);
 583  008c 7b01          	ld	a,(OFST+0,sp)
 584  008e cd0000        	call	_SPI_SendData
 586                     ; 72 		delay(10);
 588  0091 ae000a        	ldw	x,#10
 589  0094 cd0000        	call	_delay
 592  0097               L302:
 593                     ; 73     while (SPI_GetFlagStatus(SPI_FLAG_TXE) == RESET); // ???????? ???????? ???????
 595  0097 a602          	ld	a,#2
 596  0099 cd0000        	call	_SPI_GetFlagStatus
 598  009c 4d            	tnz	a
 599  009d 27f8          	jreq	L302
 601  009f               L112:
 602                     ; 74     while (SPI_GetFlagStatus(SPI_FLAG_RXNE) == RESET); // ???????? ????????? ??????
 604  009f a601          	ld	a,#1
 605  00a1 cd0000        	call	_SPI_GetFlagStatus
 607  00a4 4d            	tnz	a
 608  00a5 27f8          	jreq	L112
 609                     ; 75     data = SPI_ReceiveData();
 611  00a7 cd0000        	call	_SPI_ReceiveData
 613                     ; 76 		delay(10);
 615  00aa ae000a        	ldw	x,#10
 616  00ad cd0000        	call	_delay
 618                     ; 77 		SPI_SendData(0x0);
 620  00b0 4f            	clr	a
 621  00b1 cd0000        	call	_SPI_SendData
 623                     ; 78 		delay(10);
 625  00b4 ae000a        	ldw	x,#10
 626  00b7 cd0000        	call	_delay
 629  00ba               L712:
 630                     ; 79 		while (SPI_GetFlagStatus(SPI_FLAG_TXE) == RESET); 
 632  00ba a602          	ld	a,#2
 633  00bc cd0000        	call	_SPI_GetFlagStatus
 635  00bf 4d            	tnz	a
 636  00c0 27f8          	jreq	L712
 638  00c2               L522:
 639                     ; 80 		while (SPI_GetFlagStatus(SPI_FLAG_RXNE) == RESET); // ???????? ????????? ??????
 641  00c2 a601          	ld	a,#1
 642  00c4 cd0000        	call	_SPI_GetFlagStatus
 644  00c7 4d            	tnz	a
 645  00c8 27f8          	jreq	L522
 646                     ; 81 		data = SPI_ReceiveData();
 648  00ca cd0000        	call	_SPI_ReceiveData
 650  00cd 6b01          	ld	(OFST+0,sp),a
 652                     ; 83 cs_high();
 654  00cf cd0018        	call	_cs_high
 656                     ; 85     return data;
 658  00d2 7b01          	ld	a,(OFST+0,sp)
 661  00d4 5b01          	addw	sp,#1
 662  00d6 81            	ret
 719                     ; 88 void write_register(uint8_t reg, uint8_t value) {
 720                     	switch	.text
 721  00d7               _write_register:
 723  00d7 89            	pushw	x
 724  00d8 88            	push	a
 725       00000001      OFST:	set	1
 728                     ; 89     uint8_t command = W_REGISTER | reg;
 730  00d9 9e            	ld	a,xh
 731  00da aa20          	or	a,#32
 732  00dc 6b01          	ld	(OFST+0,sp),a
 734                     ; 91     cs_low();
 736  00de cd0022        	call	_cs_low
 738                     ; 92     SPI_SendData(command);
 740  00e1 7b01          	ld	a,(OFST+0,sp)
 741  00e3 cd0000        	call	_SPI_SendData
 744  00e6               L162:
 745                     ; 93     while (SPI_GetFlagStatus(SPI_FLAG_TXE) == RESET);
 747  00e6 a602          	ld	a,#2
 748  00e8 cd0000        	call	_SPI_GetFlagStatus
 750  00eb 4d            	tnz	a
 751  00ec 27f8          	jreq	L162
 752                     ; 94     SPI_SendData(value);
 754  00ee 7b03          	ld	a,(OFST+2,sp)
 755  00f0 cd0000        	call	_SPI_SendData
 758  00f3               L762:
 759                     ; 95     while (SPI_GetFlagStatus(SPI_FLAG_TXE) == RESET);
 761  00f3 a602          	ld	a,#2
 762  00f5 cd0000        	call	_SPI_GetFlagStatus
 764  00f8 4d            	tnz	a
 765  00f9 27f8          	jreq	L762
 766                     ; 96 		delay(10);
 768  00fb ae000a        	ldw	x,#10
 769  00fe cd0000        	call	_delay
 771                     ; 97     cs_high();
 773  0101 cd0018        	call	_cs_high
 775                     ; 98 }
 778  0104 5b03          	addw	sp,#3
 779  0106 81            	ret
 856                     ; 104 void read_registerN(uint8_t reg, uint8_t *buf, uint8_t len) {
 857                     	switch	.text
 858  0107               _read_registerN:
 860  0107 88            	push	a
 861  0108 88            	push	a
 862       00000001      OFST:	set	1
 865                     ; 105     uint8_t command = R_REGISTER | reg;
 867  0109 6b01          	ld	(OFST+0,sp),a
 869                     ; 108     cs_low();
 871  010b cd0022        	call	_cs_low
 873                     ; 110     SPI_SendData(command);
 875  010e 7b01          	ld	a,(OFST+0,sp)
 876  0110 cd0000        	call	_SPI_SendData
 879  0113               L333:
 880                     ; 111     while (SPI_GetFlagStatus(SPI_FLAG_TXE) == RESET);
 882  0113 a602          	ld	a,#2
 883  0115 cd0000        	call	_SPI_GetFlagStatus
 885  0118 4d            	tnz	a
 886  0119 27f8          	jreq	L333
 887                     ; 112 		delay(10);
 889  011b ae000a        	ldw	x,#10
 890  011e cd0000        	call	_delay
 893  0121               L143:
 894                     ; 113     while (SPI_GetFlagStatus(SPI_FLAG_RXNE) == RESET);
 896  0121 a601          	ld	a,#1
 897  0123 cd0000        	call	_SPI_GetFlagStatus
 899  0126 4d            	tnz	a
 900  0127 27f8          	jreq	L143
 901                     ; 114     SPI_ReceiveData();
 903  0129 cd0000        	call	_SPI_ReceiveData
 905                     ; 115     for (i = 0; i < len; i++) {
 907  012c 0f01          	clr	(OFST+0,sp)
 910  012e 202a          	jra	L153
 911  0130               L543:
 912                     ; 116         delay(10);
 914  0130 ae000a        	ldw	x,#10
 915  0133 cd0000        	call	_delay
 917                     ; 117         SPI_SendData(0xFF);
 919  0136 a6ff          	ld	a,#255
 920  0138 cd0000        	call	_SPI_SendData
 923  013b               L753:
 924                     ; 118         while (SPI_GetFlagStatus(SPI_FLAG_TXE) == RESET);
 926  013b a602          	ld	a,#2
 927  013d cd0000        	call	_SPI_GetFlagStatus
 929  0140 4d            	tnz	a
 930  0141 27f8          	jreq	L753
 932  0143               L563:
 933                     ; 119         while (SPI_GetFlagStatus(SPI_FLAG_RXNE) == RESET);
 935  0143 a601          	ld	a,#1
 936  0145 cd0000        	call	_SPI_GetFlagStatus
 938  0148 4d            	tnz	a
 939  0149 27f8          	jreq	L563
 940                     ; 120         buf[i] = SPI_ReceiveData();
 942  014b 7b01          	ld	a,(OFST+0,sp)
 943  014d 5f            	clrw	x
 944  014e 97            	ld	xl,a
 945  014f 72fb05        	addw	x,(OFST+4,sp)
 946  0152 89            	pushw	x
 947  0153 cd0000        	call	_SPI_ReceiveData
 949  0156 85            	popw	x
 950  0157 f7            	ld	(x),a
 951                     ; 115     for (i = 0; i < len; i++) {
 953  0158 0c01          	inc	(OFST+0,sp)
 955  015a               L153:
 958  015a 7b01          	ld	a,(OFST+0,sp)
 959  015c 1107          	cp	a,(OFST+6,sp)
 960  015e 25d0          	jrult	L543
 961                     ; 122 		delay(10);
 963  0160 ae000a        	ldw	x,#10
 964  0163 cd0000        	call	_delay
 966                     ; 123     cs_high();
 968  0166 cd0018        	call	_cs_high
 970                     ; 124 			delay(10);
 972  0169 ae000a        	ldw	x,#10
 973  016c cd0000        	call	_delay
 975                     ; 125 }
 978  016f 85            	popw	x
 979  0170 81            	ret
1055                     ; 127 void write_registerN(uint8_t reg, const uint8_t *buf, uint8_t len) {
1056                     	switch	.text
1057  0171               _write_registerN:
1059  0171 88            	push	a
1060  0172 88            	push	a
1061       00000001      OFST:	set	1
1064                     ; 128     uint8_t command = W_REGISTER | reg;
1066  0173 aa20          	or	a,#32
1067  0175 6b01          	ld	(OFST+0,sp),a
1069                     ; 131     cs_low();
1071  0177 cd0022        	call	_cs_low
1073                     ; 132     SPI_SendData(command);
1075  017a 7b01          	ld	a,(OFST+0,sp)
1076  017c cd0000        	call	_SPI_SendData
1079  017f               L134:
1080                     ; 133     while (SPI_GetFlagStatus(SPI_FLAG_TXE) == RESET);
1082  017f a602          	ld	a,#2
1083  0181 cd0000        	call	_SPI_GetFlagStatus
1085  0184 4d            	tnz	a
1086  0185 27f8          	jreq	L134
1087                     ; 135     for (i = 0; i < len; i++) {
1089  0187 0f01          	clr	(OFST+0,sp)
1092  0189 201b          	jra	L144
1093  018b               L534:
1094                     ; 136         delay(10);
1096  018b ae000a        	ldw	x,#10
1097  018e cd0000        	call	_delay
1099                     ; 137         SPI_SendData(buf[i]);
1101  0191 7b01          	ld	a,(OFST+0,sp)
1102  0193 5f            	clrw	x
1103  0194 97            	ld	xl,a
1104  0195 72fb05        	addw	x,(OFST+4,sp)
1105  0198 f6            	ld	a,(x)
1106  0199 cd0000        	call	_SPI_SendData
1109  019c               L744:
1110                     ; 138         while (SPI_GetFlagStatus(SPI_FLAG_TXE) == RESET);
1112  019c a602          	ld	a,#2
1113  019e cd0000        	call	_SPI_GetFlagStatus
1115  01a1 4d            	tnz	a
1116  01a2 27f8          	jreq	L744
1117                     ; 135     for (i = 0; i < len; i++) {
1119  01a4 0c01          	inc	(OFST+0,sp)
1121  01a6               L144:
1124  01a6 7b01          	ld	a,(OFST+0,sp)
1125  01a8 1107          	cp	a,(OFST+6,sp)
1126  01aa 25df          	jrult	L534
1127                     ; 140 		delay(10);
1129  01ac ae000a        	ldw	x,#10
1130  01af cd0000        	call	_delay
1132                     ; 141     cs_high();
1134  01b2 cd0018        	call	_cs_high
1136                     ; 142 			delay(10);
1138  01b5 ae000a        	ldw	x,#10
1139  01b8 cd0000        	call	_delay
1141                     ; 143 }
1144  01bb 85            	popw	x
1145  01bc 81            	ret
1217                     ; 151 void tx_send(const uint8_t *data, uint8_t len) {
1218                     	switch	.text
1219  01bd               _tx_send:
1221  01bd 89            	pushw	x
1222  01be 88            	push	a
1223       00000001      OFST:	set	1
1226                     ; 155     flush_tx();
1228  01bf cd0047        	call	_flush_tx
1230                     ; 157     cs_low();
1232  01c2 cd0022        	call	_cs_low
1234                     ; 158     SPI_SendData(W_TX_PAYLOAD);
1236  01c5 a6a0          	ld	a,#160
1237  01c7 cd0000        	call	_SPI_SendData
1239                     ; 159 				delay(10);
1241  01ca ae000a        	ldw	x,#10
1242  01cd cd0000        	call	_delay
1245  01d0               L705:
1246                     ; 160     while (SPI_GetFlagStatus(SPI_FLAG_TXE) == RESET);
1248  01d0 a602          	ld	a,#2
1249  01d2 cd0000        	call	_SPI_GetFlagStatus
1251  01d5 4d            	tnz	a
1252  01d6 27f8          	jreq	L705
1253                     ; 161     for (i = 0; i < len; i++) {
1255  01d8 0f01          	clr	(OFST+0,sp)
1258  01da 201b          	jra	L715
1259  01dc               L315:
1260                     ; 162         delay(10);
1262  01dc ae000a        	ldw	x,#10
1263  01df cd0000        	call	_delay
1265                     ; 163         SPI_SendData(data[i]);
1267  01e2 7b01          	ld	a,(OFST+0,sp)
1268  01e4 5f            	clrw	x
1269  01e5 97            	ld	xl,a
1270  01e6 72fb02        	addw	x,(OFST+1,sp)
1271  01e9 f6            	ld	a,(x)
1272  01ea cd0000        	call	_SPI_SendData
1275  01ed               L525:
1276                     ; 164         while (SPI_GetFlagStatus(SPI_FLAG_TXE) == RESET);
1278  01ed a602          	ld	a,#2
1279  01ef cd0000        	call	_SPI_GetFlagStatus
1281  01f2 4d            	tnz	a
1282  01f3 27f8          	jreq	L525
1283                     ; 161     for (i = 0; i < len; i++) {
1285  01f5 0c01          	inc	(OFST+0,sp)
1287  01f7               L715:
1290  01f7 7b01          	ld	a,(OFST+0,sp)
1291  01f9 1106          	cp	a,(OFST+5,sp)
1292  01fb 25df          	jrult	L315
1293                     ; 166     delay(10);
1295  01fd ae000a        	ldw	x,#10
1296  0200 cd0000        	call	_delay
1298                     ; 167     cs_high();
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
1540                     ; 208     GPIO_Init(CSN_PIN, GPIO_MODE_OUT_PP_HIGH_FAST);
1542  0288 4bf0          	push	#240
1543  028a 4b10          	push	#16
1544  028c ae500a        	ldw	x,#20490
1545  028f cd0000        	call	_GPIO_Init
1547  0292 85            	popw	x
1548                     ; 209     GPIO_Init(CE_PIN, GPIO_MODE_OUT_PP_HIGH_FAST);
1550  0293 4bf0          	push	#240
1551  0295 4b08          	push	#8
1552  0297 ae500a        	ldw	x,#20490
1553  029a cd0000        	call	_GPIO_Init
1555  029d 85            	popw	x
1556                     ; 212     write_register(CONFIG_REGISTER, DEFAULT_CONFIG_RX);
1558  029e ae000f        	ldw	x,#15
1559  02a1 cd00d7        	call	_write_register
1561                     ; 213     delay(10);
1563  02a4 ae000a        	ldw	x,#10
1564  02a7 cd0000        	call	_delay
1566                     ; 214     write_register(EN_AA_REGISTER, DEFAULT_EN_AA);
1568  02aa ae0101        	ldw	x,#257
1569  02ad cd00d7        	call	_write_register
1571                     ; 215     delay(10);
1573  02b0 ae000a        	ldw	x,#10
1574  02b3 cd0000        	call	_delay
1576                     ; 216     write_register(EN_RXADDR_REGISTER, DEFAULT_EN_RXADDR);
1578  02b6 ae0201        	ldw	x,#513
1579  02b9 cd00d7        	call	_write_register
1581                     ; 217     delay(10);
1583  02bc ae000a        	ldw	x,#10
1584  02bf cd0000        	call	_delay
1586                     ; 218     write_register(SETUP_AW_REGISTER, DEFAULT_SETUP_AW);
1588  02c2 ae0303        	ldw	x,#771
1589  02c5 cd00d7        	call	_write_register
1591                     ; 219     delay(10);
1593  02c8 ae000a        	ldw	x,#10
1594  02cb cd0000        	call	_delay
1596                     ; 220     write_register(RF_CH_REGISTER, 120); 
1598  02ce ae0578        	ldw	x,#1400
1599  02d1 cd00d7        	call	_write_register
1601                     ; 221     delay(10);
1603  02d4 ae000a        	ldw	x,#10
1604  02d7 cd0000        	call	_delay
1606                     ; 222     write_register(RF_SETUP_REGISTER, DEFAULT_RF_SETUP);
1608  02da ae0608        	ldw	x,#1544
1609  02dd cd00d7        	call	_write_register
1611                     ; 223     delay(10);
1613  02e0 ae000a        	ldw	x,#10
1614  02e3 cd0000        	call	_delay
1616                     ; 224     write_register(STATUS_REGISTER, DEFAULT_STATUS);
1618  02e6 ae0770        	ldw	x,#1904
1619  02e9 cd00d7        	call	_write_register
1621                     ; 225 		delay(10);
1623  02ec ae000a        	ldw	x,#10
1624  02ef cd0000        	call	_delay
1626                     ; 226 		flush_tx();
1628  02f2 cd0047        	call	_flush_tx
1630                     ; 227 		delay(10);
1632  02f5 ae000a        	ldw	x,#10
1633  02f8 cd0000        	call	_delay
1635                     ; 232 }
1638  02fb 81            	ret
1665                     ; 235 void tx_init(void) {
1666                     	switch	.text
1667  02fc               _tx_init:
1671                     ; 237     GPIO_Init(CSN_PIN, GPIO_MODE_OUT_PP_HIGH_FAST);
1673  02fc 4bf0          	push	#240
1674  02fe 4b10          	push	#16
1675  0300 ae500a        	ldw	x,#20490
1676  0303 cd0000        	call	_GPIO_Init
1678  0306 85            	popw	x
1679                     ; 238     GPIO_Init(CE_PIN, GPIO_MODE_OUT_PP_HIGH_FAST);
1681  0307 4bf0          	push	#240
1682  0309 4b08          	push	#8
1683  030b ae500a        	ldw	x,#20490
1684  030e cd0000        	call	_GPIO_Init
1686  0311 85            	popw	x
1687                     ; 240     write_register(CONFIG_REGISTER, DEFAULT_CONFIG_TX); 
1689  0312 ae000e        	ldw	x,#14
1690  0315 cd00d7        	call	_write_register
1692                     ; 241     delay(10);
1694  0318 ae000a        	ldw	x,#10
1695  031b cd0000        	call	_delay
1697                     ; 242     write_register(SETUP_AW_REGISTER, DEFAULT_SETUP_AW); 
1699  031e ae0303        	ldw	x,#771
1700  0321 cd00d7        	call	_write_register
1702                     ; 243     delay(10);
1704  0324 ae000a        	ldw	x,#10
1705  0327 cd0000        	call	_delay
1707                     ; 244     write_register(SETUP_RETR_REGISTER, DEFAULT_SETUP_RETR); 
1709  032a ae0401        	ldw	x,#1025
1710  032d cd00d7        	call	_write_register
1712                     ; 245     delay(10);
1714  0330 ae000a        	ldw	x,#10
1715  0333 cd0000        	call	_delay
1717                     ; 246     write_register(RF_CH_REGISTER, 120); 
1719  0336 ae0578        	ldw	x,#1400
1720  0339 cd00d7        	call	_write_register
1722                     ; 247     delay(10);
1724  033c ae000a        	ldw	x,#10
1725  033f cd0000        	call	_delay
1727                     ; 248     write_register(RF_SETUP_REGISTER, DEFAULT_RF_SETUP); 
1729  0342 ae0608        	ldw	x,#1544
1730  0345 cd00d7        	call	_write_register
1732                     ; 249     delay(10);
1734  0348 ae000a        	ldw	x,#10
1735  034b cd0000        	call	_delay
1737                     ; 250     write_register(STATUS_REGISTER, DEFAULT_STATUS);
1739  034e ae0770        	ldw	x,#1904
1740  0351 cd00d7        	call	_write_register
1742                     ; 251 		delay(10);
1744  0354 ae000a        	ldw	x,#10
1745  0357 cd0000        	call	_delay
1747                     ; 252 		flush_tx();
1749  035a cd0047        	call	_flush_tx
1751                     ; 253 		delay(10);
1753  035d ae000a        	ldw	x,#10
1754  0360 cd0000        	call	_delay
1756                     ; 256 }
1759  0363 81            	ret
1785                     ; 259 void nrf_deinit(void)
1785                     ; 260 {
1786                     	switch	.text
1787  0364               _nrf_deinit:
1791                     ; 261 		GPIO_DeInit(GPIOC);
1793  0364 ae500a        	ldw	x,#20490
1794  0367 cd0000        	call	_GPIO_DeInit
1796                     ; 263     write_register(CONFIG_REGISTER, RESET_CONFIG); 
1798  036a ae0008        	ldw	x,#8
1799  036d cd00d7        	call	_write_register
1801                     ; 264     delay(10);
1803  0370 ae000a        	ldw	x,#10
1804  0373 cd0000        	call	_delay
1806                     ; 265     write_register(SETUP_AW_REGISTER, RESET_SETUP_AW); 
1808  0376 ae0303        	ldw	x,#771
1809  0379 cd00d7        	call	_write_register
1811                     ; 266     delay(10);
1813  037c ae000a        	ldw	x,#10
1814  037f cd0000        	call	_delay
1816                     ; 267     write_register(SETUP_RETR_REGISTER, RESET_SETUP_RETR); 
1818  0382 ae0403        	ldw	x,#1027
1819  0385 cd00d7        	call	_write_register
1821                     ; 268     delay(10);
1823  0388 ae000a        	ldw	x,#10
1824  038b cd0000        	call	_delay
1826                     ; 269     write_register(RF_CH_REGISTER, RESET_RF_CH); 
1828  038e ae0502        	ldw	x,#1282
1829  0391 cd00d7        	call	_write_register
1831                     ; 270     delay(10);
1833  0394 ae000a        	ldw	x,#10
1834  0397 cd0000        	call	_delay
1836                     ; 271     write_register(RF_SETUP_REGISTER, RESET_RF_SETUP); 
1838  039a ae060f        	ldw	x,#1551
1839  039d cd00d7        	call	_write_register
1841                     ; 272     delay(10);
1843  03a0 ae000a        	ldw	x,#10
1844  03a3 cd0000        	call	_delay
1846                     ; 273     write_register(STATUS_REGISTER, RESET_STATUS);
1848  03a6 ae0770        	ldw	x,#1904
1849  03a9 cd00d7        	call	_write_register
1851                     ; 274 		delay(10);
1853  03ac ae000a        	ldw	x,#10
1854  03af cd0000        	call	_delay
1856                     ; 276 }
1859  03b2 81            	ret
1906                     ; 279 uint8_t test_tx(void) {
1907                     	switch	.text
1908  03b3               _test_tx:
1910  03b3 5206          	subw	sp,#6
1911       00000006      OFST:	set	6
1914                     ; 282     reg = read_register(STATUS_REGISTER);
1916  03b5 a607          	ld	a,#7
1917  03b7 cd0087        	call	_read_register
1919  03ba 6b06          	ld	(OFST+0,sp),a
1921                     ; 283 		delay(10);
1923  03bc ae000a        	ldw	x,#10
1924  03bf cd0000        	call	_delay
1926                     ; 284     delay(10);
1928  03c2 ae000a        	ldw	x,#10
1929  03c5 cd0000        	call	_delay
1931                     ; 285     if (reg != 0x0e) {
1933  03c8 7b06          	ld	a,(OFST+0,sp)
1934  03ca a10e          	cp	a,#14
1935  03cc 2704          	jreq	L376
1936                     ; 286         return 1;
1938  03ce a601          	ld	a,#1
1940  03d0 2014          	jra	L45
1941  03d2               L376:
1942                     ; 289 		reg = read_register(CONFIG_REGISTER);
1944  03d2 4f            	clr	a
1945  03d3 cd0087        	call	_read_register
1947  03d6 6b06          	ld	(OFST+0,sp),a
1949                     ; 290     delay(10);
1951  03d8 ae000a        	ldw	x,#10
1952  03db cd0000        	call	_delay
1954                     ; 291     if (reg != DEFAULT_CONFIG_TX) {
1956  03de 7b06          	ld	a,(OFST+0,sp)
1957  03e0 a10e          	cp	a,#14
1958  03e2 2705          	jreq	L576
1959                     ; 292         return 1;
1961  03e4 a601          	ld	a,#1
1963  03e6               L45:
1965  03e6 5b06          	addw	sp,#6
1966  03e8 81            	ret
1967  03e9               L576:
1968                     ; 295     reg = read_register(SETUP_AW_REGISTER);
1970  03e9 a603          	ld	a,#3
1971  03eb cd0087        	call	_read_register
1973  03ee 6b06          	ld	(OFST+0,sp),a
1975                     ; 296     delay(10);
1977  03f0 ae000a        	ldw	x,#10
1978  03f3 cd0000        	call	_delay
1980                     ; 297     if (reg != DEFAULT_SETUP_AW) {
1982  03f6 7b06          	ld	a,(OFST+0,sp)
1983  03f8 a103          	cp	a,#3
1984  03fa 2704          	jreq	L776
1985                     ; 298         return 1;
1987  03fc a601          	ld	a,#1
1989  03fe 20e6          	jra	L45
1990  0400               L776:
1991                     ; 301     reg = read_register(SETUP_RETR_REGISTER);
1993  0400 a604          	ld	a,#4
1994  0402 cd0087        	call	_read_register
1996  0405 6b06          	ld	(OFST+0,sp),a
1998                     ; 302     delay(10);
2000  0407 ae000a        	ldw	x,#10
2001  040a cd0000        	call	_delay
2003                     ; 303     if (reg != DEFAULT_SETUP_RETR) {
2005  040d 7b06          	ld	a,(OFST+0,sp)
2006  040f a101          	cp	a,#1
2007  0411 2704          	jreq	L107
2008                     ; 304         return 1;
2010  0413 a601          	ld	a,#1
2012  0415 20cf          	jra	L45
2013  0417               L107:
2014                     ; 307     reg = read_register(RF_CH_REGISTER);
2016  0417 a605          	ld	a,#5
2017  0419 cd0087        	call	_read_register
2019  041c 6b06          	ld	(OFST+0,sp),a
2021                     ; 308     delay(10);
2023  041e ae000a        	ldw	x,#10
2024  0421 cd0000        	call	_delay
2026                     ; 309     if (reg != 120) {
2028  0424 7b06          	ld	a,(OFST+0,sp)
2029  0426 a178          	cp	a,#120
2030  0428 2704          	jreq	L307
2031                     ; 310         return 1;
2033  042a a601          	ld	a,#1
2035  042c 20b8          	jra	L45
2036  042e               L307:
2037                     ; 313     reg = read_register(RF_SETUP_REGISTER);
2039  042e a606          	ld	a,#6
2040  0430 cd0087        	call	_read_register
2042  0433 6b06          	ld	(OFST+0,sp),a
2044                     ; 314     delay(10);
2046  0435 ae000a        	ldw	x,#10
2047  0438 cd0000        	call	_delay
2049                     ; 315     if (reg != DEFAULT_RF_SETUP) {
2051  043b 7b06          	ld	a,(OFST+0,sp)
2052  043d a108          	cp	a,#8
2053  043f 2704          	jreq	L507
2054                     ; 316         return 1;
2056  0441 a601          	ld	a,#1
2058  0443 20a1          	jra	L45
2059  0445               L507:
2060                     ; 320     read_registerN(0x10, regn, 5);
2062  0445 4b05          	push	#5
2063  0447 96            	ldw	x,sp
2064  0448 1c0002        	addw	x,#OFST-4
2065  044b 89            	pushw	x
2066  044c a610          	ld	a,#16
2067  044e cd0107        	call	_read_registerN
2069  0451 5b03          	addw	sp,#3
2070                     ; 321     delay(10);
2072  0453 ae000a        	ldw	x,#10
2073  0456 cd0000        	call	_delay
2075                     ; 322     if (regn[0] != 0x1) return 1;
2077  0459 7b01          	ld	a,(OFST-5,sp)
2078  045b a101          	cp	a,#1
2079  045d 2704          	jreq	L707
2082  045f a601          	ld	a,#1
2084  0461 2083          	jra	L45
2085  0463               L707:
2086                     ; 323     else if (regn[1] != 0x1) return 1;
2088  0463 7b02          	ld	a,(OFST-4,sp)
2089  0465 a101          	cp	a,#1
2090  0467 2706          	jreq	L317
2093  0469 a601          	ld	a,#1
2095  046b ace603e6      	jpf	L45
2096  046f               L317:
2097                     ; 324     else if (regn[2] != 0x1) return 1;
2099  046f 7b03          	ld	a,(OFST-3,sp)
2100  0471 a101          	cp	a,#1
2101  0473 2706          	jreq	L717
2104  0475 a601          	ld	a,#1
2106  0477 ace603e6      	jpf	L45
2107  047b               L717:
2108                     ; 325     else if (regn[3] != 0x1) return 1;
2110  047b 7b04          	ld	a,(OFST-2,sp)
2111  047d a101          	cp	a,#1
2112  047f 2706          	jreq	L327
2115  0481 a601          	ld	a,#1
2117  0483 ace603e6      	jpf	L45
2118  0487               L327:
2119                     ; 326     else if (regn[4] != 0x1) return 1;
2121  0487 7b05          	ld	a,(OFST-1,sp)
2122  0489 a101          	cp	a,#1
2123  048b 2706          	jreq	L117
2126  048d a601          	ld	a,#1
2128  048f ace603e6      	jpf	L45
2129  0493               L117:
2130                     ; 327     return 0;
2132  0493 4f            	clr	a
2134  0494 ace603e6      	jpf	L45
2181                     ; 330 uint8_t test_rx(void) {
2182                     	switch	.text
2183  0498               _test_rx:
2185  0498 5206          	subw	sp,#6
2186       00000006      OFST:	set	6
2189                     ; 333     reg = read_register(CONFIG_REGISTER);
2191  049a 4f            	clr	a
2192  049b cd0087        	call	_read_register
2194  049e 6b06          	ld	(OFST+0,sp),a
2196                     ; 334     delay(10);
2198  04a0 ae000a        	ldw	x,#10
2199  04a3 cd0000        	call	_delay
2201                     ; 335     if (reg != DEFAULT_CONFIG_RX) {
2203  04a6 7b06          	ld	a,(OFST+0,sp)
2204  04a8 a10f          	cp	a,#15
2205  04aa 2704          	jreq	L357
2206                     ; 336         return 1;
2208  04ac a601          	ld	a,#1
2210  04ae 2015          	jra	L06
2211  04b0               L357:
2212                     ; 339     reg = read_register(EN_AA_REGISTER);
2214  04b0 a601          	ld	a,#1
2215  04b2 cd0087        	call	_read_register
2217  04b5 6b06          	ld	(OFST+0,sp),a
2219                     ; 340     delay(10);
2221  04b7 ae000a        	ldw	x,#10
2222  04ba cd0000        	call	_delay
2224                     ; 341     if (reg != DEFAULT_EN_AA) {
2226  04bd 7b06          	ld	a,(OFST+0,sp)
2227  04bf a101          	cp	a,#1
2228  04c1 2705          	jreq	L557
2229                     ; 342         return 1;
2231  04c3 a601          	ld	a,#1
2233  04c5               L06:
2235  04c5 5b06          	addw	sp,#6
2236  04c7 81            	ret
2237  04c8               L557:
2238                     ; 345     reg = read_register(EN_RXADDR_REGISTER);
2240  04c8 a602          	ld	a,#2
2241  04ca cd0087        	call	_read_register
2243  04cd 6b06          	ld	(OFST+0,sp),a
2245                     ; 346     if (reg != DEFAULT_EN_RXADDR) {
2247  04cf 7b06          	ld	a,(OFST+0,sp)
2248  04d1 a101          	cp	a,#1
2249  04d3 2704          	jreq	L757
2250                     ; 347         return 1;
2252  04d5 a601          	ld	a,#1
2254  04d7 20ec          	jra	L06
2255  04d9               L757:
2256                     ; 350     reg = read_register(SETUP_AW_REGISTER);
2258  04d9 a603          	ld	a,#3
2259  04db cd0087        	call	_read_register
2261  04de 6b06          	ld	(OFST+0,sp),a
2263                     ; 351     delay(10);
2265  04e0 ae000a        	ldw	x,#10
2266  04e3 cd0000        	call	_delay
2268                     ; 352     if (reg != DEFAULT_SETUP_AW) {
2270  04e6 7b06          	ld	a,(OFST+0,sp)
2271  04e8 a103          	cp	a,#3
2272  04ea 2704          	jreq	L167
2273                     ; 353         return 1;
2275  04ec a601          	ld	a,#1
2277  04ee 20d5          	jra	L06
2278  04f0               L167:
2279                     ; 356     reg = read_register(RF_CH_REGISTER);
2281  04f0 a605          	ld	a,#5
2282  04f2 cd0087        	call	_read_register
2284  04f5 6b06          	ld	(OFST+0,sp),a
2286                     ; 357     delay(10);
2288  04f7 ae000a        	ldw	x,#10
2289  04fa cd0000        	call	_delay
2291                     ; 358     if (reg != 120) {
2293  04fd 7b06          	ld	a,(OFST+0,sp)
2294  04ff a178          	cp	a,#120
2295  0501 2704          	jreq	L367
2296                     ; 359         return 1;
2298  0503 a601          	ld	a,#1
2300  0505 20be          	jra	L06
2301  0507               L367:
2302                     ; 362     reg = read_register(RF_SETUP_REGISTER);
2304  0507 a606          	ld	a,#6
2305  0509 cd0087        	call	_read_register
2307  050c 6b06          	ld	(OFST+0,sp),a
2309                     ; 363     delay(10);
2311  050e ae000a        	ldw	x,#10
2312  0511 cd0000        	call	_delay
2314                     ; 364     if (reg != DEFAULT_RF_SETUP) {
2316  0514 7b06          	ld	a,(OFST+0,sp)
2317  0516 a108          	cp	a,#8
2318  0518 2704          	jreq	L567
2319                     ; 365         return 1;
2321  051a a601          	ld	a,#1
2323  051c 20a7          	jra	L06
2324  051e               L567:
2325                     ; 368     reg = read_register(STATUS_REGISTER);
2327  051e a607          	ld	a,#7
2328  0520 cd0087        	call	_read_register
2330  0523 6b06          	ld	(OFST+0,sp),a
2332                     ; 369     if (reg != 0x0e) {
2334  0525 7b06          	ld	a,(OFST+0,sp)
2335  0527 a10e          	cp	a,#14
2336  0529 2704          	jreq	L767
2337                     ; 370         return 1;
2339  052b a601          	ld	a,#1
2341  052d 2096          	jra	L06
2342  052f               L767:
2343                     ; 372 		read_registerN(0x0A, regn, 5);
2345  052f 4b05          	push	#5
2346  0531 96            	ldw	x,sp
2347  0532 1c0002        	addw	x,#OFST-4
2348  0535 89            	pushw	x
2349  0536 a60a          	ld	a,#10
2350  0538 cd0107        	call	_read_registerN
2352  053b 5b03          	addw	sp,#3
2353                     ; 373     delay(10);
2355  053d ae000a        	ldw	x,#10
2356  0540 cd0000        	call	_delay
2358                     ; 374     if (regn[0] != 0x1) return 1;
2360  0543 7b01          	ld	a,(OFST-5,sp)
2361  0545 a101          	cp	a,#1
2362  0547 2706          	jreq	L177
2365  0549 a601          	ld	a,#1
2367  054b acc504c5      	jpf	L06
2368  054f               L177:
2369                     ; 375     else if (regn[1] != 0x1) return 1;
2371  054f 7b02          	ld	a,(OFST-4,sp)
2372  0551 a101          	cp	a,#1
2373  0553 2706          	jreq	L577
2376  0555 a601          	ld	a,#1
2378  0557 acc504c5      	jpf	L06
2379  055b               L577:
2380                     ; 376     else if (regn[2] != 0x1) return 1;
2382  055b 7b03          	ld	a,(OFST-3,sp)
2383  055d a101          	cp	a,#1
2384  055f 2706          	jreq	L1001
2387  0561 a601          	ld	a,#1
2389  0563 acc504c5      	jpf	L06
2390  0567               L1001:
2391                     ; 377     else if (regn[3] != 0x1) return 1;
2393  0567 7b04          	ld	a,(OFST-2,sp)
2394  0569 a101          	cp	a,#1
2395  056b 2706          	jreq	L5001
2398  056d a601          	ld	a,#1
2400  056f acc504c5      	jpf	L06
2401  0573               L5001:
2402                     ; 378     else if (regn[4] != 0x1) return 1;
2404  0573 7b05          	ld	a,(OFST-1,sp)
2405  0575 a101          	cp	a,#1
2406  0577 2706          	jreq	L377
2409  0579 a601          	ld	a,#1
2411  057b acc504c5      	jpf	L06
2412  057f               L377:
2413                     ; 379 	return 0;
2415  057f 4f            	clr	a
2417  0580 acc504c5      	jpf	L06
2430                     	xdef	_test_rx
2431                     	xdef	_test_tx
2432                     	xdef	_SPI_DeInit_NRF
2433                     	xdef	_SPI_Init_NRF
2434                     	xdef	_rx_read
2435                     	xdef	_tx_send
2436                     	xdef	_nrf_deinit
2437                     	xdef	_rx_init
2438                     	xdef	_tx_init
2439                     	xdef	_write_registerN
2440                     	xdef	_read_registerN
2441                     	xdef	_write_register
2442                     	xdef	_read_register
2443                     	xdef	_reset_status
2444                     	xdef	_flush_tx
2445                     	xdef	_flush_rx
2446                     	xdef	_ce_low
2447                     	xdef	_ce_high
2448                     	xdef	_cs_low
2449                     	xdef	_cs_high
2450                     	xdef	_delay
2451                     	xref	_SPI_GetFlagStatus
2452                     	xref	_SPI_ReceiveData
2453                     	xref	_SPI_SendData
2454                     	xref	_SPI_Cmd
2455                     	xref	_SPI_Init
2456                     	xref	_SPI_DeInit
2457                     	xref	_GPIO_WriteLow
2458                     	xref	_GPIO_WriteHigh
2459                     	xref	_GPIO_Init
2460                     	xref	_GPIO_DeInit
2479                     	end
