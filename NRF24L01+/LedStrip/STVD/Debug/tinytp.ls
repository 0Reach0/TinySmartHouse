   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.3 - 22 Aug 2024
   4                     ; Optimizer V4.6.3 - 22 Aug 2024
  67                     .const:	section	.text
  68  0000               L6:
  69  0000 00003e80      	dc.l	16000
  71                     ; 5 void delay_ms(uint32_t ms) {
  72                     	scross	off
  73                     	switch	.text
  74  0000               _delay_ms:
  76  0000 5204          	subw	sp,#4
  77       00000004      OFST:	set	4
  80                     ; 6     uint32_t cycles = (PROC_FREQ / 1000) * ms;
  82  0002 96            	ldw	x,sp
  83  0003 1c0007        	addw	x,#OFST+3
  84  0006 cd0000        	call	c_ltor
  86  0009 ae0000        	ldw	x,#L6
  87  000c cd0000        	call	c_lmul
  89  000f 96            	ldw	x,sp
  90  0010 5c            	incw	x
  91  0011 cd0000        	call	c_rtol
  95  0014 2001          	jra	L73
  96  0016               L33:
  97                     ; 8         __asm volatile("nop");
 100  0016 9d            	nop	
 102  0017               L73:
 103                     ; 7     while (cycles--) {
 105  0017 96            	ldw	x,sp
 106  0018 5c            	incw	x
 107  0019 cd0000        	call	c_ltor
 109  001c 96            	ldw	x,sp
 110  001d 5c            	incw	x
 111  001e a601          	ld	a,#1
 112  0020 cd0000        	call	c_lgsbc
 115  0023 cd0000        	call	c_lrzmp
 117  0026 26ee          	jrne	L33
 118                     ; 10 }
 121  0028 5b04          	addw	sp,#4
 122  002a 81            	ret	
 245                     ; 12 uint8_t serializeDataPackage(const struct dataPackage* pkg, uint8_t* buffer, uint8_t* out_size) {
 246                     	switch	.text
 247  002b               _serializeDataPackage:
 249  002b 89            	pushw	x
 250  002c 88            	push	a
 251       00000001      OFST:	set	1
 254                     ; 13      uint8_t pos = 0;
 256  002d 0f01          	clr	(OFST+0,sp)
 258                     ; 14 		if (pkg->d_size > MAX_DEVICE_SIZE || pkg->data_size > MAX_DATA_SIZE) return 0;
 260  002f e601          	ld	a,(1,x)
 261  0031 a109          	cp	a,#9
 262  0033 2406          	jruge	L521
 264  0035 e624          	ld	a,(36,x)
 265  0037 a121          	cp	a,#33
 266  0039 2503          	jrult	L321
 267  003b               L521:
 270  003b 4f            	clr	a
 272  003c 207d          	jra	L61
 273  003e               L321:
 274                     ; 16     buffer[pos++] = pkg->id;
 276  003e 7b01          	ld	a,(OFST+0,sp)
 277  0040 0c01          	inc	(OFST+0,sp)
 279  0042 5f            	clrw	x
 280  0043 97            	ld	xl,a
 281  0044 1602          	ldw	y,(OFST+1,sp)
 282  0046 72fb06        	addw	x,(OFST+5,sp)
 283  0049 90f6          	ld	a,(y)
 284  004b f7            	ld	(x),a
 285                     ; 17     buffer[pos++] = pkg->d_size;
 287  004c 7b01          	ld	a,(OFST+0,sp)
 288  004e 0c01          	inc	(OFST+0,sp)
 290  0050 5f            	clrw	x
 291  0051 97            	ld	xl,a
 292  0052 72fb06        	addw	x,(OFST+5,sp)
 293  0055 90e601        	ld	a,(1,y)
 294  0058 f7            	ld	(x),a
 295                     ; 18     memcpy(&buffer[pos], pkg->device, pkg->d_size);
 297  0059 93            	ldw	x,y
 298  005a e601          	ld	a,(1,x)
 299  005c 5f            	clrw	x
 300  005d 97            	ld	xl,a
 301  005e 89            	pushw	x
 302  005f 1e04          	ldw	x,(OFST+3,sp)
 303  0061 ee02          	ldw	x,(2,x)
 304  0063 89            	pushw	x
 305  0064 7b05          	ld	a,(OFST+4,sp)
 306  0066 5f            	clrw	x
 307  0067 97            	ld	xl,a
 308  0068 72fb0a        	addw	x,(OFST+9,sp)
 309  006b cd0000        	call	_memcpy
 311  006e 5b04          	addw	sp,#4
 312                     ; 19     pos += pkg->d_size;
 314  0070 1e02          	ldw	x,(OFST+1,sp)
 315  0072 7b01          	ld	a,(OFST+0,sp)
 316  0074 eb01          	add	a,(1,x)
 317  0076 6b01          	ld	(OFST+0,sp),a
 319                     ; 20     buffer[pos++] = pkg->data_size;
 322  0078 5f            	clrw	x
 323  0079 0c01          	inc	(OFST+0,sp)
 324  007b 97            	ld	xl,a
 325  007c 1602          	ldw	y,(OFST+1,sp)
 326  007e 72fb06        	addw	x,(OFST+5,sp)
 327  0081 90e624        	ld	a,(36,y)
 328  0084 f7            	ld	(x),a
 329                     ; 21     memcpy(&buffer[pos], pkg->data, pkg->data_size);
 331  0085 93            	ldw	x,y
 332  0086 e624          	ld	a,(36,x)
 333  0088 5f            	clrw	x
 334  0089 97            	ld	xl,a
 335  008a 89            	pushw	x
 336  008b 1e04          	ldw	x,(OFST+3,sp)
 337  008d 1c0004        	addw	x,#4
 338  0090 89            	pushw	x
 339  0091 7b05          	ld	a,(OFST+4,sp)
 340  0093 5f            	clrw	x
 341  0094 97            	ld	xl,a
 342  0095 72fb0a        	addw	x,(OFST+9,sp)
 343  0098 cd0000        	call	_memcpy
 345  009b 5b04          	addw	sp,#4
 346                     ; 22     pos += pkg->data_size;
 348  009d 1e02          	ldw	x,(OFST+1,sp)
 349  009f 7b01          	ld	a,(OFST+0,sp)
 350  00a1 eb24          	add	a,(36,x)
 351  00a3 6b01          	ld	(OFST+0,sp),a
 353                     ; 23     buffer[pos++] = pkg->is_last;
 356  00a5 5f            	clrw	x
 357  00a6 0c01          	inc	(OFST+0,sp)
 358  00a8 97            	ld	xl,a
 359  00a9 1602          	ldw	y,(OFST+1,sp)
 360  00ab 72fb06        	addw	x,(OFST+5,sp)
 361  00ae 90e625        	ld	a,(37,y)
 362  00b1 f7            	ld	(x),a
 363                     ; 25     if (out_size) *out_size = pos;
 365  00b2 1e08          	ldw	x,(OFST+7,sp)
 366  00b4 2703          	jreq	L721
 369  00b6 7b01          	ld	a,(OFST+0,sp)
 370  00b8 f7            	ld	(x),a
 371  00b9               L721:
 372                     ; 26     return 1;
 374  00b9 a601          	ld	a,#1
 376  00bb               L61:
 378  00bb 5b03          	addw	sp,#3
 379  00bd 81            	ret	
 437                     ; 29 uint8_t deserializeDataPackage(struct dataPackage* pkg, const uint8_t* buffer) {
 438                     	switch	.text
 439  00be               _deserializeDataPackage:
 441  00be 89            	pushw	x
 442  00bf 88            	push	a
 443       00000001      OFST:	set	1
 446                     ; 30     uint8_t pos = 0;
 448  00c0 4f            	clr	a
 449  00c1 6b01          	ld	(OFST+0,sp),a
 451                     ; 31     pkg->id = buffer[pos++];
 454  00c3 5f            	clrw	x
 455  00c4 0c01          	inc	(OFST+0,sp)
 456  00c6 97            	ld	xl,a
 457  00c7 72fb06        	addw	x,(OFST+5,sp)
 458  00ca f6            	ld	a,(x)
 459  00cb 1e02          	ldw	x,(OFST+1,sp)
 460  00cd f7            	ld	(x),a
 461                     ; 32     pkg->d_size = buffer[pos++];
 463  00ce 7b01          	ld	a,(OFST+0,sp)
 464  00d0 0c01          	inc	(OFST+0,sp)
 466  00d2 5f            	clrw	x
 467  00d3 97            	ld	xl,a
 468  00d4 72fb06        	addw	x,(OFST+5,sp)
 469  00d7 f6            	ld	a,(x)
 470  00d8 1e02          	ldw	x,(OFST+1,sp)
 471                     ; 33     if (pkg->d_size > MAX_DEVICE_SIZE) return 0;
 473  00da a109          	cp	a,#9
 474  00dc e701          	ld	(1,x),a
 477  00de 2430          	jruge	LC001
 478                     ; 34     memcpy(pkg->device, &buffer[pos], pkg->d_size);
 480  00e0 5f            	clrw	x
 481  00e1 97            	ld	xl,a
 482  00e2 89            	pushw	x
 483  00e3 7b08          	ld	a,(OFST+7,sp)
 484  00e5 97            	ld	xl,a
 485  00e6 7b09          	ld	a,(OFST+8,sp)
 486  00e8 1b03          	add	a,(OFST+2,sp)
 487  00ea 2401          	jrnc	L42
 488  00ec 5c            	incw	x
 489  00ed               L42:
 490  00ed 02            	rlwa	x,a
 491  00ee 89            	pushw	x
 492  00ef 1e06          	ldw	x,(OFST+5,sp)
 493  00f1 ee02          	ldw	x,(2,x)
 494  00f3 cd0000        	call	_memcpy
 496  00f6 5b04          	addw	sp,#4
 497                     ; 35     pos += pkg->d_size;
 499  00f8 1e02          	ldw	x,(OFST+1,sp)
 500  00fa 7b01          	ld	a,(OFST+0,sp)
 501  00fc eb01          	add	a,(1,x)
 502  00fe 6b01          	ld	(OFST+0,sp),a
 504                     ; 36     pkg->data_size = buffer[pos++];
 507  0100 5f            	clrw	x
 508  0101 0c01          	inc	(OFST+0,sp)
 509  0103 97            	ld	xl,a
 510  0104 72fb06        	addw	x,(OFST+5,sp)
 511  0107 f6            	ld	a,(x)
 512  0108 1e02          	ldw	x,(OFST+1,sp)
 513                     ; 37     if (pkg->data_size > MAX_DATA_SIZE) return 0;
 515  010a a121          	cp	a,#33
 516  010c e724          	ld	(36,x),a
 517  010e 2504          	jrult	L361
 520  0110               LC001:
 522  0110 4f            	clr	a
 524  0111               L23:
 526  0111 5b03          	addw	sp,#3
 527  0113 81            	ret	
 528  0114               L361:
 529                     ; 38     memcpy(pkg->data, &buffer[pos], pkg->data_size);
 531  0114 5f            	clrw	x
 532  0115 97            	ld	xl,a
 533  0116 89            	pushw	x
 534  0117 7b08          	ld	a,(OFST+7,sp)
 535  0119 97            	ld	xl,a
 536  011a 7b09          	ld	a,(OFST+8,sp)
 537  011c 1b03          	add	a,(OFST+2,sp)
 538  011e 2401          	jrnc	L03
 539  0120 5c            	incw	x
 540  0121               L03:
 541  0121 02            	rlwa	x,a
 542  0122 89            	pushw	x
 543  0123 1e06          	ldw	x,(OFST+5,sp)
 544  0125 1c0004        	addw	x,#4
 545  0128 cd0000        	call	_memcpy
 547  012b 5b04          	addw	sp,#4
 548                     ; 39     pos += pkg->data_size;
 550  012d 1e02          	ldw	x,(OFST+1,sp)
 551  012f 7b01          	ld	a,(OFST+0,sp)
 552  0131 eb24          	add	a,(36,x)
 553  0133 6b01          	ld	(OFST+0,sp),a
 555                     ; 40     pkg->is_last = buffer[pos++];
 558  0135 5f            	clrw	x
 559  0136 0c01          	inc	(OFST+0,sp)
 560  0138 97            	ld	xl,a
 561  0139 72fb06        	addw	x,(OFST+5,sp)
 562  013c f6            	ld	a,(x)
 563  013d 1e02          	ldw	x,(OFST+1,sp)
 564  013f e725          	ld	(37,x),a
 565                     ; 41     return 1;
 567  0141 a601          	ld	a,#1
 569  0143 20cc          	jra	L23
 683                     ; 44 int send_one_data_package(uint8_t id, const uint8_t *device, uint8_t d_size,
 683                     ; 45                           const uint8_t *data, uint8_t data_size, uint8_t is_last) {
 684                     	switch	.text
 685  0145               _send_one_data_package:
 687  0145 88            	push	a
 688  0146 5267          	subw	sp,#103
 689       00000067      OFST:	set	103
 692                     ; 50     pkg.id = id;
 694  0148 6b42          	ld	(OFST-37,sp),a
 696                     ; 51     pkg.d_size = d_size;
 698  014a 7b6d          	ld	a,(OFST+6,sp)
 699  014c 6b43          	ld	(OFST-36,sp),a
 701                     ; 52     memcpy(pkg.device, device, d_size);
 703  014e 5f            	clrw	x
 704  014f 97            	ld	xl,a
 705  0150 89            	pushw	x
 706  0151 1e6d          	ldw	x,(OFST+6,sp)
 707  0153 89            	pushw	x
 708  0154 1e48          	ldw	x,(OFST-31,sp)
 709  0156 cd0000        	call	_memcpy
 711  0159 5b04          	addw	sp,#4
 712                     ; 53     memcpy(pkg.data, data, data_size);
 714  015b 7b70          	ld	a,(OFST+9,sp)
 715  015d 5f            	clrw	x
 716  015e 97            	ld	xl,a
 717  015f 89            	pushw	x
 718  0160 1e70          	ldw	x,(OFST+9,sp)
 719  0162 89            	pushw	x
 720  0163 96            	ldw	x,sp
 721  0164 1c004a        	addw	x,#OFST-29
 722  0167 cd0000        	call	_memcpy
 724  016a 5b04          	addw	sp,#4
 725                     ; 54     pkg.data_size = data_size;
 727  016c 7b70          	ld	a,(OFST+9,sp)
 728  016e 6b66          	ld	(OFST-1,sp),a
 730                     ; 55     pkg.is_last = is_last;
 732  0170 7b71          	ld	a,(OFST+10,sp)
 733  0172 6b67          	ld	(OFST+0,sp),a
 735                     ; 57     if (!serializeDataPackage(&pkg, buffer, &size)) return -1;
 737  0174 96            	ldw	x,sp
 738  0175 1c0041        	addw	x,#OFST-38
 739  0178 89            	pushw	x
 740  0179 1d0040        	subw	x,#64
 741  017c 89            	pushw	x
 742  017d 1c0041        	addw	x,#65
 743  0180 cd002b        	call	_serializeDataPackage
 745  0183 5b04          	addw	sp,#4
 746  0185 4d            	tnz	a
 747  0186 2605          	jrne	L342
 750  0188 aeffff        	ldw	x,#65535
 752  018b 200c          	jra	L64
 753  018d               L342:
 754                     ; 59     tx_send(buffer, size);
 756  018d 7b41          	ld	a,(OFST-38,sp)
 757  018f 88            	push	a
 758  0190 96            	ldw	x,sp
 759  0191 1c0002        	addw	x,#OFST-101
 760  0194 cd0000        	call	_tx_send
 762  0197 5f            	clrw	x
 763  0198 84            	pop	a
 764                     ; 60     return 0;
 767  0199               L64:
 769  0199 5b68          	addw	sp,#104
 770  019b 81            	ret	
 816                     ; 63 int receive_ack(uint8_t* ack_value) {
 817                     	switch	.text
 818  019c               _receive_ack:
 820  019c 89            	pushw	x
 821  019d 88            	push	a
 822       00000001      OFST:	set	1
 825                     ; 65     rx_read(buf, 1);
 827  019e 4b01          	push	#1
 828  01a0 96            	ldw	x,sp
 829  01a1 1c0002        	addw	x,#OFST+1
 830  01a4 cd0000        	call	_rx_read
 832  01a7 84            	pop	a
 833                     ; 66     *ack_value = buf[0];
 835  01a8 1e02          	ldw	x,(OFST+1,sp)
 836  01aa 7b01          	ld	a,(OFST+0,sp)
 837  01ac f7            	ld	(x),a
 838                     ; 67     return 0;
 840  01ad 5f            	clrw	x
 843  01ae 5b03          	addw	sp,#3
 844  01b0 81            	ret	
 992                     ; 70 uint8_t send_event(const uint8_t *device, uint8_t d_size,
 992                     ; 71                    const uint8_t *data, uint8_t data_size, uint8_t max_pack_size) {
 993                     	switch	.text
 994  01b1               _send_event:
 996  01b1 89            	pushw	x
 997  01b2 5208          	subw	sp,#8
 998       00000008      OFST:	set	8
1001                     ; 72     uint8_t packet_id = 0;
1003  01b4 0f06          	clr	(OFST-2,sp)
1005                     ; 73     uint16_t bytes_sent = 0;
1007  01b6 5f            	clrw	x
1008  01b7 1f07          	ldw	(OFST-1,sp),x
1010                     ; 75     if (device[0] != txaddr[0]) return -1;
1012  01b9 1e09          	ldw	x,(OFST+1,sp)
1013  01bb f6            	ld	a,(x)
1014  01bc 92c100        	cp	a,[_txaddr.w]
1015  01bf 2603cc026f    	jreq	L173
1018  01c4 a6ff          	ld	a,#255
1020  01c6 2012          	jra	L001
1021  01c8               L763:
1022                     ; 80         overhead = 1 + 1 + d_size + 1 + 1; // id + d_size + device + data_size + is_last
1024  01c8 7b0d          	ld	a,(OFST+5,sp)
1025  01ca ab04          	add	a,#4
1026  01cc 6b04          	ld	(OFST-4,sp),a
1028                     ; 81         available = (max_pack_size > overhead) ? max_pack_size - overhead : 0;
1030  01ce 7b11          	ld	a,(OFST+9,sp)
1031  01d0 1004          	sub	a,(OFST-4,sp)
1032  01d2 2201          	jrugt	L06
1033  01d4 4f            	clr	a
1034  01d5               L06:
1035  01d5 6b05          	ld	(OFST-3,sp),a
1037                     ; 83         if (available == 0) return -1;
1039  01d7 2604          	jrne	L573
1042  01d9 4a            	dec	a
1044  01da               L001:
1046  01da 5b0a          	addw	sp,#10
1047  01dc 81            	ret	
1048  01dd               L573:
1049                     ; 85         chunk_size = (data_size - bytes_sent > available) ? available : data_size - bytes_sent;
1051  01dd 7b10          	ld	a,(OFST+8,sp)
1052  01df 5f            	clrw	x
1053  01e0 97            	ld	xl,a
1054  01e1 72f007        	subw	x,(OFST-1,sp)
1055  01e4 7b05          	ld	a,(OFST-3,sp)
1056  01e6 905f          	clrw	y
1057  01e8 9097          	ld	yl,a
1058  01ea 90bf00        	ldw	c_y,y
1059  01ed b300          	cpw	x,c_y
1060  01ef 2204          	jrugt	L46
1061  01f1 7b10          	ld	a,(OFST+8,sp)
1062  01f3 1008          	sub	a,(OFST+0,sp)
1063  01f5               L46:
1064  01f5 6b04          	ld	(OFST-4,sp),a
1066                     ; 86         is_last = (bytes_sent + chunk_size == data_size) ? 1 : 0;
1068  01f7 5f            	clrw	x
1069  01f8 97            	ld	xl,a
1070  01f9 72fb07        	addw	x,(OFST-1,sp)
1071  01fc 7b10          	ld	a,(OFST+8,sp)
1072  01fe 905f          	clrw	y
1073  0200 9097          	ld	yl,a
1074  0202 90bf00        	ldw	c_y,y
1075  0205 b300          	cpw	x,c_y
1076  0207 2604          	jrne	L66
1077  0209 a601          	ld	a,#1
1078  020b 2001          	jra	L07
1079  020d               L66:
1080  020d 4f            	clr	a
1081  020e               L07:
1082  020e 6b05          	ld	(OFST-3,sp),a
1084                     ; 88         if (send_one_data_package(packet_id++, device, d_size,
1084                     ; 89                                   &data[bytes_sent], chunk_size, is_last) != 0) return -1;
1086  0210 88            	push	a
1087  0211 7b05          	ld	a,(OFST-3,sp)
1088  0213 88            	push	a
1089  0214 1e10          	ldw	x,(OFST+8,sp)
1090  0216 72fb09        	addw	x,(OFST+1,sp)
1091  0219 89            	pushw	x
1092  021a 7b11          	ld	a,(OFST+9,sp)
1093  021c 88            	push	a
1094  021d 1e0e          	ldw	x,(OFST+6,sp)
1095  021f 89            	pushw	x
1096  0220 7b0d          	ld	a,(OFST+5,sp)
1097  0222 0c0d          	inc	(OFST+5,sp)
1099  0224 cd0145        	call	_send_one_data_package
1101  0227 5b07          	addw	sp,#7
1102  0229 5d            	tnzw	x
1103  022a 2704          	jreq	L773
1106  022c a6ff          	ld	a,#255
1108  022e 20aa          	jra	L001
1109  0230               L773:
1110                     ; 91         if (!is_last) {
1112  0230 7b05          	ld	a,(OFST-3,sp)
1113  0232 2630          	jrne	L104
1114                     ; 92             for (retry = 0; retry < WAITING_ACK_TIME; retry++) {
1116  0234 6b05          	ld	(OFST-3,sp),a
1118  0236               L304:
1119                     ; 93                 if (receive_ack(&ack) == 0 && ack == ACK_ALLOW_NEXT)
1121  0236 96            	ldw	x,sp
1122  0237 1c0003        	addw	x,#OFST-5
1123  023a cd019c        	call	_receive_ack
1125  023d 5d            	tnzw	x
1126  023e 2606          	jrne	L114
1128  0240 7b03          	ld	a,(OFST-5,sp)
1129  0242 a155          	cp	a,#85
1130  0244 2713          	jreq	L704
1131                     ; 94                     break;
1133  0246               L114:
1134                     ; 95                 delay_ms(1000);
1136  0246 ae03e8        	ldw	x,#1000
1137  0249 89            	pushw	x
1138  024a 5f            	clrw	x
1139  024b 89            	pushw	x
1140  024c cd0000        	call	_delay_ms
1142  024f 5b04          	addw	sp,#4
1143                     ; 92             for (retry = 0; retry < WAITING_ACK_TIME; retry++) {
1145  0251 0c05          	inc	(OFST-3,sp)
1149  0253 7b05          	ld	a,(OFST-3,sp)
1150  0255 a105          	cp	a,#5
1151  0257 25dd          	jrult	L304
1152  0259               L704:
1153                     ; 97             if (retry == WAITING_ACK_TIME) return -1;
1155  0259 7b05          	ld	a,(OFST-3,sp)
1156  025b a105          	cp	a,#5
1157  025d 2605          	jrne	L104
1160  025f a6ff          	ld	a,#255
1162  0261 cc01da        	jra	L001
1163  0264               L104:
1164                     ; 100         bytes_sent += chunk_size;
1166  0264 7b04          	ld	a,(OFST-4,sp)
1167  0266 5f            	clrw	x
1168  0267 97            	ld	xl,a
1169  0268 1f01          	ldw	(OFST-7,sp),x
1171  026a 72fb07        	addw	x,(OFST-1,sp)
1172  026d 1f07          	ldw	(OFST-1,sp),x
1174  026f               L173:
1175                     ; 77     while (bytes_sent < data_size) {
1177  026f 7b10          	ld	a,(OFST+8,sp)
1178  0271 5f            	clrw	x
1179  0272 97            	ld	xl,a
1180  0273 bf00          	ldw	c_x,x
1181  0275 1e07          	ldw	x,(OFST-1,sp)
1182  0277 b300          	cpw	x,c_x
1183  0279 2403cc01c8    	jrult	L763
1184                     ; 103     return 0;
1186  027e 4f            	clr	a
1188  027f cc01da        	jra	L001
1201                     	xref	_memcpy
1202                     	xref	_rx_read
1203                     	xref	_tx_send
1204                     	xdef	_send_event
1205                     	xdef	_receive_ack
1206                     	xdef	_send_one_data_package
1207                     	xdef	_deserializeDataPackage
1208                     	xdef	_serializeDataPackage
1209                     	xdef	_delay_ms
1210                     	xref.b	_txaddr
1211                     	xref.b	c_x
1212                     	xref.b	c_y
1231                     	xref	c_lrzmp
1232                     	xref	c_lgsbc
1233                     	xref	c_rtol
1234                     	xref	c_lmul
1235                     	xref	c_ltor
1236                     	end
