   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.3 - 22 Aug 2024
   4                     ; Optimizer V4.6.3 - 22 Aug 2024
  19                     .const:	section	.text
  20  0000               _APR_Array:
  21  0000 00            	dc.b	0
  22  0001 1e            	dc.b	30
  23  0002 1e            	dc.b	30
  24  0003 1e            	dc.b	30
  25  0004 1e            	dc.b	30
  26  0005 1e            	dc.b	30
  27  0006 1e            	dc.b	30
  28  0007 1e            	dc.b	30
  29  0008 1e            	dc.b	30
  30  0009 1e            	dc.b	30
  31  000a 1e            	dc.b	30
  32  000b 1e            	dc.b	30
  33  000c 1e            	dc.b	30
  34  000d 3d            	dc.b	61
  35  000e 17            	dc.b	23
  36  000f 17            	dc.b	23
  37  0010 3e            	dc.b	62
  38  0011               _TBR_Array:
  39  0011 00            	dc.b	0
  40  0012 01            	dc.b	1
  41  0013 02            	dc.b	2
  42  0014 03            	dc.b	3
  43  0015 04            	dc.b	4
  44  0016 05            	dc.b	5
  45  0017 06            	dc.b	6
  46  0018 07            	dc.b	7
  47  0019 08            	dc.b	8
  48  001a 09            	dc.b	9
  49  001b 0a            	dc.b	10
  50  001c 0b            	dc.b	11
  51  001d 0c            	dc.b	12
  52  001e 0c            	dc.b	12
  53  001f 0e            	dc.b	14
  54  0020 0f            	dc.b	15
  55  0021 0f            	dc.b	15
  84                     ; 73 void AWU_DeInit(void)
  84                     ; 74 {
  86                     	switch	.text
  87  0000               _AWU_DeInit:
  91                     ; 75   AWU->CSR = AWU_CSR_RESET_VALUE;
  93  0000 725f50f0      	clr	20720
  94                     ; 76   AWU->APR = AWU_APR_RESET_VALUE;
  96  0004 353f50f1      	mov	20721,#63
  97                     ; 77   AWU->TBR = AWU_TBR_RESET_VALUE;
  99  0008 725f50f2      	clr	20722
 100                     ; 78 }
 103  000c 81            	ret	
 266                     ; 88 void AWU_Init(AWU_Timebase_TypeDef AWU_TimeBase)
 266                     ; 89 {
 267                     	switch	.text
 268  000d               _AWU_Init:
 270  000d 88            	push	a
 271       00000000      OFST:	set	0
 274                     ; 91   assert_param(IS_AWU_TIMEBASE_OK(AWU_TimeBase));
 276  000e 4d            	tnz	a
 277  000f 274e          	jreq	L41
 278  0011 a101          	cp	a,#1
 279  0013 274a          	jreq	L41
 280  0015 a102          	cp	a,#2
 281  0017 2746          	jreq	L41
 282  0019 a103          	cp	a,#3
 283  001b 2742          	jreq	L41
 284  001d a104          	cp	a,#4
 285  001f 273e          	jreq	L41
 286  0021 a105          	cp	a,#5
 287  0023 273a          	jreq	L41
 288  0025 a106          	cp	a,#6
 289  0027 2736          	jreq	L41
 290  0029 a107          	cp	a,#7
 291  002b 2732          	jreq	L41
 292  002d a108          	cp	a,#8
 293  002f 272e          	jreq	L41
 294  0031 a109          	cp	a,#9
 295  0033 272a          	jreq	L41
 296  0035 a10a          	cp	a,#10
 297  0037 2726          	jreq	L41
 298  0039 a10b          	cp	a,#11
 299  003b 2722          	jreq	L41
 300  003d a10c          	cp	a,#12
 301  003f 271e          	jreq	L41
 302  0041 a10d          	cp	a,#13
 303  0043 271a          	jreq	L41
 304  0045 a10e          	cp	a,#14
 305  0047 2716          	jreq	L41
 306  0049 a10f          	cp	a,#15
 307  004b 2712          	jreq	L41
 308  004d a110          	cp	a,#16
 309  004f 270e          	jreq	L41
 310  0051 ae005b        	ldw	x,#91
 311  0054 89            	pushw	x
 312  0055 5f            	clrw	x
 313  0056 89            	pushw	x
 314  0057 ae002e        	ldw	x,#L501
 315  005a cd0000        	call	_assert_failed
 317  005d 5b04          	addw	sp,#4
 318  005f               L41:
 319                     ; 94   AWU->CSR |= AWU_CSR_AWUEN;
 321  005f 721850f0      	bset	20720,#4
 322                     ; 97   AWU->TBR &= (uint8_t)(~AWU_TBR_AWUTB);
 324  0063 c650f2        	ld	a,20722
 325  0066 a4f0          	and	a,#240
 326  0068 c750f2        	ld	20722,a
 327                     ; 98   AWU->TBR |= TBR_Array[(uint8_t)AWU_TimeBase];
 329  006b 7b01          	ld	a,(OFST+1,sp)
 330  006d 5f            	clrw	x
 331  006e 97            	ld	xl,a
 332  006f c650f2        	ld	a,20722
 333  0072 da0011        	or	a,(_TBR_Array,x)
 334  0075 c750f2        	ld	20722,a
 335                     ; 101   AWU->APR &= (uint8_t)(~AWU_APR_APR);
 337  0078 c650f1        	ld	a,20721
 338  007b a4c0          	and	a,#192
 339  007d c750f1        	ld	20721,a
 340                     ; 102   AWU->APR |= APR_Array[(uint8_t)AWU_TimeBase];
 342  0080 7b01          	ld	a,(OFST+1,sp)
 343  0082 5f            	clrw	x
 344  0083 97            	ld	xl,a
 345  0084 c650f1        	ld	a,20721
 346  0087 da0000        	or	a,(_APR_Array,x)
 347  008a c750f1        	ld	20721,a
 348                     ; 103 }
 351  008d 84            	pop	a
 352  008e 81            	ret	
 407                     ; 112 void AWU_Cmd(FunctionalState NewState)
 407                     ; 113 {
 408                     	switch	.text
 409  008f               _AWU_Cmd:
 413                     ; 114   if (NewState != DISABLE)
 415  008f 4d            	tnz	a
 416  0090 2705          	jreq	L531
 417                     ; 117     AWU->CSR |= AWU_CSR_AWUEN;
 419  0092 721850f0      	bset	20720,#4
 422  0096 81            	ret	
 423  0097               L531:
 424                     ; 122     AWU->CSR &= (uint8_t)(~AWU_CSR_AWUEN);
 426  0097 721950f0      	bres	20720,#4
 427                     ; 124 }
 430  009b 81            	ret	
 484                     	switch	.const
 485  0022               L62:
 486  0022 0001adb0      	dc.l	110000
 487  0026               L03:
 488  0026 000249f1      	dc.l	150001
 489  002a               L63:
 490  002a 000003e8      	dc.l	1000
 491                     ; 139 void AWU_LSICalibrationConfig(uint32_t LSIFreqHz)
 491                     ; 140 {
 492                     	switch	.text
 493  009c               _AWU_LSICalibrationConfig:
 495  009c 5206          	subw	sp,#6
 496       00000006      OFST:	set	6
 499                     ; 141   uint16_t lsifreqkhz = 0x0;
 501                     ; 142   uint16_t A = 0x0;
 503                     ; 145   assert_param(IS_LSI_FREQUENCY_OK(LSIFreqHz));
 505  009e 96            	ldw	x,sp
 506  009f 1c0009        	addw	x,#OFST+3
 507  00a2 cd0000        	call	c_ltor
 509  00a5 ae0022        	ldw	x,#L62
 510  00a8 cd0000        	call	c_lcmp
 512  00ab 250f          	jrult	L42
 513  00ad 96            	ldw	x,sp
 514  00ae 1c0009        	addw	x,#OFST+3
 515  00b1 cd0000        	call	c_ltor
 517  00b4 ae0026        	ldw	x,#L03
 518  00b7 cd0000        	call	c_lcmp
 520  00ba 250e          	jrult	L23
 521  00bc               L42:
 522  00bc ae0091        	ldw	x,#145
 523  00bf 89            	pushw	x
 524  00c0 5f            	clrw	x
 525  00c1 89            	pushw	x
 526  00c2 ae002e        	ldw	x,#L501
 527  00c5 cd0000        	call	_assert_failed
 529  00c8 5b04          	addw	sp,#4
 530  00ca               L23:
 531                     ; 147   lsifreqkhz = (uint16_t)(LSIFreqHz / 1000); /* Converts value in kHz */
 533  00ca 96            	ldw	x,sp
 534  00cb 1c0009        	addw	x,#OFST+3
 535  00ce cd0000        	call	c_ltor
 537  00d1 ae002a        	ldw	x,#L63
 538  00d4 cd0000        	call	c_ludv
 540  00d7 be02          	ldw	x,c_lreg+2
 541  00d9 1f03          	ldw	(OFST-3,sp),x
 543                     ; 151   A = (uint16_t)(lsifreqkhz >> 2U); /* Division by 4, keep integer part only */
 545  00db 54            	srlw	x
 546  00dc 54            	srlw	x
 547  00dd 1f05          	ldw	(OFST-1,sp),x
 549                     ; 153   if ((4U * A) >= ((lsifreqkhz - (4U * A)) * (1U + (2U * A))))
 551  00df 58            	sllw	x
 552  00e0 58            	sllw	x
 553  00e1 1f01          	ldw	(OFST-5,sp),x
 555  00e3 1e03          	ldw	x,(OFST-3,sp)
 556  00e5 72f001        	subw	x,(OFST-5,sp)
 557  00e8 1605          	ldw	y,(OFST-1,sp)
 558  00ea 9058          	sllw	y
 559  00ec 905c          	incw	y
 560  00ee cd0000        	call	c_imul
 562  00f1 1605          	ldw	y,(OFST-1,sp)
 563  00f3 9058          	sllw	y
 564  00f5 bf00          	ldw	c_x,x
 565  00f7 9058          	sllw	y
 566  00f9 90b300        	cpw	y,c_x
 567  00fc 7b06          	ld	a,(OFST+0,sp)
 568  00fe 2504          	jrult	L761
 569                     ; 155     AWU->APR = (uint8_t)(A - 2U);
 571  0100 a002          	sub	a,#2
 573  0102 2001          	jra	L171
 574  0104               L761:
 575                     ; 159     AWU->APR = (uint8_t)(A - 1U);
 577  0104 4a            	dec	a
 578  0105               L171:
 579  0105 c750f1        	ld	20721,a
 580                     ; 161 }
 583  0108 5b06          	addw	sp,#6
 584  010a 81            	ret	
 607                     ; 168 void AWU_IdleModeEnable(void)
 607                     ; 169 {
 608                     	switch	.text
 609  010b               _AWU_IdleModeEnable:
 613                     ; 171   AWU->CSR &= (uint8_t)(~AWU_CSR_AWUEN);
 615  010b 721950f0      	bres	20720,#4
 616                     ; 174   AWU->TBR = (uint8_t)(~AWU_TBR_AWUTB);
 618  010f 35f050f2      	mov	20722,#240
 619                     ; 175 }
 622  0113 81            	ret	
 666                     ; 183 FlagStatus AWU_GetFlagStatus(void)
 666                     ; 184 {
 667                     	switch	.text
 668  0114               _AWU_GetFlagStatus:
 672                     ; 185   return((FlagStatus)(((uint8_t)(AWU->CSR & AWU_CSR_AWUF) == (uint8_t)0x00) ? RESET : SET));
 674  0114 720a50f002    	btjt	20720,#5,L44
 675  0119 4f            	clr	a
 677  011a 81            	ret	
 678  011b               L44:
 679  011b a601          	ld	a,#1
 682  011d 81            	ret	
 717                     	xdef	_TBR_Array
 718                     	xdef	_APR_Array
 719                     	xdef	_AWU_GetFlagStatus
 720                     	xdef	_AWU_IdleModeEnable
 721                     	xdef	_AWU_LSICalibrationConfig
 722                     	xdef	_AWU_Cmd
 723                     	xdef	_AWU_Init
 724                     	xdef	_AWU_DeInit
 725                     	xref	_assert_failed
 726                     	switch	.const
 727  002e               L501:
 728  002e 2e2e5c2e2e5c  	dc.b	"..\..\stm8s_spl\li"
 729  0040 627261726965  	dc.b	"braries\stm8s_stdp"
 730  0052 65726970685f  	dc.b	"eriph_driver\src\s"
 731  0064 746d38735f61  	dc.b	"tm8s_awu.c",0
 732                     	xref.b	c_lreg
 733                     	xref.b	c_x
 753                     	xref	c_imul
 754                     	xref	c_ludv
 755                     	xref	c_lcmp
 756                     	xref	c_ltor
 757                     	end
