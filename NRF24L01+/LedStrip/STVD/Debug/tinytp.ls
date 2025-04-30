   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.3 - 22 Aug 2024
   4                     ; Optimizer V4.6.3 - 22 Aug 2024
  76                     .const:	section	.text
  77  0000               L6:
  78  0000 00003e80      	dc.l	16000
  80                     ; 7 void delay_ms(uint32_t ms) {
  81                     	scross	off
  82                     	switch	.text
  83  0000               _delay_ms:
  85  0000 5208          	subw	sp,#8
  86       00000008      OFST:	set	8
  89                     ; 8     uint32_t cycles_per_ms = PROC_FREQ / 1000;
  91                     ; 9     volatile uint32_t cycles = cycles_per_ms * ms;
  93  0002 96            	ldw	x,sp
  94  0003 1c000b        	addw	x,#OFST+3
  95  0006 cd0000        	call	c_ltor
  97  0009 ae0000        	ldw	x,#L6
  98  000c cd0000        	call	c_lmul
 100  000f 96            	ldw	x,sp
 101  0010 1c0005        	addw	x,#OFST-3
 102  0013 cd0000        	call	c_rtol
 106  0016 2001          	jra	L34
 107  0018               L73:
 108                     ; 12         __asm volatile("nop");
 111  0018 9d            	nop	
 113  0019               L34:
 114                     ; 11     while (cycles--) {
 116  0019 96            	ldw	x,sp
 117  001a 1c0005        	addw	x,#OFST-3
 118  001d cd0000        	call	c_ltor
 120  0020 96            	ldw	x,sp
 121  0021 1c0005        	addw	x,#OFST-3
 122  0024 a601          	ld	a,#1
 123  0026 cd0000        	call	c_lgsbc
 126  0029 cd0000        	call	c_lrzmp
 128  002c 26ea          	jrne	L73
 129                     ; 14 }
 132  002e 5b08          	addw	sp,#8
 133  0030 81            	ret	
 293                     ; 17 uint8_t *serializeDataPackage(struct dataPackage* package, uint8_t *out_size) {
 294                     	switch	.text
 295  0031               _serializeDataPackage:
 297  0031 89            	pushw	x
 298  0032 5204          	subw	sp,#4
 299       00000004      OFST:	set	4
 302                     ; 22     pos = 0;
 304  0034 0f02          	clr	(OFST-2,sp)
 306                     ; 23     total_size = 1 + 1 + package->d_size + 1 + 1 + package->data->size + 1;
 308  0036 ee05          	ldw	x,(5,x)
 309  0038 e602          	ld	a,(2,x)
 310  003a 1e05          	ldw	x,(OFST+1,sp)
 311  003c eb01          	add	a,(1,x)
 312  003e ab05          	add	a,#5
 313  0040 6b01          	ld	(OFST-3,sp),a
 315                     ; 24     buffer = (uint8_t*)malloc(total_size);
 317  0042 5f            	clrw	x
 318  0043 97            	ld	xl,a
 319  0044 cd0000        	call	_malloc
 321  0047 1f03          	ldw	(OFST-1,sp),x
 323                     ; 25     if (!buffer) return NULL;
 325  0049 2604          	jrne	L741
 328  004b 5f            	clrw	x
 330  004c cc00e1        	jra	L02
 331  004f               L741:
 332                     ; 27     buffer[pos++] = package->id;
 334  004f 7b02          	ld	a,(OFST-2,sp)
 335  0051 0c02          	inc	(OFST-2,sp)
 337  0053 5f            	clrw	x
 338  0054 97            	ld	xl,a
 339  0055 1605          	ldw	y,(OFST+1,sp)
 340  0057 72fb03        	addw	x,(OFST-1,sp)
 341  005a 90f6          	ld	a,(y)
 342  005c f7            	ld	(x),a
 343                     ; 28     buffer[pos++] = package->d_size;
 345  005d 7b02          	ld	a,(OFST-2,sp)
 346  005f 0c02          	inc	(OFST-2,sp)
 348  0061 5f            	clrw	x
 349  0062 97            	ld	xl,a
 350  0063 72fb03        	addw	x,(OFST-1,sp)
 351  0066 90e601        	ld	a,(1,y)
 352  0069 f7            	ld	(x),a
 353                     ; 29     memcpy(&buffer[pos], package->device, package->d_size);
 355  006a 93            	ldw	x,y
 356  006b e601          	ld	a,(1,x)
 357  006d 5f            	clrw	x
 358  006e 97            	ld	xl,a
 359  006f 89            	pushw	x
 360  0070 1e07          	ldw	x,(OFST+3,sp)
 361  0072 ee02          	ldw	x,(2,x)
 362  0074 89            	pushw	x
 363  0075 7b06          	ld	a,(OFST+2,sp)
 364  0077 5f            	clrw	x
 365  0078 97            	ld	xl,a
 366  0079 72fb07        	addw	x,(OFST+3,sp)
 367  007c cd0000        	call	_memcpy
 369  007f 5b04          	addw	sp,#4
 370                     ; 30     pos += package->d_size;
 372  0081 1e05          	ldw	x,(OFST+1,sp)
 373  0083 7b02          	ld	a,(OFST-2,sp)
 374  0085 eb01          	add	a,(1,x)
 375  0087 6b02          	ld	(OFST-2,sp),a
 377                     ; 31     buffer[pos++] = package->type;
 380  0089 5f            	clrw	x
 381  008a 0c02          	inc	(OFST-2,sp)
 382  008c 97            	ld	xl,a
 383  008d 1605          	ldw	y,(OFST+1,sp)
 384  008f 72fb03        	addw	x,(OFST-1,sp)
 385  0092 90e604        	ld	a,(4,y)
 386  0095 f7            	ld	(x),a
 387                     ; 32     buffer[pos++] = package->data->size;
 389  0096 7b02          	ld	a,(OFST-2,sp)
 390  0098 0c02          	inc	(OFST-2,sp)
 392  009a 5f            	clrw	x
 393  009b 97            	ld	xl,a
 394  009c 90ee05        	ldw	y,(5,y)
 395  009f 72fb03        	addw	x,(OFST-1,sp)
 396  00a2 90e602        	ld	a,(2,y)
 397  00a5 f7            	ld	(x),a
 398                     ; 33     memcpy(&buffer[pos], package->data->data, package->data->size);
 400  00a6 1e05          	ldw	x,(OFST+1,sp)
 401  00a8 ee05          	ldw	x,(5,x)
 402  00aa e602          	ld	a,(2,x)
 403  00ac 5f            	clrw	x
 404  00ad 97            	ld	xl,a
 405  00ae 89            	pushw	x
 406  00af 1e07          	ldw	x,(OFST+3,sp)
 407  00b1 ee05          	ldw	x,(5,x)
 408  00b3 fe            	ldw	x,(x)
 409  00b4 89            	pushw	x
 410  00b5 7b06          	ld	a,(OFST+2,sp)
 411  00b7 5f            	clrw	x
 412  00b8 97            	ld	xl,a
 413  00b9 72fb07        	addw	x,(OFST+3,sp)
 414  00bc cd0000        	call	_memcpy
 416  00bf 5b04          	addw	sp,#4
 417                     ; 34     pos += package->data->size;
 419  00c1 1e05          	ldw	x,(OFST+1,sp)
 420  00c3 ee05          	ldw	x,(5,x)
 421  00c5 7b02          	ld	a,(OFST-2,sp)
 422  00c7 eb02          	add	a,(2,x)
 423  00c9 6b02          	ld	(OFST-2,sp),a
 425                     ; 35     buffer[pos++] = package->e_flag;
 428  00cb 5f            	clrw	x
 429  00cc 0c02          	inc	(OFST-2,sp)
 430  00ce 97            	ld	xl,a
 431  00cf 1605          	ldw	y,(OFST+1,sp)
 432  00d1 72fb03        	addw	x,(OFST-1,sp)
 433  00d4 90e607        	ld	a,(7,y)
 434  00d7 f7            	ld	(x),a
 435                     ; 36     if (out_size) *out_size = total_size;
 437  00d8 1e09          	ldw	x,(OFST+5,sp)
 438  00da 2703          	jreq	L151
 441  00dc 7b01          	ld	a,(OFST-3,sp)
 442  00de f7            	ld	(x),a
 443  00df               L151:
 444                     ; 37     return buffer;
 446  00df 1e03          	ldw	x,(OFST-1,sp)
 448  00e1               L02:
 450  00e1 5b06          	addw	sp,#6
 451  00e3 81            	ret	
 514                     ; 40 struct dataPackage* deserializeDataPackage(const uint8_t* buffer) {
 515                     	switch	.text
 516  00e4               _deserializeDataPackage:
 518  00e4 89            	pushw	x
 519  00e5 5203          	subw	sp,#3
 520       00000003      OFST:	set	3
 523                     ; 44     pos = 0;
 525  00e7 0f01          	clr	(OFST-2,sp)
 527                     ; 45     package = (struct dataPackage*)malloc(sizeof(struct dataPackage));
 529  00e9 ae0008        	ldw	x,#8
 530  00ec cd0000        	call	_malloc
 532  00ef 1f02          	ldw	(OFST-1,sp),x
 534                     ; 46     if (!package) return NULL;
 538  00f1 272f          	jreq	LC001
 539                     ; 48     package->id = buffer[pos++];
 541  00f3 7b01          	ld	a,(OFST-2,sp)
 542  00f5 0c01          	inc	(OFST-2,sp)
 544  00f7 5f            	clrw	x
 545  00f8 97            	ld	xl,a
 546  00f9 72fb04        	addw	x,(OFST+1,sp)
 547  00fc f6            	ld	a,(x)
 548  00fd 1e02          	ldw	x,(OFST-1,sp)
 549  00ff f7            	ld	(x),a
 550                     ; 49     package->d_size = buffer[pos++];
 552  0100 7b01          	ld	a,(OFST-2,sp)
 553  0102 0c01          	inc	(OFST-2,sp)
 555  0104 5f            	clrw	x
 556  0105 97            	ld	xl,a
 557  0106 72fb04        	addw	x,(OFST+1,sp)
 558  0109 f6            	ld	a,(x)
 559  010a 1e02          	ldw	x,(OFST-1,sp)
 560  010c e701          	ld	(1,x),a
 561                     ; 50     package->device = (uint8_t*)malloc(package->d_size);
 563  010e 5f            	clrw	x
 564  010f 97            	ld	xl,a
 565  0110 cd0000        	call	_malloc
 567  0113 1602          	ldw	y,(OFST-1,sp)
 568  0115 90ef02        	ldw	(2,y),x
 569                     ; 51     if (!package->device) {
 571  0118 93            	ldw	x,y
 572  0119 e603          	ld	a,(3,x)
 573  011b ea02          	or	a,(2,x)
 574  011d 2607          	jrne	L702
 575                     ; 52         free(package);
 577  011f               LC002:
 578  011f cd0000        	call	_free
 580                     ; 53         return NULL;
 582  0122               LC001:
 586  0122 5f            	clrw	x
 588  0123               L06:
 590  0123 5b05          	addw	sp,#5
 591  0125 81            	ret	
 592  0126               L702:
 593                     ; 55     memcpy(package->device, &buffer[pos], package->d_size);
 595  0126 e601          	ld	a,(1,x)
 596  0128 5f            	clrw	x
 597  0129 97            	ld	xl,a
 598  012a 89            	pushw	x
 599  012b 7b06          	ld	a,(OFST+3,sp)
 600  012d 97            	ld	xl,a
 601  012e 7b07          	ld	a,(OFST+4,sp)
 602  0130 1b03          	add	a,(OFST+0,sp)
 603  0132 2401          	jrnc	L43
 604  0134 5c            	incw	x
 605  0135               L43:
 606  0135 02            	rlwa	x,a
 607  0136 89            	pushw	x
 608  0137 1e06          	ldw	x,(OFST+3,sp)
 609  0139 ee02          	ldw	x,(2,x)
 610  013b cd0000        	call	_memcpy
 612  013e 5b04          	addw	sp,#4
 613                     ; 56     pos += package->d_size;
 615  0140 1e02          	ldw	x,(OFST-1,sp)
 616  0142 7b01          	ld	a,(OFST-2,sp)
 617  0144 eb01          	add	a,(1,x)
 618  0146 6b01          	ld	(OFST-2,sp),a
 620                     ; 58     package->type = buffer[pos++];
 623  0148 5f            	clrw	x
 624  0149 0c01          	inc	(OFST-2,sp)
 625  014b 97            	ld	xl,a
 626  014c 72fb04        	addw	x,(OFST+1,sp)
 627  014f f6            	ld	a,(x)
 628  0150 1e02          	ldw	x,(OFST-1,sp)
 629  0152 e704          	ld	(4,x),a
 630                     ; 60     package->data = (struct eventData*)malloc(sizeof(struct eventData));
 632  0154 ae0003        	ldw	x,#3
 633  0157 cd0000        	call	_malloc
 635  015a 1602          	ldw	y,(OFST-1,sp)
 636  015c 90ef05        	ldw	(5,y),x
 637                     ; 61     if (!package->data) {
 639  015f 93            	ldw	x,y
 640  0160 e606          	ld	a,(6,x)
 641  0162 ea05          	or	a,(5,x)
 642                     ; 62         free(package->device);
 644                     ; 63         free(package);
 646                     ; 64         return NULL;
 648  0164 2732          	jreq	LC003
 649                     ; 67     package->data->size = buffer[pos++];
 651  0166 7b01          	ld	a,(OFST-2,sp)
 652  0168 0c01          	inc	(OFST-2,sp)
 654  016a 5f            	clrw	x
 655  016b 97            	ld	xl,a
 656  016c 72fb04        	addw	x,(OFST+1,sp)
 657  016f f6            	ld	a,(x)
 658  0170 93            	ldw	x,y
 659  0171 ee05          	ldw	x,(5,x)
 660  0173 e702          	ld	(2,x),a
 661                     ; 68     package->data->data = (uint8_t*)malloc(package->data->size);
 663  0175 93            	ldw	x,y
 664  0176 ee05          	ldw	x,(5,x)
 665  0178 e602          	ld	a,(2,x)
 666  017a 5f            	clrw	x
 667  017b 97            	ld	xl,a
 668  017c cd0000        	call	_malloc
 670  017f 1602          	ldw	y,(OFST-1,sp)
 671  0181 90ee05        	ldw	y,(5,y)
 672  0184 90ff          	ldw	(y),x
 673                     ; 69     if (!package->data->data) {
 675  0186 1e02          	ldw	x,(OFST-1,sp)
 676  0188 ee05          	ldw	x,(5,x)
 677  018a e601          	ld	a,(1,x)
 678  018c fa            	or	a,(x)
 679  018d 2613          	jrne	L312
 680                     ; 70         free(package->data);
 682  018f 1e02          	ldw	x,(OFST-1,sp)
 683  0191 ee05          	ldw	x,(5,x)
 684  0193 cd0000        	call	_free
 686                     ; 71         free(package->device);
 688  0196 1e02          	ldw	x,(OFST-1,sp)
 690                     ; 72         free(package);
 692  0198               LC003:
 694  0198 ee02          	ldw	x,(2,x)
 695  019a cd0000        	call	_free
 697  019d 1e02          	ldw	x,(OFST-1,sp)
 699                     ; 73         return NULL;
 701  019f cc011f        	jp	LC002
 702  01a2               L312:
 703                     ; 75     memcpy(package->data->data, &buffer[pos], package->data->size);
 705  01a2 1e02          	ldw	x,(OFST-1,sp)
 706  01a4 ee05          	ldw	x,(5,x)
 707  01a6 e602          	ld	a,(2,x)
 708  01a8 5f            	clrw	x
 709  01a9 97            	ld	xl,a
 710  01aa 89            	pushw	x
 711  01ab 7b06          	ld	a,(OFST+3,sp)
 712  01ad 97            	ld	xl,a
 713  01ae 7b07          	ld	a,(OFST+4,sp)
 714  01b0 1b03          	add	a,(OFST+0,sp)
 715  01b2 2401          	jrnc	L65
 716  01b4 5c            	incw	x
 717  01b5               L65:
 718  01b5 02            	rlwa	x,a
 719  01b6 89            	pushw	x
 720  01b7 1e06          	ldw	x,(OFST+3,sp)
 721  01b9 ee05          	ldw	x,(5,x)
 722  01bb fe            	ldw	x,(x)
 723  01bc cd0000        	call	_memcpy
 725  01bf 5b04          	addw	sp,#4
 726                     ; 76     pos += package->data->size;
 728  01c1 1e02          	ldw	x,(OFST-1,sp)
 729  01c3 ee05          	ldw	x,(5,x)
 730  01c5 7b01          	ld	a,(OFST-2,sp)
 731  01c7 eb02          	add	a,(2,x)
 732  01c9 6b01          	ld	(OFST-2,sp),a
 734                     ; 78     package->e_flag = buffer[pos++];
 737  01cb 5f            	clrw	x
 738  01cc 0c01          	inc	(OFST-2,sp)
 739  01ce 97            	ld	xl,a
 740  01cf 72fb04        	addw	x,(OFST+1,sp)
 741  01d2 f6            	ld	a,(x)
 742  01d3 1e02          	ldw	x,(OFST-1,sp)
 743  01d5 e707          	ld	(7,x),a
 744                     ; 80     return package;
 747  01d7 cc0123        	jra	L06
 853                     ; 83 uint8_t* serializeAckPackage(struct ackPackage* ack, uint8_t* out_size) {
 854                     	switch	.text
 855  01da               _serializeAckPackage:
 857  01da 89            	pushw	x
 858  01db 5204          	subw	sp,#4
 859       00000004      OFST:	set	4
 862                     ; 88     pos = 0;
 864  01dd 0f02          	clr	(OFST-2,sp)
 866                     ; 89     total_size = 3;
 868  01df a603          	ld	a,#3
 869  01e1 6b01          	ld	(OFST-3,sp),a
 871                     ; 90     buffer = (uint8_t*)malloc(total_size);
 873  01e3 ae0003        	ldw	x,#3
 874  01e6 cd0000        	call	_malloc
 876  01e9 1f03          	ldw	(OFST-1,sp),x
 878                     ; 91     if (!buffer) return NULL;
 880  01eb 2603          	jrne	L762
 883  01ed 5f            	clrw	x
 885  01ee 2031          	jra	L66
 886  01f0               L762:
 887                     ; 93     buffer[pos++] = ack->id;
 889  01f0 7b02          	ld	a,(OFST-2,sp)
 890  01f2 0c02          	inc	(OFST-2,sp)
 892  01f4 5f            	clrw	x
 893  01f5 97            	ld	xl,a
 894  01f6 1605          	ldw	y,(OFST+1,sp)
 895  01f8 72fb03        	addw	x,(OFST-1,sp)
 896  01fb 90f6          	ld	a,(y)
 897  01fd f7            	ld	(x),a
 898                     ; 94     buffer[pos++] = ack->g_flag;
 900  01fe 7b02          	ld	a,(OFST-2,sp)
 901  0200 0c02          	inc	(OFST-2,sp)
 903  0202 5f            	clrw	x
 904  0203 97            	ld	xl,a
 905  0204 72fb03        	addw	x,(OFST-1,sp)
 906  0207 90e601        	ld	a,(1,y)
 907  020a f7            	ld	(x),a
 908                     ; 95     buffer[pos++] = ack->f_flag;
 910  020b 7b02          	ld	a,(OFST-2,sp)
 911  020d 0c02          	inc	(OFST-2,sp)
 913  020f 5f            	clrw	x
 914  0210 97            	ld	xl,a
 915  0211 72fb03        	addw	x,(OFST-1,sp)
 916  0214 90e602        	ld	a,(2,y)
 917  0217 f7            	ld	(x),a
 918                     ; 96     if (out_size) *out_size = total_size;
 920  0218 1e09          	ldw	x,(OFST+5,sp)
 921  021a 2703          	jreq	L172
 924  021c 7b01          	ld	a,(OFST-3,sp)
 925  021e f7            	ld	(x),a
 926  021f               L172:
 927                     ; 97     return buffer;
 929  021f 1e03          	ldw	x,(OFST-1,sp)
 931  0221               L66:
 933  0221 5b06          	addw	sp,#6
 934  0223 81            	ret	
1050                     ; 100 int send_one_data_package(uint8_t id, uint8_t *device, uint8_t d_size, uint8_t type, struct eventData *partial_data, uint8_t e_flag) {
1051                     	switch	.text
1052  0224               _send_one_data_package:
1054  0224 88            	push	a
1055  0225 520b          	subw	sp,#11
1056       0000000b      OFST:	set	11
1059                     ; 105     dPack.id = id;
1061  0227 6b04          	ld	(OFST-7,sp),a
1063                     ; 106     dPack.d_size = d_size;
1065  0229 7b11          	ld	a,(OFST+6,sp)
1066  022b 6b05          	ld	(OFST-6,sp),a
1068                     ; 107     dPack.device = device;
1070  022d 1e0f          	ldw	x,(OFST+4,sp)
1071  022f 1f06          	ldw	(OFST-5,sp),x
1073                     ; 108     dPack.type = type;
1075  0231 7b12          	ld	a,(OFST+7,sp)
1076  0233 6b08          	ld	(OFST-3,sp),a
1078                     ; 109     dPack.data = partial_data;
1080  0235 1e13          	ldw	x,(OFST+8,sp)
1081  0237 1f09          	ldw	(OFST-2,sp),x
1083                     ; 110     dPack.e_flag = e_flag;
1085  0239 7b15          	ld	a,(OFST+10,sp)
1086  023b 6b0b          	ld	(OFST+0,sp),a
1088                     ; 112     rData = serializeDataPackage(&dPack, &rSize);
1090  023d 96            	ldw	x,sp
1091  023e 5c            	incw	x
1092  023f 89            	pushw	x
1093  0240 1c0003        	addw	x,#3
1094  0243 cd0031        	call	_serializeDataPackage
1096  0246 5b02          	addw	sp,#2
1097  0248 1f02          	ldw	(OFST-9,sp),x
1099                     ; 113     if (rData == NULL) return -1;
1101  024a 2603          	jrne	L353
1104  024c 5a            	decw	x
1106  024d 200d          	jra	L001
1107  024f               L353:
1108                     ; 115     tx_send(rData, rSize);
1110  024f 7b01          	ld	a,(OFST-10,sp)
1111  0251 88            	push	a
1112  0252 cd0000        	call	_tx_send
1114  0255 84            	pop	a
1115                     ; 116     free(rData);
1117  0256 1e02          	ldw	x,(OFST-9,sp)
1118  0258 cd0000        	call	_free
1120                     ; 118     return 0;
1122  025b 5f            	clrw	x
1124  025c               L001:
1126  025c 5b0c          	addw	sp,#12
1127  025e 81            	ret	
1175                     ; 121 int receive_ack(struct ackPackage *ack) {
1176                     	switch	.text
1177  025f               _receive_ack:
1179  025f 89            	pushw	x
1180  0260 5203          	subw	sp,#3
1181       00000003      OFST:	set	3
1184                     ; 124     rx_read(buffer, 3);
1186  0262 4b03          	push	#3
1187  0264 96            	ldw	x,sp
1188  0265 1c0002        	addw	x,#OFST-1
1189  0268 cd0000        	call	_rx_read
1191  026b 84            	pop	a
1192                     ; 126     ack->id = buffer[0];
1194  026c 1e04          	ldw	x,(OFST+1,sp)
1195  026e 7b01          	ld	a,(OFST-2,sp)
1196  0270 f7            	ld	(x),a
1197                     ; 127     ack->g_flag = buffer[1];
1199  0271 7b02          	ld	a,(OFST-1,sp)
1200  0273 e701          	ld	(1,x),a
1201                     ; 128     ack->f_flag = buffer[2];
1203  0275 7b03          	ld	a,(OFST+0,sp)
1204  0277 e702          	ld	(2,x),a
1205                     ; 130     return 0;
1207  0279 5f            	clrw	x
1210  027a 5b05          	addw	sp,#5
1211  027c 81            	ret	
1390                     ; 133 uint8_t send_event(uint8_t *device, uint8_t d_size, uint8_t type, struct eventData *data, uint8_t max_pack_size) {
1391                     	switch	.text
1392  027d               _send_event:
1394  027d 89            	pushw	x
1395  027e 5211          	subw	sp,#17
1396       00000011      OFST:	set	17
1399                     ; 138     packet_id = 0;
1401  0280 0f0d          	clr	(OFST-4,sp)
1403                     ; 139     bytes_sent = 0;
1405  0282 5f            	clrw	x
1406  0283 1f10          	ldw	(OFST-1,sp),x
1408                     ; 140     data_total_size = data->size;
1410  0285 1e18          	ldw	x,(OFST+7,sp)
1411  0287 e602          	ld	a,(2,x)
1412  0289 5f            	clrw	x
1413  028a 97            	ld	xl,a
1414  028b 1f0e          	ldw	(OFST-3,sp),x
1416                     ; 142     if (device[0] != txaddr[0]) return -1;
1418  028d 1e12          	ldw	x,(OFST+1,sp)
1419  028f f6            	ld	a,(x)
1420  0290 92c100        	cp	a,[_txaddr.w]
1421  0293 2603cc0355    	jreq	L125
1424  0298 a6ff          	ld	a,#255
1426  029a 2019          	jra	L431
1427  029c               L715:
1428                     ; 154         remaining = data_total_size - bytes_sent;
1430  029c 1e0e          	ldw	x,(OFST-3,sp)
1431  029e 72f010        	subw	x,(OFST-1,sp)
1432  02a1 1f03          	ldw	(OFST-14,sp),x
1434                     ; 155         overhead = 1 + 1 + d_size + 1 + 1 + 1;
1436  02a3 7b16          	ld	a,(OFST+5,sp)
1437  02a5 ab05          	add	a,#5
1438  02a7 6b0b          	ld	(OFST-6,sp),a
1440                     ; 156         available_space = (max_pack_size > overhead) ? (max_pack_size - overhead) : 0;
1442  02a9 7b1a          	ld	a,(OFST+9,sp)
1443  02ab 100b          	sub	a,(OFST-6,sp)
1444  02ad 2201          	jrugt	L211
1445  02af 4f            	clr	a
1446  02b0               L211:
1447  02b0 6b0c          	ld	(OFST-5,sp),a
1449                     ; 158         if (available_space == 0) return -1;
1451  02b2 2604          	jrne	L525
1454  02b4 4a            	dec	a
1456  02b5               L431:
1458  02b5 5b13          	addw	sp,#19
1459  02b7 81            	ret	
1460  02b8               L525:
1461                     ; 160         chunk_size = (remaining > available_space) ? available_space : remaining;
1463  02b8 5f            	clrw	x
1464  02b9 97            	ld	xl,a
1465  02ba bf00          	ldw	c_x,x
1466  02bc 1e03          	ldw	x,(OFST-14,sp)
1467  02be b300          	cpw	x,c_x
1468  02c0 2202          	jrugt	L611
1469  02c2 7b04          	ld	a,(OFST-13,sp)
1470  02c4               L611:
1471  02c4 6b0b          	ld	(OFST-6,sp),a
1473                     ; 161         e_flag = (bytes_sent + chunk_size == data_total_size) ? 1 : 0;
1475  02c6 5f            	clrw	x
1476  02c7 97            	ld	xl,a
1477  02c8 72fb10        	addw	x,(OFST-1,sp)
1478  02cb 130e          	cpw	x,(OFST-3,sp)
1479  02cd 2604          	jrne	L021
1480  02cf a601          	ld	a,#1
1481  02d1 2001          	jra	L221
1482  02d3               L021:
1483  02d3 4f            	clr	a
1484  02d4               L221:
1485  02d4 6b0c          	ld	(OFST-5,sp),a
1487                     ; 163         partial_data.size = chunk_size;
1489  02d6 7b0b          	ld	a,(OFST-6,sp)
1490  02d8 6b07          	ld	(OFST-10,sp),a
1492                     ; 164         partial_data.data = &(data->data[bytes_sent]);
1494  02da 1e18          	ldw	x,(OFST+7,sp)
1495  02dc fe            	ldw	x,(x)
1496  02dd 72fb10        	addw	x,(OFST-1,sp)
1497  02e0 1f05          	ldw	(OFST-12,sp),x
1499                     ; 166         if (send_one_data_package(packet_id++, device, d_size, type, &partial_data, e_flag) != 0) {
1501  02e2 7b0c          	ld	a,(OFST-5,sp)
1502  02e4 88            	push	a
1503  02e5 96            	ldw	x,sp
1504  02e6 1c0006        	addw	x,#OFST-11
1505  02e9 89            	pushw	x
1506  02ea 7b1a          	ld	a,(OFST+9,sp)
1507  02ec 88            	push	a
1508  02ed 7b1a          	ld	a,(OFST+9,sp)
1509  02ef 88            	push	a
1510  02f0 1e17          	ldw	x,(OFST+6,sp)
1511  02f2 89            	pushw	x
1512  02f3 7b14          	ld	a,(OFST+3,sp)
1513  02f5 0c14          	inc	(OFST+3,sp)
1515  02f7 cd0224        	call	_send_one_data_package
1517  02fa 5b07          	addw	sp,#7
1518  02fc 5d            	tnzw	x
1519  02fd 2704          	jreq	L725
1520                     ; 167             return -1;
1522  02ff a6ff          	ld	a,#255
1524  0301 20b2          	jra	L431
1525  0303               L725:
1526                     ; 170         if (e_flag == 0) {
1528  0303 7b0c          	ld	a,(OFST-5,sp)
1529  0305 2643          	jrne	L135
1530                     ; 171             for (c = 0; c < 5; c++) {
1532  0307 6b0c          	ld	(OFST-5,sp),a
1534  0309               L335:
1535                     ; 172                 if (receive_ack(&ack) == 0) {
1537  0309 96            	ldw	x,sp
1538  030a 1c0008        	addw	x,#OFST-9
1539  030d cd025f        	call	_receive_ack
1541  0310 5d            	tnzw	x
1542  0311 2619          	jrne	L145
1543                     ; 173                     if (ack.f_flag == 1 && ack.id == packet_id - 1) {
1545  0313 7b0a          	ld	a,(OFST-7,sp)
1546  0315 4a            	dec	a
1547  0316 2612          	jrne	L345
1549  0318 7b0d          	ld	a,(OFST-4,sp)
1550  031a 5f            	clrw	x
1551  031b 97            	ld	xl,a
1552  031c 5a            	decw	x
1553  031d 7b08          	ld	a,(OFST-9,sp)
1554  031f 905f          	clrw	y
1555  0321 9097          	ld	yl,a
1556  0323 90bf00        	ldw	c_y,y
1557  0326 b300          	cpw	x,c_y
1558  0328 2715          	jreq	L735
1559                     ; 174                         break;
1561  032a               L345:
1562                     ; 176                         c--;
1564  032a 0a0c          	dec	(OFST-5,sp)
1566                     ; 177                         delay_ms(1000);
1568  032c               L145:
1569                     ; 180                     delay_ms(1000);
1573  032c ae03e8        	ldw	x,#1000
1574  032f 89            	pushw	x
1575  0330 5f            	clrw	x
1576  0331 89            	pushw	x
1577  0332 cd0000        	call	_delay_ms
1578  0335 5b04          	addw	sp,#4
1579                     ; 171             for (c = 0; c < 5; c++) {
1581  0337 0c0c          	inc	(OFST-5,sp)
1585  0339 7b0c          	ld	a,(OFST-5,sp)
1586  033b a105          	cp	a,#5
1587  033d 25ca          	jrult	L335
1588  033f               L735:
1589                     ; 183             if (c == 5) {
1591  033f 7b0c          	ld	a,(OFST-5,sp)
1592  0341 a105          	cp	a,#5
1593  0343 2605          	jrne	L135
1594                     ; 184                 return -1;
1596  0345 a6ff          	ld	a,#255
1598  0347 cc02b5        	jra	L431
1599  034a               L135:
1600                     ; 188         bytes_sent += chunk_size;
1602  034a 7b0b          	ld	a,(OFST-6,sp)
1603  034c 5f            	clrw	x
1604  034d 97            	ld	xl,a
1605  034e 1f01          	ldw	(OFST-16,sp),x
1607  0350 72fb10        	addw	x,(OFST-1,sp)
1608  0353 1f10          	ldw	(OFST-1,sp),x
1610  0355               L125:
1611                     ; 144     while (bytes_sent < data_total_size) {
1613  0355 1e10          	ldw	x,(OFST-1,sp)
1614  0357 130e          	cpw	x,(OFST-3,sp)
1615  0359 2403cc029c    	jrult	L715
1616                     ; 191     return 0;
1618  035e 4f            	clr	a
1620  035f cc02b5        	jra	L431
1633                     	xref	_memcpy
1634                     	xref	_malloc
1635                     	xref	_free
1636                     	xref	_rx_read
1637                     	xref	_tx_send
1638                     	xdef	_send_event
1639                     	xdef	_receive_ack
1640                     	xdef	_send_one_data_package
1641                     	xdef	_serializeAckPackage
1642                     	xdef	_deserializeDataPackage
1643                     	xdef	_serializeDataPackage
1644                     	xdef	_delay_ms
1645                     	xref.b	_txaddr
1646                     	xref.b	c_x
1647                     	xref.b	c_y
1666                     	xref	c_lrzmp
1667                     	xref	c_lgsbc
1668                     	xref	c_rtol
1669                     	xref	c_lmul
1670                     	xref	c_ltor
1671                     	end
