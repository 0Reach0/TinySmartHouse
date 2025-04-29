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
1292                     ; 169     ce_high();
1294  01eb cd0024        	call	_ce_high
1296                     ; 170     delay(10);
1298  01ee ae000a        	ldw	x,#10
1299  01f1 cd0000        	call	_delay
1301                     ; 171     ce_low();
1303  01f4 cd002e        	call	_ce_low
1305  01f7               L135:
1306                     ; 174         status = read_register(STATUS_REGISTER);
1308  01f7 a607          	ld	a,#7
1309  01f9 cd007a        	call	_read_register
1311  01fc 6b01          	ld	(OFST+0,sp),a
1313                     ; 175     } while (!(status & (1 << 5)) && !(status & (1 << 4)));
1315  01fe a520          	bcp	a,#32
1316  0200 2604          	jrne	L735
1318  0202 a510          	bcp	a,#16
1319  0204 27f1          	jreq	L135
1320  0206               L735:
1321                     ; 177     write_register(STATUS_REGISTER, 0x70);
1323  0206 ae0770        	ldw	x,#1904
1324  0209 cd00c5        	call	_write_register
1326                     ; 178 }
1329  020c 5b03          	addw	sp,#3
1330  020e 81            	ret	
1390                     ; 180 void rx_read(uint8_t *buf, uint8_t len) {
1391                     	switch	.text
1392  020f               _rx_read:
1394  020f 89            	pushw	x
1395  0210 88            	push	a
1396       00000001      OFST:	set	1
1399                     ; 184     cs_low();
1401  0211 cd001a        	call	_cs_low
1403                     ; 185     SPI_SendData(R_RX_PAYLOAD);
1405  0214 a661          	ld	a,#97
1406  0216 cd0000        	call	_SPI_SendData
1408                     ; 186     delay(10);
1410  0219 ae000a        	ldw	x,#10
1411  021c cd0000        	call	_delay
1414  021f               L175:
1415                     ; 187     while (SPI_GetFlagStatus(SPI_FLAG_RXNE) == RESET);
1417  021f a601          	ld	a,#1
1418  0221 cd0000        	call	_SPI_GetFlagStatus
1420  0224 4d            	tnz	a
1421  0225 27f8          	jreq	L175
1422                     ; 188     SPI_ReceiveData();
1424  0227 cd0000        	call	_SPI_ReceiveData
1427  022a               L775:
1428                     ; 189     while (SPI_GetFlagStatus(SPI_FLAG_TXE) == RESET);
1430  022a a602          	ld	a,#2
1431  022c cd0000        	call	_SPI_GetFlagStatus
1433  022f 4d            	tnz	a
1434  0230 27f8          	jreq	L775
1435                     ; 190     for (i = 0; i < len; i++) {
1437  0232 0f01          	clr	(OFST+0,sp)
1440  0234 2021          	jra	L706
1441  0236               L306:
1442                     ; 191         delay(10);
1444  0236 ae000a        	ldw	x,#10
1445  0239 cd0000        	call	_delay
1447                     ; 192         SPI_SendData(0x00);
1449  023c 4f            	clr	a
1450  023d cd0000        	call	_SPI_SendData
1453  0240               L516:
1454                     ; 193         while (SPI_GetFlagStatus(SPI_FLAG_RXNE) == RESET);
1456  0240 a601          	ld	a,#1
1457  0242 cd0000        	call	_SPI_GetFlagStatus
1459  0245 4d            	tnz	a
1460  0246 27f8          	jreq	L516
1461                     ; 194         buf[i] = SPI_ReceiveData();
1463  0248 7b01          	ld	a,(OFST+0,sp)
1464  024a 5f            	clrw	x
1465  024b 97            	ld	xl,a
1466  024c 72fb02        	addw	x,(OFST+1,sp)
1467  024f 89            	pushw	x
1468  0250 cd0000        	call	_SPI_ReceiveData
1470  0253 85            	popw	x
1471  0254 f7            	ld	(x),a
1472                     ; 190     for (i = 0; i < len; i++) {
1474  0255 0c01          	inc	(OFST+0,sp)
1476  0257               L706:
1479  0257 7b01          	ld	a,(OFST+0,sp)
1480  0259 1106          	cp	a,(OFST+5,sp)
1481  025b 25d9          	jrult	L306
1482                     ; 196     cs_high();
1484  025d cd0010        	call	_cs_high
1486                     ; 198     write_register(STATUS_REGISTER, 0x70);
1488  0260 ae0770        	ldw	x,#1904
1489  0263 cd00c5        	call	_write_register
1491                     ; 199 }
1494  0266 5b03          	addw	sp,#3
1495  0268 81            	ret	
1522                     ; 205 void rx_init(void) {
1523                     	switch	.text
1524  0269               _rx_init:
1528                     ; 206     GPIO_Init(CSN_PIN, GPIO_MODE_OUT_PP_HIGH_FAST);
1530  0269 4bf0          	push	#240
1531  026b 4b10          	push	#16
1532  026d ae500a        	ldw	x,#20490
1533  0270 cd0000        	call	_GPIO_Init
1535  0273 85            	popw	x
1536                     ; 207     GPIO_Init(CE_PIN, GPIO_MODE_OUT_PP_HIGH_FAST);
1538  0274 4bf0          	push	#240
1539  0276 4b08          	push	#8
1540  0278 ae500a        	ldw	x,#20490
1541  027b cd0000        	call	_GPIO_Init
1543  027e 85            	popw	x
1544                     ; 210     write_register(CONFIG_REGISTER, DEFAULT_CONFIG_RX);
1546  027f ae000f        	ldw	x,#15
1547  0282 ad27          	call	LC002
1549                     ; 212     write_register(EN_AA_REGISTER, DEFAULT_EN_AA);
1551  0284 ae0101        	ldw	x,#257
1552  0287 ad22          	call	LC002
1554                     ; 214     write_register(EN_RXADDR_REGISTER, DEFAULT_EN_RXADDR);
1556  0289 ae0201        	ldw	x,#513
1557  028c ad1d          	call	LC002
1559                     ; 216     write_register(SETUP_AW_REGISTER, DEFAULT_SETUP_AW);
1561  028e ae0303        	ldw	x,#771
1562  0291 ad18          	call	LC002
1564                     ; 218     write_register(RF_CH_REGISTER, 120); 
1566  0293 ae0578        	ldw	x,#1400
1567  0296 ad13          	call	LC002
1569                     ; 220     write_register(RF_SETUP_REGISTER, DEFAULT_RF_SETUP);
1571  0298 ae0608        	ldw	x,#1544
1572  029b ad0e          	call	LC002
1574                     ; 222     write_register(STATUS_REGISTER, DEFAULT_STATUS);
1576  029d ae0770        	ldw	x,#1904
1577  02a0 ad09          	call	LC002
1579                     ; 224 		flush_tx();
1581  02a2 cd003e        	call	_flush_tx
1583                     ; 225 		delay(10);
1585  02a5 ae000a        	ldw	x,#10
1587                     ; 227 }
1590  02a8 cc0000        	jp	_delay
1591  02ab               LC002:
1592  02ab cd00c5        	call	_write_register
1594                     ; 223 		delay(10);
1596  02ae ae000a        	ldw	x,#10
1597  02b1 cc0000        	jp	_delay
1624                     ; 230 void tx_init(void) {
1625                     	switch	.text
1626  02b4               _tx_init:
1630                     ; 231     GPIO_Init(CSN_PIN, GPIO_MODE_OUT_PP_HIGH_FAST);
1632  02b4 4bf0          	push	#240
1633  02b6 4b10          	push	#16
1634  02b8 ae500a        	ldw	x,#20490
1635  02bb cd0000        	call	_GPIO_Init
1637  02be 85            	popw	x
1638                     ; 232     GPIO_Init(CE_PIN, GPIO_MODE_OUT_PP_HIGH_FAST);
1640  02bf 4bf0          	push	#240
1641  02c1 4b08          	push	#8
1642  02c3 ae500a        	ldw	x,#20490
1643  02c6 cd0000        	call	_GPIO_Init
1645  02c9 85            	popw	x
1646                     ; 234     write_register(CONFIG_REGISTER, DEFAULT_CONFIG_TX); 
1648  02ca ae000e        	ldw	x,#14
1649  02cd ad22          	call	LC003
1651                     ; 236     write_register(SETUP_AW_REGISTER, DEFAULT_SETUP_AW); 
1653  02cf ae0303        	ldw	x,#771
1654  02d2 ad1d          	call	LC003
1656                     ; 238     write_register(SETUP_RETR_REGISTER, DEFAULT_SETUP_RETR); 
1658  02d4 ae0401        	ldw	x,#1025
1659  02d7 ad18          	call	LC003
1661                     ; 240     write_register(RF_CH_REGISTER, 120); 
1663  02d9 ae0578        	ldw	x,#1400
1664  02dc ad13          	call	LC003
1666                     ; 242     write_register(RF_SETUP_REGISTER, DEFAULT_RF_SETUP); 
1668  02de ae0608        	ldw	x,#1544
1669  02e1 ad0e          	call	LC003
1671                     ; 244     write_register(STATUS_REGISTER, DEFAULT_STATUS);
1673  02e3 ae0770        	ldw	x,#1904
1674  02e6 ad09          	call	LC003
1676                     ; 246 	flush_tx();
1678  02e8 cd003e        	call	_flush_tx
1680                     ; 247 	delay(10);
1682  02eb ae000a        	ldw	x,#10
1684                     ; 248 }
1687  02ee cc0000        	jp	_delay
1688  02f1               LC003:
1689  02f1 cd00c5        	call	_write_register
1691                     ; 245 	delay(10);
1693  02f4 ae000a        	ldw	x,#10
1694  02f7 cc0000        	jp	_delay
1720                     ; 251 void nrf_deinit(void)
1720                     ; 252 {
1721                     	switch	.text
1722  02fa               _nrf_deinit:
1726                     ; 253 		GPIO_DeInit(GPIOC);
1728  02fa ae500a        	ldw	x,#20490
1729  02fd cd0000        	call	_GPIO_DeInit
1731                     ; 255     write_register(CONFIG_REGISTER, RESET_CONFIG); 
1733  0300 ae0008        	ldw	x,#8
1734  0303 ad20          	call	LC004
1736                     ; 257     write_register(SETUP_AW_REGISTER, RESET_SETUP_AW); 
1738  0305 ae0303        	ldw	x,#771
1739  0308 ad1b          	call	LC004
1741                     ; 259     write_register(SETUP_RETR_REGISTER, RESET_SETUP_RETR); 
1743  030a ae0403        	ldw	x,#1027
1744  030d ad16          	call	LC004
1746                     ; 261     write_register(RF_CH_REGISTER, RESET_RF_CH); 
1748  030f ae0502        	ldw	x,#1282
1749  0312 ad11          	call	LC004
1751                     ; 263     write_register(RF_SETUP_REGISTER, RESET_RF_SETUP); 
1753  0314 ae060f        	ldw	x,#1551
1754  0317 ad0c          	call	LC004
1756                     ; 265     write_register(STATUS_REGISTER, RESET_STATUS);
1758  0319 ae0770        	ldw	x,#1904
1759  031c cd00c5        	call	_write_register
1761                     ; 266 		delay(10);
1763  031f ae000a        	ldw	x,#10
1765                     ; 268 }
1768  0322 cc0000        	jp	_delay
1769  0325               LC004:
1770  0325 cd00c5        	call	_write_register
1772                     ; 264     delay(10);
1774  0328 ae000a        	ldw	x,#10
1775  032b cc0000        	jp	_delay
1811                     ; 271 uint8_t test_tx(void) {
1812                     	switch	.text
1813  032e               _test_tx:
1815  032e 88            	push	a
1816       00000001      OFST:	set	1
1819                     ; 274     reg = read_register(STATUS_REGISTER);
1821  032f a607          	ld	a,#7
1822  0331 cd007a        	call	_read_register
1824  0334 6b01          	ld	(OFST+0,sp),a
1826                     ; 275 		delay(10);
1828  0336 ae000a        	ldw	x,#10
1829  0339 cd0000        	call	_delay
1831                     ; 276     delay(10);
1833  033c ae000a        	ldw	x,#10
1834  033f cd0000        	call	_delay
1836                     ; 277     if (reg != 0x0e) {
1838  0342 7b01          	ld	a,(OFST+0,sp)
1839  0344 a10e          	cp	a,#14
1840  0346 2702          	jreq	L766
1841                     ; 278         return 1;
1843  0348 206b          	jp	LC005
1844  034a               L766:
1845                     ; 281 		reg = read_register(CONFIG_REGISTER);
1847  034a 4f            	clr	a
1848  034b cd007a        	call	_read_register
1850  034e 6b01          	ld	(OFST+0,sp),a
1852                     ; 282     delay(10);
1854  0350 ae000a        	ldw	x,#10
1855  0353 cd0000        	call	_delay
1857                     ; 283     if (reg != DEFAULT_CONFIG_TX) {
1859  0356 7b01          	ld	a,(OFST+0,sp)
1860  0358 a10e          	cp	a,#14
1861  035a 2702          	jreq	L176
1862                     ; 284         return 1;
1864  035c 2057          	jp	LC005
1865  035e               L176:
1866                     ; 287     reg = read_register(SETUP_AW_REGISTER);
1868  035e a603          	ld	a,#3
1869  0360 cd007a        	call	_read_register
1871  0363 6b01          	ld	(OFST+0,sp),a
1873                     ; 288     delay(10);
1875  0365 ae000a        	ldw	x,#10
1876  0368 cd0000        	call	_delay
1878                     ; 289     if (reg != DEFAULT_SETUP_AW) {
1880  036b 7b01          	ld	a,(OFST+0,sp)
1881  036d a103          	cp	a,#3
1882  036f 2702          	jreq	L376
1883                     ; 290         return 1;
1885  0371 2042          	jp	LC005
1886  0373               L376:
1887                     ; 293     reg = read_register(SETUP_RETR_REGISTER);
1889  0373 a604          	ld	a,#4
1890  0375 cd007a        	call	_read_register
1892  0378 6b01          	ld	(OFST+0,sp),a
1894                     ; 294     delay(10);
1896  037a ae000a        	ldw	x,#10
1897  037d cd0000        	call	_delay
1899                     ; 295     if (reg != DEFAULT_SETUP_RETR) {
1901  0380 7b01          	ld	a,(OFST+0,sp)
1902  0382 4a            	dec	a
1903  0383 2702          	jreq	L576
1904                     ; 296         return 1;
1906  0385 202e          	jp	LC005
1907  0387               L576:
1908                     ; 299     reg = read_register(RF_CH_REGISTER);
1910  0387 a605          	ld	a,#5
1911  0389 cd007a        	call	_read_register
1913  038c 6b01          	ld	(OFST+0,sp),a
1915                     ; 300     delay(10);
1917  038e ae000a        	ldw	x,#10
1918  0391 cd0000        	call	_delay
1920                     ; 301     if (reg != 120) {
1922  0394 7b01          	ld	a,(OFST+0,sp)
1923  0396 a178          	cp	a,#120
1924  0398 2702          	jreq	L776
1925                     ; 302         return 1;
1927  039a 2019          	jp	LC005
1928  039c               L776:
1929                     ; 305     reg = read_register(RF_SETUP_REGISTER);
1931  039c a606          	ld	a,#6
1932  039e cd007a        	call	_read_register
1934  03a1 6b01          	ld	(OFST+0,sp),a
1936                     ; 306     delay(10);
1938  03a3 ae000a        	ldw	x,#10
1939  03a6 cd0000        	call	_delay
1941                     ; 307     if (reg != DEFAULT_RF_SETUP) {
1943  03a9 7b01          	ld	a,(OFST+0,sp)
1944  03ab a108          	cp	a,#8
1945  03ad 2702          	jreq	L107
1946                     ; 308         return 1;
1948  03af 2004          	jp	LC005
1949  03b1               L107:
1950                     ; 311     return 0;
1952  03b1 4f            	clr	a
1955  03b2 5b01          	addw	sp,#1
1956  03b4 81            	ret	
1957  03b5               LC005:
1958  03b5 a601          	ld	a,#1
1959                     ; 308         return 1;
1961  03b7 5b01          	addw	sp,#1
1962  03b9 81            	ret	
1998                     ; 314 uint8_t test_rx(void) {
1999                     	switch	.text
2000  03ba               _test_rx:
2002  03ba 88            	push	a
2003       00000001      OFST:	set	1
2006                     ; 317     reg = read_register(CONFIG_REGISTER);
2008  03bb 4f            	clr	a
2009  03bc cd007a        	call	_read_register
2011  03bf 6b01          	ld	(OFST+0,sp),a
2013                     ; 318     delay(10);
2015  03c1 ae000a        	ldw	x,#10
2016  03c4 cd0000        	call	_delay
2018                     ; 319     if (reg != DEFAULT_CONFIG_RX) {
2020  03c7 7b01          	ld	a,(OFST+0,sp)
2021  03c9 a10f          	cp	a,#15
2022  03cb 2702          	jreq	L127
2023                     ; 320         return 1;
2025  03cd 2070          	jp	LC006
2026  03cf               L127:
2027                     ; 323     reg = read_register(EN_AA_REGISTER);
2029  03cf a601          	ld	a,#1
2030  03d1 cd007a        	call	_read_register
2032  03d4 6b01          	ld	(OFST+0,sp),a
2034                     ; 324     delay(10);
2036  03d6 ae000a        	ldw	x,#10
2037  03d9 cd0000        	call	_delay
2039                     ; 325     if (reg != DEFAULT_EN_AA) {
2041  03dc 7b01          	ld	a,(OFST+0,sp)
2042  03de 4a            	dec	a
2043  03df 2702          	jreq	L327
2044                     ; 326         return 1;
2046  03e1 205c          	jp	LC006
2047  03e3               L327:
2048                     ; 329     reg = read_register(EN_RXADDR_REGISTER);
2050  03e3 a602          	ld	a,#2
2051  03e5 cd007a        	call	_read_register
2053  03e8 6b01          	ld	(OFST+0,sp),a
2055                     ; 330     if (reg != DEFAULT_EN_RXADDR) {
2057  03ea 4a            	dec	a
2058  03eb 2702          	jreq	L527
2059                     ; 331         return 1;
2061  03ed 2050          	jp	LC006
2062  03ef               L527:
2063                     ; 334     reg = read_register(SETUP_AW_REGISTER);
2065  03ef a603          	ld	a,#3
2066  03f1 cd007a        	call	_read_register
2068  03f4 6b01          	ld	(OFST+0,sp),a
2070                     ; 335     delay(10);
2072  03f6 ae000a        	ldw	x,#10
2073  03f9 cd0000        	call	_delay
2075                     ; 336     if (reg != DEFAULT_SETUP_AW) {
2077  03fc 7b01          	ld	a,(OFST+0,sp)
2078  03fe a103          	cp	a,#3
2079  0400 2702          	jreq	L727
2080                     ; 337         return 1;
2082  0402 203b          	jp	LC006
2083  0404               L727:
2084                     ; 340     reg = read_register(RF_CH_REGISTER);
2086  0404 a605          	ld	a,#5
2087  0406 cd007a        	call	_read_register
2089  0409 6b01          	ld	(OFST+0,sp),a
2091                     ; 341     delay(10);
2093  040b ae000a        	ldw	x,#10
2094  040e cd0000        	call	_delay
2096                     ; 342     if (reg != 120) {
2098  0411 7b01          	ld	a,(OFST+0,sp)
2099  0413 a178          	cp	a,#120
2100  0415 2702          	jreq	L137
2101                     ; 343         return 1;
2103  0417 2026          	jp	LC006
2104  0419               L137:
2105                     ; 346     reg = read_register(RF_SETUP_REGISTER);
2107  0419 a606          	ld	a,#6
2108  041b cd007a        	call	_read_register
2110  041e 6b01          	ld	(OFST+0,sp),a
2112                     ; 347     delay(10);
2114  0420 ae000a        	ldw	x,#10
2115  0423 cd0000        	call	_delay
2117                     ; 348     if (reg != DEFAULT_RF_SETUP) {
2119  0426 7b01          	ld	a,(OFST+0,sp)
2120  0428 a108          	cp	a,#8
2121  042a 2702          	jreq	L337
2122                     ; 349         return 1;
2124  042c 2011          	jp	LC006
2125  042e               L337:
2126                     ; 352     reg = read_register(STATUS_REGISTER);
2128  042e a607          	ld	a,#7
2129  0430 cd007a        	call	_read_register
2131  0433 6b01          	ld	(OFST+0,sp),a
2133                     ; 353     if (reg != 0x0e) {
2135  0435 a10e          	cp	a,#14
2136  0437 2702          	jreq	L537
2137                     ; 354         return 1;
2139  0439 2004          	jp	LC006
2140  043b               L537:
2141                     ; 356 	return 0;
2143  043b 4f            	clr	a
2146  043c 5b01          	addw	sp,#1
2147  043e 81            	ret	
2148  043f               LC006:
2149  043f a601          	ld	a,#1
2150                     ; 354         return 1;
2152  0441 5b01          	addw	sp,#1
2153  0443 81            	ret	
2166                     	xdef	_test_rx
2167                     	xdef	_test_tx
2168                     	xdef	_SPI_DeInit_NRF
2169                     	xdef	_SPI_Init_NRF
2170                     	xdef	_rx_read
2171                     	xdef	_tx_send
2172                     	xdef	_nrf_deinit
2173                     	xdef	_rx_init
2174                     	xdef	_tx_init
2175                     	xdef	_write_registerN
2176                     	xdef	_read_registerN
2177                     	xdef	_write_register
2178                     	xdef	_read_register
2179                     	xdef	_reset_status
2180                     	xdef	_flush_tx
2181                     	xdef	_flush_rx
2182                     	xdef	_ce_low
2183                     	xdef	_ce_high
2184                     	xdef	_cs_low
2185                     	xdef	_cs_high
2186                     	xdef	_delay
2187                     	xref	_SPI_GetFlagStatus
2188                     	xref	_SPI_ReceiveData
2189                     	xref	_SPI_SendData
2190                     	xref	_SPI_Cmd
2191                     	xref	_SPI_Init
2192                     	xref	_SPI_DeInit
2193                     	xref	_GPIO_WriteLow
2194                     	xref	_GPIO_WriteHigh
2195                     	xref	_GPIO_Init
2196                     	xref	_GPIO_DeInit
2215                     	end
