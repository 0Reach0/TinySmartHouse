   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.3 - 22 Aug 2024
  63                     .const:	section	.text
  64  0000               L6:
  65  0000 00003e80      	dc.l	16000
  67                     ; 5 void delay_ms(uint32_t ms) {
  68                     	scross	off
  69                     	switch	.text
  70  0000               _delay_ms:
  72  0000 5204          	subw	sp,#4
  73       00000004      OFST:	set	4
  76                     ; 6     uint32_t cycles = (PROC_FREQ / 1000) * ms;
  78  0002 96            	ldw	x,sp
  79  0003 1c0007        	addw	x,#OFST+3
  80  0006 cd0000        	call	c_ltor
  82  0009 ae0000        	ldw	x,#L6
  83  000c cd0000        	call	c_lmul
  85  000f 96            	ldw	x,sp
  86  0010 1c0001        	addw	x,#OFST-3
  87  0013 cd0000        	call	c_rtol
  91  0016 2001          	jra	L73
  92  0018               L33:
  93                     ; 8         __asm volatile("nop");
  96  0018 9d            nop
  98  0019               L73:
  99                     ; 7     while (cycles--) {
 101  0019 96            	ldw	x,sp
 102  001a 1c0001        	addw	x,#OFST-3
 103  001d cd0000        	call	c_ltor
 105  0020 96            	ldw	x,sp
 106  0021 1c0001        	addw	x,#OFST-3
 107  0024 a601          	ld	a,#1
 108  0026 cd0000        	call	c_lgsbc
 111  0029 cd0000        	call	c_lrzmp
 113  002c 26ea          	jrne	L33
 114                     ; 10 }
 117  002e 5b04          	addw	sp,#4
 118  0030 81            	ret
 241                     ; 12 uint8_t serializeDataPackage(const struct dataPackage* pkg, uint8_t* buffer, uint8_t* out_size) {
 242                     	switch	.text
 243  0031               _serializeDataPackage:
 245  0031 89            	pushw	x
 246  0032 88            	push	a
 247       00000001      OFST:	set	1
 250                     ; 13      uint8_t pos = 0;
 252  0033 0f01          	clr	(OFST+0,sp)
 254                     ; 14 		if (pkg->d_size > MAX_DEVICE_SIZE || pkg->data_size > MAX_DATA_SIZE) return 0;
 256  0035 e601          	ld	a,(1,x)
 257  0037 a109          	cp	a,#9
 258  0039 2406          	jruge	L521
 260  003b e624          	ld	a,(36,x)
 261  003d a121          	cp	a,#33
 262  003f 2505          	jrult	L321
 263  0041               L521:
 266  0041 4f            	clr	a
 268  0042 aced00ed      	jpf	L22
 269  0046               L321:
 270                     ; 16     buffer[pos++] = pkg->id;
 272  0046 7b01          	ld	a,(OFST+0,sp)
 273  0048 97            	ld	xl,a
 274  0049 0c01          	inc	(OFST+0,sp)
 276  004b 9f            	ld	a,xl
 277  004c 5f            	clrw	x
 278  004d 97            	ld	xl,a
 279  004e 72fb06        	addw	x,(OFST+5,sp)
 280  0051 1602          	ldw	y,(OFST+1,sp)
 281  0053 90f6          	ld	a,(y)
 282  0055 f7            	ld	(x),a
 283                     ; 17     buffer[pos++] = pkg->d_size;
 285  0056 7b01          	ld	a,(OFST+0,sp)
 286  0058 97            	ld	xl,a
 287  0059 0c01          	inc	(OFST+0,sp)
 289  005b 9f            	ld	a,xl
 290  005c 5f            	clrw	x
 291  005d 97            	ld	xl,a
 292  005e 72fb06        	addw	x,(OFST+5,sp)
 293  0061 1602          	ldw	y,(OFST+1,sp)
 294  0063 90e601        	ld	a,(1,y)
 295  0066 f7            	ld	(x),a
 296                     ; 18     memcpy(&buffer[pos], pkg->device, pkg->d_size);
 298  0067 7b01          	ld	a,(OFST+0,sp)
 299  0069 5f            	clrw	x
 300  006a 97            	ld	xl,a
 301  006b 72fb06        	addw	x,(OFST+5,sp)
 302  006e bf00          	ldw	c_x,x
 303  0070 1602          	ldw	y,(OFST+1,sp)
 304  0072 90ee02        	ldw	y,(2,y)
 305  0075 90bf00        	ldw	c_y,y
 306  0078 1e02          	ldw	x,(OFST+1,sp)
 307  007a e601          	ld	a,(1,x)
 308  007c 5f            	clrw	x
 309  007d 97            	ld	xl,a
 310  007e 5d            	tnzw	x
 311  007f 270a          	jreq	L21
 312  0081               L41:
 313  0081 5a            	decw	x
 314  0082 92d600        	ld	a,([c_y.w],x)
 315  0085 92d700        	ld	([c_x.w],x),a
 316  0088 5d            	tnzw	x
 317  0089 26f6          	jrne	L41
 318  008b               L21:
 319                     ; 19     pos += pkg->d_size;
 321  008b 1e02          	ldw	x,(OFST+1,sp)
 322  008d 7b01          	ld	a,(OFST+0,sp)
 323  008f eb01          	add	a,(1,x)
 324  0091 6b01          	ld	(OFST+0,sp),a
 326                     ; 20     buffer[pos++] = pkg->data_size;
 328  0093 7b01          	ld	a,(OFST+0,sp)
 329  0095 97            	ld	xl,a
 330  0096 0c01          	inc	(OFST+0,sp)
 332  0098 9f            	ld	a,xl
 333  0099 5f            	clrw	x
 334  009a 97            	ld	xl,a
 335  009b 72fb06        	addw	x,(OFST+5,sp)
 336  009e 1602          	ldw	y,(OFST+1,sp)
 337  00a0 90e624        	ld	a,(36,y)
 338  00a3 f7            	ld	(x),a
 339                     ; 21     memcpy(&buffer[pos], pkg->data, pkg->data_size);
 341  00a4 7b01          	ld	a,(OFST+0,sp)
 342  00a6 5f            	clrw	x
 343  00a7 97            	ld	xl,a
 344  00a8 72fb06        	addw	x,(OFST+5,sp)
 345  00ab bf00          	ldw	c_x,x
 346  00ad 1602          	ldw	y,(OFST+1,sp)
 347  00af 72a90004      	addw	y,#4
 348  00b3 90bf00        	ldw	c_y,y
 349  00b6 1e02          	ldw	x,(OFST+1,sp)
 350  00b8 e624          	ld	a,(36,x)
 351  00ba 5f            	clrw	x
 352  00bb 97            	ld	xl,a
 353  00bc 5d            	tnzw	x
 354  00bd 270a          	jreq	L61
 355  00bf               L02:
 356  00bf 5a            	decw	x
 357  00c0 92d600        	ld	a,([c_y.w],x)
 358  00c3 92d700        	ld	([c_x.w],x),a
 359  00c6 5d            	tnzw	x
 360  00c7 26f6          	jrne	L02
 361  00c9               L61:
 362                     ; 22     pos += pkg->data_size;
 364  00c9 1e02          	ldw	x,(OFST+1,sp)
 365  00cb 7b01          	ld	a,(OFST+0,sp)
 366  00cd eb24          	add	a,(36,x)
 367  00cf 6b01          	ld	(OFST+0,sp),a
 369                     ; 23     buffer[pos++] = pkg->is_last;
 371  00d1 7b01          	ld	a,(OFST+0,sp)
 372  00d3 97            	ld	xl,a
 373  00d4 0c01          	inc	(OFST+0,sp)
 375  00d6 9f            	ld	a,xl
 376  00d7 5f            	clrw	x
 377  00d8 97            	ld	xl,a
 378  00d9 72fb06        	addw	x,(OFST+5,sp)
 379  00dc 1602          	ldw	y,(OFST+1,sp)
 380  00de 90e625        	ld	a,(37,y)
 381  00e1 f7            	ld	(x),a
 382                     ; 25     if (out_size) *out_size = pos;
 384  00e2 1e08          	ldw	x,(OFST+7,sp)
 385  00e4 2705          	jreq	L721
 388  00e6 7b01          	ld	a,(OFST+0,sp)
 389  00e8 1e08          	ldw	x,(OFST+7,sp)
 390  00ea f7            	ld	(x),a
 391  00eb               L721:
 392                     ; 26     return 1;
 394  00eb a601          	ld	a,#1
 396  00ed               L22:
 398  00ed 5b03          	addw	sp,#3
 399  00ef 81            	ret
 457                     ; 29 uint8_t deserializeDataPackage(struct dataPackage* pkg, const uint8_t* buffer) {
 458                     	switch	.text
 459  00f0               _deserializeDataPackage:
 461  00f0 89            	pushw	x
 462  00f1 88            	push	a
 463       00000001      OFST:	set	1
 466                     ; 30     uint8_t pos = 0;
 468  00f2 0f01          	clr	(OFST+0,sp)
 470                     ; 31     pkg->id = buffer[pos++];
 472  00f4 7b01          	ld	a,(OFST+0,sp)
 473  00f6 97            	ld	xl,a
 474  00f7 0c01          	inc	(OFST+0,sp)
 476  00f9 9f            	ld	a,xl
 477  00fa 5f            	clrw	x
 478  00fb 97            	ld	xl,a
 479  00fc 72fb06        	addw	x,(OFST+5,sp)
 480  00ff f6            	ld	a,(x)
 481  0100 1e02          	ldw	x,(OFST+1,sp)
 482  0102 f7            	ld	(x),a
 483                     ; 32     pkg->d_size = buffer[pos++];
 485  0103 7b01          	ld	a,(OFST+0,sp)
 486  0105 97            	ld	xl,a
 487  0106 0c01          	inc	(OFST+0,sp)
 489  0108 9f            	ld	a,xl
 490  0109 5f            	clrw	x
 491  010a 97            	ld	xl,a
 492  010b 72fb06        	addw	x,(OFST+5,sp)
 493  010e f6            	ld	a,(x)
 494  010f 1e02          	ldw	x,(OFST+1,sp)
 495  0111 e701          	ld	(1,x),a
 496                     ; 33     if (pkg->d_size > MAX_DEVICE_SIZE) return 0;
 498  0113 1e02          	ldw	x,(OFST+1,sp)
 499  0115 e601          	ld	a,(1,x)
 500  0117 a109          	cp	a,#9
 501  0119 2503          	jrult	L161
 504  011b 4f            	clr	a
 506  011c 2046          	jra	L63
 507  011e               L161:
 508                     ; 34     memcpy(pkg->device, &buffer[pos], pkg->d_size);
 510  011e 1e02          	ldw	x,(OFST+1,sp)
 511  0120 ee02          	ldw	x,(2,x)
 512  0122 bf00          	ldw	c_x,x
 513  0124 7b01          	ld	a,(OFST+0,sp)
 514  0126 905f          	clrw	y
 515  0128 9097          	ld	yl,a
 516  012a 72f906        	addw	y,(OFST+5,sp)
 517  012d 90bf00        	ldw	c_y,y
 518  0130 1e02          	ldw	x,(OFST+1,sp)
 519  0132 e601          	ld	a,(1,x)
 520  0134 5f            	clrw	x
 521  0135 97            	ld	xl,a
 522  0136 5d            	tnzw	x
 523  0137 270a          	jreq	L62
 524  0139               L03:
 525  0139 5a            	decw	x
 526  013a 92d600        	ld	a,([c_y.w],x)
 527  013d 92d700        	ld	([c_x.w],x),a
 528  0140 5d            	tnzw	x
 529  0141 26f6          	jrne	L03
 530  0143               L62:
 531                     ; 35     pos += pkg->d_size;
 533  0143 1e02          	ldw	x,(OFST+1,sp)
 534  0145 7b01          	ld	a,(OFST+0,sp)
 535  0147 eb01          	add	a,(1,x)
 536  0149 6b01          	ld	(OFST+0,sp),a
 538                     ; 36     pkg->data_size = buffer[pos++];
 540  014b 7b01          	ld	a,(OFST+0,sp)
 541  014d 97            	ld	xl,a
 542  014e 0c01          	inc	(OFST+0,sp)
 544  0150 9f            	ld	a,xl
 545  0151 5f            	clrw	x
 546  0152 97            	ld	xl,a
 547  0153 72fb06        	addw	x,(OFST+5,sp)
 548  0156 f6            	ld	a,(x)
 549  0157 1e02          	ldw	x,(OFST+1,sp)
 550  0159 e724          	ld	(36,x),a
 551                     ; 37     if (pkg->data_size > MAX_DATA_SIZE) return 0;
 553  015b 1e02          	ldw	x,(OFST+1,sp)
 554  015d e624          	ld	a,(36,x)
 555  015f a121          	cp	a,#33
 556  0161 2504          	jrult	L361
 559  0163 4f            	clr	a
 561  0164               L63:
 563  0164 5b03          	addw	sp,#3
 564  0166 81            	ret
 565  0167               L361:
 566                     ; 38     memcpy(pkg->data, &buffer[pos], pkg->data_size);
 568  0167 1e02          	ldw	x,(OFST+1,sp)
 569  0169 1c0004        	addw	x,#4
 570  016c bf00          	ldw	c_x,x
 571  016e 7b01          	ld	a,(OFST+0,sp)
 572  0170 905f          	clrw	y
 573  0172 9097          	ld	yl,a
 574  0174 72f906        	addw	y,(OFST+5,sp)
 575  0177 90bf00        	ldw	c_y,y
 576  017a 1e02          	ldw	x,(OFST+1,sp)
 577  017c e624          	ld	a,(36,x)
 578  017e 5f            	clrw	x
 579  017f 97            	ld	xl,a
 580  0180 5d            	tnzw	x
 581  0181 270a          	jreq	L23
 582  0183               L43:
 583  0183 5a            	decw	x
 584  0184 92d600        	ld	a,([c_y.w],x)
 585  0187 92d700        	ld	([c_x.w],x),a
 586  018a 5d            	tnzw	x
 587  018b 26f6          	jrne	L43
 588  018d               L23:
 589                     ; 39     pos += pkg->data_size;
 591  018d 1e02          	ldw	x,(OFST+1,sp)
 592  018f 7b01          	ld	a,(OFST+0,sp)
 593  0191 eb24          	add	a,(36,x)
 594  0193 6b01          	ld	(OFST+0,sp),a
 596                     ; 40     pkg->is_last = buffer[pos++];
 598  0195 7b01          	ld	a,(OFST+0,sp)
 599  0197 97            	ld	xl,a
 600  0198 0c01          	inc	(OFST+0,sp)
 602  019a 9f            	ld	a,xl
 603  019b 5f            	clrw	x
 604  019c 97            	ld	xl,a
 605  019d 72fb06        	addw	x,(OFST+5,sp)
 606  01a0 f6            	ld	a,(x)
 607  01a1 1e02          	ldw	x,(OFST+1,sp)
 608  01a3 e725          	ld	(37,x),a
 609                     ; 41     return 1;
 611  01a5 a601          	ld	a,#1
 613  01a7 20bb          	jra	L63
 727                     ; 44 int send_one_data_package(uint8_t id, const uint8_t *device, uint8_t d_size,
 727                     ; 45                           const uint8_t *data, uint8_t data_size, uint8_t is_last) {
 728                     	switch	.text
 729  01a9               _send_one_data_package:
 731  01a9 88            	push	a
 732  01aa 5267          	subw	sp,#103
 733       00000067      OFST:	set	103
 736                     ; 50     pkg.id = id;
 738  01ac 6b42          	ld	(OFST-37,sp),a
 740                     ; 51     pkg.d_size = d_size;
 742  01ae 7b6d          	ld	a,(OFST+6,sp)
 743  01b0 6b43          	ld	(OFST-36,sp),a
 745                     ; 52     memcpy(pkg.device, device, d_size);
 747  01b2 1e44          	ldw	x,(OFST-35,sp)
 748  01b4 bf00          	ldw	c_x,x
 749  01b6 166b          	ldw	y,(OFST+4,sp)
 750  01b8 90bf00        	ldw	c_y,y
 751  01bb 7b6d          	ld	a,(OFST+6,sp)
 752  01bd 5f            	clrw	x
 753  01be 97            	ld	xl,a
 754  01bf 5d            	tnzw	x
 755  01c0 270a          	jreq	L24
 756  01c2               L44:
 757  01c2 5a            	decw	x
 758  01c3 92d600        	ld	a,([c_y.w],x)
 759  01c6 92d700        	ld	([c_x.w],x),a
 760  01c9 5d            	tnzw	x
 761  01ca 26f6          	jrne	L44
 762  01cc               L24:
 763                     ; 53     memcpy(pkg.data, data, data_size);
 765  01cc 96            	ldw	x,sp
 766  01cd 1c0046        	addw	x,#OFST-33
 767  01d0 bf00          	ldw	c_x,x
 768  01d2 166e          	ldw	y,(OFST+7,sp)
 769  01d4 90bf00        	ldw	c_y,y
 770  01d7 7b70          	ld	a,(OFST+9,sp)
 771  01d9 5f            	clrw	x
 772  01da 97            	ld	xl,a
 773  01db 5d            	tnzw	x
 774  01dc 270a          	jreq	L64
 775  01de               L05:
 776  01de 5a            	decw	x
 777  01df 92d600        	ld	a,([c_y.w],x)
 778  01e2 92d700        	ld	([c_x.w],x),a
 779  01e5 5d            	tnzw	x
 780  01e6 26f6          	jrne	L05
 781  01e8               L64:
 782                     ; 54     pkg.data_size = data_size;
 784  01e8 7b70          	ld	a,(OFST+9,sp)
 785  01ea 6b66          	ld	(OFST-1,sp),a
 787                     ; 55     pkg.is_last = is_last;
 789  01ec 7b71          	ld	a,(OFST+10,sp)
 790  01ee 6b67          	ld	(OFST+0,sp),a
 792                     ; 57     if (!serializeDataPackage(&pkg, buffer, &size)) return -1;
 794  01f0 96            	ldw	x,sp
 795  01f1 1c0041        	addw	x,#OFST-38
 796  01f4 89            	pushw	x
 797  01f5 96            	ldw	x,sp
 798  01f6 1c0003        	addw	x,#OFST-100
 799  01f9 89            	pushw	x
 800  01fa 96            	ldw	x,sp
 801  01fb 1c0046        	addw	x,#OFST-33
 802  01fe cd0031        	call	_serializeDataPackage
 804  0201 5b04          	addw	sp,#4
 805  0203 4d            	tnz	a
 806  0204 2605          	jrne	L342
 809  0206 aeffff        	ldw	x,#65535
 811  0209 200c          	jra	L25
 812  020b               L342:
 813                     ; 59     tx_send(buffer, size);
 815  020b 7b41          	ld	a,(OFST-38,sp)
 816  020d 88            	push	a
 817  020e 96            	ldw	x,sp
 818  020f 1c0002        	addw	x,#OFST-101
 819  0212 cd0000        	call	_tx_send
 821  0215 84            	pop	a
 822                     ; 60     return 0;
 824  0216 5f            	clrw	x
 826  0217               L25:
 828  0217 5b68          	addw	sp,#104
 829  0219 81            	ret
 875                     ; 63 int receive_ack(uint8_t* ack_value) {
 876                     	switch	.text
 877  021a               _receive_ack:
 879  021a 89            	pushw	x
 880  021b 88            	push	a
 881       00000001      OFST:	set	1
 884                     ; 65     rx_read(buf, 1);
 886  021c 4b01          	push	#1
 887  021e 96            	ldw	x,sp
 888  021f 1c0002        	addw	x,#OFST+1
 889  0222 cd0000        	call	_rx_read
 891  0225 84            	pop	a
 892                     ; 66     *ack_value = buf[0];
 894  0226 7b01          	ld	a,(OFST+0,sp)
 895  0228 1e02          	ldw	x,(OFST+1,sp)
 896  022a f7            	ld	(x),a
 897                     ; 67     return 0;
 899  022b 5f            	clrw	x
 902  022c 5b03          	addw	sp,#3
 903  022e 81            	ret
1051                     ; 70 uint8_t send_event(const uint8_t *device, uint8_t d_size,
1051                     ; 71                    const uint8_t *data, uint8_t data_size, uint8_t max_pack_size) {
1052                     	switch	.text
1053  022f               _send_event:
1055  022f 89            	pushw	x
1056  0230 5208          	subw	sp,#8
1057       00000008      OFST:	set	8
1060                     ; 72     uint8_t packet_id = 0;
1062  0232 0f06          	clr	(OFST-2,sp)
1064                     ; 73     uint16_t bytes_sent = 0;
1066  0234 5f            	clrw	x
1067  0235 1f07          	ldw	(OFST-1,sp),x
1069                     ; 75     if (device[0] != txaddr[0]) return -1;
1071  0237 1e09          	ldw	x,(OFST+1,sp)
1072  0239 f6            	ld	a,(x)
1073  023a 92c100        	cp	a,[_txaddr.w]
1074  023d 2603          	jrne	L67
1075  023f cc0307        	jp	L173
1076  0242               L67:
1079  0242 a6ff          	ld	a,#255
1081  0244 201b          	jra	L47
1082  0246               L763:
1083                     ; 80         overhead = 1 + 1 + d_size + 1 + 1; // id + d_size + device + data_size + is_last
1085  0246 7b0d          	ld	a,(OFST+5,sp)
1086  0248 ab04          	add	a,#4
1087  024a 6b04          	ld	(OFST-4,sp),a
1089                     ; 81         available = (max_pack_size > overhead) ? max_pack_size - overhead : 0;
1091  024c 7b11          	ld	a,(OFST+9,sp)
1092  024e 1104          	cp	a,(OFST-4,sp)
1093  0250 2306          	jrule	L06
1094  0252 7b11          	ld	a,(OFST+9,sp)
1095  0254 1004          	sub	a,(OFST-4,sp)
1096  0256 2001          	jra	L26
1097  0258               L06:
1098  0258 4f            	clr	a
1099  0259               L26:
1100  0259 6b05          	ld	(OFST-3,sp),a
1102                     ; 83         if (available == 0) return -1;
1104  025b 0d05          	tnz	(OFST-3,sp)
1105  025d 2605          	jrne	L573
1108  025f a6ff          	ld	a,#255
1110  0261               L47:
1112  0261 5b0a          	addw	sp,#10
1113  0263 81            	ret
1114  0264               L573:
1115                     ; 85         chunk_size = (data_size - bytes_sent > available) ? available : data_size - bytes_sent;
1117  0264 7b10          	ld	a,(OFST+8,sp)
1118  0266 5f            	clrw	x
1119  0267 97            	ld	xl,a
1120  0268 72f007        	subw	x,(OFST-1,sp)
1121  026b 7b05          	ld	a,(OFST-3,sp)
1122  026d 905f          	clrw	y
1123  026f 9097          	ld	yl,a
1124  0271 90bf00        	ldw	c_y,y
1125  0274 b300          	cpw	x,c_y
1126  0276 2304          	jrule	L46
1127  0278 7b05          	ld	a,(OFST-3,sp)
1128  027a 2004          	jra	L66
1129  027c               L46:
1130  027c 7b10          	ld	a,(OFST+8,sp)
1131  027e 1008          	sub	a,(OFST+0,sp)
1132  0280               L66:
1133  0280 6b04          	ld	(OFST-4,sp),a
1135                     ; 86         is_last = (bytes_sent + chunk_size == data_size) ? 1 : 0;
1137  0282 7b04          	ld	a,(OFST-4,sp)
1138  0284 5f            	clrw	x
1139  0285 97            	ld	xl,a
1140  0286 72fb07        	addw	x,(OFST-1,sp)
1141  0289 7b10          	ld	a,(OFST+8,sp)
1142  028b 905f          	clrw	y
1143  028d 9097          	ld	yl,a
1144  028f 90bf00        	ldw	c_y,y
1145  0292 b300          	cpw	x,c_y
1146  0294 2604          	jrne	L07
1147  0296 a601          	ld	a,#1
1148  0298 2001          	jra	L27
1149  029a               L07:
1150  029a 4f            	clr	a
1151  029b               L27:
1152  029b 6b05          	ld	(OFST-3,sp),a
1154                     ; 88         if (send_one_data_package(packet_id++, device, d_size,
1154                     ; 89                                   &data[bytes_sent], chunk_size, is_last) != 0) return -1;
1156  029d 7b05          	ld	a,(OFST-3,sp)
1157  029f 88            	push	a
1158  02a0 7b05          	ld	a,(OFST-3,sp)
1159  02a2 88            	push	a
1160  02a3 1e10          	ldw	x,(OFST+8,sp)
1161  02a5 72fb09        	addw	x,(OFST+1,sp)
1162  02a8 89            	pushw	x
1163  02a9 7b11          	ld	a,(OFST+9,sp)
1164  02ab 88            	push	a
1165  02ac 1e0e          	ldw	x,(OFST+6,sp)
1166  02ae 89            	pushw	x
1167  02af 7b0d          	ld	a,(OFST+5,sp)
1168  02b1 0c0d          	inc	(OFST+5,sp)
1170  02b3 cd01a9        	call	_send_one_data_package
1172  02b6 5b07          	addw	sp,#7
1173  02b8 a30000        	cpw	x,#0
1174  02bb 2704          	jreq	L773
1177  02bd a6ff          	ld	a,#255
1179  02bf 20a0          	jra	L47
1180  02c1               L773:
1181                     ; 91         if (!is_last) {
1183  02c1 0d05          	tnz	(OFST-3,sp)
1184  02c3 2635          	jrne	L104
1185                     ; 92             for (retry = 0; retry < WAITING_ACK_TIME; retry++) {
1187  02c5 0f05          	clr	(OFST-3,sp)
1189  02c7               L304:
1190                     ; 93                 if (receive_ack(&ack) == 0 && ack == ACK_ALLOW_NEXT)
1192  02c7 96            	ldw	x,sp
1193  02c8 1c0003        	addw	x,#OFST-5
1194  02cb cd021a        	call	_receive_ack
1196  02ce a30000        	cpw	x,#0
1197  02d1 2606          	jrne	L114
1199  02d3 7b03          	ld	a,(OFST-5,sp)
1200  02d5 a155          	cp	a,#85
1201  02d7 2715          	jreq	L704
1202                     ; 94                     break;
1204  02d9               L114:
1205                     ; 95                 delay_ms(1000);
1207  02d9 ae03e8        	ldw	x,#1000
1208  02dc 89            	pushw	x
1209  02dd ae0000        	ldw	x,#0
1210  02e0 89            	pushw	x
1211  02e1 cd0000        	call	_delay_ms
1213  02e4 5b04          	addw	sp,#4
1214                     ; 92             for (retry = 0; retry < WAITING_ACK_TIME; retry++) {
1216  02e6 0c05          	inc	(OFST-3,sp)
1220  02e8 7b05          	ld	a,(OFST-3,sp)
1221  02ea a105          	cp	a,#5
1222  02ec 25d9          	jrult	L304
1223  02ee               L704:
1224                     ; 97             if (retry == WAITING_ACK_TIME) return -1;
1226  02ee 7b05          	ld	a,(OFST-3,sp)
1227  02f0 a105          	cp	a,#5
1228  02f2 2606          	jrne	L104
1231  02f4 a6ff          	ld	a,#255
1233  02f6 ac610261      	jpf	L47
1234  02fa               L104:
1235                     ; 100         bytes_sent += chunk_size;
1237  02fa 7b04          	ld	a,(OFST-4,sp)
1238  02fc 5f            	clrw	x
1239  02fd 97            	ld	xl,a
1240  02fe 1f01          	ldw	(OFST-7,sp),x
1242  0300 1e07          	ldw	x,(OFST-1,sp)
1243  0302 72fb01        	addw	x,(OFST-7,sp)
1244  0305 1f07          	ldw	(OFST-1,sp),x
1246  0307               L173:
1247                     ; 77     while (bytes_sent < data_size) {
1249  0307 7b10          	ld	a,(OFST+8,sp)
1250  0309 5f            	clrw	x
1251  030a 97            	ld	xl,a
1252  030b bf00          	ldw	c_x,x
1253  030d 1e07          	ldw	x,(OFST-1,sp)
1254  030f b300          	cpw	x,c_x
1255  0311 2403          	jruge	L001
1256  0313 cc0246        	jp	L763
1257  0316               L001:
1258                     ; 103     return 0;
1260  0316 4f            	clr	a
1262  0317 ac610261      	jpf	L47
1275                     	xref	_rx_read
1276                     	xref	_tx_send
1277                     	xdef	_send_event
1278                     	xdef	_receive_ack
1279                     	xdef	_send_one_data_package
1280                     	xdef	_deserializeDataPackage
1281                     	xdef	_serializeDataPackage
1282                     	xdef	_delay_ms
1283                     	xref.b	_txaddr
1284                     	xref.b	c_x
1285                     	xref.b	c_y
1304                     	xref	c_lrzmp
1305                     	xref	c_lgsbc
1306                     	xref	c_rtol
1307                     	xref	c_lmul
1308                     	xref	c_ltor
1309                     	end
