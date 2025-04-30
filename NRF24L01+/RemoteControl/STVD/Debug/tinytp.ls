   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.3 - 22 Aug 2024
  72                     .const:	section	.text
  73  0000               L6:
  74  0000 00003e80      	dc.l	16000
  76                     ; 7 void delay_ms(uint32_t ms) {
  77                     	scross	off
  78                     	switch	.text
  79  0000               _delay_ms:
  81  0000 5208          	subw	sp,#8
  82       00000008      OFST:	set	8
  85                     ; 8     uint32_t cycles_per_ms = PROC_FREQ / 1000;
  87                     ; 9     volatile uint32_t cycles = cycles_per_ms * ms;
  89  0002 96            	ldw	x,sp
  90  0003 1c000b        	addw	x,#OFST+3
  91  0006 cd0000        	call	c_ltor
  93  0009 ae0000        	ldw	x,#L6
  94  000c cd0000        	call	c_lmul
  96  000f 96            	ldw	x,sp
  97  0010 1c0005        	addw	x,#OFST-3
  98  0013 cd0000        	call	c_rtol
 102  0016 2001          	jra	L34
 103  0018               L73:
 104                     ; 12         __asm volatile("nop");
 107  0018 9d            nop
 109  0019               L34:
 110                     ; 11     while (cycles--) {
 112  0019 96            	ldw	x,sp
 113  001a 1c0005        	addw	x,#OFST-3
 114  001d cd0000        	call	c_ltor
 116  0020 96            	ldw	x,sp
 117  0021 1c0005        	addw	x,#OFST-3
 118  0024 a601          	ld	a,#1
 119  0026 cd0000        	call	c_lgsbc
 122  0029 cd0000        	call	c_lrzmp
 124  002c 26ea          	jrne	L73
 125                     ; 14 }
 128  002e 5b08          	addw	sp,#8
 129  0030 81            	ret
 289                     ; 17 uint8_t *serializeDataPackage(struct dataPackage* package, uint8_t *out_size) {
 290                     	switch	.text
 291  0031               _serializeDataPackage:
 293  0031 89            	pushw	x
 294  0032 5204          	subw	sp,#4
 295       00000004      OFST:	set	4
 298                     ; 22     pos = 0;
 300  0034 0f02          	clr	(OFST-2,sp)
 302                     ; 23     total_size = 1 + 1 + package->d_size + 1 + 1 + package->data->size + 1;
 304  0036 ee05          	ldw	x,(5,x)
 305  0038 e602          	ld	a,(2,x)
 306  003a 1e05          	ldw	x,(OFST+1,sp)
 307  003c eb01          	add	a,(1,x)
 308  003e ab05          	add	a,#5
 309  0040 6b01          	ld	(OFST-3,sp),a
 311                     ; 24     buffer = (uint8_t*)malloc(total_size);
 313  0042 7b01          	ld	a,(OFST-3,sp)
 314  0044 5f            	clrw	x
 315  0045 97            	ld	xl,a
 316  0046 cd0000        	call	_malloc
 318  0049 1f03          	ldw	(OFST-1,sp),x
 320                     ; 25     if (!buffer) return NULL;
 322  004b 1e03          	ldw	x,(OFST-1,sp)
 323  004d 2605          	jrne	L741
 326  004f 5f            	clrw	x
 328  0050 ac140114      	jpf	L22
 329  0054               L741:
 330                     ; 27     buffer[pos++] = package->id;
 332  0054 7b02          	ld	a,(OFST-2,sp)
 333  0056 97            	ld	xl,a
 334  0057 0c02          	inc	(OFST-2,sp)
 336  0059 9f            	ld	a,xl
 337  005a 5f            	clrw	x
 338  005b 97            	ld	xl,a
 339  005c 72fb03        	addw	x,(OFST-1,sp)
 340  005f 1605          	ldw	y,(OFST+1,sp)
 341  0061 90f6          	ld	a,(y)
 342  0063 f7            	ld	(x),a
 343                     ; 28     buffer[pos++] = package->d_size;
 345  0064 7b02          	ld	a,(OFST-2,sp)
 346  0066 97            	ld	xl,a
 347  0067 0c02          	inc	(OFST-2,sp)
 349  0069 9f            	ld	a,xl
 350  006a 5f            	clrw	x
 351  006b 97            	ld	xl,a
 352  006c 72fb03        	addw	x,(OFST-1,sp)
 353  006f 1605          	ldw	y,(OFST+1,sp)
 354  0071 90e601        	ld	a,(1,y)
 355  0074 f7            	ld	(x),a
 356                     ; 29     memcpy(&buffer[pos], package->device, package->d_size);
 358  0075 7b02          	ld	a,(OFST-2,sp)
 359  0077 5f            	clrw	x
 360  0078 97            	ld	xl,a
 361  0079 72fb03        	addw	x,(OFST-1,sp)
 362  007c bf00          	ldw	c_x,x
 363  007e 1605          	ldw	y,(OFST+1,sp)
 364  0080 90ee02        	ldw	y,(2,y)
 365  0083 90bf00        	ldw	c_y,y
 366  0086 1e05          	ldw	x,(OFST+1,sp)
 367  0088 e601          	ld	a,(1,x)
 368  008a 5f            	clrw	x
 369  008b 97            	ld	xl,a
 370  008c 5d            	tnzw	x
 371  008d 270a          	jreq	L21
 372  008f               L41:
 373  008f 5a            	decw	x
 374  0090 92d600        	ld	a,([c_y.w],x)
 375  0093 92d700        	ld	([c_x.w],x),a
 376  0096 5d            	tnzw	x
 377  0097 26f6          	jrne	L41
 378  0099               L21:
 379                     ; 30     pos += package->d_size;
 381  0099 1e05          	ldw	x,(OFST+1,sp)
 382  009b 7b02          	ld	a,(OFST-2,sp)
 383  009d eb01          	add	a,(1,x)
 384  009f 6b02          	ld	(OFST-2,sp),a
 386                     ; 31     buffer[pos++] = package->type;
 388  00a1 7b02          	ld	a,(OFST-2,sp)
 389  00a3 97            	ld	xl,a
 390  00a4 0c02          	inc	(OFST-2,sp)
 392  00a6 9f            	ld	a,xl
 393  00a7 5f            	clrw	x
 394  00a8 97            	ld	xl,a
 395  00a9 72fb03        	addw	x,(OFST-1,sp)
 396  00ac 1605          	ldw	y,(OFST+1,sp)
 397  00ae 90e604        	ld	a,(4,y)
 398  00b1 f7            	ld	(x),a
 399                     ; 32     buffer[pos++] = package->data->size;
 401  00b2 7b02          	ld	a,(OFST-2,sp)
 402  00b4 97            	ld	xl,a
 403  00b5 0c02          	inc	(OFST-2,sp)
 405  00b7 9f            	ld	a,xl
 406  00b8 5f            	clrw	x
 407  00b9 97            	ld	xl,a
 408  00ba 72fb03        	addw	x,(OFST-1,sp)
 409  00bd 1605          	ldw	y,(OFST+1,sp)
 410  00bf 90ee05        	ldw	y,(5,y)
 411  00c2 90e602        	ld	a,(2,y)
 412  00c5 f7            	ld	(x),a
 413                     ; 33     memcpy(&buffer[pos], package->data->data, package->data->size);
 415  00c6 7b02          	ld	a,(OFST-2,sp)
 416  00c8 5f            	clrw	x
 417  00c9 97            	ld	xl,a
 418  00ca 72fb03        	addw	x,(OFST-1,sp)
 419  00cd bf00          	ldw	c_x,x
 420  00cf 1605          	ldw	y,(OFST+1,sp)
 421  00d1 90ee05        	ldw	y,(5,y)
 422  00d4 90fe          	ldw	y,(y)
 423  00d6 90bf00        	ldw	c_y,y
 424  00d9 1e05          	ldw	x,(OFST+1,sp)
 425  00db ee05          	ldw	x,(5,x)
 426  00dd e602          	ld	a,(2,x)
 427  00df 5f            	clrw	x
 428  00e0 97            	ld	xl,a
 429  00e1 5d            	tnzw	x
 430  00e2 270a          	jreq	L61
 431  00e4               L02:
 432  00e4 5a            	decw	x
 433  00e5 92d600        	ld	a,([c_y.w],x)
 434  00e8 92d700        	ld	([c_x.w],x),a
 435  00eb 5d            	tnzw	x
 436  00ec 26f6          	jrne	L02
 437  00ee               L61:
 438                     ; 34     pos += package->data->size;
 440  00ee 1e05          	ldw	x,(OFST+1,sp)
 441  00f0 ee05          	ldw	x,(5,x)
 442  00f2 7b02          	ld	a,(OFST-2,sp)
 443  00f4 eb02          	add	a,(2,x)
 444  00f6 6b02          	ld	(OFST-2,sp),a
 446                     ; 35     buffer[pos++] = package->e_flag;
 448  00f8 7b02          	ld	a,(OFST-2,sp)
 449  00fa 97            	ld	xl,a
 450  00fb 0c02          	inc	(OFST-2,sp)
 452  00fd 9f            	ld	a,xl
 453  00fe 5f            	clrw	x
 454  00ff 97            	ld	xl,a
 455  0100 72fb03        	addw	x,(OFST-1,sp)
 456  0103 1605          	ldw	y,(OFST+1,sp)
 457  0105 90e607        	ld	a,(7,y)
 458  0108 f7            	ld	(x),a
 459                     ; 36     if (out_size) *out_size = total_size;
 461  0109 1e09          	ldw	x,(OFST+5,sp)
 462  010b 2705          	jreq	L151
 465  010d 7b01          	ld	a,(OFST-3,sp)
 466  010f 1e09          	ldw	x,(OFST+5,sp)
 467  0111 f7            	ld	(x),a
 468  0112               L151:
 469                     ; 37     return buffer;
 471  0112 1e03          	ldw	x,(OFST-1,sp)
 473  0114               L22:
 475  0114 5b06          	addw	sp,#6
 476  0116 81            	ret
 539                     ; 40 struct dataPackage* deserializeDataPackage(const uint8_t* buffer) {
 540                     	switch	.text
 541  0117               _deserializeDataPackage:
 543  0117 89            	pushw	x
 544  0118 5203          	subw	sp,#3
 545       00000003      OFST:	set	3
 548                     ; 44     pos = 0;
 550  011a 0f01          	clr	(OFST-2,sp)
 552                     ; 45     package = (struct dataPackage*)malloc(sizeof(struct dataPackage));
 554  011c ae0008        	ldw	x,#8
 555  011f cd0000        	call	_malloc
 557  0122 1f02          	ldw	(OFST-1,sp),x
 559                     ; 46     if (!package) return NULL;
 561  0124 1e02          	ldw	x,(OFST-1,sp)
 562  0126 2603          	jrne	L502
 565  0128 5f            	clrw	x
 567  0129 203b          	jra	L63
 568  012b               L502:
 569                     ; 48     package->id = buffer[pos++];
 571  012b 7b01          	ld	a,(OFST-2,sp)
 572  012d 97            	ld	xl,a
 573  012e 0c01          	inc	(OFST-2,sp)
 575  0130 9f            	ld	a,xl
 576  0131 5f            	clrw	x
 577  0132 97            	ld	xl,a
 578  0133 72fb04        	addw	x,(OFST+1,sp)
 579  0136 f6            	ld	a,(x)
 580  0137 1e02          	ldw	x,(OFST-1,sp)
 581  0139 f7            	ld	(x),a
 582                     ; 49     package->d_size = buffer[pos++];
 584  013a 7b01          	ld	a,(OFST-2,sp)
 585  013c 97            	ld	xl,a
 586  013d 0c01          	inc	(OFST-2,sp)
 588  013f 9f            	ld	a,xl
 589  0140 5f            	clrw	x
 590  0141 97            	ld	xl,a
 591  0142 72fb04        	addw	x,(OFST+1,sp)
 592  0145 f6            	ld	a,(x)
 593  0146 1e02          	ldw	x,(OFST-1,sp)
 594  0148 e701          	ld	(1,x),a
 595                     ; 50     package->device = (uint8_t*)malloc(package->d_size);
 597  014a 1e02          	ldw	x,(OFST-1,sp)
 598  014c e601          	ld	a,(1,x)
 599  014e 5f            	clrw	x
 600  014f 97            	ld	xl,a
 601  0150 cd0000        	call	_malloc
 603  0153 1602          	ldw	y,(OFST-1,sp)
 604  0155 90ef02        	ldw	(2,y),x
 605                     ; 51     if (!package->device) {
 607  0158 1e02          	ldw	x,(OFST-1,sp)
 608  015a e603          	ld	a,(3,x)
 609  015c ea02          	or	a,(2,x)
 610  015e 2609          	jrne	L702
 611                     ; 52         free(package);
 613  0160 1e02          	ldw	x,(OFST-1,sp)
 614  0162 cd0000        	call	_free
 616                     ; 53         return NULL;
 618  0165 5f            	clrw	x
 620  0166               L63:
 622  0166 5b05          	addw	sp,#5
 623  0168 81            	ret
 624  0169               L702:
 625                     ; 55     memcpy(package->device, &buffer[pos], package->d_size);
 627  0169 1e02          	ldw	x,(OFST-1,sp)
 628  016b ee02          	ldw	x,(2,x)
 629  016d bf00          	ldw	c_x,x
 630  016f 7b01          	ld	a,(OFST-2,sp)
 631  0171 905f          	clrw	y
 632  0173 9097          	ld	yl,a
 633  0175 72f904        	addw	y,(OFST+1,sp)
 634  0178 90bf00        	ldw	c_y,y
 635  017b 1e02          	ldw	x,(OFST-1,sp)
 636  017d e601          	ld	a,(1,x)
 637  017f 5f            	clrw	x
 638  0180 97            	ld	xl,a
 639  0181 5d            	tnzw	x
 640  0182 270a          	jreq	L62
 641  0184               L03:
 642  0184 5a            	decw	x
 643  0185 92d600        	ld	a,([c_y.w],x)
 644  0188 92d700        	ld	([c_x.w],x),a
 645  018b 5d            	tnzw	x
 646  018c 26f6          	jrne	L03
 647  018e               L62:
 648                     ; 56     pos += package->d_size;
 650  018e 1e02          	ldw	x,(OFST-1,sp)
 651  0190 7b01          	ld	a,(OFST-2,sp)
 652  0192 eb01          	add	a,(1,x)
 653  0194 6b01          	ld	(OFST-2,sp),a
 655                     ; 58     package->type = buffer[pos++];
 657  0196 7b01          	ld	a,(OFST-2,sp)
 658  0198 97            	ld	xl,a
 659  0199 0c01          	inc	(OFST-2,sp)
 661  019b 9f            	ld	a,xl
 662  019c 5f            	clrw	x
 663  019d 97            	ld	xl,a
 664  019e 72fb04        	addw	x,(OFST+1,sp)
 665  01a1 f6            	ld	a,(x)
 666  01a2 1e02          	ldw	x,(OFST-1,sp)
 667  01a4 e704          	ld	(4,x),a
 668                     ; 60     package->data = (struct eventData*)malloc(sizeof(struct eventData));
 670  01a6 ae0003        	ldw	x,#3
 671  01a9 cd0000        	call	_malloc
 673  01ac 1602          	ldw	y,(OFST-1,sp)
 674  01ae 90ef05        	ldw	(5,y),x
 675                     ; 61     if (!package->data) {
 677  01b1 1e02          	ldw	x,(OFST-1,sp)
 678  01b3 e606          	ld	a,(6,x)
 679  01b5 ea05          	or	a,(5,x)
 680  01b7 260f          	jrne	L112
 681                     ; 62         free(package->device);
 683  01b9 1e02          	ldw	x,(OFST-1,sp)
 684  01bb ee02          	ldw	x,(2,x)
 685  01bd cd0000        	call	_free
 687                     ; 63         free(package);
 689  01c0 1e02          	ldw	x,(OFST-1,sp)
 690  01c2 cd0000        	call	_free
 692                     ; 64         return NULL;
 694  01c5 5f            	clrw	x
 696  01c6 209e          	jra	L63
 697  01c8               L112:
 698                     ; 67     package->data->size = buffer[pos++];
 700  01c8 7b01          	ld	a,(OFST-2,sp)
 701  01ca 97            	ld	xl,a
 702  01cb 0c01          	inc	(OFST-2,sp)
 704  01cd 9f            	ld	a,xl
 705  01ce 5f            	clrw	x
 706  01cf 97            	ld	xl,a
 707  01d0 72fb04        	addw	x,(OFST+1,sp)
 708  01d3 f6            	ld	a,(x)
 709  01d4 1e02          	ldw	x,(OFST-1,sp)
 710  01d6 ee05          	ldw	x,(5,x)
 711  01d8 e702          	ld	(2,x),a
 712                     ; 68     package->data->data = (uint8_t*)malloc(package->data->size);
 714  01da 1e02          	ldw	x,(OFST-1,sp)
 715  01dc ee05          	ldw	x,(5,x)
 716  01de e602          	ld	a,(2,x)
 717  01e0 5f            	clrw	x
 718  01e1 97            	ld	xl,a
 719  01e2 cd0000        	call	_malloc
 721  01e5 1602          	ldw	y,(OFST-1,sp)
 722  01e7 90ee05        	ldw	y,(5,y)
 723  01ea 90ff          	ldw	(y),x
 724                     ; 69     if (!package->data->data) {
 726  01ec 1e02          	ldw	x,(OFST-1,sp)
 727  01ee ee05          	ldw	x,(5,x)
 728  01f0 e601          	ld	a,(1,x)
 729  01f2 fa            	or	a,(x)
 730  01f3 2618          	jrne	L312
 731                     ; 70         free(package->data);
 733  01f5 1e02          	ldw	x,(OFST-1,sp)
 734  01f7 ee05          	ldw	x,(5,x)
 735  01f9 cd0000        	call	_free
 737                     ; 71         free(package->device);
 739  01fc 1e02          	ldw	x,(OFST-1,sp)
 740  01fe ee02          	ldw	x,(2,x)
 741  0200 cd0000        	call	_free
 743                     ; 72         free(package);
 745  0203 1e02          	ldw	x,(OFST-1,sp)
 746  0205 cd0000        	call	_free
 748                     ; 73         return NULL;
 750  0208 5f            	clrw	x
 752  0209 ac660166      	jpf	L63
 753  020d               L312:
 754                     ; 75     memcpy(package->data->data, &buffer[pos], package->data->size);
 756  020d 1e02          	ldw	x,(OFST-1,sp)
 757  020f ee05          	ldw	x,(5,x)
 758  0211 fe            	ldw	x,(x)
 759  0212 bf00          	ldw	c_x,x
 760  0214 7b01          	ld	a,(OFST-2,sp)
 761  0216 905f          	clrw	y
 762  0218 9097          	ld	yl,a
 763  021a 72f904        	addw	y,(OFST+1,sp)
 764  021d 90bf00        	ldw	c_y,y
 765  0220 1e02          	ldw	x,(OFST-1,sp)
 766  0222 ee05          	ldw	x,(5,x)
 767  0224 e602          	ld	a,(2,x)
 768  0226 5f            	clrw	x
 769  0227 97            	ld	xl,a
 770  0228 5d            	tnzw	x
 771  0229 270a          	jreq	L23
 772  022b               L43:
 773  022b 5a            	decw	x
 774  022c 92d600        	ld	a,([c_y.w],x)
 775  022f 92d700        	ld	([c_x.w],x),a
 776  0232 5d            	tnzw	x
 777  0233 26f6          	jrne	L43
 778  0235               L23:
 779                     ; 76     pos += package->data->size;
 781  0235 1e02          	ldw	x,(OFST-1,sp)
 782  0237 ee05          	ldw	x,(5,x)
 783  0239 7b01          	ld	a,(OFST-2,sp)
 784  023b eb02          	add	a,(2,x)
 785  023d 6b01          	ld	(OFST-2,sp),a
 787                     ; 78     package->e_flag = buffer[pos++];
 789  023f 7b01          	ld	a,(OFST-2,sp)
 790  0241 97            	ld	xl,a
 791  0242 0c01          	inc	(OFST-2,sp)
 793  0244 9f            	ld	a,xl
 794  0245 5f            	clrw	x
 795  0246 97            	ld	xl,a
 796  0247 72fb04        	addw	x,(OFST+1,sp)
 797  024a f6            	ld	a,(x)
 798  024b 1e02          	ldw	x,(OFST-1,sp)
 799  024d e707          	ld	(7,x),a
 800                     ; 80     return package;
 802  024f 1e02          	ldw	x,(OFST-1,sp)
 804  0251 ac660166      	jpf	L63
 910                     ; 83 uint8_t* serializeAckPackage(struct ackPackage* ack, uint8_t* out_size) {
 911                     	switch	.text
 912  0255               _serializeAckPackage:
 914  0255 89            	pushw	x
 915  0256 5204          	subw	sp,#4
 916       00000004      OFST:	set	4
 919                     ; 88     pos = 0;
 921  0258 0f02          	clr	(OFST-2,sp)
 923                     ; 89     total_size = 3;
 925  025a a603          	ld	a,#3
 926  025c 6b01          	ld	(OFST-3,sp),a
 928                     ; 90     buffer = (uint8_t*)malloc(total_size);
 930  025e ae0003        	ldw	x,#3
 931  0261 cd0000        	call	_malloc
 933  0264 1f03          	ldw	(OFST-1,sp),x
 935                     ; 91     if (!buffer) return NULL;
 937  0266 1e03          	ldw	x,(OFST-1,sp)
 938  0268 2603          	jrne	L762
 941  026a 5f            	clrw	x
 943  026b 203d          	jra	L24
 944  026d               L762:
 945                     ; 93     buffer[pos++] = ack->id;
 947  026d 7b02          	ld	a,(OFST-2,sp)
 948  026f 97            	ld	xl,a
 949  0270 0c02          	inc	(OFST-2,sp)
 951  0272 9f            	ld	a,xl
 952  0273 5f            	clrw	x
 953  0274 97            	ld	xl,a
 954  0275 72fb03        	addw	x,(OFST-1,sp)
 955  0278 1605          	ldw	y,(OFST+1,sp)
 956  027a 90f6          	ld	a,(y)
 957  027c f7            	ld	(x),a
 958                     ; 94     buffer[pos++] = ack->g_flag;
 960  027d 7b02          	ld	a,(OFST-2,sp)
 961  027f 97            	ld	xl,a
 962  0280 0c02          	inc	(OFST-2,sp)
 964  0282 9f            	ld	a,xl
 965  0283 5f            	clrw	x
 966  0284 97            	ld	xl,a
 967  0285 72fb03        	addw	x,(OFST-1,sp)
 968  0288 1605          	ldw	y,(OFST+1,sp)
 969  028a 90e601        	ld	a,(1,y)
 970  028d f7            	ld	(x),a
 971                     ; 95     buffer[pos++] = ack->f_flag;
 973  028e 7b02          	ld	a,(OFST-2,sp)
 974  0290 97            	ld	xl,a
 975  0291 0c02          	inc	(OFST-2,sp)
 977  0293 9f            	ld	a,xl
 978  0294 5f            	clrw	x
 979  0295 97            	ld	xl,a
 980  0296 72fb03        	addw	x,(OFST-1,sp)
 981  0299 1605          	ldw	y,(OFST+1,sp)
 982  029b 90e602        	ld	a,(2,y)
 983  029e f7            	ld	(x),a
 984                     ; 96     if (out_size) *out_size = total_size;
 986  029f 1e09          	ldw	x,(OFST+5,sp)
 987  02a1 2705          	jreq	L172
 990  02a3 7b01          	ld	a,(OFST-3,sp)
 991  02a5 1e09          	ldw	x,(OFST+5,sp)
 992  02a7 f7            	ld	(x),a
 993  02a8               L172:
 994                     ; 97     return buffer;
 996  02a8 1e03          	ldw	x,(OFST-1,sp)
 998  02aa               L24:
1000  02aa 5b06          	addw	sp,#6
1001  02ac 81            	ret
1117                     ; 100 int send_one_data_package(uint8_t id, uint8_t *device, uint8_t d_size, uint8_t type, struct eventData *partial_data, uint8_t e_flag) {
1118                     	switch	.text
1119  02ad               _send_one_data_package:
1121  02ad 88            	push	a
1122  02ae 520b          	subw	sp,#11
1123       0000000b      OFST:	set	11
1126                     ; 105     dPack.id = id;
1128  02b0 6b04          	ld	(OFST-7,sp),a
1130                     ; 106     dPack.d_size = d_size;
1132  02b2 7b11          	ld	a,(OFST+6,sp)
1133  02b4 6b05          	ld	(OFST-6,sp),a
1135                     ; 107     dPack.device = device;
1137  02b6 1e0f          	ldw	x,(OFST+4,sp)
1138  02b8 1f06          	ldw	(OFST-5,sp),x
1140                     ; 108     dPack.type = type;
1142  02ba 7b12          	ld	a,(OFST+7,sp)
1143  02bc 6b08          	ld	(OFST-3,sp),a
1145                     ; 109     dPack.data = partial_data;
1147  02be 1e13          	ldw	x,(OFST+8,sp)
1148  02c0 1f09          	ldw	(OFST-2,sp),x
1150                     ; 110     dPack.e_flag = e_flag;
1152  02c2 7b15          	ld	a,(OFST+10,sp)
1153  02c4 6b0b          	ld	(OFST+0,sp),a
1155                     ; 112     rData = serializeDataPackage(&dPack, &rSize);
1157  02c6 96            	ldw	x,sp
1158  02c7 1c0001        	addw	x,#OFST-10
1159  02ca 89            	pushw	x
1160  02cb 96            	ldw	x,sp
1161  02cc 1c0006        	addw	x,#OFST-5
1162  02cf cd0031        	call	_serializeDataPackage
1164  02d2 5b02          	addw	sp,#2
1165  02d4 1f02          	ldw	(OFST-9,sp),x
1167                     ; 113     if (rData == NULL) return -1;
1169  02d6 1e02          	ldw	x,(OFST-9,sp)
1170  02d8 2605          	jrne	L353
1173  02da aeffff        	ldw	x,#65535
1175  02dd 200f          	jra	L64
1176  02df               L353:
1177                     ; 115     tx_send(rData, rSize);
1179  02df 7b01          	ld	a,(OFST-10,sp)
1180  02e1 88            	push	a
1181  02e2 1e03          	ldw	x,(OFST-8,sp)
1182  02e4 cd0000        	call	_tx_send
1184  02e7 84            	pop	a
1185                     ; 116     free(rData);
1187  02e8 1e02          	ldw	x,(OFST-9,sp)
1188  02ea cd0000        	call	_free
1190                     ; 118     return 0;
1192  02ed 5f            	clrw	x
1194  02ee               L64:
1196  02ee 5b0c          	addw	sp,#12
1197  02f0 81            	ret
1245                     ; 121 int receive_ack(struct ackPackage *ack) {
1246                     	switch	.text
1247  02f1               _receive_ack:
1249  02f1 89            	pushw	x
1250  02f2 5203          	subw	sp,#3
1251       00000003      OFST:	set	3
1254                     ; 124     rx_read(buffer, 3);
1256  02f4 4b03          	push	#3
1257  02f6 96            	ldw	x,sp
1258  02f7 1c0002        	addw	x,#OFST-1
1259  02fa cd0000        	call	_rx_read
1261  02fd 84            	pop	a
1262                     ; 126     ack->id = buffer[0];
1264  02fe 7b01          	ld	a,(OFST-2,sp)
1265  0300 1e04          	ldw	x,(OFST+1,sp)
1266  0302 f7            	ld	(x),a
1267                     ; 127     ack->g_flag = buffer[1];
1269  0303 7b02          	ld	a,(OFST-1,sp)
1270  0305 1e04          	ldw	x,(OFST+1,sp)
1271  0307 e701          	ld	(1,x),a
1272                     ; 128     ack->f_flag = buffer[2];
1274  0309 7b03          	ld	a,(OFST+0,sp)
1275  030b 1e04          	ldw	x,(OFST+1,sp)
1276  030d e702          	ld	(2,x),a
1277                     ; 130     return 0;
1279  030f 5f            	clrw	x
1282  0310 5b05          	addw	sp,#5
1283  0312 81            	ret
1462                     ; 133 uint8_t send_event(uint8_t *device, uint8_t d_size, uint8_t type, struct eventData *data, uint8_t max_pack_size) {
1463                     	switch	.text
1464  0313               _send_event:
1466  0313 89            	pushw	x
1467  0314 5211          	subw	sp,#17
1468       00000011      OFST:	set	17
1471                     ; 138     packet_id = 0;
1473  0316 0f0d          	clr	(OFST-4,sp)
1475                     ; 139     bytes_sent = 0;
1477  0318 5f            	clrw	x
1478  0319 1f10          	ldw	(OFST-1,sp),x
1480                     ; 140     data_total_size = data->size;
1482  031b 1e18          	ldw	x,(OFST+7,sp)
1483  031d e602          	ld	a,(2,x)
1484  031f 5f            	clrw	x
1485  0320 97            	ld	xl,a
1486  0321 1f0e          	ldw	(OFST-3,sp),x
1488                     ; 142     if (device[0] != txaddr[0]) return -1;
1490  0323 1e12          	ldw	x,(OFST+1,sp)
1491  0325 f6            	ld	a,(x)
1492  0326 92c100        	cp	a,[_txaddr.w]
1493  0329 2603          	jrne	L27
1494  032b cc0415        	jp	L125
1495  032e               L27:
1498  032e a6ff          	ld	a,#255
1500  0330 2022          	jra	L07
1501  0332               L715:
1502                     ; 154         remaining = data_total_size - bytes_sent;
1504  0332 1e0e          	ldw	x,(OFST-3,sp)
1505  0334 72f010        	subw	x,(OFST-1,sp)
1506  0337 1f03          	ldw	(OFST-14,sp),x
1508                     ; 155         overhead = 1 + 1 + d_size + 1 + 1 + 1;
1510  0339 7b16          	ld	a,(OFST+5,sp)
1511  033b ab05          	add	a,#5
1512  033d 6b0b          	ld	(OFST-6,sp),a
1514                     ; 156         available_space = (max_pack_size > overhead) ? (max_pack_size - overhead) : 0;
1516  033f 7b1a          	ld	a,(OFST+9,sp)
1517  0341 110b          	cp	a,(OFST-6,sp)
1518  0343 2306          	jrule	L45
1519  0345 7b1a          	ld	a,(OFST+9,sp)
1520  0347 100b          	sub	a,(OFST-6,sp)
1521  0349 2001          	jra	L65
1522  034b               L45:
1523  034b 4f            	clr	a
1524  034c               L65:
1525  034c 6b0c          	ld	(OFST-5,sp),a
1527                     ; 158         if (available_space == 0) return -1;
1529  034e 0d0c          	tnz	(OFST-5,sp)
1530  0350 2605          	jrne	L525
1533  0352 a6ff          	ld	a,#255
1535  0354               L07:
1537  0354 5b13          	addw	sp,#19
1538  0356 81            	ret
1539  0357               L525:
1540                     ; 160         chunk_size = (remaining > available_space) ? available_space : remaining;
1542  0357 7b0c          	ld	a,(OFST-5,sp)
1543  0359 5f            	clrw	x
1544  035a 97            	ld	xl,a
1545  035b bf00          	ldw	c_x,x
1546  035d 1e03          	ldw	x,(OFST-14,sp)
1547  035f b300          	cpw	x,c_x
1548  0361 2304          	jrule	L06
1549  0363 7b0c          	ld	a,(OFST-5,sp)
1550  0365 2002          	jra	L26
1551  0367               L06:
1552  0367 7b04          	ld	a,(OFST-13,sp)
1553  0369               L26:
1554  0369 6b0b          	ld	(OFST-6,sp),a
1556                     ; 161         e_flag = (bytes_sent + chunk_size == data_total_size) ? 1 : 0;
1558  036b 7b0b          	ld	a,(OFST-6,sp)
1559  036d 5f            	clrw	x
1560  036e 97            	ld	xl,a
1561  036f 72fb10        	addw	x,(OFST-1,sp)
1562  0372 130e          	cpw	x,(OFST-3,sp)
1563  0374 2604          	jrne	L46
1564  0376 a601          	ld	a,#1
1565  0378 2001          	jra	L66
1566  037a               L46:
1567  037a 4f            	clr	a
1568  037b               L66:
1569  037b 6b0c          	ld	(OFST-5,sp),a
1571                     ; 163         partial_data.size = chunk_size;
1573  037d 7b0b          	ld	a,(OFST-6,sp)
1574  037f 6b07          	ld	(OFST-10,sp),a
1576                     ; 164         partial_data.data = &(data->data[bytes_sent]);
1578  0381 1e18          	ldw	x,(OFST+7,sp)
1579  0383 fe            	ldw	x,(x)
1580  0384 72fb10        	addw	x,(OFST-1,sp)
1581  0387 1f05          	ldw	(OFST-12,sp),x
1583                     ; 166         if (send_one_data_package(packet_id++, device, d_size, type, &partial_data, e_flag) != 0) {
1585  0389 7b0c          	ld	a,(OFST-5,sp)
1586  038b 88            	push	a
1587  038c 96            	ldw	x,sp
1588  038d 1c0006        	addw	x,#OFST-11
1589  0390 89            	pushw	x
1590  0391 7b1a          	ld	a,(OFST+9,sp)
1591  0393 88            	push	a
1592  0394 7b1a          	ld	a,(OFST+9,sp)
1593  0396 88            	push	a
1594  0397 1e17          	ldw	x,(OFST+6,sp)
1595  0399 89            	pushw	x
1596  039a 7b14          	ld	a,(OFST+3,sp)
1597  039c 0c14          	inc	(OFST+3,sp)
1599  039e cd02ad        	call	_send_one_data_package
1601  03a1 5b07          	addw	sp,#7
1602  03a3 a30000        	cpw	x,#0
1603  03a6 2704          	jreq	L725
1604                     ; 167             return -1;
1606  03a8 a6ff          	ld	a,#255
1608  03aa 20a8          	jra	L07
1609  03ac               L725:
1610                     ; 170         if (e_flag == 0) {
1612  03ac 0d0c          	tnz	(OFST-5,sp)
1613  03ae 2658          	jrne	L135
1614                     ; 171             for (c = 0; c < 5; c++) {
1616  03b0 0f0c          	clr	(OFST-5,sp)
1618  03b2               L335:
1619                     ; 172                 if (receive_ack(&ack) == 0) {
1621  03b2 96            	ldw	x,sp
1622  03b3 1c0008        	addw	x,#OFST-9
1623  03b6 cd02f1        	call	_receive_ack
1625  03b9 a30000        	cpw	x,#0
1626  03bc 2629          	jrne	L145
1627                     ; 173                     if (ack.f_flag == 1 && ack.id == packet_id - 1) {
1629  03be 7b0a          	ld	a,(OFST-7,sp)
1630  03c0 a101          	cp	a,#1
1631  03c2 2612          	jrne	L345
1633  03c4 7b0d          	ld	a,(OFST-4,sp)
1634  03c6 5f            	clrw	x
1635  03c7 97            	ld	xl,a
1636  03c8 5a            	decw	x
1637  03c9 7b08          	ld	a,(OFST-9,sp)
1638  03cb 905f          	clrw	y
1639  03cd 9097          	ld	yl,a
1640  03cf 90bf00        	ldw	c_y,y
1641  03d2 b300          	cpw	x,c_y
1642  03d4 2726          	jreq	L735
1643                     ; 174                         break;
1645  03d6               L345:
1646                     ; 176                         c--;
1648  03d6 0a0c          	dec	(OFST-5,sp)
1650                     ; 177                         delay_ms(1000);
1652  03d8 ae03e8        	ldw	x,#1000
1653  03db 89            	pushw	x
1654  03dc ae0000        	ldw	x,#0
1655  03df 89            	pushw	x
1656  03e0 cd0000        	call	_delay_ms
1658  03e3 5b04          	addw	sp,#4
1659  03e5 200d          	jra	L745
1660  03e7               L145:
1661                     ; 180                     delay_ms(1000);
1663  03e7 ae03e8        	ldw	x,#1000
1664  03ea 89            	pushw	x
1665  03eb ae0000        	ldw	x,#0
1666  03ee 89            	pushw	x
1667  03ef cd0000        	call	_delay_ms
1669  03f2 5b04          	addw	sp,#4
1670  03f4               L745:
1671                     ; 171             for (c = 0; c < 5; c++) {
1673  03f4 0c0c          	inc	(OFST-5,sp)
1677  03f6 7b0c          	ld	a,(OFST-5,sp)
1678  03f8 a105          	cp	a,#5
1679  03fa 25b6          	jrult	L335
1680  03fc               L735:
1681                     ; 183             if (c == 5) {
1683  03fc 7b0c          	ld	a,(OFST-5,sp)
1684  03fe a105          	cp	a,#5
1685  0400 2606          	jrne	L135
1686                     ; 184                 return -1;
1688  0402 a6ff          	ld	a,#255
1690  0404 ac540354      	jpf	L07
1691  0408               L135:
1692                     ; 188         bytes_sent += chunk_size;
1694  0408 7b0b          	ld	a,(OFST-6,sp)
1695  040a 5f            	clrw	x
1696  040b 97            	ld	xl,a
1697  040c 1f01          	ldw	(OFST-16,sp),x
1699  040e 1e10          	ldw	x,(OFST-1,sp)
1700  0410 72fb01        	addw	x,(OFST-16,sp)
1701  0413 1f10          	ldw	(OFST-1,sp),x
1703  0415               L125:
1704                     ; 144     while (bytes_sent < data_total_size) {
1706  0415 1e10          	ldw	x,(OFST-1,sp)
1707  0417 130e          	cpw	x,(OFST-3,sp)
1708  0419 2403          	jruge	L47
1709  041b cc0332        	jp	L715
1710  041e               L47:
1711                     ; 191     return 0;
1713  041e 4f            	clr	a
1715  041f ac540354      	jpf	L07
1728                     	xref	_malloc
1729                     	xref	_free
1730                     	xref	_rx_read
1731                     	xref	_tx_send
1732                     	xdef	_send_event
1733                     	xdef	_receive_ack
1734                     	xdef	_send_one_data_package
1735                     	xdef	_serializeAckPackage
1736                     	xdef	_deserializeDataPackage
1737                     	xdef	_serializeDataPackage
1738                     	xdef	_delay_ms
1739                     	xref.b	_txaddr
1740                     	xref.b	c_x
1741                     	xref.b	c_y
1760                     	xref	c_lrzmp
1761                     	xref	c_lgsbc
1762                     	xref	c_rtol
1763                     	xref	c_lmul
1764                     	xref	c_ltor
1765                     	end
