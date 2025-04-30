   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.3 - 22 Aug 2024
   4                     ; Optimizer V4.6.3 - 22 Aug 2024
  18                     .const:	section	.text
  19  0000               _APR_Array:
  20  0000 00            	dc.b	0
  21  0001 1e            	dc.b	30
  22  0002 1e            	dc.b	30
  23  0003 1e            	dc.b	30
  24  0004 1e            	dc.b	30
  25  0005 1e            	dc.b	30
  26  0006 1e            	dc.b	30
  27  0007 1e            	dc.b	30
  28  0008 1e            	dc.b	30
  29  0009 1e            	dc.b	30
  30  000a 1e            	dc.b	30
  31  000b 1e            	dc.b	30
  32  000c 1e            	dc.b	30
  33  000d 3d            	dc.b	61
  34  000e 17            	dc.b	23
  35  000f 17            	dc.b	23
  36  0010 3e            	dc.b	62
  37  0011               _TBR_Array:
  38  0011 00            	dc.b	0
  39  0012 01            	dc.b	1
  40  0013 02            	dc.b	2
  41  0014 03            	dc.b	3
  42  0015 04            	dc.b	4
  43  0016 05            	dc.b	5
  44  0017 06            	dc.b	6
  45  0018 07            	dc.b	7
  46  0019 08            	dc.b	8
  47  001a 09            	dc.b	9
  48  001b 0a            	dc.b	10
  49  001c 0b            	dc.b	11
  50  001d 0c            	dc.b	12
  51  001e 0c            	dc.b	12
  52  001f 0e            	dc.b	14
  53  0020 0f            	dc.b	15
  54  0021 0f            	dc.b	15
  83                     ; 73 void AWU_DeInit(void)
  83                     ; 74 {
  85                     	switch	.text
  86  0000               _AWU_DeInit:
  90                     ; 75   AWU->CSR = AWU_CSR_RESET_VALUE;
  92  0000 725f50f0      	clr	20720
  93                     ; 76   AWU->APR = AWU_APR_RESET_VALUE;
  95  0004 353f50f1      	mov	20721,#63
  96                     ; 77   AWU->TBR = AWU_TBR_RESET_VALUE;
  98  0008 725f50f2      	clr	20722
  99                     ; 78 }
 102  000c 81            	ret	
 265                     ; 88 void AWU_Init(AWU_Timebase_TypeDef AWU_TimeBase)
 265                     ; 89 {
 266                     	switch	.text
 267  000d               _AWU_Init:
 269  000d 88            	push	a
 270       00000000      OFST:	set	0
 273                     ; 91   assert_param(IS_AWU_TIMEBASE_OK(AWU_TimeBase));
 275  000e 4d            	tnz	a
 276  000f 274e          	jreq	L41
 277  0011 a101          	cp	a,#1
 278  0013 274a          	jreq	L41
 279  0015 a102          	cp	a,#2
 280  0017 2746          	jreq	L41
 281  0019 a103          	cp	a,#3
 282  001b 2742          	jreq	L41
 283  001d a104          	cp	a,#4
 284  001f 273e          	jreq	L41
 285  0021 a105          	cp	a,#5
 286  0023 273a          	jreq	L41
 287  0025 a106          	cp	a,#6
 288  0027 2736          	jreq	L41
 289  0029 a107          	cp	a,#7
 290  002b 2732          	jreq	L41
 291  002d a108          	cp	a,#8
 292  002f 272e          	jreq	L41
 293  0031 a109          	cp	a,#9
 294  0033 272a          	jreq	L41
 295  0035 a10a          	cp	a,#10
 296  0037 2726          	jreq	L41
 297  0039 a10b          	cp	a,#11
 298  003b 2722          	jreq	L41
 299  003d a10c          	cp	a,#12
 300  003f 271e          	jreq	L41
 301  0041 a10d          	cp	a,#13
 302  0043 271a          	jreq	L41
 303  0045 a10e          	cp	a,#14
 304  0047 2716          	jreq	L41
 305  0049 a10f          	cp	a,#15
 306  004b 2712          	jreq	L41
 307  004d a110          	cp	a,#16
 308  004f 270e          	jreq	L41
 309  0051 ae005b        	ldw	x,#91
 310  0054 89            	pushw	x
 311  0055 5f            	clrw	x
 312  0056 89            	pushw	x
 313  0057 ae002e        	ldw	x,#L501
 314  005a cd0000        	call	_assert_failed
 316  005d 5b04          	addw	sp,#4
 317  005f               L41:
 318                     ; 94   AWU->CSR |= AWU_CSR_AWUEN;
 320  005f 721850f0      	bset	20720,#4
 321                     ; 97   AWU->TBR &= (uint8_t)(~AWU_TBR_AWUTB);
 323  0063 c650f2        	ld	a,20722
 324  0066 a4f0          	and	a,#240
 325  0068 c750f2        	ld	20722,a
 326                     ; 98   AWU->TBR |= TBR_Array[(uint8_t)AWU_TimeBase];
 328  006b 7b01          	ld	a,(OFST+1,sp)
 329  006d 5f            	clrw	x
 330  006e 97            	ld	xl,a
 331  006f c650f2        	ld	a,20722
 332  0072 da0011        	or	a,(_TBR_Array,x)
 333  0075 c750f2        	ld	20722,a
 334                     ; 101   AWU->APR &= (uint8_t)(~AWU_APR_APR);
 336  0078 c650f1        	ld	a,20721
 337  007b a4c0          	and	a,#192
 338  007d c750f1        	ld	20721,a
 339                     ; 102   AWU->APR |= APR_Array[(uint8_t)AWU_TimeBase];
 341  0080 7b01          	ld	a,(OFST+1,sp)
 342  0082 5f            	clrw	x
 343  0083 97            	ld	xl,a
 344  0084 c650f1        	ld	a,20721
 345  0087 da0000        	or	a,(_APR_Array,x)
 346  008a c750f1        	ld	20721,a
 347                     ; 103 }
 350  008d 84            	pop	a
 351  008e 81            	ret	
 406                     ; 112 void AWU_Cmd(FunctionalState NewState)
 406                     ; 113 {
 407                     	switch	.text
 408  008f               _AWU_Cmd:
 412                     ; 114   if (NewState != DISABLE)
 414  008f 4d            	tnz	a
 415  0090 2705          	jreq	L531
 416                     ; 117     AWU->CSR |= AWU_CSR_AWUEN;
 418  0092 721850f0      	bset	20720,#4
 421  0096 81            	ret	
 422  0097               L531:
 423                     ; 122     AWU->CSR &= (uint8_t)(~AWU_CSR_AWUEN);
 425  0097 721950f0      	bres	20720,#4
 426                     ; 124 }
 429  009b 81            	ret	
 483                     	switch	.const
 484  0022               L62:
 485  0022 0001adb0      	dc.l	110000
 486  0026               L03:
 487  0026 000249f1      	dc.l	150001
 488  002a               L63:
 489  002a 000003e8      	dc.l	1000
 490                     ; 139 void AWU_LSICalibrationConfig(uint32_t LSIFreqHz)
 490                     ; 140 {
 491                     	switch	.text
 492  009c               _AWU_LSICalibrationConfig:
 494  009c 5206          	subw	sp,#6
 495       00000006      OFST:	set	6
 498                     ; 141   uint16_t lsifreqkhz = 0x0;
 500                     ; 142   uint16_t A = 0x0;
 502                     ; 145   assert_param(IS_LSI_FREQUENCY_OK(LSIFreqHz));
 504  009e 96            	ldw	x,sp
 505  009f 1c0009        	addw	x,#OFST+3
 506  00a2 cd0000        	call	c_ltor
 508  00a5 ae0022        	ldw	x,#L62
 509  00a8 cd0000        	call	c_lcmp
 511  00ab 250f          	jrult	L42
 512  00ad 96            	ldw	x,sp
 513  00ae 1c0009        	addw	x,#OFST+3
 514  00b1 cd0000        	call	c_ltor
 516  00b4 ae0026        	ldw	x,#L03
 517  00b7 cd0000        	call	c_lcmp
 519  00ba 250e          	jrult	L23
 520  00bc               L42:
 521  00bc ae0091        	ldw	x,#145
 522  00bf 89            	pushw	x
 523  00c0 5f            	clrw	x
 524  00c1 89            	pushw	x
 525  00c2 ae002e        	ldw	x,#L501
 526  00c5 cd0000        	call	_assert_failed
 528  00c8 5b04          	addw	sp,#4
 529  00ca               L23:
 530                     ; 147   lsifreqkhz = (uint16_t)(LSIFreqHz / 1000); /* Converts value in kHz */
 532  00ca 96            	ldw	x,sp
 533  00cb 1c0009        	addw	x,#OFST+3
 534  00ce cd0000        	call	c_ltor
 536  00d1 ae002a        	ldw	x,#L63
 537  00d4 cd0000        	call	c_ludv
 539  00d7 be02          	ldw	x,c_lreg+2
 540  00d9 1f03          	ldw	(OFST-3,sp),x
 542                     ; 151   A = (uint16_t)(lsifreqkhz >> 2U); /* Division by 4, keep integer part only */
 544  00db 54            	srlw	x
 545  00dc 54            	srlw	x
 546  00dd 1f05          	ldw	(OFST-1,sp),x
 548                     ; 153   if ((4U * A) >= ((lsifreqkhz - (4U * A)) * (1U + (2U * A))))
 550  00df 58            	sllw	x
 551  00e0 58            	sllw	x
 552  00e1 1f01          	ldw	(OFST-5,sp),x
 554  00e3 1e03          	ldw	x,(OFST-3,sp)
 555  00e5 72f001        	subw	x,(OFST-5,sp)
 556  00e8 1605          	ldw	y,(OFST-1,sp)
 557  00ea 9058          	sllw	y
 558  00ec 905c          	incw	y
 559  00ee cd0000        	call	c_imul
 561  00f1 1605          	ldw	y,(OFST-1,sp)
 562  00f3 9058          	sllw	y
 563  00f5 bf00          	ldw	c_x,x
 564  00f7 9058          	sllw	y
 565  00f9 90b300        	cpw	y,c_x
 566  00fc 7b06          	ld	a,(OFST+0,sp)
 567  00fe 2504          	jrult	L761
 568                     ; 155     AWU->APR = (uint8_t)(A - 2U);
 570  0100 a002          	sub	a,#2
 572  0102 2001          	jra	L171
 573  0104               L761:
 574                     ; 159     AWU->APR = (uint8_t)(A - 1U);
 576  0104 4a            	dec	a
 577  0105               L171:
 578  0105 c750f1        	ld	20721,a
 579                     ; 161 }
 582  0108 5b06          	addw	sp,#6
 583  010a 81            	ret	
 606                     ; 168 void AWU_IdleModeEnable(void)
 606                     ; 169 {
 607                     	switch	.text
 608  010b               _AWU_IdleModeEnable:
 612                     ; 171   AWU->CSR &= (uint8_t)(~AWU_CSR_AWUEN);
 614  010b 721950f0      	bres	20720,#4
 615                     ; 174   AWU->TBR = (uint8_t)(~AWU_TBR_AWUTB);
 617  010f 35f050f2      	mov	20722,#240
 618                     ; 175 }
 621  0113 81            	ret	
 665                     ; 183 FlagStatus AWU_GetFlagStatus(void)
 665                     ; 184 {
 666                     	switch	.text
 667  0114               _AWU_GetFlagStatus:
 671                     ; 185   return((FlagStatus)(((uint8_t)(AWU->CSR & AWU_CSR_AWUF) == (uint8_t)0x00) ? RESET : SET));
 673  0114 720a50f002    	btjt	20720,#5,L44
 674  0119 4f            	clr	a
 676  011a 81            	ret	
 677  011b               L44:
 678  011b a601          	ld	a,#1
 681  011d 81            	ret	
 716                     	xdef	_TBR_Array
 717                     	xdef	_APR_Array
 718                     	xdef	_AWU_GetFlagStatus
 719                     	xdef	_AWU_IdleModeEnable
 720                     	xdef	_AWU_LSICalibrationConfig
 721                     	xdef	_AWU_Cmd
 722                     	xdef	_AWU_Init
 723                     	xdef	_AWU_DeInit
 724                     	xref	_assert_failed
 725                     	switch	.const
 726  002e               L501:
 727  002e 2e2e5c2e2e5c  	dc.b	"..\..\stm8s_spl\li"
 728  0040 627261726965  	dc.b	"braries\stm8s_stdp"
 729  0052 65726970685f  	dc.b	"eriph_driver\src\s"
 730  0064 746d38735f61  	dc.b	"tm8s_awu.c",0
 731                     	xref.b	c_lreg
 732                     	xref.b	c_x
 752                     	xref	c_imul
 753                     	xref	c_ludv
 754                     	xref	c_lcmp
 755                     	xref	c_ltor
 756                     	end
