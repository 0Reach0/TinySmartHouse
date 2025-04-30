   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.3 - 22 Aug 2024
   4                     ; Optimizer V4.6.3 - 22 Aug 2024
  68                     ; 6 void delay(uint16_t n) {
  70                     	switch	.text
  71  0000               _delay:
  73  0000 89            	pushw	x
  74  0001 89            	pushw	x
  75       00000002      OFST:	set	2
  78                     ; 7     uint16_t i = 0;
  80                     ; 8     for (i = 0; i < n; i++) {
  82  0002 5f            	clrw	x
  84  0003 2002          	jra	L73
  85  0005               L33:
  86                     ; 9         __asm("nop");
  89  0005 9d            	nop	
  91                     ; 8     for (i = 0; i < n; i++) {
  93  0006 5c            	incw	x
  94  0007               L73:
  95  0007 1f01          	ldw	(OFST-1,sp),x
  99  0009 1303          	cpw	x,(OFST+1,sp)
 100  000b 25f8          	jrult	L33
 101                     ; 11 }
 104  000d 5b04          	addw	sp,#4
 105  000f 81            	ret	
 129                     ; 15 void cs_high(void) {
 130                     	switch	.text
 131  0010               _cs_high:
 135                     ; 16     GPIO_WriteHigh(CSN_PIN);
 137  0010 4b10          	push	#16
 138  0012 ae500a        	ldw	x,#20490
 139  0015 cd0000        	call	_GPIO_WriteHigh
 141  0018 84            	pop	a
 142                     ; 17 }
 145  0019 81            	ret	
 169                     ; 19 void cs_low(void) {
 170                     	switch	.text
 171  001a               _cs_low:
 175                     ; 20     GPIO_WriteLow(CSN_PIN);
 177  001a 4b10          	push	#16
 178  001c ae500a        	ldw	x,#20490
 179  001f cd0000        	call	_GPIO_WriteLow
 181  0022 84            	pop	a
 182                     ; 21 }
 185  0023 81            	ret	
 209                     ; 23 void ce_high(void) {
 210                     	switch	.text
 211  0024               _ce_high:
 215                     ; 24     GPIO_WriteHigh(CE_PIN);
 217  0024 4b08          	push	#8
 218  0026 ae500a        	ldw	x,#20490
 219  0029 cd0000        	call	_GPIO_WriteHigh
 221  002c 84            	pop	a
 222                     ; 25 }
 225  002d 81            	ret	
 249                     ; 27 void ce_low(void) {
 250                     	switch	.text
 251  002e               _ce_low:
 255                     ; 28     GPIO_WriteLow(CE_PIN);
 257  002e 4b08          	push	#8
 258  0030 ae500a        	ldw	x,#20490
 259  0033 cd0000        	call	_GPIO_WriteLow
 261  0036 84            	pop	a
 262                     ; 29 }
 265  0037 81            	ret	
 289                     ; 31 void reset_status(void) {
 290                     	switch	.text
 291  0038               _reset_status:
 295                     ; 32     write_register(STATUS_REGISTER, 0x70);
 297  0038 ae0770        	ldw	x,#1904
 299                     ; 33 }
 302  003b cc00c5        	jp	_write_register
 329                     ; 35 void flush_tx(void) {
 330                     	switch	.text
 331  003e               _flush_tx:
 335                     ; 36     cs_low();
 337  003e adda          	call	_cs_low
 339                     ; 37     SPI_SendData(FLUSH_TX);
 341  0040 a6e1          	ld	a,#225
 342  0042 cd0000        	call	_SPI_SendData
 344                     ; 38     delay(10);
 346  0045 ae000a        	ldw	x,#10
 347  0048 adb6          	call	_delay
 349                     ; 39     cs_high();
 352                     ; 40 }
 355  004a 20c4          	jp	_cs_high
 382                     ; 42 void flush_rx(void) {
 383                     	switch	.text
 384  004c               _flush_rx:
 388                     ; 43     cs_low();
 390  004c adcc          	call	_cs_low
 392                     ; 44     SPI_SendData(FLUSH_RX);
 394  004e a6e2          	ld	a,#226
 395  0050 cd0000        	call	_SPI_SendData
 397                     ; 45     delay(10);
 399  0053 ae000a        	ldw	x,#10
 400  0056 ada8          	call	_delay
 402                     ; 46     cs_high();
 405                     ; 47 }
 408  0058 20b6          	jp	_cs_high
 433                     ; 52 void SPI_Init_NRF(void) {
 434                     	switch	.text
 435  005a               _SPI_Init_NRF:
 439                     ; 53     SPI_Init(SPI_FIRSTBIT_MSB, SPI_BAUDRATEPRESCALER_8, SPI_MODE_MASTER,
 439                     ; 54              SPI_CLOCKPOLARITY_LOW, SPI_CLOCKPHASE_1EDGE, SPI_DATADIRECTION_2LINES_FULLDUPLEX,
 439                     ; 55              SPI_NSS_SOFT, 0x07);
 441  005a 4b07          	push	#7
 442  005c 4b02          	push	#2
 443  005e 4b00          	push	#0
 444  0060 4b00          	push	#0
 445  0062 4b00          	push	#0
 446  0064 4b04          	push	#4
 447  0066 ae0010        	ldw	x,#16
 448  0069 cd0000        	call	_SPI_Init
 450  006c 5b06          	addw	sp,#6
 451                     ; 56     SPI_Cmd(ENABLE);
 453  006e a601          	ld	a,#1
 455                     ; 57 }
 458  0070 cc0000        	jp	_SPI_Cmd
 483                     ; 59 void SPI_DeInit_NRF(void){
 484                     	switch	.text
 485  0073               _SPI_DeInit_NRF:
 489                     ; 60 		SPI_DeInit();
 491  0073 cd0000        	call	_SPI_DeInit
 493                     ; 61 		SPI_Cmd(DISABLE);
 495  0076 4f            	clr	a
 497                     ; 62 }
 500  0077 cc0000        	jp	_SPI_Cmd
 558                     ; 67 uint8_t read_register(uint8_t reg) {
 559                     	switch	.text
 560  007a               _read_register:
 562  007a 88            	push	a
 563       00000001      OFST:	set	1
 566                     ; 68     uint8_t command = R_REGISTER | reg;
 568  007b 6b01          	ld	(OFST+0,sp),a
 570                     ; 69     uint8_t data = 0;
 572                     ; 71     cs_low();
 574  007d ad9b          	call	_cs_low
 576                     ; 72     SPI_SendData(command);
 578  007f 7b01          	ld	a,(OFST+0,sp)
 579  0081 ad39          	call	LC001
 581                     ; 73 		delay(10);
 582  0083               L302:
 583                     ; 74     while (SPI_GetFlagStatus(SPI_FLAG_TXE) == RESET); // ???????? ???????? ???????
 585  0083 a602          	ld	a,#2
 586  0085 cd0000        	call	_SPI_GetFlagStatus
 588  0088 4d            	tnz	a
 589  0089 27f8          	jreq	L302
 591  008b               L112:
 592                     ; 75     while (SPI_GetFlagStatus(SPI_FLAG_RXNE) == RESET); // ???????? ????????? ??????
 594  008b a601          	ld	a,#1
 595  008d cd0000        	call	_SPI_GetFlagStatus
 597  0090 4d            	tnz	a
 598  0091 27f8          	jreq	L112
 599                     ; 76     data = SPI_ReceiveData();
 601  0093 cd0000        	call	_SPI_ReceiveData
 603                     ; 77 		delay(10);
 605  0096 ae000a        	ldw	x,#10
 606  0099 cd0000        	call	_delay
 608                     ; 78 		SPI_SendData(0x0);
 610  009c 4f            	clr	a
 611  009d ad1d          	call	LC001
 613                     ; 79 		delay(10);
 614  009f               L712:
 615                     ; 80 		while (SPI_GetFlagStatus(SPI_FLAG_TXE) == RESET); 
 617  009f a602          	ld	a,#2
 618  00a1 cd0000        	call	_SPI_GetFlagStatus
 620  00a4 4d            	tnz	a
 621  00a5 27f8          	jreq	L712
 623  00a7               L522:
 624                     ; 81 		while (SPI_GetFlagStatus(SPI_FLAG_RXNE) == RESET); // ???????? ????????? ??????
 626  00a7 a601          	ld	a,#1
 627  00a9 cd0000        	call	_SPI_GetFlagStatus
 629  00ac 4d            	tnz	a
 630  00ad 27f8          	jreq	L522
 631                     ; 82 		data = SPI_ReceiveData();
 633  00af cd0000        	call	_SPI_ReceiveData
 635  00b2 6b01          	ld	(OFST+0,sp),a
 637                     ; 84 cs_high();
 639  00b4 cd0010        	call	_cs_high
 641                     ; 86     return data;
 643  00b7 7b01          	ld	a,(OFST+0,sp)
 646  00b9 5b01          	addw	sp,#1
 647  00bb 81            	ret	
 648  00bc               LC001:
 649  00bc cd0000        	call	_SPI_SendData
 651                     ; 79 		delay(10);
 653  00bf ae000a        	ldw	x,#10
 654  00c2 cc0000        	jp	_delay
 711                     ; 89 void write_register(uint8_t reg, uint8_t value) {
 712                     	switch	.text
 713  00c5               _write_register:
 715  00c5 89            	pushw	x
 716  00c6 88            	push	a
 717       00000001      OFST:	set	1
 720                     ; 90     uint8_t command = W_REGISTER | reg;
 722  00c7 9e            	ld	a,xh
 723  00c8 aa20          	or	a,#32
 724  00ca 6b01          	ld	(OFST+0,sp),a
 726                     ; 92     cs_low();
 728  00cc cd001a        	call	_cs_low
 730                     ; 93     SPI_SendData(command);
 732  00cf 7b01          	ld	a,(OFST+0,sp)
 733  00d1 cd0000        	call	_SPI_SendData
 736  00d4               L162:
 737                     ; 94     while (SPI_GetFlagStatus(SPI_FLAG_TXE) == RESET);
 739  00d4 a602          	ld	a,#2
 740  00d6 cd0000        	call	_SPI_GetFlagStatus
 742  00d9 4d            	tnz	a
 743  00da 27f8          	jreq	L162
 744                     ; 95     SPI_SendData(value);
 746  00dc 7b03          	ld	a,(OFST+2,sp)
 747  00de cd0000        	call	_SPI_SendData
 750  00e1               L762:
 751                     ; 96     while (SPI_GetFlagStatus(SPI_FLAG_TXE) == RESET);
 753  00e1 a602          	ld	a,#2
 754  00e3 cd0000        	call	_SPI_GetFlagStatus
 756  00e6 4d            	tnz	a
 757  00e7 27f8          	jreq	L762
 758                     ; 97 		delay(10);
 760  00e9 ae000a        	ldw	x,#10
 761  00ec cd0000        	call	_delay
 763                     ; 98     cs_high();
 765  00ef cd0010        	call	_cs_high
 767                     ; 99 }
 770  00f2 5b03          	addw	sp,#3
 771  00f4 81            	ret	
 848                     ; 105 void read_registerN(uint8_t reg, uint8_t *buf, uint8_t len) {
 849                     	switch	.text
 850  00f5               _read_registerN:
 852  00f5 88            	push	a
 853  00f6 88            	push	a
 854       00000001      OFST:	set	1
 857                     ; 106     uint8_t command = R_REGISTER | reg;
 859  00f7 6b01          	ld	(OFST+0,sp),a
 861                     ; 109     cs_low();
 863  00f9 cd001a        	call	_cs_low
 865                     ; 111     SPI_SendData(command);
 867  00fc 7b01          	ld	a,(OFST+0,sp)
 868  00fe cd0000        	call	_SPI_SendData
 871  0101               L333:
 872                     ; 112     while (SPI_GetFlagStatus(SPI_FLAG_TXE) == RESET);
 874  0101 a602          	ld	a,#2
 875  0103 cd0000        	call	_SPI_GetFlagStatus
 877  0106 4d            	tnz	a
 878  0107 27f8          	jreq	L333
 879                     ; 113 		delay(10);
 881  0109 ae000a        	ldw	x,#10
 882  010c cd0000        	call	_delay
 885  010f               L143:
 886                     ; 114     while (SPI_GetFlagStatus(SPI_FLAG_RXNE) == RESET);
 888  010f a601          	ld	a,#1
 889  0111 cd0000        	call	_SPI_GetFlagStatus
 891  0114 4d            	tnz	a
 892  0115 27f8          	jreq	L143
 893                     ; 115     SPI_ReceiveData();
 895  0117 cd0000        	call	_SPI_ReceiveData
 897                     ; 116     for (i = 0; i < len; i++) {
 899  011a 0f01          	clr	(OFST+0,sp)
 902  011c 2027          	jra	L153
 903  011e               L543:
 904                     ; 117         delay(10);
 906  011e cd0000        	call	_delay
 908                     ; 118         SPI_SendData(0xFF);
 910  0121 a6ff          	ld	a,#255
 911  0123 cd0000        	call	_SPI_SendData
 914  0126               L753:
 915                     ; 119         while (SPI_GetFlagStatus(SPI_FLAG_TXE) == RESET);
 917  0126 a602          	ld	a,#2
 918  0128 cd0000        	call	_SPI_GetFlagStatus
 920  012b 4d            	tnz	a
 921  012c 27f8          	jreq	L753
 923  012e               L563:
 924                     ; 120         while (SPI_GetFlagStatus(SPI_FLAG_RXNE) == RESET);
 926  012e a601          	ld	a,#1
 927  0130 cd0000        	call	_SPI_GetFlagStatus
 929  0133 4d            	tnz	a
 930  0134 27f8          	jreq	L563
 931                     ; 121         buf[i] = SPI_ReceiveData();
 933  0136 7b01          	ld	a,(OFST+0,sp)
 934  0138 5f            	clrw	x
 935  0139 97            	ld	xl,a
 936  013a 72fb05        	addw	x,(OFST+4,sp)
 937  013d 89            	pushw	x
 938  013e cd0000        	call	_SPI_ReceiveData
 940  0141 85            	popw	x
 941  0142 f7            	ld	(x),a
 942                     ; 116     for (i = 0; i < len; i++) {
 944  0143 0c01          	inc	(OFST+0,sp)
 946  0145               L153:
 949  0145 7b01          	ld	a,(OFST+0,sp)
 950  0147 1107          	cp	a,(OFST+6,sp)
 951  0149 ae000a        	ldw	x,#10
 952  014c 25d0          	jrult	L543
 953                     ; 123 		delay(10);
 955  014e cd0000        	call	_delay
 957                     ; 124     cs_high();
 959  0151 cd0010        	call	_cs_high
 961                     ; 125 			delay(10);
 963  0154 ae000a        	ldw	x,#10
 964  0157 cd0000        	call	_delay
 966                     ; 126 }
 969  015a 85            	popw	x
 970  015b 81            	ret	
1046                     ; 128 void write_registerN(uint8_t reg, const uint8_t *buf, uint8_t len) {
1047                     	switch	.text
1048  015c               _write_registerN:
1050  015c 88            	push	a
1051  015d 88            	push	a
1052       00000001      OFST:	set	1
1055                     ; 129     uint8_t command = W_REGISTER | reg;
1057  015e aa20          	or	a,#32
1058  0160 6b01          	ld	(OFST+0,sp),a
1060                     ; 132     cs_low();
1062  0162 cd001a        	call	_cs_low
1064                     ; 133     SPI_SendData(command);
1066  0165 7b01          	ld	a,(OFST+0,sp)
1067  0167 cd0000        	call	_SPI_SendData
1070  016a               L134:
1071                     ; 134     while (SPI_GetFlagStatus(SPI_FLAG_TXE) == RESET);
1073  016a a602          	ld	a,#2
1074  016c cd0000        	call	_SPI_GetFlagStatus
1076  016f 4d            	tnz	a
1077  0170 27f8          	jreq	L134
1078                     ; 136     for (i = 0; i < len; i++) {
1080  0172 0f01          	clr	(OFST+0,sp)
1083  0174 2018          	jra	L144
1084  0176               L534:
1085                     ; 137         delay(10);
1087  0176 cd0000        	call	_delay
1089                     ; 138         SPI_SendData(buf[i]);
1091  0179 7b01          	ld	a,(OFST+0,sp)
1092  017b 5f            	clrw	x
1093  017c 97            	ld	xl,a
1094  017d 72fb05        	addw	x,(OFST+4,sp)
1095  0180 f6            	ld	a,(x)
1096  0181 cd0000        	call	_SPI_SendData
1099  0184               L744:
1100                     ; 139         while (SPI_GetFlagStatus(SPI_FLAG_TXE) == RESET);
1102  0184 a602          	ld	a,#2
1103  0186 cd0000        	call	_SPI_GetFlagStatus
1105  0189 4d            	tnz	a
1106  018a 27f8          	jreq	L744
1107                     ; 136     for (i = 0; i < len; i++) {
1109  018c 0c01          	inc	(OFST+0,sp)
1111  018e               L144:
1114  018e 7b01          	ld	a,(OFST+0,sp)
1115  0190 1107          	cp	a,(OFST+6,sp)
1116  0192 ae000a        	ldw	x,#10
1117  0195 25df          	jrult	L534
1118                     ; 141 		delay(10);
1120  0197 cd0000        	call	_delay
1122                     ; 142     cs_high();
1124  019a cd0010        	call	_cs_high
1126                     ; 143 			delay(10);
1128  019d ae000a        	ldw	x,#10
1129  01a0 cd0000        	call	_delay
1131                     ; 144 }
1134  01a3 85            	popw	x
1135  01a4 81            	ret	
1207                     ; 152 void tx_send(const uint8_t *data, uint8_t len) {
1208                     	switch	.text
1209  01a5               _tx_send:
1211  01a5 89            	pushw	x
1212  01a6 88            	push	a
1213       00000001      OFST:	set	1
1216                     ; 156     flush_tx();
1218  01a7 cd003e        	call	_flush_tx
1220                     ; 158     cs_low();
1222  01aa cd001a        	call	_cs_low
1224                     ; 159     SPI_SendData(W_TX_PAYLOAD);
1226  01ad a6a0          	ld	a,#160
1227  01af cd0000        	call	_SPI_SendData
1229                     ; 160 				delay(10);
1231  01b2 ae000a        	ldw	x,#10
1232  01b5 cd0000        	call	_delay
1235  01b8               L705:
1236                     ; 161     while (SPI_GetFlagStatus(SPI_FLAG_TXE) == RESET);
1238  01b8 a602          	ld	a,#2
1239  01ba cd0000        	call	_SPI_GetFlagStatus
1241  01bd 4d            	tnz	a
1242  01be 27f8          	jreq	L705
1243                     ; 162     for (i = 0; i < len; i++) {
1245  01c0 0f01          	clr	(OFST+0,sp)
1248  01c2 2018          	jra	L715
1249  01c4               L315:
1250                     ; 163         delay(10);
1252  01c4 cd0000        	call	_delay
1254                     ; 164         SPI_SendData(data[i]);
1256  01c7 7b01          	ld	a,(OFST+0,sp)
1257  01c9 5f            	clrw	x
1258  01ca 97            	ld	xl,a
1259  01cb 72fb02        	addw	x,(OFST+1,sp)
1260  01ce f6            	ld	a,(x)
1261  01cf cd0000        	call	_SPI_SendData
1264  01d2               L525:
1265                     ; 165         while (SPI_GetFlagStatus(SPI_FLAG_TXE) == RESET);
1267  01d2 a602          	ld	a,#2
1268  01d4 cd0000        	call	_SPI_GetFlagStatus
1270  01d7 4d            	tnz	a
1271  01d8 27f8          	jreq	L525
1272                     ; 162     for (i = 0; i < len; i++) {
1274  01da 0c01          	inc	(OFST+0,sp)
1276  01dc               L715:
1279  01dc 7b01          	ld	a,(OFST+0,sp)
1280  01de 1106          	cp	a,(OFST+5,sp)
1281  01e0 ae000a        	ldw	x,#10
1282  01e3 25df          	jrult	L315
1283                     ; 167     delay(10);
1285  01e5 cd0000        	call	_delay
1287                     ; 168     cs_high();
1289  01e8 cd0010        	call	_cs_high
1291                     ; 170     ce_high();
1293  01eb cd0024        	call	_ce_high
1295                     ; 171     delay(10);
1297  01ee ae000a        	ldw	x,#10
1298  01f1 cd0000        	call	_delay
1300                     ; 172     ce_low();
1302  01f4 cd002e        	call	_ce_low
1304  01f7               L135:
1305                     ; 175         status = read_register(STATUS_REGISTER);
1307  01f7 a607          	ld	a,#7
1308  01f9 cd007a        	call	_read_register
1310  01fc 6b01          	ld	(OFST+0,sp),a
1312                     ; 176     } while (!(status & (1 << 5)) && !(status & (1 << 4)));
1314  01fe a520          	bcp	a,#32
1315  0200 2604          	jrne	L735
1317  0202 a510          	bcp	a,#16
1318  0204 27f1          	jreq	L135
1319  0206               L735:
1320                     ; 178     write_register(STATUS_REGISTER, 0x70);
1322  0206 ae0770        	ldw	x,#1904
1323  0209 cd00c5        	call	_write_register
1325                     ; 179 }
1328  020c 5b03          	addw	sp,#3
1329  020e 81            	ret	
1389                     ; 181 void rx_read(uint8_t *buf, uint8_t len) {
1390                     	switch	.text
1391  020f               _rx_read:
1393  020f 89            	pushw	x
1394  0210 88            	push	a
1395       00000001      OFST:	set	1
1398                     ; 185     cs_low();
1400  0211 cd001a        	call	_cs_low
1402                     ; 186     SPI_SendData(R_RX_PAYLOAD);
1404  0214 a661          	ld	a,#97
1405  0216 cd0000        	call	_SPI_SendData
1407                     ; 187     delay(10);
1409  0219 ae000a        	ldw	x,#10
1410  021c cd0000        	call	_delay
1413  021f               L175:
1414                     ; 188     while (SPI_GetFlagStatus(SPI_FLAG_RXNE) == RESET);
1416  021f a601          	ld	a,#1
1417  0221 cd0000        	call	_SPI_GetFlagStatus
1419  0224 4d            	tnz	a
1420  0225 27f8          	jreq	L175
1421                     ; 189     SPI_ReceiveData();
1423  0227 cd0000        	call	_SPI_ReceiveData
1426  022a               L775:
1427                     ; 190     while (SPI_GetFlagStatus(SPI_FLAG_TXE) == RESET);
1429  022a a602          	ld	a,#2
1430  022c cd0000        	call	_SPI_GetFlagStatus
1432  022f 4d            	tnz	a
1433  0230 27f8          	jreq	L775
1434                     ; 191     for (i = 0; i < len; i++) {
1436  0232 0f01          	clr	(OFST+0,sp)
1439  0234 2021          	jra	L706
1440  0236               L306:
1441                     ; 192         delay(10);
1443  0236 ae000a        	ldw	x,#10
1444  0239 cd0000        	call	_delay
1446                     ; 193         SPI_SendData(0x00);
1448  023c 4f            	clr	a
1449  023d cd0000        	call	_SPI_SendData
1452  0240               L516:
1453                     ; 194         while (SPI_GetFlagStatus(SPI_FLAG_RXNE) == RESET);
1455  0240 a601          	ld	a,#1
1456  0242 cd0000        	call	_SPI_GetFlagStatus
1458  0245 4d            	tnz	a
1459  0246 27f8          	jreq	L516
1460                     ; 195         buf[i] = SPI_ReceiveData();
1462  0248 7b01          	ld	a,(OFST+0,sp)
1463  024a 5f            	clrw	x
1464  024b 97            	ld	xl,a
1465  024c 72fb02        	addw	x,(OFST+1,sp)
1466  024f 89            	pushw	x
1467  0250 cd0000        	call	_SPI_ReceiveData
1469  0253 85            	popw	x
1470  0254 f7            	ld	(x),a
1471                     ; 191     for (i = 0; i < len; i++) {
1473  0255 0c01          	inc	(OFST+0,sp)
1475  0257               L706:
1478  0257 7b01          	ld	a,(OFST+0,sp)
1479  0259 1106          	cp	a,(OFST+5,sp)
1480  025b 25d9          	jrult	L306
1481                     ; 197     cs_high();
1483  025d cd0010        	call	_cs_high
1485                     ; 199     write_register(STATUS_REGISTER, 0x70);
1487  0260 ae0770        	ldw	x,#1904
1488  0263 cd00c5        	call	_write_register
1490                     ; 200 }
1493  0266 5b03          	addw	sp,#3
1494  0268 81            	ret	
1521                     ; 206 void rx_init(void) {
1522                     	switch	.text
1523  0269               _rx_init:
1527                     ; 207     GPIO_Init(CSN_PIN, GPIO_MODE_OUT_PP_HIGH_FAST);
1529  0269 4bf0          	push	#240
1530  026b 4b10          	push	#16
1531  026d ae500a        	ldw	x,#20490
1532  0270 cd0000        	call	_GPIO_Init
1534  0273 85            	popw	x
1535                     ; 208     GPIO_Init(CE_PIN, GPIO_MODE_OUT_PP_HIGH_FAST);
1537  0274 4bf0          	push	#240
1538  0276 4b08          	push	#8
1539  0278 ae500a        	ldw	x,#20490
1540  027b cd0000        	call	_GPIO_Init
1542  027e 85            	popw	x
1543                     ; 211     write_register(CONFIG_REGISTER, DEFAULT_CONFIG_RX);
1545  027f ae000f        	ldw	x,#15
1546  0282 ad27          	call	LC002
1548                     ; 213     write_register(EN_AA_REGISTER, DEFAULT_EN_AA);
1550  0284 ae0101        	ldw	x,#257
1551  0287 ad22          	call	LC002
1553                     ; 215     write_register(EN_RXADDR_REGISTER, DEFAULT_EN_RXADDR);
1555  0289 ae0201        	ldw	x,#513
1556  028c ad1d          	call	LC002
1558                     ; 217     write_register(SETUP_AW_REGISTER, DEFAULT_SETUP_AW);
1560  028e ae0303        	ldw	x,#771
1561  0291 ad18          	call	LC002
1563                     ; 219     write_register(RF_CH_REGISTER, 120); 
1565  0293 ae0578        	ldw	x,#1400
1566  0296 ad13          	call	LC002
1568                     ; 221     write_register(RF_SETUP_REGISTER, DEFAULT_RF_SETUP);
1570  0298 ae0608        	ldw	x,#1544
1571  029b ad0e          	call	LC002
1573                     ; 223     write_register(STATUS_REGISTER, DEFAULT_STATUS);
1575  029d ae0770        	ldw	x,#1904
1576  02a0 ad09          	call	LC002
1578                     ; 225 		flush_tx();
1580  02a2 cd003e        	call	_flush_tx
1582                     ; 226 		delay(10);
1584  02a5 ae000a        	ldw	x,#10
1586                     ; 228 }
1589  02a8 cc0000        	jp	_delay
1590  02ab               LC002:
1591  02ab cd00c5        	call	_write_register
1593                     ; 224 		delay(10);
1595  02ae ae000a        	ldw	x,#10
1596  02b1 cc0000        	jp	_delay
1623                     ; 231 void tx_init(void) {
1624                     	switch	.text
1625  02b4               _tx_init:
1629                     ; 232     GPIO_Init(CSN_PIN, GPIO_MODE_OUT_PP_HIGH_FAST);
1631  02b4 4bf0          	push	#240
1632  02b6 4b10          	push	#16
1633  02b8 ae500a        	ldw	x,#20490
1634  02bb cd0000        	call	_GPIO_Init
1636  02be 85            	popw	x
1637                     ; 233     GPIO_Init(CE_PIN, GPIO_MODE_OUT_PP_HIGH_FAST);
1639  02bf 4bf0          	push	#240
1640  02c1 4b08          	push	#8
1641  02c3 ae500a        	ldw	x,#20490
1642  02c6 cd0000        	call	_GPIO_Init
1644  02c9 85            	popw	x
1645                     ; 235     write_register(CONFIG_REGISTER, DEFAULT_CONFIG_TX); 
1647  02ca ae000e        	ldw	x,#14
1648  02cd ad22          	call	LC003
1650                     ; 237     write_register(SETUP_AW_REGISTER, DEFAULT_SETUP_AW); 
1652  02cf ae0303        	ldw	x,#771
1653  02d2 ad1d          	call	LC003
1655                     ; 239     write_register(SETUP_RETR_REGISTER, DEFAULT_SETUP_RETR); 
1657  02d4 ae0401        	ldw	x,#1025
1658  02d7 ad18          	call	LC003
1660                     ; 241     write_register(RF_CH_REGISTER, 120); 
1662  02d9 ae0578        	ldw	x,#1400
1663  02dc ad13          	call	LC003
1665                     ; 243     write_register(RF_SETUP_REGISTER, DEFAULT_RF_SETUP); 
1667  02de ae0608        	ldw	x,#1544
1668  02e1 ad0e          	call	LC003
1670                     ; 245     write_register(STATUS_REGISTER, DEFAULT_STATUS);
1672  02e3 ae0770        	ldw	x,#1904
1673  02e6 ad09          	call	LC003
1675                     ; 247 	flush_tx();
1677  02e8 cd003e        	call	_flush_tx
1679                     ; 248 	delay(10);
1681  02eb ae000a        	ldw	x,#10
1683                     ; 249 }
1686  02ee cc0000        	jp	_delay
1687  02f1               LC003:
1688  02f1 cd00c5        	call	_write_register
1690                     ; 246 	delay(10);
1692  02f4 ae000a        	ldw	x,#10
1693  02f7 cc0000        	jp	_delay
1719                     ; 252 void nrf_deinit(void)
1719                     ; 253 {
1720                     	switch	.text
1721  02fa               _nrf_deinit:
1725                     ; 254 		GPIO_DeInit(GPIOC);
1727  02fa ae500a        	ldw	x,#20490
1728  02fd cd0000        	call	_GPIO_DeInit
1730                     ; 256     write_register(CONFIG_REGISTER, RESET_CONFIG); 
1732  0300 ae0008        	ldw	x,#8
1733  0303 ad20          	call	LC004
1735                     ; 258     write_register(SETUP_AW_REGISTER, RESET_SETUP_AW); 
1737  0305 ae0303        	ldw	x,#771
1738  0308 ad1b          	call	LC004
1740                     ; 260     write_register(SETUP_RETR_REGISTER, RESET_SETUP_RETR); 
1742  030a ae0403        	ldw	x,#1027
1743  030d ad16          	call	LC004
1745                     ; 262     write_register(RF_CH_REGISTER, RESET_RF_CH); 
1747  030f ae0502        	ldw	x,#1282
1748  0312 ad11          	call	LC004
1750                     ; 264     write_register(RF_SETUP_REGISTER, RESET_RF_SETUP); 
1752  0314 ae060f        	ldw	x,#1551
1753  0317 ad0c          	call	LC004
1755                     ; 266     write_register(STATUS_REGISTER, RESET_STATUS);
1757  0319 ae0770        	ldw	x,#1904
1758  031c cd00c5        	call	_write_register
1760                     ; 267 		delay(10);
1762  031f ae000a        	ldw	x,#10
1764                     ; 269 }
1767  0322 cc0000        	jp	_delay
1768  0325               LC004:
1769  0325 cd00c5        	call	_write_register
1771                     ; 265     delay(10);
1773  0328 ae000a        	ldw	x,#10
1774  032b cc0000        	jp	_delay
1810                     ; 272 uint8_t test_tx(void) {
1811                     	switch	.text
1812  032e               _test_tx:
1814  032e 88            	push	a
1815       00000001      OFST:	set	1
1818                     ; 275     reg = read_register(STATUS_REGISTER);
1820  032f a607          	ld	a,#7
1821  0331 cd007a        	call	_read_register
1823  0334 6b01          	ld	(OFST+0,sp),a
1825                     ; 276 		delay(10);
1827  0336 ae000a        	ldw	x,#10
1828  0339 cd0000        	call	_delay
1830                     ; 277     delay(10);
1832  033c ae000a        	ldw	x,#10
1833  033f cd0000        	call	_delay
1835                     ; 278     if (reg != 0x0e) {
1837  0342 7b01          	ld	a,(OFST+0,sp)
1838  0344 a10e          	cp	a,#14
1839  0346 2702          	jreq	L766
1840                     ; 279         return 1;
1842  0348 206b          	jp	LC005
1843  034a               L766:
1844                     ; 282 		reg = read_register(CONFIG_REGISTER);
1846  034a 4f            	clr	a
1847  034b cd007a        	call	_read_register
1849  034e 6b01          	ld	(OFST+0,sp),a
1851                     ; 283     delay(10);
1853  0350 ae000a        	ldw	x,#10
1854  0353 cd0000        	call	_delay
1856                     ; 284     if (reg != DEFAULT_CONFIG_TX) {
1858  0356 7b01          	ld	a,(OFST+0,sp)
1859  0358 a10e          	cp	a,#14
1860  035a 2702          	jreq	L176
1861                     ; 285         return 1;
1863  035c 2057          	jp	LC005
1864  035e               L176:
1865                     ; 288     reg = read_register(SETUP_AW_REGISTER);
1867  035e a603          	ld	a,#3
1868  0360 cd007a        	call	_read_register
1870  0363 6b01          	ld	(OFST+0,sp),a
1872                     ; 289     delay(10);
1874  0365 ae000a        	ldw	x,#10
1875  0368 cd0000        	call	_delay
1877                     ; 290     if (reg != DEFAULT_SETUP_AW) {
1879  036b 7b01          	ld	a,(OFST+0,sp)
1880  036d a103          	cp	a,#3
1881  036f 2702          	jreq	L376
1882                     ; 291         return 1;
1884  0371 2042          	jp	LC005
1885  0373               L376:
1886                     ; 294     reg = read_register(SETUP_RETR_REGISTER);
1888  0373 a604          	ld	a,#4
1889  0375 cd007a        	call	_read_register
1891  0378 6b01          	ld	(OFST+0,sp),a
1893                     ; 295     delay(10);
1895  037a ae000a        	ldw	x,#10
1896  037d cd0000        	call	_delay
1898                     ; 296     if (reg != DEFAULT_SETUP_RETR) {
1900  0380 7b01          	ld	a,(OFST+0,sp)
1901  0382 4a            	dec	a
1902  0383 2702          	jreq	L576
1903                     ; 297         return 1;
1905  0385 202e          	jp	LC005
1906  0387               L576:
1907                     ; 300     reg = read_register(RF_CH_REGISTER);
1909  0387 a605          	ld	a,#5
1910  0389 cd007a        	call	_read_register
1912  038c 6b01          	ld	(OFST+0,sp),a
1914                     ; 301     delay(10);
1916  038e ae000a        	ldw	x,#10
1917  0391 cd0000        	call	_delay
1919                     ; 302     if (reg != 120) {
1921  0394 7b01          	ld	a,(OFST+0,sp)
1922  0396 a178          	cp	a,#120
1923  0398 2702          	jreq	L776
1924                     ; 303         return 1;
1926  039a 2019          	jp	LC005
1927  039c               L776:
1928                     ; 306     reg = read_register(RF_SETUP_REGISTER);
1930  039c a606          	ld	a,#6
1931  039e cd007a        	call	_read_register
1933  03a1 6b01          	ld	(OFST+0,sp),a
1935                     ; 307     delay(10);
1937  03a3 ae000a        	ldw	x,#10
1938  03a6 cd0000        	call	_delay
1940                     ; 308     if (reg != DEFAULT_RF_SETUP) {
1942  03a9 7b01          	ld	a,(OFST+0,sp)
1943  03ab a108          	cp	a,#8
1944  03ad 2702          	jreq	L107
1945                     ; 309         return 1;
1947  03af 2004          	jp	LC005
1948  03b1               L107:
1949                     ; 312     return 0;
1951  03b1 4f            	clr	a
1954  03b2 5b01          	addw	sp,#1
1955  03b4 81            	ret	
1956  03b5               LC005:
1957  03b5 a601          	ld	a,#1
1958                     ; 309         return 1;
1960  03b7 5b01          	addw	sp,#1
1961  03b9 81            	ret	
1997                     ; 315 uint8_t test_rx(void) {
1998                     	switch	.text
1999  03ba               _test_rx:
2001  03ba 88            	push	a
2002       00000001      OFST:	set	1
2005                     ; 318     reg = read_register(CONFIG_REGISTER);
2007  03bb 4f            	clr	a
2008  03bc cd007a        	call	_read_register
2010  03bf 6b01          	ld	(OFST+0,sp),a
2012                     ; 319     delay(10);
2014  03c1 ae000a        	ldw	x,#10
2015  03c4 cd0000        	call	_delay
2017                     ; 320     if (reg != DEFAULT_CONFIG_RX) {
2019  03c7 7b01          	ld	a,(OFST+0,sp)
2020  03c9 a10f          	cp	a,#15
2021  03cb 2702          	jreq	L127
2022                     ; 321         return 1;
2024  03cd 2070          	jp	LC006
2025  03cf               L127:
2026                     ; 324     reg = read_register(EN_AA_REGISTER);
2028  03cf a601          	ld	a,#1
2029  03d1 cd007a        	call	_read_register
2031  03d4 6b01          	ld	(OFST+0,sp),a
2033                     ; 325     delay(10);
2035  03d6 ae000a        	ldw	x,#10
2036  03d9 cd0000        	call	_delay
2038                     ; 326     if (reg != DEFAULT_EN_AA) {
2040  03dc 7b01          	ld	a,(OFST+0,sp)
2041  03de 4a            	dec	a
2042  03df 2702          	jreq	L327
2043                     ; 327         return 1;
2045  03e1 205c          	jp	LC006
2046  03e3               L327:
2047                     ; 330     reg = read_register(EN_RXADDR_REGISTER);
2049  03e3 a602          	ld	a,#2
2050  03e5 cd007a        	call	_read_register
2052  03e8 6b01          	ld	(OFST+0,sp),a
2054                     ; 331     if (reg != DEFAULT_EN_RXADDR) {
2056  03ea 4a            	dec	a
2057  03eb 2702          	jreq	L527
2058                     ; 332         return 1;
2060  03ed 2050          	jp	LC006
2061  03ef               L527:
2062                     ; 335     reg = read_register(SETUP_AW_REGISTER);
2064  03ef a603          	ld	a,#3
2065  03f1 cd007a        	call	_read_register
2067  03f4 6b01          	ld	(OFST+0,sp),a
2069                     ; 336     delay(10);
2071  03f6 ae000a        	ldw	x,#10
2072  03f9 cd0000        	call	_delay
2074                     ; 337     if (reg != DEFAULT_SETUP_AW) {
2076  03fc 7b01          	ld	a,(OFST+0,sp)
2077  03fe a103          	cp	a,#3
2078  0400 2702          	jreq	L727
2079                     ; 338         return 1;
2081  0402 203b          	jp	LC006
2082  0404               L727:
2083                     ; 341     reg = read_register(RF_CH_REGISTER);
2085  0404 a605          	ld	a,#5
2086  0406 cd007a        	call	_read_register
2088  0409 6b01          	ld	(OFST+0,sp),a
2090                     ; 342     delay(10);
2092  040b ae000a        	ldw	x,#10
2093  040e cd0000        	call	_delay
2095                     ; 343     if (reg != 120) {
2097  0411 7b01          	ld	a,(OFST+0,sp)
2098  0413 a178          	cp	a,#120
2099  0415 2702          	jreq	L137
2100                     ; 344         return 1;
2102  0417 2026          	jp	LC006
2103  0419               L137:
2104                     ; 347     reg = read_register(RF_SETUP_REGISTER);
2106  0419 a606          	ld	a,#6
2107  041b cd007a        	call	_read_register
2109  041e 6b01          	ld	(OFST+0,sp),a
2111                     ; 348     delay(10);
2113  0420 ae000a        	ldw	x,#10
2114  0423 cd0000        	call	_delay
2116                     ; 349     if (reg != DEFAULT_RF_SETUP) {
2118  0426 7b01          	ld	a,(OFST+0,sp)
2119  0428 a108          	cp	a,#8
2120  042a 2702          	jreq	L337
2121                     ; 350         return 1;
2123  042c 2011          	jp	LC006
2124  042e               L337:
2125                     ; 353     reg = read_register(STATUS_REGISTER);
2127  042e a607          	ld	a,#7
2128  0430 cd007a        	call	_read_register
2130  0433 6b01          	ld	(OFST+0,sp),a
2132                     ; 354     if (reg != 0x0e) {
2134  0435 a10e          	cp	a,#14
2135  0437 2702          	jreq	L537
2136                     ; 355         return 1;
2138  0439 2004          	jp	LC006
2139  043b               L537:
2140                     ; 357 	return 0;
2142  043b 4f            	clr	a
2145  043c 5b01          	addw	sp,#1
2146  043e 81            	ret	
2147  043f               LC006:
2148  043f a601          	ld	a,#1
2149                     ; 355         return 1;
2151  0441 5b01          	addw	sp,#1
2152  0443 81            	ret	
2187                     	switch	.ubsct
2188  0000               _rxaddr:
2189  0000 0000          	ds.b	2
2190                     	xdef	_rxaddr
2191  0002               _txaddr:
2192  0002 0000          	ds.b	2
2193                     	xdef	_txaddr
2194                     	xdef	_test_rx
2195                     	xdef	_test_tx
2196                     	xdef	_SPI_DeInit_NRF
2197                     	xdef	_SPI_Init_NRF
2198                     	xdef	_rx_read
2199                     	xdef	_tx_send
2200                     	xdef	_nrf_deinit
2201                     	xdef	_rx_init
2202                     	xdef	_tx_init
2203                     	xdef	_write_registerN
2204                     	xdef	_read_registerN
2205                     	xdef	_write_register
2206                     	xdef	_read_register
2207                     	xdef	_reset_status
2208                     	xdef	_flush_tx
2209                     	xdef	_flush_rx
2210                     	xdef	_ce_low
2211                     	xdef	_ce_high
2212                     	xdef	_cs_low
2213                     	xdef	_cs_high
2214                     	xdef	_delay
2215                     	xref	_SPI_GetFlagStatus
2216                     	xref	_SPI_ReceiveData
2217                     	xref	_SPI_SendData
2218                     	xref	_SPI_Cmd
2219                     	xref	_SPI_Init
2220                     	xref	_SPI_DeInit
2221                     	xref	_GPIO_WriteLow
2222                     	xref	_GPIO_WriteHigh
2223                     	xref	_GPIO_Init
2224                     	xref	_GPIO_DeInit
2244                     	end
