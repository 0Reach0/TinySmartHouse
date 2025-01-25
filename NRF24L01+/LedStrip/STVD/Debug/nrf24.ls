   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.3 - 22 Aug 2024
   4                     ; Optimizer V4.6.3 - 22 Aug 2024
  69                     ; 5 void delay(uint16_t n) {
  71                     	switch	.text
  72  0000               _delay:
  74  0000 89            	pushw	x
  75  0001 89            	pushw	x
  76       00000002      OFST:	set	2
  79                     ; 6     uint16_t i = 0;
  81                     ; 7     for (i = 0; i < n; i++) {
  83  0002 5f            	clrw	x
  85  0003 2002          	jra	L73
  86  0005               L33:
  87                     ; 8         __asm("nop");
  90  0005 9d            	nop	
  92                     ; 7     for (i = 0; i < n; i++) {
  94  0006 5c            	incw	x
  95  0007               L73:
  96  0007 1f01          	ldw	(OFST-1,sp),x
 100  0009 1303          	cpw	x,(OFST+1,sp)
 101  000b 25f8          	jrult	L33
 102                     ; 10 }
 105  000d 5b04          	addw	sp,#4
 106  000f 81            	ret	
 130                     ; 14 void cs_high(void) {
 131                     	switch	.text
 132  0010               _cs_high:
 136                     ; 15     GPIO_WriteHigh(CSN_PIN);
 138  0010 4b10          	push	#16
 139  0012 ae500a        	ldw	x,#20490
 140  0015 cd0000        	call	_GPIO_WriteHigh
 142  0018 84            	pop	a
 143                     ; 16 }
 146  0019 81            	ret	
 170                     ; 18 void cs_low(void) {
 171                     	switch	.text
 172  001a               _cs_low:
 176                     ; 19     GPIO_WriteLow(CSN_PIN);
 178  001a 4b10          	push	#16
 179  001c ae500a        	ldw	x,#20490
 180  001f cd0000        	call	_GPIO_WriteLow
 182  0022 84            	pop	a
 183                     ; 20 }
 186  0023 81            	ret	
 210                     ; 22 void ce_high(void) {
 211                     	switch	.text
 212  0024               _ce_high:
 216                     ; 23     GPIO_WriteHigh(CE_PIN);
 218  0024 4b08          	push	#8
 219  0026 ae500a        	ldw	x,#20490
 220  0029 cd0000        	call	_GPIO_WriteHigh
 222  002c 84            	pop	a
 223                     ; 24 }
 226  002d 81            	ret	
 250                     ; 26 void ce_low(void) {
 251                     	switch	.text
 252  002e               _ce_low:
 256                     ; 27     GPIO_WriteLow(CE_PIN);
 258  002e 4b08          	push	#8
 259  0030 ae500a        	ldw	x,#20490
 260  0033 cd0000        	call	_GPIO_WriteLow
 262  0036 84            	pop	a
 263                     ; 28 }
 266  0037 81            	ret	
 290                     ; 30 void reset_status(void) {
 291                     	switch	.text
 292  0038               _reset_status:
 296                     ; 31     write_register(STATUS_REGISTER, 0x70);
 298  0038 ae0770        	ldw	x,#1904
 300                     ; 32 }
 303  003b cc00c5        	jp	_write_register
 330                     ; 34 void flush_tx(void) {
 331                     	switch	.text
 332  003e               _flush_tx:
 336                     ; 35     cs_low();
 338  003e adda          	call	_cs_low
 340                     ; 36     SPI_SendData(FLUSH_TX);
 342  0040 a6e1          	ld	a,#225
 343  0042 cd0000        	call	_SPI_SendData
 345                     ; 37     delay(10);
 347  0045 ae000a        	ldw	x,#10
 348  0048 adb6          	call	_delay
 350                     ; 38     cs_high();
 353                     ; 39 }
 356  004a 20c4          	jp	_cs_high
 383                     ; 41 void flush_rx(void) {
 384                     	switch	.text
 385  004c               _flush_rx:
 389                     ; 42     cs_low();
 391  004c adcc          	call	_cs_low
 393                     ; 43     SPI_SendData(FLUSH_RX);
 395  004e a6e2          	ld	a,#226
 396  0050 cd0000        	call	_SPI_SendData
 398                     ; 44     delay(10);
 400  0053 ae000a        	ldw	x,#10
 401  0056 ada8          	call	_delay
 403                     ; 45     cs_high();
 406                     ; 46 }
 409  0058 20b6          	jp	_cs_high
 434                     ; 51 void SPI_Init_NRF(void) {
 435                     	switch	.text
 436  005a               _SPI_Init_NRF:
 440                     ; 52     SPI_Init(SPI_FIRSTBIT_MSB, SPI_BAUDRATEPRESCALER_8, SPI_MODE_MASTER,
 440                     ; 53              SPI_CLOCKPOLARITY_LOW, SPI_CLOCKPHASE_1EDGE, SPI_DATADIRECTION_2LINES_FULLDUPLEX,
 440                     ; 54              SPI_NSS_SOFT, 0x07);
 442  005a 4b07          	push	#7
 443  005c 4b02          	push	#2
 444  005e 4b00          	push	#0
 445  0060 4b00          	push	#0
 446  0062 4b00          	push	#0
 447  0064 4b04          	push	#4
 448  0066 ae0010        	ldw	x,#16
 449  0069 cd0000        	call	_SPI_Init
 451  006c 5b06          	addw	sp,#6
 452                     ; 55     SPI_Cmd(ENABLE);
 454  006e a601          	ld	a,#1
 456                     ; 56 }
 459  0070 cc0000        	jp	_SPI_Cmd
 484                     ; 58 void SPI_DeInit_NRF(void){
 485                     	switch	.text
 486  0073               _SPI_DeInit_NRF:
 490                     ; 59 		SPI_DeInit();
 492  0073 cd0000        	call	_SPI_DeInit
 494                     ; 60 		SPI_Cmd(DISABLE);
 496  0076 4f            	clr	a
 498                     ; 61 }
 501  0077 cc0000        	jp	_SPI_Cmd
 559                     ; 66 uint8_t read_register(uint8_t reg) {
 560                     	switch	.text
 561  007a               _read_register:
 563  007a 88            	push	a
 564       00000001      OFST:	set	1
 567                     ; 67     uint8_t command = R_REGISTER | reg;
 569  007b 6b01          	ld	(OFST+0,sp),a
 571                     ; 68     uint8_t data = 0;
 573                     ; 70     cs_low();
 575  007d ad9b          	call	_cs_low
 577                     ; 71     SPI_SendData(command);
 579  007f 7b01          	ld	a,(OFST+0,sp)
 580  0081 ad39          	call	LC001
 582                     ; 72 		delay(10);
 583  0083               L302:
 584                     ; 73     while (SPI_GetFlagStatus(SPI_FLAG_TXE) == RESET); // ???????? ???????? ???????
 586  0083 a602          	ld	a,#2
 587  0085 cd0000        	call	_SPI_GetFlagStatus
 589  0088 4d            	tnz	a
 590  0089 27f8          	jreq	L302
 592  008b               L112:
 593                     ; 74     while (SPI_GetFlagStatus(SPI_FLAG_RXNE) == RESET); // ???????? ????????? ??????
 595  008b a601          	ld	a,#1
 596  008d cd0000        	call	_SPI_GetFlagStatus
 598  0090 4d            	tnz	a
 599  0091 27f8          	jreq	L112
 600                     ; 75     data = SPI_ReceiveData();
 602  0093 cd0000        	call	_SPI_ReceiveData
 604                     ; 76 		delay(10);
 606  0096 ae000a        	ldw	x,#10
 607  0099 cd0000        	call	_delay
 609                     ; 77 		SPI_SendData(0x0);
 611  009c 4f            	clr	a
 612  009d ad1d          	call	LC001
 614                     ; 78 		delay(10);
 615  009f               L712:
 616                     ; 79 		while (SPI_GetFlagStatus(SPI_FLAG_TXE) == RESET); 
 618  009f a602          	ld	a,#2
 619  00a1 cd0000        	call	_SPI_GetFlagStatus
 621  00a4 4d            	tnz	a
 622  00a5 27f8          	jreq	L712
 624  00a7               L522:
 625                     ; 80 		while (SPI_GetFlagStatus(SPI_FLAG_RXNE) == RESET); // ???????? ????????? ??????
 627  00a7 a601          	ld	a,#1
 628  00a9 cd0000        	call	_SPI_GetFlagStatus
 630  00ac 4d            	tnz	a
 631  00ad 27f8          	jreq	L522
 632                     ; 81 		data = SPI_ReceiveData();
 634  00af cd0000        	call	_SPI_ReceiveData
 636  00b2 6b01          	ld	(OFST+0,sp),a
 638                     ; 83 cs_high();
 640  00b4 cd0010        	call	_cs_high
 642                     ; 85     return data;
 644  00b7 7b01          	ld	a,(OFST+0,sp)
 647  00b9 5b01          	addw	sp,#1
 648  00bb 81            	ret	
 649  00bc               LC001:
 650  00bc cd0000        	call	_SPI_SendData
 652                     ; 78 		delay(10);
 654  00bf ae000a        	ldw	x,#10
 655  00c2 cc0000        	jp	_delay
 712                     ; 88 void write_register(uint8_t reg, uint8_t value) {
 713                     	switch	.text
 714  00c5               _write_register:
 716  00c5 89            	pushw	x
 717  00c6 88            	push	a
 718       00000001      OFST:	set	1
 721                     ; 89     uint8_t command = W_REGISTER | reg;
 723  00c7 9e            	ld	a,xh
 724  00c8 aa20          	or	a,#32
 725  00ca 6b01          	ld	(OFST+0,sp),a
 727                     ; 91     cs_low();
 729  00cc cd001a        	call	_cs_low
 731                     ; 92     SPI_SendData(command);
 733  00cf 7b01          	ld	a,(OFST+0,sp)
 734  00d1 cd0000        	call	_SPI_SendData
 737  00d4               L162:
 738                     ; 93     while (SPI_GetFlagStatus(SPI_FLAG_TXE) == RESET);
 740  00d4 a602          	ld	a,#2
 741  00d6 cd0000        	call	_SPI_GetFlagStatus
 743  00d9 4d            	tnz	a
 744  00da 27f8          	jreq	L162
 745                     ; 94     SPI_SendData(value);
 747  00dc 7b03          	ld	a,(OFST+2,sp)
 748  00de cd0000        	call	_SPI_SendData
 751  00e1               L762:
 752                     ; 95     while (SPI_GetFlagStatus(SPI_FLAG_TXE) == RESET);
 754  00e1 a602          	ld	a,#2
 755  00e3 cd0000        	call	_SPI_GetFlagStatus
 757  00e6 4d            	tnz	a
 758  00e7 27f8          	jreq	L762
 759                     ; 96 		delay(10);
 761  00e9 ae000a        	ldw	x,#10
 762  00ec cd0000        	call	_delay
 764                     ; 97     cs_high();
 766  00ef cd0010        	call	_cs_high
 768                     ; 98 }
 771  00f2 5b03          	addw	sp,#3
 772  00f4 81            	ret	
 849                     ; 104 void read_registerN(uint8_t reg, uint8_t *buf, uint8_t len) {
 850                     	switch	.text
 851  00f5               _read_registerN:
 853  00f5 88            	push	a
 854  00f6 88            	push	a
 855       00000001      OFST:	set	1
 858                     ; 105     uint8_t command = R_REGISTER | reg;
 860  00f7 6b01          	ld	(OFST+0,sp),a
 862                     ; 108     cs_low();
 864  00f9 cd001a        	call	_cs_low
 866                     ; 110     SPI_SendData(command);
 868  00fc 7b01          	ld	a,(OFST+0,sp)
 869  00fe cd0000        	call	_SPI_SendData
 872  0101               L333:
 873                     ; 111     while (SPI_GetFlagStatus(SPI_FLAG_TXE) == RESET);
 875  0101 a602          	ld	a,#2
 876  0103 cd0000        	call	_SPI_GetFlagStatus
 878  0106 4d            	tnz	a
 879  0107 27f8          	jreq	L333
 880                     ; 112 		delay(10);
 882  0109 ae000a        	ldw	x,#10
 883  010c cd0000        	call	_delay
 886  010f               L143:
 887                     ; 113     while (SPI_GetFlagStatus(SPI_FLAG_RXNE) == RESET);
 889  010f a601          	ld	a,#1
 890  0111 cd0000        	call	_SPI_GetFlagStatus
 892  0114 4d            	tnz	a
 893  0115 27f8          	jreq	L143
 894                     ; 114     SPI_ReceiveData();
 896  0117 cd0000        	call	_SPI_ReceiveData
 898                     ; 115     for (i = 0; i < len; i++) {
 900  011a 0f01          	clr	(OFST+0,sp)
 903  011c 2027          	jra	L153
 904  011e               L543:
 905                     ; 116         delay(10);
 907  011e cd0000        	call	_delay
 909                     ; 117         SPI_SendData(0xFF);
 911  0121 a6ff          	ld	a,#255
 912  0123 cd0000        	call	_SPI_SendData
 915  0126               L753:
 916                     ; 118         while (SPI_GetFlagStatus(SPI_FLAG_TXE) == RESET);
 918  0126 a602          	ld	a,#2
 919  0128 cd0000        	call	_SPI_GetFlagStatus
 921  012b 4d            	tnz	a
 922  012c 27f8          	jreq	L753
 924  012e               L563:
 925                     ; 119         while (SPI_GetFlagStatus(SPI_FLAG_RXNE) == RESET);
 927  012e a601          	ld	a,#1
 928  0130 cd0000        	call	_SPI_GetFlagStatus
 930  0133 4d            	tnz	a
 931  0134 27f8          	jreq	L563
 932                     ; 120         buf[i] = SPI_ReceiveData();
 934  0136 7b01          	ld	a,(OFST+0,sp)
 935  0138 5f            	clrw	x
 936  0139 97            	ld	xl,a
 937  013a 72fb05        	addw	x,(OFST+4,sp)
 938  013d 89            	pushw	x
 939  013e cd0000        	call	_SPI_ReceiveData
 941  0141 85            	popw	x
 942  0142 f7            	ld	(x),a
 943                     ; 115     for (i = 0; i < len; i++) {
 945  0143 0c01          	inc	(OFST+0,sp)
 947  0145               L153:
 950  0145 7b01          	ld	a,(OFST+0,sp)
 951  0147 1107          	cp	a,(OFST+6,sp)
 952  0149 ae000a        	ldw	x,#10
 953  014c 25d0          	jrult	L543
 954                     ; 122 		delay(10);
 956  014e cd0000        	call	_delay
 958                     ; 123     cs_high();
 960  0151 cd0010        	call	_cs_high
 962                     ; 124 			delay(10);
 964  0154 ae000a        	ldw	x,#10
 965  0157 cd0000        	call	_delay
 967                     ; 125 }
 970  015a 85            	popw	x
 971  015b 81            	ret	
1047                     ; 127 void write_registerN(uint8_t reg, const uint8_t *buf, uint8_t len) {
1048                     	switch	.text
1049  015c               _write_registerN:
1051  015c 88            	push	a
1052  015d 88            	push	a
1053       00000001      OFST:	set	1
1056                     ; 128     uint8_t command = W_REGISTER | reg;
1058  015e aa20          	or	a,#32
1059  0160 6b01          	ld	(OFST+0,sp),a
1061                     ; 131     cs_low();
1063  0162 cd001a        	call	_cs_low
1065                     ; 132     SPI_SendData(command);
1067  0165 7b01          	ld	a,(OFST+0,sp)
1068  0167 cd0000        	call	_SPI_SendData
1071  016a               L134:
1072                     ; 133     while (SPI_GetFlagStatus(SPI_FLAG_TXE) == RESET);
1074  016a a602          	ld	a,#2
1075  016c cd0000        	call	_SPI_GetFlagStatus
1077  016f 4d            	tnz	a
1078  0170 27f8          	jreq	L134
1079                     ; 135     for (i = 0; i < len; i++) {
1081  0172 0f01          	clr	(OFST+0,sp)
1084  0174 2018          	jra	L144
1085  0176               L534:
1086                     ; 136         delay(10);
1088  0176 cd0000        	call	_delay
1090                     ; 137         SPI_SendData(buf[i]);
1092  0179 7b01          	ld	a,(OFST+0,sp)
1093  017b 5f            	clrw	x
1094  017c 97            	ld	xl,a
1095  017d 72fb05        	addw	x,(OFST+4,sp)
1096  0180 f6            	ld	a,(x)
1097  0181 cd0000        	call	_SPI_SendData
1100  0184               L744:
1101                     ; 138         while (SPI_GetFlagStatus(SPI_FLAG_TXE) == RESET);
1103  0184 a602          	ld	a,#2
1104  0186 cd0000        	call	_SPI_GetFlagStatus
1106  0189 4d            	tnz	a
1107  018a 27f8          	jreq	L744
1108                     ; 135     for (i = 0; i < len; i++) {
1110  018c 0c01          	inc	(OFST+0,sp)
1112  018e               L144:
1115  018e 7b01          	ld	a,(OFST+0,sp)
1116  0190 1107          	cp	a,(OFST+6,sp)
1117  0192 ae000a        	ldw	x,#10
1118  0195 25df          	jrult	L534
1119                     ; 140 		delay(10);
1121  0197 cd0000        	call	_delay
1123                     ; 141     cs_high();
1125  019a cd0010        	call	_cs_high
1127                     ; 142 			delay(10);
1129  019d ae000a        	ldw	x,#10
1130  01a0 cd0000        	call	_delay
1132                     ; 143 }
1135  01a3 85            	popw	x
1136  01a4 81            	ret	
1208                     ; 151 void tx_send(const uint8_t *data, uint8_t len) {
1209                     	switch	.text
1210  01a5               _tx_send:
1212  01a5 89            	pushw	x
1213  01a6 88            	push	a
1214       00000001      OFST:	set	1
1217                     ; 155     flush_tx();
1219  01a7 cd003e        	call	_flush_tx
1221                     ; 157     cs_low();
1223  01aa cd001a        	call	_cs_low
1225                     ; 158     SPI_SendData(W_TX_PAYLOAD);
1227  01ad a6a0          	ld	a,#160
1228  01af cd0000        	call	_SPI_SendData
1230                     ; 159 				delay(10);
1232  01b2 ae000a        	ldw	x,#10
1233  01b5 cd0000        	call	_delay
1236  01b8               L705:
1237                     ; 160     while (SPI_GetFlagStatus(SPI_FLAG_TXE) == RESET);
1239  01b8 a602          	ld	a,#2
1240  01ba cd0000        	call	_SPI_GetFlagStatus
1242  01bd 4d            	tnz	a
1243  01be 27f8          	jreq	L705
1244                     ; 161     for (i = 0; i < len; i++) {
1246  01c0 0f01          	clr	(OFST+0,sp)
1249  01c2 2018          	jra	L715
1250  01c4               L315:
1251                     ; 162         delay(10);
1253  01c4 cd0000        	call	_delay
1255                     ; 163         SPI_SendData(data[i]);
1257  01c7 7b01          	ld	a,(OFST+0,sp)
1258  01c9 5f            	clrw	x
1259  01ca 97            	ld	xl,a
1260  01cb 72fb02        	addw	x,(OFST+1,sp)
1261  01ce f6            	ld	a,(x)
1262  01cf cd0000        	call	_SPI_SendData
1265  01d2               L525:
1266                     ; 164         while (SPI_GetFlagStatus(SPI_FLAG_TXE) == RESET);
1268  01d2 a602          	ld	a,#2
1269  01d4 cd0000        	call	_SPI_GetFlagStatus
1271  01d7 4d            	tnz	a
1272  01d8 27f8          	jreq	L525
1273                     ; 161     for (i = 0; i < len; i++) {
1275  01da 0c01          	inc	(OFST+0,sp)
1277  01dc               L715:
1280  01dc 7b01          	ld	a,(OFST+0,sp)
1281  01de 1106          	cp	a,(OFST+5,sp)
1282  01e0 ae000a        	ldw	x,#10
1283  01e3 25df          	jrult	L315
1284                     ; 166     delay(10);
1286  01e5 cd0000        	call	_delay
1288                     ; 167     cs_high();
1290  01e8 cd0010        	call	_cs_high
1292                     ; 170     ce_high();
1294  01eb cd0024        	call	_ce_high
1296                     ; 171     delay(10);
1298  01ee ae000a        	ldw	x,#10
1299  01f1 cd0000        	call	_delay
1301                     ; 172     ce_low();
1303  01f4 cd002e        	call	_ce_low
1305  01f7               L135:
1306                     ; 175         status = read_register(STATUS_REGISTER);
1308  01f7 a607          	ld	a,#7
1309  01f9 cd007a        	call	_read_register
1311  01fc 6b01          	ld	(OFST+0,sp),a
1313                     ; 176     } while (!(status & (1 << 5)) && !(status & (1 << 4)));
1315  01fe a520          	bcp	a,#32
1316  0200 2604          	jrne	L735
1318  0202 a510          	bcp	a,#16
1319  0204 27f1          	jreq	L135
1320  0206               L735:
1321                     ; 178     write_register(STATUS_REGISTER, 0x70);
1323  0206 ae0770        	ldw	x,#1904
1324  0209 cd00c5        	call	_write_register
1326                     ; 179 }
1329  020c 5b03          	addw	sp,#3
1330  020e 81            	ret	
1390                     ; 181 void rx_read(uint8_t *buf, uint8_t len) {
1391                     	switch	.text
1392  020f               _rx_read:
1394  020f 89            	pushw	x
1395  0210 88            	push	a
1396       00000001      OFST:	set	1
1399                     ; 185     cs_low();
1401  0211 cd001a        	call	_cs_low
1403                     ; 186     SPI_SendData(R_RX_PAYLOAD);
1405  0214 a661          	ld	a,#97
1406  0216 cd0000        	call	_SPI_SendData
1408                     ; 187     delay(10);
1410  0219 ae000a        	ldw	x,#10
1411  021c cd0000        	call	_delay
1414  021f               L175:
1415                     ; 188     while (SPI_GetFlagStatus(SPI_FLAG_RXNE) == RESET);
1417  021f a601          	ld	a,#1
1418  0221 cd0000        	call	_SPI_GetFlagStatus
1420  0224 4d            	tnz	a
1421  0225 27f8          	jreq	L175
1422                     ; 189     SPI_ReceiveData();
1424  0227 cd0000        	call	_SPI_ReceiveData
1427  022a               L775:
1428                     ; 190     while (SPI_GetFlagStatus(SPI_FLAG_TXE) == RESET);
1430  022a a602          	ld	a,#2
1431  022c cd0000        	call	_SPI_GetFlagStatus
1433  022f 4d            	tnz	a
1434  0230 27f8          	jreq	L775
1435                     ; 191     for (i = 0; i < len; i++) {
1437  0232 0f01          	clr	(OFST+0,sp)
1440  0234 2021          	jra	L706
1441  0236               L306:
1442                     ; 192         delay(10);
1444  0236 ae000a        	ldw	x,#10
1445  0239 cd0000        	call	_delay
1447                     ; 193         SPI_SendData(0x00);
1449  023c 4f            	clr	a
1450  023d cd0000        	call	_SPI_SendData
1453  0240               L516:
1454                     ; 194         while (SPI_GetFlagStatus(SPI_FLAG_RXNE) == RESET);
1456  0240 a601          	ld	a,#1
1457  0242 cd0000        	call	_SPI_GetFlagStatus
1459  0245 4d            	tnz	a
1460  0246 27f8          	jreq	L516
1461                     ; 195         buf[i] = SPI_ReceiveData();
1463  0248 7b01          	ld	a,(OFST+0,sp)
1464  024a 5f            	clrw	x
1465  024b 97            	ld	xl,a
1466  024c 72fb02        	addw	x,(OFST+1,sp)
1467  024f 89            	pushw	x
1468  0250 cd0000        	call	_SPI_ReceiveData
1470  0253 85            	popw	x
1471  0254 f7            	ld	(x),a
1472                     ; 191     for (i = 0; i < len; i++) {
1474  0255 0c01          	inc	(OFST+0,sp)
1476  0257               L706:
1479  0257 7b01          	ld	a,(OFST+0,sp)
1480  0259 1106          	cp	a,(OFST+5,sp)
1481  025b 25d9          	jrult	L306
1482                     ; 197     cs_high();
1484  025d cd0010        	call	_cs_high
1486                     ; 199     write_register(STATUS_REGISTER, 0x70);
1488  0260 ae0770        	ldw	x,#1904
1489  0263 cd00c5        	call	_write_register
1491                     ; 200 }
1494  0266 5b03          	addw	sp,#3
1495  0268 81            	ret	
1522                     ; 206 void rx_init(void) {
1523                     	switch	.text
1524  0269               _rx_init:
1528                     ; 208     GPIO_Init(CSN_PIN, GPIO_MODE_OUT_PP_HIGH_FAST);
1530  0269 4bf0          	push	#240
1531  026b 4b10          	push	#16
1532  026d ae500a        	ldw	x,#20490
1533  0270 cd0000        	call	_GPIO_Init
1535  0273 85            	popw	x
1536                     ; 209     GPIO_Init(CE_PIN, GPIO_MODE_OUT_PP_HIGH_FAST);
1538  0274 4bf0          	push	#240
1539  0276 4b08          	push	#8
1540  0278 ae500a        	ldw	x,#20490
1541  027b cd0000        	call	_GPIO_Init
1543  027e 85            	popw	x
1544                     ; 212     write_register(CONFIG_REGISTER, DEFAULT_CONFIG_RX);
1546  027f ae000f        	ldw	x,#15
1547  0282 ad27          	call	LC002
1549                     ; 214     write_register(EN_AA_REGISTER, DEFAULT_EN_AA);
1551  0284 ae0101        	ldw	x,#257
1552  0287 ad22          	call	LC002
1554                     ; 216     write_register(EN_RXADDR_REGISTER, DEFAULT_EN_RXADDR);
1556  0289 ae0201        	ldw	x,#513
1557  028c ad1d          	call	LC002
1559                     ; 218     write_register(SETUP_AW_REGISTER, DEFAULT_SETUP_AW);
1561  028e ae0303        	ldw	x,#771
1562  0291 ad18          	call	LC002
1564                     ; 220     write_register(RF_CH_REGISTER, 120); 
1566  0293 ae0578        	ldw	x,#1400
1567  0296 ad13          	call	LC002
1569                     ; 222     write_register(RF_SETUP_REGISTER, DEFAULT_RF_SETUP);
1571  0298 ae0608        	ldw	x,#1544
1572  029b ad0e          	call	LC002
1574                     ; 224     write_register(STATUS_REGISTER, DEFAULT_STATUS);
1576  029d ae0770        	ldw	x,#1904
1577  02a0 ad09          	call	LC002
1579                     ; 226 		flush_tx();
1581  02a2 cd003e        	call	_flush_tx
1583                     ; 227 		delay(10);
1585  02a5 ae000a        	ldw	x,#10
1587                     ; 232 }
1590  02a8 cc0000        	jp	_delay
1591  02ab               LC002:
1592  02ab cd00c5        	call	_write_register
1594                     ; 225 		delay(10);
1596  02ae ae000a        	ldw	x,#10
1597  02b1 cc0000        	jp	_delay
1624                     ; 235 void tx_init(void) {
1625                     	switch	.text
1626  02b4               _tx_init:
1630                     ; 237     GPIO_Init(CSN_PIN, GPIO_MODE_OUT_PP_HIGH_FAST);
1632  02b4 4bf0          	push	#240
1633  02b6 4b10          	push	#16
1634  02b8 ae500a        	ldw	x,#20490
1635  02bb cd0000        	call	_GPIO_Init
1637  02be 85            	popw	x
1638                     ; 238     GPIO_Init(CE_PIN, GPIO_MODE_OUT_PP_HIGH_FAST);
1640  02bf 4bf0          	push	#240
1641  02c1 4b08          	push	#8
1642  02c3 ae500a        	ldw	x,#20490
1643  02c6 cd0000        	call	_GPIO_Init
1645  02c9 85            	popw	x
1646                     ; 240     write_register(CONFIG_REGISTER, DEFAULT_CONFIG_TX); 
1648  02ca ae000e        	ldw	x,#14
1649  02cd ad22          	call	LC003
1651                     ; 242     write_register(SETUP_AW_REGISTER, DEFAULT_SETUP_AW); 
1653  02cf ae0303        	ldw	x,#771
1654  02d2 ad1d          	call	LC003
1656                     ; 244     write_register(SETUP_RETR_REGISTER, DEFAULT_SETUP_RETR); 
1658  02d4 ae0401        	ldw	x,#1025
1659  02d7 ad18          	call	LC003
1661                     ; 246     write_register(RF_CH_REGISTER, 120); 
1663  02d9 ae0578        	ldw	x,#1400
1664  02dc ad13          	call	LC003
1666                     ; 248     write_register(RF_SETUP_REGISTER, DEFAULT_RF_SETUP); 
1668  02de ae0608        	ldw	x,#1544
1669  02e1 ad0e          	call	LC003
1671                     ; 250     write_register(STATUS_REGISTER, DEFAULT_STATUS);
1673  02e3 ae0770        	ldw	x,#1904
1674  02e6 ad09          	call	LC003
1676                     ; 252 		flush_tx();
1678  02e8 cd003e        	call	_flush_tx
1680                     ; 253 		delay(10);
1682  02eb ae000a        	ldw	x,#10
1684                     ; 256 }
1687  02ee cc0000        	jp	_delay
1688  02f1               LC003:
1689  02f1 cd00c5        	call	_write_register
1691                     ; 251 		delay(10);
1693  02f4 ae000a        	ldw	x,#10
1694  02f7 cc0000        	jp	_delay
1720                     ; 259 void nrf_deinit(void)
1720                     ; 260 {
1721                     	switch	.text
1722  02fa               _nrf_deinit:
1726                     ; 261 		GPIO_DeInit(GPIOC);
1728  02fa ae500a        	ldw	x,#20490
1729  02fd cd0000        	call	_GPIO_DeInit
1731                     ; 263     write_register(CONFIG_REGISTER, RESET_CONFIG); 
1733  0300 ae0008        	ldw	x,#8
1734  0303 ad20          	call	LC004
1736                     ; 265     write_register(SETUP_AW_REGISTER, RESET_SETUP_AW); 
1738  0305 ae0303        	ldw	x,#771
1739  0308 ad1b          	call	LC004
1741                     ; 267     write_register(SETUP_RETR_REGISTER, RESET_SETUP_RETR); 
1743  030a ae0403        	ldw	x,#1027
1744  030d ad16          	call	LC004
1746                     ; 269     write_register(RF_CH_REGISTER, RESET_RF_CH); 
1748  030f ae0502        	ldw	x,#1282
1749  0312 ad11          	call	LC004
1751                     ; 271     write_register(RF_SETUP_REGISTER, RESET_RF_SETUP); 
1753  0314 ae060f        	ldw	x,#1551
1754  0317 ad0c          	call	LC004
1756                     ; 273     write_register(STATUS_REGISTER, RESET_STATUS);
1758  0319 ae0770        	ldw	x,#1904
1759  031c cd00c5        	call	_write_register
1761                     ; 274 		delay(10);
1763  031f ae000a        	ldw	x,#10
1765                     ; 276 }
1768  0322 cc0000        	jp	_delay
1769  0325               LC004:
1770  0325 cd00c5        	call	_write_register
1772                     ; 272     delay(10);
1774  0328 ae000a        	ldw	x,#10
1775  032b cc0000        	jp	_delay
1822                     ; 279 uint8_t test_tx(void) {
1823                     	switch	.text
1824  032e               _test_tx:
1826  032e 5206          	subw	sp,#6
1827       00000006      OFST:	set	6
1830                     ; 282     reg = read_register(STATUS_REGISTER);
1832  0330 a607          	ld	a,#7
1833  0332 cd007a        	call	_read_register
1835  0335 6b06          	ld	(OFST+0,sp),a
1837                     ; 283 		delay(10);
1839  0337 ae000a        	ldw	x,#10
1840  033a cd0000        	call	_delay
1842                     ; 284     delay(10);
1844  033d ae000a        	ldw	x,#10
1845  0340 cd0000        	call	_delay
1847                     ; 285     if (reg != 0x0e) {
1849  0343 7b06          	ld	a,(OFST+0,sp)
1850  0345 a10e          	cp	a,#14
1851                     ; 286         return 1;
1853  0347 2612          	jrne	LC005
1854                     ; 289 		reg = read_register(CONFIG_REGISTER);
1856  0349 4f            	clr	a
1857  034a cd007a        	call	_read_register
1859  034d 6b06          	ld	(OFST+0,sp),a
1861                     ; 290     delay(10);
1863  034f ae000a        	ldw	x,#10
1864  0352 cd0000        	call	_delay
1866                     ; 291     if (reg != DEFAULT_CONFIG_TX) {
1868  0355 7b06          	ld	a,(OFST+0,sp)
1869  0357 a10e          	cp	a,#14
1870  0359 2705          	jreq	L576
1871                     ; 292         return 1;
1873  035b               LC005:
1884  035b a601          	ld	a,#1
1886  035d               L625:
1888  035d 5b06          	addw	sp,#6
1889  035f 81            	ret	
1890  0360               L576:
1891                     ; 295     reg = read_register(SETUP_AW_REGISTER);
1893  0360 a603          	ld	a,#3
1894  0362 cd007a        	call	_read_register
1896  0365 6b06          	ld	(OFST+0,sp),a
1898                     ; 296     delay(10);
1900  0367 ae000a        	ldw	x,#10
1901  036a cd0000        	call	_delay
1903                     ; 297     if (reg != DEFAULT_SETUP_AW) {
1905  036d 7b06          	ld	a,(OFST+0,sp)
1906  036f a103          	cp	a,#3
1907                     ; 298         return 1;
1909  0371 26e8          	jrne	LC005
1910                     ; 301     reg = read_register(SETUP_RETR_REGISTER);
1912  0373 a604          	ld	a,#4
1913  0375 cd007a        	call	_read_register
1915  0378 6b06          	ld	(OFST+0,sp),a
1917                     ; 302     delay(10);
1919  037a ae000a        	ldw	x,#10
1920  037d cd0000        	call	_delay
1922                     ; 303     if (reg != DEFAULT_SETUP_RETR) {
1924  0380 7b06          	ld	a,(OFST+0,sp)
1925  0382 4a            	dec	a
1926                     ; 304         return 1;
1928  0383 26d6          	jrne	LC005
1929                     ; 307     reg = read_register(RF_CH_REGISTER);
1931  0385 a605          	ld	a,#5
1932  0387 cd007a        	call	_read_register
1934  038a 6b06          	ld	(OFST+0,sp),a
1936                     ; 308     delay(10);
1938  038c ae000a        	ldw	x,#10
1939  038f cd0000        	call	_delay
1941                     ; 309     if (reg != 120) {
1943  0392 7b06          	ld	a,(OFST+0,sp)
1944  0394 a178          	cp	a,#120
1945                     ; 310         return 1;
1947  0396 26c3          	jrne	LC005
1948                     ; 313     reg = read_register(RF_SETUP_REGISTER);
1950  0398 a606          	ld	a,#6
1951  039a cd007a        	call	_read_register
1953  039d 6b06          	ld	(OFST+0,sp),a
1955                     ; 314     delay(10);
1957  039f ae000a        	ldw	x,#10
1958  03a2 cd0000        	call	_delay
1960                     ; 315     if (reg != DEFAULT_RF_SETUP) {
1962  03a5 7b06          	ld	a,(OFST+0,sp)
1963  03a7 a108          	cp	a,#8
1964                     ; 316         return 1;
1966  03a9 26b0          	jrne	LC005
1967                     ; 320     read_registerN(0x10, regn, 5);
1969  03ab 4b05          	push	#5
1970  03ad 96            	ldw	x,sp
1971  03ae 1c0002        	addw	x,#OFST-4
1972  03b1 89            	pushw	x
1973  03b2 a610          	ld	a,#16
1974  03b4 cd00f5        	call	_read_registerN
1976  03b7 5b03          	addw	sp,#3
1977                     ; 321     delay(10);
1979  03b9 ae000a        	ldw	x,#10
1980  03bc cd0000        	call	_delay
1982                     ; 322     if (regn[0] != 0x1) return 1;
1984  03bf 7b01          	ld	a,(OFST-5,sp)
1985  03c1 4a            	dec	a
1988  03c2 2697          	jrne	LC005
1989                     ; 323     else if (regn[1] != 0x1) return 1;
1991  03c4 7b02          	ld	a,(OFST-4,sp)
1992  03c6 4a            	dec	a
1995  03c7 2692          	jrne	LC005
1996                     ; 324     else if (regn[2] != 0x1) return 1;
1998  03c9 7b03          	ld	a,(OFST-3,sp)
1999  03cb 4a            	dec	a
2002  03cc 268d          	jrne	LC005
2003                     ; 325     else if (regn[3] != 0x1) return 1;
2005  03ce 7b04          	ld	a,(OFST-2,sp)
2006  03d0 4a            	dec	a
2009  03d1 2688          	jrne	LC005
2010                     ; 326     else if (regn[4] != 0x1) return 1;
2012  03d3 7b05          	ld	a,(OFST-1,sp)
2013  03d5 4a            	dec	a
2016  03d6 2683          	jrne	LC005
2017                     ; 327     return 0;
2020  03d8 2083          	jra	L625
2067                     ; 330 uint8_t test_rx(void) {
2068                     	switch	.text
2069  03da               _test_rx:
2071  03da 5206          	subw	sp,#6
2072       00000006      OFST:	set	6
2075                     ; 333     reg = read_register(CONFIG_REGISTER);
2077  03dc 4f            	clr	a
2078  03dd cd007a        	call	_read_register
2080  03e0 6b06          	ld	(OFST+0,sp),a
2082                     ; 334     delay(10);
2084  03e2 ae000a        	ldw	x,#10
2085  03e5 cd0000        	call	_delay
2087                     ; 335     if (reg != DEFAULT_CONFIG_RX) {
2089  03e8 7b06          	ld	a,(OFST+0,sp)
2090  03ea a10f          	cp	a,#15
2091                     ; 336         return 1;
2093  03ec 2612          	jrne	LC006
2094                     ; 339     reg = read_register(EN_AA_REGISTER);
2096  03ee a601          	ld	a,#1
2097  03f0 cd007a        	call	_read_register
2099  03f3 6b06          	ld	(OFST+0,sp),a
2101                     ; 340     delay(10);
2103  03f5 ae000a        	ldw	x,#10
2104  03f8 cd0000        	call	_delay
2106                     ; 341     if (reg != DEFAULT_EN_AA) {
2108  03fb 7b06          	ld	a,(OFST+0,sp)
2109  03fd 4a            	dec	a
2110  03fe 2705          	jreq	L557
2111                     ; 342         return 1;
2113  0400               LC006:
2125  0400 a601          	ld	a,#1
2127  0402               L665:
2129  0402 5b06          	addw	sp,#6
2130  0404 81            	ret	
2131  0405               L557:
2132                     ; 345     reg = read_register(EN_RXADDR_REGISTER);
2134  0405 a602          	ld	a,#2
2135  0407 cd007a        	call	_read_register
2137  040a 6b06          	ld	(OFST+0,sp),a
2139                     ; 346     if (reg != DEFAULT_EN_RXADDR) {
2141  040c 4a            	dec	a
2142                     ; 347         return 1;
2144  040d 26f1          	jrne	LC006
2145                     ; 350     reg = read_register(SETUP_AW_REGISTER);
2147  040f a603          	ld	a,#3
2148  0411 cd007a        	call	_read_register
2150  0414 6b06          	ld	(OFST+0,sp),a
2152                     ; 351     delay(10);
2154  0416 ae000a        	ldw	x,#10
2155  0419 cd0000        	call	_delay
2157                     ; 352     if (reg != DEFAULT_SETUP_AW) {
2159  041c 7b06          	ld	a,(OFST+0,sp)
2160  041e a103          	cp	a,#3
2161                     ; 353         return 1;
2163  0420 26de          	jrne	LC006
2164                     ; 356     reg = read_register(RF_CH_REGISTER);
2166  0422 a605          	ld	a,#5
2167  0424 cd007a        	call	_read_register
2169  0427 6b06          	ld	(OFST+0,sp),a
2171                     ; 357     delay(10);
2173  0429 ae000a        	ldw	x,#10
2174  042c cd0000        	call	_delay
2176                     ; 358     if (reg != 120) {
2178  042f 7b06          	ld	a,(OFST+0,sp)
2179  0431 a178          	cp	a,#120
2180                     ; 359         return 1;
2182  0433 26cb          	jrne	LC006
2183                     ; 362     reg = read_register(RF_SETUP_REGISTER);
2185  0435 a606          	ld	a,#6
2186  0437 cd007a        	call	_read_register
2188  043a 6b06          	ld	(OFST+0,sp),a
2190                     ; 363     delay(10);
2192  043c ae000a        	ldw	x,#10
2193  043f cd0000        	call	_delay
2195                     ; 364     if (reg != DEFAULT_RF_SETUP) {
2197  0442 7b06          	ld	a,(OFST+0,sp)
2198  0444 a108          	cp	a,#8
2199                     ; 365         return 1;
2201  0446 26b8          	jrne	LC006
2202                     ; 368     reg = read_register(STATUS_REGISTER);
2204  0448 a607          	ld	a,#7
2205  044a cd007a        	call	_read_register
2207  044d 6b06          	ld	(OFST+0,sp),a
2209                     ; 369     if (reg != 0x0e) {
2211  044f a10e          	cp	a,#14
2212                     ; 370         return 1;
2214  0451 26ad          	jrne	LC006
2215                     ; 372 		read_registerN(0x0A, regn, 5);
2217  0453 4b05          	push	#5
2218  0455 96            	ldw	x,sp
2219  0456 1c0002        	addw	x,#OFST-4
2220  0459 89            	pushw	x
2221  045a a60a          	ld	a,#10
2222  045c cd00f5        	call	_read_registerN
2224  045f 5b03          	addw	sp,#3
2225                     ; 373     delay(10);
2227  0461 ae000a        	ldw	x,#10
2228  0464 cd0000        	call	_delay
2230                     ; 374     if (regn[0] != 0x1) return 1;
2232  0467 7b01          	ld	a,(OFST-5,sp)
2233  0469 4a            	dec	a
2236  046a 2694          	jrne	LC006
2237                     ; 375     else if (regn[1] != 0x1) return 1;
2239  046c 7b02          	ld	a,(OFST-4,sp)
2240  046e 4a            	dec	a
2243  046f 268f          	jrne	LC006
2244                     ; 376     else if (regn[2] != 0x1) return 1;
2246  0471 7b03          	ld	a,(OFST-3,sp)
2247  0473 4a            	dec	a
2250  0474 268a          	jrne	LC006
2251                     ; 377     else if (regn[3] != 0x1) return 1;
2253  0476 7b04          	ld	a,(OFST-2,sp)
2254  0478 4a            	dec	a
2257  0479 2685          	jrne	LC006
2258                     ; 378     else if (regn[4] != 0x1) return 1;
2260  047b 7b05          	ld	a,(OFST-1,sp)
2261  047d 4a            	dec	a
2264  047e 2680          	jrne	LC006
2265                     ; 379 	return 0;
2268  0480 2080          	jra	L665
2281                     	xdef	_test_rx
2282                     	xdef	_test_tx
2283                     	xdef	_SPI_DeInit_NRF
2284                     	xdef	_SPI_Init_NRF
2285                     	xdef	_rx_read
2286                     	xdef	_tx_send
2287                     	xdef	_nrf_deinit
2288                     	xdef	_rx_init
2289                     	xdef	_tx_init
2290                     	xdef	_write_registerN
2291                     	xdef	_read_registerN
2292                     	xdef	_write_register
2293                     	xdef	_read_register
2294                     	xdef	_reset_status
2295                     	xdef	_flush_tx
2296                     	xdef	_flush_rx
2297                     	xdef	_ce_low
2298                     	xdef	_ce_high
2299                     	xdef	_cs_low
2300                     	xdef	_cs_high
2301                     	xdef	_delay
2302                     	xref	_SPI_GetFlagStatus
2303                     	xref	_SPI_ReceiveData
2304                     	xref	_SPI_SendData
2305                     	xref	_SPI_Cmd
2306                     	xref	_SPI_Init
2307                     	xref	_SPI_DeInit
2308                     	xref	_GPIO_WriteLow
2309                     	xref	_GPIO_WriteHigh
2310                     	xref	_GPIO_Init
2311                     	xref	_GPIO_DeInit
2330                     	end
