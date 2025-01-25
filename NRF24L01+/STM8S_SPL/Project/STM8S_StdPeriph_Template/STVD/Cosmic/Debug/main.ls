   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.3 - 22 Aug 2024
   4                     ; Optimizer V4.6.3 - 22 Aug 2024
  71                     ; 10 void delay(uint16_t n) {
  73                     .text:	section	.text,new
  74  0000               _delay:
  76  0000 89            	pushw	x
  77  0001 89            	pushw	x
  78       00000002      OFST:	set	2
  81                     ; 11 	uint16_t i =0;
  83                     ; 12     for(i = 0; i < n; i++) {
  85  0002 5f            	clrw	x
  87  0003 2002          	jra	L73
  88  0005               L33:
  89                     ; 13         __asm("nop");  // ??????? ???????????? ??????? NOP
  92  0005 9d            	nop	
  94                     ; 12     for(i = 0; i < n; i++) {
  96  0006 5c            	incw	x
  97  0007               L73:
  98  0007 1f01          	ldw	(OFST-1,sp),x
 102  0009 1303          	cpw	x,(OFST+1,sp)
 103  000b 25f8          	jrult	L33
 104                     ; 15 }
 107  000d 5b04          	addw	sp,#4
 108  000f 81            	ret	
 132                     ; 19 static void cs_high(void) {
 133                     .text:	section	.text,new
 134  0000               L34_cs_high:
 138                     ; 20     GPIO_WriteHigh(GPIOC, GPIO_PIN_4); // CSN ?? PC4
 140  0000 4b10          	push	#16
 141  0002 ae500a        	ldw	x,#20490
 142  0005 cd0000        	call	_GPIO_WriteHigh
 144  0008 84            	pop	a
 145                     ; 21 }
 148  0009 81            	ret	
 172                     ; 23 static void cs_low(void) {
 173                     .text:	section	.text,new
 174  0000               L55_cs_low:
 178                     ; 24     GPIO_WriteLow(GPIOC, GPIO_PIN_4); // CSN ?? PC4
 180  0000 4b10          	push	#16
 181  0002 ae500a        	ldw	x,#20490
 182  0005 cd0000        	call	_GPIO_WriteLow
 184  0008 84            	pop	a
 185                     ; 25 }
 188  0009 81            	ret	
 212                     ; 28 static void ce_high(void) {
 213                     .text:	section	.text,new
 214  0000               L76_ce_high:
 218                     ; 29     GPIO_WriteHigh(GPIOC, GPIO_PIN_3); // CE ?? PC3
 220  0000 4b08          	push	#8
 221  0002 ae500a        	ldw	x,#20490
 222  0005 cd0000        	call	_GPIO_WriteHigh
 224  0008 84            	pop	a
 225                     ; 30 }
 228  0009 81            	ret	
 252                     ; 32 static void ce_low(void) {
 253                     .text:	section	.text,new
 254  0000               L101_ce_low:
 258                     ; 33     GPIO_WriteLow(GPIOC, GPIO_PIN_3); // CE ?? PC3
 260  0000 4b08          	push	#8
 261  0002 ae500a        	ldw	x,#20490
 262  0005 cd0000        	call	_GPIO_WriteLow
 264  0008 84            	pop	a
 265                     ; 34 }
 268  0009 81            	ret	
 327                     ; 37 uint8_t nrf24l01p_read_register(uint8_t reg) {
 328                     .text:	section	.text,new
 329  0000               _nrf24l01p_read_register:
 331  0000 88            	push	a
 332       00000001      OFST:	set	1
 335                     ; 38     uint8_t command = NRF24L01_CMD_R_REGISTER | reg;
 337  0001 6b01          	ld	(OFST+0,sp),a
 339                     ; 39     uint8_t data = 0;
 341                     ; 41     cs_low();
 343  0003 cd0000        	call	L55_cs_low
 345                     ; 42     SPI_SendData(command);
 347  0006 7b01          	ld	a,(OFST+0,sp)
 348  0008 ad39          	call	LC001
 350                     ; 43 					delay(10);
 351  000a               L341:
 352                     ; 44     while (SPI_GetFlagStatus(SPI_FLAG_TXE) == RESET); // ???????? ???????? ???????
 354  000a a602          	ld	a,#2
 355  000c cd0000        	call	_SPI_GetFlagStatus
 357  000f 4d            	tnz	a
 358  0010 27f8          	jreq	L341
 360  0012               L151:
 361                     ; 45     while (SPI_GetFlagStatus(SPI_FLAG_RXNE) == RESET); // ???????? ????????? ??????
 363  0012 a601          	ld	a,#1
 364  0014 cd0000        	call	_SPI_GetFlagStatus
 366  0017 4d            	tnz	a
 367  0018 27f8          	jreq	L151
 368                     ; 46     data = SPI_ReceiveData();
 370  001a cd0000        	call	_SPI_ReceiveData
 372                     ; 47 		delay(10);
 374  001d ae000a        	ldw	x,#10
 375  0020 cd0000        	call	_delay
 377                     ; 48 		 SPI_SendData(0x0);
 379  0023 4f            	clr	a
 380  0024 ad1d          	call	LC001
 382                     ; 49 		 		 delay(10);
 383  0026               L751:
 384                     ; 50 		 while (SPI_GetFlagStatus(SPI_FLAG_TXE) == RESET); 
 386  0026 a602          	ld	a,#2
 387  0028 cd0000        	call	_SPI_GetFlagStatus
 389  002b 4d            	tnz	a
 390  002c 27f8          	jreq	L751
 392  002e               L561:
 393                     ; 51 		 while (SPI_GetFlagStatus(SPI_FLAG_RXNE) == RESET); // ???????? ????????? ??????
 395  002e a601          	ld	a,#1
 396  0030 cd0000        	call	_SPI_GetFlagStatus
 398  0033 4d            	tnz	a
 399  0034 27f8          	jreq	L561
 400                     ; 52 		data = SPI_ReceiveData();
 402  0036 cd0000        	call	_SPI_ReceiveData
 404  0039 6b01          	ld	(OFST+0,sp),a
 406                     ; 54 cs_high();
 408  003b cd0000        	call	L34_cs_high
 410                     ; 56     return data;
 412  003e 7b01          	ld	a,(OFST+0,sp)
 415  0040 5b01          	addw	sp,#1
 416  0042 81            	ret	
 417  0043               LC001:
 418  0043 cd0000        	call	_SPI_SendData
 420                     ; 49 		 		 delay(10);
 422  0046 ae000a        	ldw	x,#10
 423  0049 cc0000        	jp	_delay
 481                     ; 60 void nrf24l01p_write_register(uint8_t reg, uint8_t value) {
 482                     .text:	section	.text,new
 483  0000               _nrf24l01p_write_register:
 485  0000 89            	pushw	x
 486  0001 88            	push	a
 487       00000001      OFST:	set	1
 490                     ; 61     uint8_t command = NRF24L01_CMD_W_REGISTER | reg;
 492  0002 9e            	ld	a,xh
 493  0003 aa20          	or	a,#32
 494  0005 6b01          	ld	(OFST+0,sp),a
 496                     ; 63     cs_low();
 498  0007 cd0000        	call	L55_cs_low
 500                     ; 64     SPI_SendData(command);
 502  000a 7b01          	ld	a,(OFST+0,sp)
 503  000c cd0000        	call	_SPI_SendData
 506  000f               L122:
 507                     ; 65     while (SPI_GetFlagStatus(SPI_FLAG_TXE) == RESET);
 509  000f a602          	ld	a,#2
 510  0011 cd0000        	call	_SPI_GetFlagStatus
 512  0014 4d            	tnz	a
 513  0015 27f8          	jreq	L122
 514                     ; 66     SPI_SendData(value);
 516  0017 7b03          	ld	a,(OFST+2,sp)
 517  0019 cd0000        	call	_SPI_SendData
 520  001c               L722:
 521                     ; 67     while (SPI_GetFlagStatus(SPI_FLAG_TXE) == RESET);
 523  001c a602          	ld	a,#2
 524  001e cd0000        	call	_SPI_GetFlagStatus
 526  0021 4d            	tnz	a
 527  0022 27f8          	jreq	L722
 528                     ; 68 		delay(10);
 530  0024 ae000a        	ldw	x,#10
 531  0027 cd0000        	call	_delay
 533                     ; 69     cs_high();
 535  002a cd0000        	call	L34_cs_high
 537                     ; 70 }
 540  002d 5b03          	addw	sp,#3
 541  002f 81            	ret	
 619                     ; 72 void nrf24l01p_read_registerN(uint8_t reg, uint8_t *buf, uint8_t len) {
 620                     .text:	section	.text,new
 621  0000               _nrf24l01p_read_registerN:
 623  0000 88            	push	a
 624  0001 88            	push	a
 625       00000001      OFST:	set	1
 628                     ; 73     uint8_t command = NRF24L01_CMD_R_REGISTER | reg;
 630  0002 6b01          	ld	(OFST+0,sp),a
 632                     ; 76     cs_low(); // ???????? CSN
 634  0004 cd0000        	call	L55_cs_low
 636                     ; 79     SPI_SendData(command);
 638  0007 7b01          	ld	a,(OFST+0,sp)
 639  0009 cd0000        	call	_SPI_SendData
 642  000c               L372:
 643                     ; 80     while (SPI_GetFlagStatus(SPI_FLAG_TXE) == RESET); // ???????? ?????????? ????????
 645  000c a602          	ld	a,#2
 646  000e cd0000        	call	_SPI_GetFlagStatus
 648  0011 4d            	tnz	a
 649  0012 27f8          	jreq	L372
 650                     ; 81 		delay(20);
 652  0014 ae0014        	ldw	x,#20
 653  0017 cd0000        	call	_delay
 656  001a               L103:
 657                     ; 82     while (SPI_GetFlagStatus(SPI_FLAG_RXNE) == RESET); // ???????? ????????? ??????
 659  001a a601          	ld	a,#1
 660  001c cd0000        	call	_SPI_GetFlagStatus
 662  001f 4d            	tnz	a
 663  0020 27f8          	jreq	L103
 664                     ; 83 		SPI_ReceiveData(); // ??????? ?????????? "????????" ?????? (???? ????)
 666  0022 cd0000        	call	_SPI_ReceiveData
 668                     ; 85     for (i = 0; i < len; i++) {
 670  0025 0f01          	clr	(OFST+0,sp)
 673  0027 2030          	jra	L113
 674  0029               L503:
 675                     ; 86 			delay(10);
 677  0029 ae000a        	ldw	x,#10
 678  002c cd0000        	call	_delay
 680                     ; 87         SPI_SendData(0xFF); // ????????? ???????? (0xFF) ??? ??????
 682  002f a6ff          	ld	a,#255
 683  0031 cd0000        	call	_SPI_SendData
 686  0034               L713:
 687                     ; 88         while (SPI_GetFlagStatus(SPI_FLAG_TXE) == RESET); // ???????? ?????????? ????????
 689  0034 a602          	ld	a,#2
 690  0036 cd0000        	call	_SPI_GetFlagStatus
 692  0039 4d            	tnz	a
 693  003a 27f8          	jreq	L713
 694                     ; 89 				delay(10);
 696  003c ae000a        	ldw	x,#10
 697  003f cd0000        	call	_delay
 700  0042               L523:
 701                     ; 90         while (SPI_GetFlagStatus(SPI_FLAG_RXNE) == RESET); // ???????? ????????? ??????
 703  0042 a601          	ld	a,#1
 704  0044 cd0000        	call	_SPI_GetFlagStatus
 706  0047 4d            	tnz	a
 707  0048 27f8          	jreq	L523
 708                     ; 91         buf[i] = SPI_ReceiveData(); // ????????? ???????? ?????? ? ?????
 710  004a 7b01          	ld	a,(OFST+0,sp)
 711  004c 5f            	clrw	x
 712  004d 97            	ld	xl,a
 713  004e 72fb05        	addw	x,(OFST+4,sp)
 714  0051 89            	pushw	x
 715  0052 cd0000        	call	_SPI_ReceiveData
 717  0055 85            	popw	x
 718  0056 f7            	ld	(x),a
 719                     ; 85     for (i = 0; i < len; i++) {
 721  0057 0c01          	inc	(OFST+0,sp)
 723  0059               L113:
 726  0059 7b01          	ld	a,(OFST+0,sp)
 727  005b 1107          	cp	a,(OFST+6,sp)
 728  005d 25ca          	jrult	L503
 729                     ; 94     cs_high(); // ??????? CSN
 731  005f cd0000        	call	L34_cs_high
 733                     ; 95 }
 736  0062 85            	popw	x
 737  0063 81            	ret	
 814                     ; 99 void nrf24l01p_write_registerN(uint8_t reg, const uint8_t *buf, uint8_t len) {
 815                     .text:	section	.text,new
 816  0000               _nrf24l01p_write_registerN:
 818  0000 88            	push	a
 819  0001 88            	push	a
 820       00000001      OFST:	set	1
 823                     ; 100     uint8_t command = NRF24L01_CMD_W_REGISTER | reg;
 825  0002 aa20          	or	a,#32
 826  0004 6b01          	ld	(OFST+0,sp),a
 828                     ; 103     cs_low();
 830  0006 cd0000        	call	L55_cs_low
 832                     ; 104     SPI_SendData(command);
 834  0009 7b01          	ld	a,(OFST+0,sp)
 835  000b cd0000        	call	_SPI_SendData
 838  000e               L173:
 839                     ; 105     while (SPI_GetFlagStatus(SPI_FLAG_TXE) == RESET);
 841  000e a602          	ld	a,#2
 842  0010 cd0000        	call	_SPI_GetFlagStatus
 844  0013 4d            	tnz	a
 845  0014 27f8          	jreq	L173
 846                     ; 106 		delay(10);
 848  0016 ae000a        	ldw	x,#10
 849  0019 cd0000        	call	_delay
 851                     ; 107     for (i = 0; i < len; i++) {
 853  001c 0f01          	clr	(OFST+0,sp)
 856  001e 2018          	jra	L104
 857  0020               L573:
 858                     ; 108 			delay(10);
 860  0020 cd0000        	call	_delay
 862                     ; 109         SPI_SendData(buf[i]);
 864  0023 7b01          	ld	a,(OFST+0,sp)
 865  0025 5f            	clrw	x
 866  0026 97            	ld	xl,a
 867  0027 72fb05        	addw	x,(OFST+4,sp)
 868  002a f6            	ld	a,(x)
 869  002b cd0000        	call	_SPI_SendData
 872  002e               L704:
 873                     ; 110         while (SPI_GetFlagStatus(SPI_FLAG_TXE) == RESET);
 875  002e a602          	ld	a,#2
 876  0030 cd0000        	call	_SPI_GetFlagStatus
 878  0033 4d            	tnz	a
 879  0034 27f8          	jreq	L704
 880                     ; 107     for (i = 0; i < len; i++) {
 882  0036 0c01          	inc	(OFST+0,sp)
 884  0038               L104:
 887  0038 7b01          	ld	a,(OFST+0,sp)
 888  003a 1107          	cp	a,(OFST+6,sp)
 889  003c ae000a        	ldw	x,#10
 890  003f 25df          	jrult	L573
 891                     ; 112 	delay(10);
 893  0041 cd0000        	call	_delay
 895                     ; 113     cs_high();
 897  0044 cd0000        	call	L34_cs_high
 899                     ; 114 }
 902  0047 85            	popw	x
 903  0048 81            	ret	
 930                     ; 115 		void nrf24l01p_flush_tx(void) {
 931                     .text:	section	.text,new
 932  0000               _nrf24l01p_flush_tx:
 936                     ; 116     cs_low();                  // ?????????? CSN (?????? SPI ????????)
 938  0000 cd0000        	call	L55_cs_low
 940                     ; 117     SPI_SendData(0xE1); // ?????????? ??????? FLUSH_TX
 942  0003 a6e1          	ld	a,#225
 943  0005 cd0000        	call	_SPI_SendData
 945                     ; 118 		delay(10);
 947  0008 ae000a        	ldw	x,#10
 948  000b cd0000        	call	_delay
 950                     ; 119     cs_high();                 // ???????????? CSN (????? SPI ????????)
 953                     ; 120 }
 956  000e cc0000        	jp	L34_cs_high
1028                     ; 122 void nrf24l01p_tx_send(const uint8_t *data, uint8_t len) {
1029                     .text:	section	.text,new
1030  0000               _nrf24l01p_tx_send:
1032  0000 89            	pushw	x
1033  0001 88            	push	a
1034       00000001      OFST:	set	1
1037                     ; 127     nrf24l01p_flush_tx();
1039  0002 cd0000        	call	_nrf24l01p_flush_tx
1041                     ; 130     cs_low();
1043  0005 cd0000        	call	L55_cs_low
1045                     ; 131     SPI_SendData(NRF24L01_CMD_W_TX_PAYLOAD);
1047  0008 a6a0          	ld	a,#160
1048  000a cd0000        	call	_SPI_SendData
1051  000d               L754:
1052                     ; 132     while (SPI_GetFlagStatus(SPI_FLAG_TXE) == RESET);
1054  000d a602          	ld	a,#2
1055  000f cd0000        	call	_SPI_GetFlagStatus
1057  0012 4d            	tnz	a
1058  0013 27f8          	jreq	L754
1059                     ; 135     for (i = 0; i < len; i++) {
1061  0015 0f01          	clr	(OFST+0,sp)
1064  0017 2018          	jra	L764
1065  0019               L364:
1066                     ; 136 			delay(10);
1068  0019 cd0000        	call	_delay
1070                     ; 137         SPI_SendData(data[i]);
1072  001c 7b01          	ld	a,(OFST+0,sp)
1073  001e 5f            	clrw	x
1074  001f 97            	ld	xl,a
1075  0020 72fb02        	addw	x,(OFST+1,sp)
1076  0023 f6            	ld	a,(x)
1077  0024 cd0000        	call	_SPI_SendData
1080  0027               L574:
1081                     ; 138         while (SPI_GetFlagStatus(SPI_FLAG_TXE) == RESET);
1083  0027 a602          	ld	a,#2
1084  0029 cd0000        	call	_SPI_GetFlagStatus
1086  002c 4d            	tnz	a
1087  002d 27f8          	jreq	L574
1088                     ; 135     for (i = 0; i < len; i++) {
1090  002f 0c01          	inc	(OFST+0,sp)
1092  0031               L764:
1095  0031 7b01          	ld	a,(OFST+0,sp)
1096  0033 1106          	cp	a,(OFST+5,sp)
1097  0035 ae000a        	ldw	x,#10
1098  0038 25df          	jrult	L364
1099                     ; 140 		delay(10);
1101  003a cd0000        	call	_delay
1103                     ; 141     cs_high();
1105  003d cd0000        	call	L34_cs_high
1107                     ; 142 	delay(10);
1109  0040 ae000a        	ldw	x,#10
1110  0043 cd0000        	call	_delay
1112                     ; 144     ce_high();
1114  0046 cd0000        	call	L76_ce_high
1116                     ; 145     delay(10);  // ???????? ???????? ??? ????????
1118  0049 ae000a        	ldw	x,#10
1119  004c cd0000        	call	_delay
1121                     ; 146     ce_low();
1123  004f cd0000        	call	L101_ce_low
1125  0052               L105:
1126                     ; 150         status = nrf24l01p_read_register(0x07);  // ?????? ????????? ???????
1128  0052 a607          	ld	a,#7
1129  0054 cd0000        	call	_nrf24l01p_read_register
1131  0057 6b01          	ld	(OFST+0,sp),a
1133                     ; 151     } while (!(status & (1 << 5)) && !(status & (1 << 4)));  // ????, ???? TX_DS (??? 5) ??? MAX_RT (??? 4) ?? ???????????
1135  0059 a520          	bcp	a,#32
1136  005b 2604          	jrne	L705
1138  005d a510          	bcp	a,#16
1139  005f 27f1          	jreq	L105
1140  0061               L705:
1141                     ; 154     nrf24l01p_write_register(0x07, 0x70); // Clear status flags
1143  0061 ae0770        	ldw	x,#1904
1144  0064 cd0000        	call	_nrf24l01p_write_register
1146                     ; 155 }
1149  0067 5b03          	addw	sp,#3
1150  0069 81            	ret	
1176                     ; 158 void SPI_Init_NRF(void) {
1177                     .text:	section	.text,new
1178  0000               _SPI_Init_NRF:
1182                     ; 159     GPIO_Init(GPIOC, GPIO_PIN_5, GPIO_MODE_OUT_PP_HIGH_FAST); // SCK
1184  0000 4bf0          	push	#240
1185  0002 4b20          	push	#32
1186  0004 ae500a        	ldw	x,#20490
1187  0007 cd0000        	call	_GPIO_Init
1189  000a 85            	popw	x
1190                     ; 160     GPIO_Init(GPIOC, GPIO_PIN_6, GPIO_MODE_OUT_PP_HIGH_FAST); // MOSI
1192  000b 4bf0          	push	#240
1193  000d 4b40          	push	#64
1194  000f ae500a        	ldw	x,#20490
1195  0012 cd0000        	call	_GPIO_Init
1197  0015 85            	popw	x
1198                     ; 161     GPIO_Init(GPIOC, GPIO_PIN_7, GPIO_MODE_IN_PU_NO_IT);      // MISO
1200  0016 4b40          	push	#64
1201  0018 4b80          	push	#128
1202  001a ae500a        	ldw	x,#20490
1203  001d cd0000        	call	_GPIO_Init
1205  0020 85            	popw	x
1206                     ; 163     SPI_Init(SPI_FIRSTBIT_MSB, SPI_BAUDRATEPRESCALER_8, SPI_MODE_MASTER,
1206                     ; 164              SPI_CLOCKPOLARITY_LOW, SPI_CLOCKPHASE_1EDGE, SPI_DATADIRECTION_2LINES_FULLDUPLEX,
1206                     ; 165              SPI_NSS_SOFT, 0x07);
1208  0021 4b07          	push	#7
1209  0023 4b02          	push	#2
1210  0025 4b00          	push	#0
1211  0027 4b00          	push	#0
1212  0029 4b00          	push	#0
1213  002b 4b04          	push	#4
1214  002d ae0010        	ldw	x,#16
1215  0030 cd0000        	call	_SPI_Init
1217  0033 5b06          	addw	sp,#6
1218                     ; 166     SPI_Cmd(ENABLE);
1220  0035 a601          	ld	a,#1
1222                     ; 167 }
1225  0037 cc0000        	jp	_SPI_Cmd
1250                     ; 170 void nrf24l01p_reset_status(void) {
1251                     .text:	section	.text,new
1252  0000               _nrf24l01p_reset_status:
1256                     ; 171     nrf24l01p_write_register(0x07, 0x70);
1258  0000 ae0770        	ldw	x,#1904
1260                     ; 172 }
1263  0003 cc0000        	jp	_nrf24l01p_write_register
1266                     .const:	section	.text
1267  0000               L135_rxaddr:
1268  0000 01            	dc.b	1
1269  0001 01            	dc.b	1
1270  0002 01            	dc.b	1
1271  0003 01            	dc.b	1
1272  0004 01            	dc.b	1
1311                     ; 175 void nrf24l01p_rx_init(void) {
1312                     .text:	section	.text,new
1313  0000               _nrf24l01p_rx_init:
1315  0000 5205          	subw	sp,#5
1316       00000005      OFST:	set	5
1319                     ; 176     uint8_t rxaddr[] = {0x01, 0x01, 0x01, 0x01, 0x01};
1321  0002 96            	ldw	x,sp
1322  0003 5c            	incw	x
1323  0004 90ae0000      	ldw	y,#L135_rxaddr
1324  0008 a605          	ld	a,#5
1325  000a cd0000        	call	c_xymov
1327                     ; 178     cs_low();
1329  000d cd0000        	call	L55_cs_low
1331                     ; 179     nrf24l01p_write_register(0x00, 0x0F); // Power up, PRX mode
1333  0010 ae000f        	ldw	x,#15
1334  0013 ad40          	call	LC002
1336                     ; 181     nrf24l01p_write_register(0x01, 0x01); // Enable auto-ack for pipe 0
1338  0015 ae0101        	ldw	x,#257
1339  0018 ad3b          	call	LC002
1341                     ; 183     nrf24l01p_write_register(0x02, 0x01); // Enable pipe 0
1343  001a ae0201        	ldw	x,#513
1344  001d ad36          	call	LC002
1346                     ; 185     nrf24l01p_write_register(0x03, 0x03); // Address width: 5 bytes
1348  001f ae0303        	ldw	x,#771
1349  0022 ad31          	call	LC002
1351                     ; 187     nrf24l01p_write_register(0x05, 120); // RF channel 120
1353  0024 ae0578        	ldw	x,#1400
1354  0027 ad2c          	call	LC002
1356                     ; 189     nrf24l01p_write_register(0x06, 0x08); // Data rate: 2Mbps, output power: 0dBm
1358  0029 ae0608        	ldw	x,#1544
1359  002c ad27          	call	LC002
1361                     ; 191     nrf24l01p_write_register(0x07, 0x70); // Clear status flags
1363  002e ae0770        	ldw	x,#1904
1364  0031 ad22          	call	LC002
1366                     ; 193     nrf24l01p_write_registerN(0x0A, rxaddr, 5); // Set RX address for pipe 0
1368  0033 4b05          	push	#5
1369  0035 96            	ldw	x,sp
1370  0036 1c0002        	addw	x,#OFST-3
1371  0039 89            	pushw	x
1372  003a a60a          	ld	a,#10
1373  003c cd0000        	call	_nrf24l01p_write_registerN
1375  003f 5b03          	addw	sp,#3
1376                     ; 194     delay(10);
1378  0041 ae000a        	ldw	x,#10
1379  0044 cd0000        	call	_delay
1381                     ; 195     nrf24l01p_write_register(0x11, 0x01); // Number of bytes in RX payload in pipe 0
1383  0047 ae1101        	ldw	x,#4353
1384  004a ad09          	call	LC002
1386                     ; 197     cs_high();
1388  004c cd0000        	call	L34_cs_high
1390                     ; 198     ce_high(); // Start listening
1392  004f cd0000        	call	L76_ce_high
1394                     ; 199 }
1397  0052 5b05          	addw	sp,#5
1398  0054 81            	ret	
1399  0055               LC002:
1400  0055 cd0000        	call	_nrf24l01p_write_register
1402                     ; 196     delay(10);
1404  0058 ae000a        	ldw	x,#10
1405  005b cc0000        	jp	_delay
1408                     	switch	.const
1409  0005               L155_txaddr:
1410  0005 01            	dc.b	1
1411  0006 01            	dc.b	1
1412  0007 01            	dc.b	1
1413  0008 01            	dc.b	1
1414  0009 01            	dc.b	1
1453                     ; 202 void nrf24l01p_tx_init(void) {
1454                     .text:	section	.text,new
1455  0000               _nrf24l01p_tx_init:
1457  0000 5205          	subw	sp,#5
1458       00000005      OFST:	set	5
1461                     ; 203     uint8_t txaddr[] = {0x01, 0x01, 0x01, 0x01, 0x01};
1463  0002 96            	ldw	x,sp
1464  0003 5c            	incw	x
1465  0004 90ae0005      	ldw	y,#L155_txaddr
1466  0008 a605          	ld	a,#5
1467  000a cd0000        	call	c_xymov
1469                     ; 205     cs_high();
1471  000d cd0000        	call	L34_cs_high
1473                     ; 206     ce_low();
1475  0010 cd0000        	call	L101_ce_low
1477                     ; 207     nrf24l01p_write_register(0x00, 0x0E); // Power up, PTX mode
1479  0013 ae000e        	ldw	x,#14
1480  0016 ad33          	call	LC003
1482                     ; 209     nrf24l01p_write_register(0x03, 0x03); // Address width: 5 bytes
1484  0018 ae0303        	ldw	x,#771
1485  001b ad2e          	call	LC003
1487                     ; 211     nrf24l01p_write_register(0x04, 0xFF); // Retry delay 4000us, retry count 15
1489  001d ae04ff        	ldw	x,#1279
1490  0020 ad29          	call	LC003
1492                     ; 213     nrf24l01p_write_register(0x05, 120); // RF channel 120
1494  0022 ae0578        	ldw	x,#1400
1495  0025 ad24          	call	LC003
1497                     ; 215     nrf24l01p_write_register(0x06, 0x0C); // Data rate: 2Mbps, output power: 0dBm
1499  0027 ae060c        	ldw	x,#1548
1500  002a ad1f          	call	LC003
1502                     ; 217     nrf24l01p_write_register(0x07, 0x70); // Clear status flags
1504  002c ae0770        	ldw	x,#1904
1505  002f ad1a          	call	LC003
1507                     ; 219     nrf24l01p_write_registerN(0x10, txaddr, 5); // Set TX address
1509  0031 4b05          	push	#5
1510  0033 96            	ldw	x,sp
1511  0034 1c0002        	addw	x,#OFST-3
1512  0037 89            	pushw	x
1513  0038 a610          	ld	a,#16
1514  003a cd0000        	call	_nrf24l01p_write_registerN
1516  003d 5b03          	addw	sp,#3
1517                     ; 220     delay(10);
1519  003f ae000a        	ldw	x,#10
1520  0042 cd0000        	call	_delay
1522                     ; 221     ce_high();
1524  0045 cd0000        	call	L76_ce_high
1526                     ; 222 }
1529  0048 5b05          	addw	sp,#5
1530  004a 81            	ret	
1531  004b               LC003:
1532  004b cd0000        	call	_nrf24l01p_write_register
1534                     ; 218     delay(10);
1536  004e ae000a        	ldw	x,#10
1537  0051 cc0000        	jp	_delay
1606                     ; 224 uint8_t nrf24l01p_rx_read(uint8_t *buf, uint8_t len) {
1607                     .text:	section	.text,new
1608  0000               _nrf24l01p_rx_read:
1610  0000 89            	pushw	x
1611  0001 88            	push	a
1612       00000001      OFST:	set	1
1615                     ; 228     cs_low();
1617  0002 cd0000        	call	L55_cs_low
1619                     ; 229     SPI_SendData(NRF24L01_CMD_R_RX_PAYLOAD);  // ??????? ??? ?????? ?????? ?? ?????? ??????
1621  0005 a661          	ld	a,#97
1622  0007 cd0000        	call	_SPI_SendData
1625  000a               L526:
1626                     ; 230 		    while (SPI_GetFlagStatus(SPI_FLAG_RXNE) == RESET); // ???????? ????????? ??????
1628  000a a601          	ld	a,#1
1629  000c cd0000        	call	_SPI_GetFlagStatus
1631  000f 4d            	tnz	a
1632  0010 27f8          	jreq	L526
1633                     ; 231     SPI_ReceiveData(); // ??????? ?????????? "????????" ?????? (???? ????)
1635  0012 cd0000        	call	_SPI_ReceiveData
1638  0015               L336:
1639                     ; 232     while (SPI_GetFlagStatus(SPI_FLAG_TXE) == RESET);  // ??????? ?????????? ???????? ??????
1641  0015 a602          	ld	a,#2
1642  0017 cd0000        	call	_SPI_GetFlagStatus
1644  001a 4d            	tnz	a
1645  001b 27f8          	jreq	L336
1646                     ; 233     for (i = 0; i < len; i++) {
1648  001d 0f01          	clr	(OFST+0,sp)
1651  001f 201b          	jra	L346
1652  0021               L736:
1653                     ; 234         SPI_SendData(0x00);  // ?????????? 0 ??? ?????? ??????
1655  0021 4f            	clr	a
1656  0022 cd0000        	call	_SPI_SendData
1659  0025               L156:
1660                     ; 235         while (SPI_GetFlagStatus(SPI_FLAG_RXNE) == RESET);  // ??????? ????????? ??????
1662  0025 a601          	ld	a,#1
1663  0027 cd0000        	call	_SPI_GetFlagStatus
1665  002a 4d            	tnz	a
1666  002b 27f8          	jreq	L156
1667                     ; 236         buf[i] = SPI_ReceiveData();  // ?????? ??????
1669  002d 7b01          	ld	a,(OFST+0,sp)
1670  002f 5f            	clrw	x
1671  0030 97            	ld	xl,a
1672  0031 72fb02        	addw	x,(OFST+1,sp)
1673  0034 89            	pushw	x
1674  0035 cd0000        	call	_SPI_ReceiveData
1676  0038 85            	popw	x
1677  0039 f7            	ld	(x),a
1678                     ; 233     for (i = 0; i < len; i++) {
1680  003a 0c01          	inc	(OFST+0,sp)
1682  003c               L346:
1685  003c 7b01          	ld	a,(OFST+0,sp)
1686  003e 1106          	cp	a,(OFST+5,sp)
1687  0040 25df          	jrult	L736
1688                     ; 238     cs_high();
1690  0042 cd0000        	call	L34_cs_high
1692                     ; 241     status = nrf24l01p_read_register(0x07);  // ?????? ???????? ???????
1694  0045 a607          	ld	a,#7
1695  0047 cd0000        	call	_nrf24l01p_read_register
1697  004a 6b01          	ld	(OFST+0,sp),a
1699                     ; 242     nrf24l01p_write_register(0x07, status | 0x70);  // ????? ????? ??????????
1701  004c aa70          	or	a,#112
1702  004e ae0700        	ldw	x,#1792
1703  0051 97            	ld	xl,a
1704  0052 cd0000        	call	_nrf24l01p_write_register
1706                     ; 244     return status;  // ?????????? ??????
1708  0055 7b01          	ld	a,(OFST+0,sp)
1711  0057 5b03          	addw	sp,#3
1712  0059 81            	ret	
1758                     ; 247 int check_tx(void)
1758                     ; 248 {
1759                     .text:	section	.text,new
1760  0000               _check_tx:
1762  0000 5206          	subw	sp,#6
1763       00000006      OFST:	set	6
1766                     ; 251  reg =  nrf24l01p_read_register(0x07);
1768  0002 a607          	ld	a,#7
1769  0004 cd0000        	call	_nrf24l01p_read_register
1771  0007 6b01          	ld	(OFST-5,sp),a
1773                     ; 252  if(reg != 0x0e)
1775  0009 a10e          	cp	a,#14
1776                     ; 253 	{return -1;} 
1778  000b 2613          	jrne	LC004
1779                     ; 254 nrf24l01p_read_registerN(0x10, regn, 5);
1781  000d 4b05          	push	#5
1782  000f 96            	ldw	x,sp
1783  0010 1c0003        	addw	x,#OFST-3
1784  0013 89            	pushw	x
1785  0014 a610          	ld	a,#16
1786  0016 cd0000        	call	_nrf24l01p_read_registerN
1788  0019 5b03          	addw	sp,#3
1789                     ; 255 if(regn[0] != 0x1)return -1;
1791  001b 7b02          	ld	a,(OFST-4,sp)
1792  001d 4a            	dec	a
1793  001e 2706          	jreq	L107
1796  0020               LC004:
1802  0020 aeffff        	ldw	x,#65535
1804  0023               L234:
1806  0023 5b06          	addw	sp,#6
1807  0025 81            	ret	
1808  0026               L107:
1809                     ; 256 if(regn[1] != 0x1)return -1;
1811  0026 7b03          	ld	a,(OFST-3,sp)
1812  0028 4a            	dec	a
1815  0029 26f5          	jrne	LC004
1816                     ; 257 if(regn[2] != 0x1)return -1;
1818  002b 7b04          	ld	a,(OFST-2,sp)
1819  002d 4a            	dec	a
1822  002e 26f0          	jrne	LC004
1823                     ; 258 if(regn[3] != 0x1)return -1;
1825  0030 7b05          	ld	a,(OFST-1,sp)
1826  0032 4a            	dec	a
1829  0033 26eb          	jrne	LC004
1830                     ; 259 if(regn[4] != 0x1)return -1;
1832  0035 7b06          	ld	a,(OFST+0,sp)
1833  0037 4a            	dec	a
1836  0038 26e6          	jrne	LC004
1837                     ; 260 return 0;
1839  003a 5f            	clrw	x
1841  003b 20e6          	jra	L234
1888                     ; 262 int check_rx(void){
1889                     .text:	section	.text,new
1890  0000               _check_rx:
1892  0000 5206          	subw	sp,#6
1893       00000006      OFST:	set	6
1896                     ; 265  reg =  nrf24l01p_read_register(0x01);
1898  0002 a601          	ld	a,#1
1899  0004 cd0000        	call	_nrf24l01p_read_register
1901  0007 6b01          	ld	(OFST-5,sp),a
1903                     ; 266  delay(10);
1905  0009 ae000a        	ldw	x,#10
1906  000c cd0000        	call	_delay
1908                     ; 267  if(reg != 0x1)
1910  000f 7b01          	ld	a,(OFST-5,sp)
1911  0011 4a            	dec	a
1912                     ; 268 {return -1;} 
1914  0012 2612          	jrne	LC005
1915                     ; 269  reg =  nrf24l01p_read_register(0x02);
1917  0014 a602          	ld	a,#2
1918  0016 cd0000        	call	_nrf24l01p_read_register
1920  0019 6b01          	ld	(OFST-5,sp),a
1922                     ; 270  delay(10);
1924  001b ae000a        	ldw	x,#10
1925  001e cd0000        	call	_delay
1927                     ; 271  if(reg != 0x1)
1929  0021 7b01          	ld	a,(OFST-5,sp)
1930  0023 4a            	dec	a
1931  0024 2706          	jreq	L737
1932                     ; 272 {return -1;} 
1934  0026               LC005:
1942  0026 aeffff        	ldw	x,#65535
1944  0029               L654:
1946  0029 5b06          	addw	sp,#6
1947  002b 81            	ret	
1948  002c               L737:
1949                     ; 273  reg =  nrf24l01p_read_register(0x07);
1951  002c a607          	ld	a,#7
1952  002e cd0000        	call	_nrf24l01p_read_register
1954  0031 6b01          	ld	(OFST-5,sp),a
1956                     ; 274  delay(10);
1958  0033 ae000a        	ldw	x,#10
1959  0036 cd0000        	call	_delay
1961                     ; 275  if(reg != 0x0e)
1963  0039 7b01          	ld	a,(OFST-5,sp)
1964  003b a10e          	cp	a,#14
1965                     ; 276 {return -1;} 
1967  003d 26e7          	jrne	LC005
1968                     ; 277 nrf24l01p_read_registerN(0x0A, regn, 5);
1970  003f 4b05          	push	#5
1971  0041 96            	ldw	x,sp
1972  0042 1c0003        	addw	x,#OFST-3
1973  0045 89            	pushw	x
1974  0046 a60a          	ld	a,#10
1975  0048 cd0000        	call	_nrf24l01p_read_registerN
1977  004b 5b03          	addw	sp,#3
1978                     ; 278 delay(10);
1980  004d ae000a        	ldw	x,#10
1981  0050 cd0000        	call	_delay
1983                     ; 279 if(regn[0] != 0x1)return -1;
1985  0053 7b02          	ld	a,(OFST-4,sp)
1986  0055 4a            	dec	a
1989  0056 26ce          	jrne	LC005
1990                     ; 280 if(regn[1] != 0x1)return -1;
1992  0058 7b03          	ld	a,(OFST-3,sp)
1993  005a 4a            	dec	a
1996  005b 26c9          	jrne	LC005
1997                     ; 281 if(regn[2] != 0x1)return -1;
1999  005d 7b04          	ld	a,(OFST-2,sp)
2000  005f 4a            	dec	a
2003  0060 26c4          	jrne	LC005
2004                     ; 282 if(regn[3] != 0x1)return -1;
2006  0062 7b05          	ld	a,(OFST-1,sp)
2007  0064 4a            	dec	a
2010  0065 26bf          	jrne	LC005
2011                     ; 283 if(regn[4] != 0x1)return -1;
2013  0067 7b06          	ld	a,(OFST+0,sp)
2014  0069 4a            	dec	a
2017  006a 26ba          	jrne	LC005
2018                     ; 284 return 0;
2020  006c 5f            	clrw	x
2022  006d 20ba          	jra	L654
2025                     	switch	.const
2026  000a               L557_tx_data:
2027  000a aa            	dc.b	170
2028  000b aa            	dc.b	170
2029  000c aa            	dc.b	170
2094                     ; 288 void main(void) {
2095                     .text:	section	.text,new
2096  0000               _main:
2098  0000 5207          	subw	sp,#7
2099       00000007      OFST:	set	7
2102                     ; 289     uint8_t tx_data[] = {0xAA,0xAA,0xAA};
2104  0002 96            	ldw	x,sp
2105  0003 5c            	incw	x
2106  0004 90ae000a      	ldw	y,#L557_tx_data
2107  0008 a603          	ld	a,#3
2108  000a cd0000        	call	c_xymov
2110                     ; 293     cs_high();
2112  000d cd0000        	call	L34_cs_high
2114                     ; 294     delay(100);
2116  0010 ae0064        	ldw	x,#100
2117  0013 cd0000        	call	_delay
2119                     ; 295     GPIO_Init(GPIOC, GPIO_PIN_4, GPIO_MODE_OUT_PP_HIGH_FAST); // CSN
2121  0016 4bf0          	push	#240
2122  0018 4b10          	push	#16
2123  001a ae500a        	ldw	x,#20490
2124  001d cd0000        	call	_GPIO_Init
2126  0020 85            	popw	x
2127                     ; 296     GPIO_Init(GPIOC, GPIO_PIN_3, GPIO_MODE_OUT_PP_HIGH_FAST); // CE
2129  0021 4bf0          	push	#240
2130  0023 4b08          	push	#8
2131  0025 ae500a        	ldw	x,#20490
2132  0028 cd0000        	call	_GPIO_Init
2134  002b 85            	popw	x
2135                     ; 297     SPI_Init_NRF();
2137  002c cd0000        	call	_SPI_Init_NRF
2139                     ; 298 		GPIO_Init(GPIOB, GPIO_PIN_5, GPIO_MODE_OUT_PP_HIGH_FAST); // CSN
2141  002f 4bf0          	push	#240
2142  0031 4b20          	push	#32
2143  0033 ae5005        	ldw	x,#20485
2144  0036 cd0000        	call	_GPIO_Init
2146  0039 85            	popw	x
2147                     ; 300     nrf24l01p_rx_init();
2149  003a cd0000        	call	_nrf24l01p_rx_init
2151                     ; 301     delay(1000);
2153  003d ae03e8        	ldw	x,#1000
2154  0040 cd0000        	call	_delay
2156                     ; 302 		    GPIO_Init(GPIOB, GPIO_PIN_4, GPIO_MODE_IN_PU_IT);
2158  0043 4b60          	push	#96
2159  0045 4b10          	push	#16
2160  0047 ae5005        	ldw	x,#20485
2161  004a cd0000        	call	_GPIO_Init
2163  004d 85            	popw	x
2164                     ; 303     EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOB, EXTI_SENSITIVITY_FALL_ONLY);
2166  004e ae0102        	ldw	x,#258
2167  0051 cd0000        	call	_EXTI_SetExtIntSensitivity
2169                     ; 307 		reg = check_rx();
2171  0054 cd0000        	call	_check_rx
2173  0057 01            	rrwa	x,a
2174  0058 6b07          	ld	(OFST+0,sp),a
2176                     ; 308     if(reg!= 0)
2178  005a 0d07          	tnz	(OFST+0,sp)
2179  005c 270b          	jreq	L5001
2180                     ; 311 	GPIO_WriteLow(GPIOB, GPIO_PIN_5);
2182  005e 4b20          	push	#32
2183  0060 ae5005        	ldw	x,#20485
2184  0063 cd0000        	call	_GPIO_WriteLow
2186  0066 84            	pop	a
2187  0067               L7001:
2188                     ; 312 	while(1);
2190  0067 20fe          	jra	L7001
2191  0069               L5001:
2192                     ; 315 		ce_high();
2194  0069 cd0000        	call	L76_ce_high
2196  006c               L3101:
2197                     ; 317 			reg = nrf24l01p_read_register(0x07);
2199  006c a607          	ld	a,#7
2200  006e cd0000        	call	_nrf24l01p_read_register
2202  0071 6b07          	ld	(OFST+0,sp),a
2204                     ; 319         delay(100); // ???????? 1 ???????
2206  0073 ae0064        	ldw	x,#100
2207  0076 cd0000        	call	_delay
2209                     ; 320 			if(reg & (1 << 6)) {
2211  0079 7b07          	ld	a,(OFST+0,sp)
2212  007b a540          	bcp	a,#64
2213  007d 27ed          	jreq	L3101
2214                     ; 321 					nrf24l01p_rx_read(rx_data, 1);				// ???????? 6-?? ????
2216  007f 4b01          	push	#1
2217  0081 96            	ldw	x,sp
2218  0082 1c0005        	addw	x,#OFST-2
2219  0085 cd0000        	call	_nrf24l01p_rx_read
2221  0088 84            	pop	a
2222  0089               L1201:
2223                     ; 324 						GPIO_WriteLow(GPIOB, GPIO_PIN_5);
2225  0089 4b20          	push	#32
2226  008b ae5005        	ldw	x,#20485
2227  008e cd0000        	call	_GPIO_WriteLow
2229  0091 ae0032        	ldw	x,#50
2230  0094 84            	pop	a
2231                     ; 325 						delay(50);
2233  0095 cd0000        	call	_delay
2235                     ; 326 						GPIO_WriteHigh(GPIOB, GPIO_PIN_5);
2237  0098 4b20          	push	#32
2238  009a ae5005        	ldw	x,#20485
2239  009d cd0000        	call	_GPIO_WriteHigh
2241  00a0 ae0032        	ldw	x,#50
2242  00a3 84            	pop	a
2243                     ; 327 						delay(50);
2245  00a4 cd0000        	call	_delay
2248  00a7 20e0          	jra	L1201
2283                     ; 338 void assert_failed(uint8_t* file, uint32_t line) {
2284                     .text:	section	.text,new
2285  0000               _assert_failed:
2289  0000               L3401:
2290                     ; 340     while (1);
2292  0000 20fe          	jra	L3401
2305                     	xdef	_main
2306                     	xdef	_check_rx
2307                     	xdef	_check_tx
2308                     	xdef	_nrf24l01p_rx_read
2309                     	xdef	_nrf24l01p_tx_init
2310                     	xdef	_nrf24l01p_rx_init
2311                     	xdef	_nrf24l01p_reset_status
2312                     	xdef	_SPI_Init_NRF
2313                     	xdef	_nrf24l01p_tx_send
2314                     	xdef	_nrf24l01p_flush_tx
2315                     	xdef	_nrf24l01p_write_registerN
2316                     	xdef	_nrf24l01p_read_registerN
2317                     	xdef	_nrf24l01p_write_register
2318                     	xdef	_nrf24l01p_read_register
2319                     	xdef	_delay
2320                     	xdef	_assert_failed
2321                     	xref	_SPI_GetFlagStatus
2322                     	xref	_SPI_ReceiveData
2323                     	xref	_SPI_SendData
2324                     	xref	_SPI_Cmd
2325                     	xref	_SPI_Init
2326                     	xref	_GPIO_WriteLow
2327                     	xref	_GPIO_WriteHigh
2328                     	xref	_GPIO_Init
2329                     	xref	_EXTI_SetExtIntSensitivity
2330                     	xref.b	c_x
2349                     	xref	c_xymov
2350                     	end
