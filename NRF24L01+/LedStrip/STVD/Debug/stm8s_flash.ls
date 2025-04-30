   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.3 - 22 Aug 2024
   4                     ; Optimizer V4.6.3 - 22 Aug 2024
  79                     ; 87 void FLASH_Unlock(FLASH_MemType_TypeDef FLASH_MemType)
  79                     ; 88 {
  81                     	switch	.text
  82  0000               _FLASH_Unlock:
  84  0000 88            	push	a
  85       00000000      OFST:	set	0
  88                     ; 90   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
  90  0001 a1fd          	cp	a,#253
  91  0003 2712          	jreq	L21
  92  0005 a1f7          	cp	a,#247
  93  0007 270e          	jreq	L21
  94  0009 ae005a        	ldw	x,#90
  95  000c 89            	pushw	x
  96  000d 5f            	clrw	x
  97  000e 89            	pushw	x
  98  000f ae0010        	ldw	x,#L73
  99  0012 cd0000        	call	_assert_failed
 101  0015 5b04          	addw	sp,#4
 102  0017               L21:
 103                     ; 93   if(FLASH_MemType == FLASH_MEMTYPE_PROG)
 105  0017 7b01          	ld	a,(OFST+1,sp)
 106  0019 a1fd          	cp	a,#253
 107  001b 260a          	jrne	L14
 108                     ; 95     FLASH->PUKR = FLASH_RASS_KEY1;
 110  001d 35565062      	mov	20578,#86
 111                     ; 96     FLASH->PUKR = FLASH_RASS_KEY2;
 113  0021 35ae5062      	mov	20578,#174
 115  0025 2008          	jra	L34
 116  0027               L14:
 117                     ; 101     FLASH->DUKR = FLASH_RASS_KEY2; /* Warning: keys are reversed on data memory !!! */
 119  0027 35ae5064      	mov	20580,#174
 120                     ; 102     FLASH->DUKR = FLASH_RASS_KEY1;
 122  002b 35565064      	mov	20580,#86
 123  002f               L34:
 124                     ; 104 }
 127  002f 84            	pop	a
 128  0030 81            	ret	
 164                     ; 112 void FLASH_Lock(FLASH_MemType_TypeDef FLASH_MemType)
 164                     ; 113 {
 165                     	switch	.text
 166  0031               _FLASH_Lock:
 168  0031 88            	push	a
 169       00000000      OFST:	set	0
 172                     ; 115   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
 174  0032 a1fd          	cp	a,#253
 175  0034 2712          	jreq	L42
 176  0036 a1f7          	cp	a,#247
 177  0038 270e          	jreq	L42
 178  003a ae0073        	ldw	x,#115
 179  003d 89            	pushw	x
 180  003e 5f            	clrw	x
 181  003f 89            	pushw	x
 182  0040 ae0010        	ldw	x,#L73
 183  0043 cd0000        	call	_assert_failed
 185  0046 5b04          	addw	sp,#4
 186  0048               L42:
 187                     ; 118   FLASH->IAPSR &= (uint8_t)FLASH_MemType;
 189  0048 c6505f        	ld	a,20575
 190  004b 1401          	and	a,(OFST+1,sp)
 191  004d c7505f        	ld	20575,a
 192                     ; 119 }
 195  0050 84            	pop	a
 196  0051 81            	ret	
 219                     ; 126 void FLASH_DeInit(void)
 219                     ; 127 {
 220                     	switch	.text
 221  0052               _FLASH_DeInit:
 225                     ; 128   FLASH->CR1 = FLASH_CR1_RESET_VALUE;
 227  0052 725f505a      	clr	20570
 228                     ; 129   FLASH->CR2 = FLASH_CR2_RESET_VALUE;
 230  0056 725f505b      	clr	20571
 231                     ; 130   FLASH->NCR2 = FLASH_NCR2_RESET_VALUE;
 233  005a 35ff505c      	mov	20572,#255
 234                     ; 131   FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_DUL);
 236  005e 7217505f      	bres	20575,#3
 237                     ; 132   FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_PUL);
 239  0062 7213505f      	bres	20575,#1
 240                     ; 133   (void) FLASH->IAPSR; /* Reading of this register causes the clearing of status flags */
 242  0066 c6505f        	ld	a,20575
 243                     ; 134 }
 246  0069 81            	ret	
 302                     ; 142 void FLASH_ITConfig(FunctionalState NewState)
 302                     ; 143 {
 303                     	switch	.text
 304  006a               _FLASH_ITConfig:
 306  006a 88            	push	a
 307       00000000      OFST:	set	0
 310                     ; 145   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 312  006b 4d            	tnz	a
 313  006c 2711          	jreq	L04
 314  006e 4a            	dec	a
 315  006f 270e          	jreq	L04
 316  0071 ae0091        	ldw	x,#145
 317  0074 89            	pushw	x
 318  0075 5f            	clrw	x
 319  0076 89            	pushw	x
 320  0077 ae0010        	ldw	x,#L73
 321  007a cd0000        	call	_assert_failed
 323  007d 5b04          	addw	sp,#4
 324  007f               L04:
 325                     ; 147   if(NewState != DISABLE)
 327  007f 7b01          	ld	a,(OFST+1,sp)
 328  0081 2706          	jreq	L121
 329                     ; 149     FLASH->CR1 |= FLASH_CR1_IE; /* Enables the interrupt sources */
 331  0083 7212505a      	bset	20570,#1
 333  0087 2004          	jra	L321
 334  0089               L121:
 335                     ; 153     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_IE); /* Disables the interrupt sources */
 337  0089 7213505a      	bres	20570,#1
 338  008d               L321:
 339                     ; 155 }
 342  008d 84            	pop	a
 343  008e 81            	ret	
 378                     .const:	section	.text
 379  0000               L45:
 380  0000 00008000      	dc.l	32768
 381  0004               L65:
 382  0004 0000a000      	dc.l	40960
 383  0008               L06:
 384  0008 00004000      	dc.l	16384
 385  000c               L26:
 386  000c 00004280      	dc.l	17024
 387                     ; 164 void FLASH_EraseByte(uint32_t Address)
 387                     ; 165 {
 388                     	switch	.text
 389  008f               _FLASH_EraseByte:
 391       00000000      OFST:	set	0
 394                     ; 167   assert_param(IS_FLASH_ADDRESS_OK(Address));
 396  008f 96            	ldw	x,sp
 397  0090 1c0003        	addw	x,#OFST+3
 398  0093 cd0000        	call	c_ltor
 400  0096 ae0000        	ldw	x,#L45
 401  0099 cd0000        	call	c_lcmp
 403  009c 250f          	jrult	L25
 404  009e 96            	ldw	x,sp
 405  009f 1c0003        	addw	x,#OFST+3
 406  00a2 cd0000        	call	c_ltor
 408  00a5 ae0004        	ldw	x,#L65
 409  00a8 cd0000        	call	c_lcmp
 411  00ab 252c          	jrult	L46
 412  00ad               L25:
 413  00ad 96            	ldw	x,sp
 414  00ae 1c0003        	addw	x,#OFST+3
 415  00b1 cd0000        	call	c_ltor
 417  00b4 ae0008        	ldw	x,#L06
 418  00b7 cd0000        	call	c_lcmp
 420  00ba 250f          	jrult	L64
 421  00bc 96            	ldw	x,sp
 422  00bd 1c0003        	addw	x,#OFST+3
 423  00c0 cd0000        	call	c_ltor
 425  00c3 ae000c        	ldw	x,#L26
 426  00c6 cd0000        	call	c_lcmp
 428  00c9 250e          	jrult	L46
 429  00cb               L64:
 430  00cb ae00a7        	ldw	x,#167
 431  00ce 89            	pushw	x
 432  00cf 5f            	clrw	x
 433  00d0 89            	pushw	x
 434  00d1 ae0010        	ldw	x,#L73
 435  00d4 cd0000        	call	_assert_failed
 437  00d7 5b04          	addw	sp,#4
 438  00d9               L46:
 439                     ; 170   *(PointerAttr uint8_t*) (MemoryAddressCast)Address = FLASH_CLEAR_BYTE; 
 441  00d9 1e05          	ldw	x,(OFST+5,sp)
 442  00db 7f            	clr	(x)
 443                     ; 171 }
 446  00dc 81            	ret	
 490                     ; 181 void FLASH_ProgramByte(uint32_t Address, uint8_t Data)
 490                     ; 182 {
 491                     	switch	.text
 492  00dd               _FLASH_ProgramByte:
 494       00000000      OFST:	set	0
 497                     ; 184   assert_param(IS_FLASH_ADDRESS_OK(Address));
 499  00dd 96            	ldw	x,sp
 500  00de 1c0003        	addw	x,#OFST+3
 501  00e1 cd0000        	call	c_ltor
 503  00e4 ae0000        	ldw	x,#L45
 504  00e7 cd0000        	call	c_lcmp
 506  00ea 250f          	jrult	L67
 507  00ec 96            	ldw	x,sp
 508  00ed 1c0003        	addw	x,#OFST+3
 509  00f0 cd0000        	call	c_ltor
 511  00f3 ae0004        	ldw	x,#L65
 512  00f6 cd0000        	call	c_lcmp
 514  00f9 252c          	jrult	L001
 515  00fb               L67:
 516  00fb 96            	ldw	x,sp
 517  00fc 1c0003        	addw	x,#OFST+3
 518  00ff cd0000        	call	c_ltor
 520  0102 ae0008        	ldw	x,#L06
 521  0105 cd0000        	call	c_lcmp
 523  0108 250f          	jrult	L27
 524  010a 96            	ldw	x,sp
 525  010b 1c0003        	addw	x,#OFST+3
 526  010e cd0000        	call	c_ltor
 528  0111 ae000c        	ldw	x,#L26
 529  0114 cd0000        	call	c_lcmp
 531  0117 250e          	jrult	L001
 532  0119               L27:
 533  0119 ae00b8        	ldw	x,#184
 534  011c 89            	pushw	x
 535  011d 5f            	clrw	x
 536  011e 89            	pushw	x
 537  011f ae0010        	ldw	x,#L73
 538  0122 cd0000        	call	_assert_failed
 540  0125 5b04          	addw	sp,#4
 541  0127               L001:
 542                     ; 185   *(PointerAttr uint8_t*) (MemoryAddressCast)Address = Data;
 544  0127 1e05          	ldw	x,(OFST+5,sp)
 545  0129 7b07          	ld	a,(OFST+7,sp)
 546  012b f7            	ld	(x),a
 547                     ; 186 }
 550  012c 81            	ret	
 585                     ; 195 uint8_t FLASH_ReadByte(uint32_t Address)
 585                     ; 196 {
 586                     	switch	.text
 587  012d               _FLASH_ReadByte:
 589       00000000      OFST:	set	0
 592                     ; 198   assert_param(IS_FLASH_ADDRESS_OK(Address));
 594  012d 96            	ldw	x,sp
 595  012e 1c0003        	addw	x,#OFST+3
 596  0131 cd0000        	call	c_ltor
 598  0134 ae0000        	ldw	x,#L45
 599  0137 cd0000        	call	c_lcmp
 601  013a 250f          	jrult	L211
 602  013c 96            	ldw	x,sp
 603  013d 1c0003        	addw	x,#OFST+3
 604  0140 cd0000        	call	c_ltor
 606  0143 ae0004        	ldw	x,#L65
 607  0146 cd0000        	call	c_lcmp
 609  0149 252c          	jrult	L411
 610  014b               L211:
 611  014b 96            	ldw	x,sp
 612  014c 1c0003        	addw	x,#OFST+3
 613  014f cd0000        	call	c_ltor
 615  0152 ae0008        	ldw	x,#L06
 616  0155 cd0000        	call	c_lcmp
 618  0158 250f          	jrult	L601
 619  015a 96            	ldw	x,sp
 620  015b 1c0003        	addw	x,#OFST+3
 621  015e cd0000        	call	c_ltor
 623  0161 ae000c        	ldw	x,#L26
 624  0164 cd0000        	call	c_lcmp
 626  0167 250e          	jrult	L411
 627  0169               L601:
 628  0169 ae00c6        	ldw	x,#198
 629  016c 89            	pushw	x
 630  016d 5f            	clrw	x
 631  016e 89            	pushw	x
 632  016f ae0010        	ldw	x,#L73
 633  0172 cd0000        	call	_assert_failed
 635  0175 5b04          	addw	sp,#4
 636  0177               L411:
 637                     ; 201   return(*(PointerAttr uint8_t *) (MemoryAddressCast)Address); 
 639  0177 1e05          	ldw	x,(OFST+5,sp)
 640  0179 f6            	ld	a,(x)
 643  017a 81            	ret	
 687                     ; 212 void FLASH_ProgramWord(uint32_t Address, uint32_t Data)
 687                     ; 213 {
 688                     	switch	.text
 689  017b               _FLASH_ProgramWord:
 691       00000000      OFST:	set	0
 694                     ; 215   assert_param(IS_FLASH_ADDRESS_OK(Address));
 696  017b 96            	ldw	x,sp
 697  017c 1c0003        	addw	x,#OFST+3
 698  017f cd0000        	call	c_ltor
 700  0182 ae0000        	ldw	x,#L45
 701  0185 cd0000        	call	c_lcmp
 703  0188 250f          	jrult	L621
 704  018a 96            	ldw	x,sp
 705  018b 1c0003        	addw	x,#OFST+3
 706  018e cd0000        	call	c_ltor
 708  0191 ae0004        	ldw	x,#L65
 709  0194 cd0000        	call	c_lcmp
 711  0197 252c          	jrult	L031
 712  0199               L621:
 713  0199 96            	ldw	x,sp
 714  019a 1c0003        	addw	x,#OFST+3
 715  019d cd0000        	call	c_ltor
 717  01a0 ae0008        	ldw	x,#L06
 718  01a3 cd0000        	call	c_lcmp
 720  01a6 250f          	jrult	L221
 721  01a8 96            	ldw	x,sp
 722  01a9 1c0003        	addw	x,#OFST+3
 723  01ac cd0000        	call	c_ltor
 725  01af ae000c        	ldw	x,#L26
 726  01b2 cd0000        	call	c_lcmp
 728  01b5 250e          	jrult	L031
 729  01b7               L221:
 730  01b7 ae00d7        	ldw	x,#215
 731  01ba 89            	pushw	x
 732  01bb 5f            	clrw	x
 733  01bc 89            	pushw	x
 734  01bd ae0010        	ldw	x,#L73
 735  01c0 cd0000        	call	_assert_failed
 737  01c3 5b04          	addw	sp,#4
 738  01c5               L031:
 739                     ; 218   FLASH->CR2 |= FLASH_CR2_WPRG;
 741  01c5 721c505b      	bset	20571,#6
 742                     ; 219   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NWPRG);
 744  01c9 721d505c      	bres	20572,#6
 745                     ; 222   *((PointerAttr uint8_t*)(MemoryAddressCast)Address)       = *((uint8_t*)(&Data));
 747  01cd 1e05          	ldw	x,(OFST+5,sp)
 748  01cf 7b07          	ld	a,(OFST+7,sp)
 749  01d1 f7            	ld	(x),a
 750                     ; 224   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 1) = *((uint8_t*)(&Data)+1); 
 752  01d2 7b08          	ld	a,(OFST+8,sp)
 753  01d4 e701          	ld	(1,x),a
 754                     ; 226   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 2) = *((uint8_t*)(&Data)+2); 
 756  01d6 7b09          	ld	a,(OFST+9,sp)
 757  01d8 e702          	ld	(2,x),a
 758                     ; 228   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 3) = *((uint8_t*)(&Data)+3); 
 760  01da 7b0a          	ld	a,(OFST+10,sp)
 761  01dc e703          	ld	(3,x),a
 762                     ; 229 }
 765  01de 81            	ret	
 811                     ; 237 void FLASH_ProgramOptionByte(uint16_t Address, uint8_t Data)
 811                     ; 238 {
 812                     	switch	.text
 813  01df               _FLASH_ProgramOptionByte:
 815  01df 89            	pushw	x
 816       00000000      OFST:	set	0
 819                     ; 240   assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
 821  01e0 a34800        	cpw	x,#18432
 822  01e3 2505          	jrult	L631
 823  01e5 a34880        	cpw	x,#18560
 824  01e8 250e          	jrult	L041
 825  01ea               L631:
 826  01ea ae00f0        	ldw	x,#240
 827  01ed 89            	pushw	x
 828  01ee 5f            	clrw	x
 829  01ef 89            	pushw	x
 830  01f0 ae0010        	ldw	x,#L73
 831  01f3 cd0000        	call	_assert_failed
 833  01f6 5b04          	addw	sp,#4
 834  01f8               L041:
 835                     ; 243   FLASH->CR2 |= FLASH_CR2_OPT;
 837  01f8 721e505b      	bset	20571,#7
 838                     ; 244   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
 840  01fc 721f505c      	bres	20572,#7
 841                     ; 247   if(Address == 0x4800)
 843  0200 1e01          	ldw	x,(OFST+1,sp)
 844  0202 a34800        	cpw	x,#18432
 845  0205 2605          	jrne	L742
 846                     ; 250     *((NEAR uint8_t*)Address) = Data;
 848  0207 7b05          	ld	a,(OFST+5,sp)
 849  0209 f7            	ld	(x),a
 851  020a 2006          	jra	L152
 852  020c               L742:
 853                     ; 255     *((NEAR uint8_t*)Address) = Data;
 855  020c 7b05          	ld	a,(OFST+5,sp)
 856  020e f7            	ld	(x),a
 857                     ; 256     *((NEAR uint8_t*)((uint16_t)(Address + 1))) = (uint8_t)(~Data);
 859  020f 43            	cpl	a
 860  0210 e701          	ld	(1,x),a
 861  0212               L152:
 862                     ; 258   FLASH_WaitForLastOperation(FLASH_MEMTYPE_PROG);
 864  0212 a6fd          	ld	a,#253
 865  0214 cd0368        	call	_FLASH_WaitForLastOperation
 867                     ; 261   FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 869  0217 721f505b      	bres	20571,#7
 870                     ; 262   FLASH->NCR2 |= FLASH_NCR2_NOPT;
 872  021b 721e505c      	bset	20572,#7
 873                     ; 263 }
 876  021f 85            	popw	x
 877  0220 81            	ret	
 914                     ; 270 void FLASH_EraseOptionByte(uint16_t Address)
 914                     ; 271 {
 915                     	switch	.text
 916  0221               _FLASH_EraseOptionByte:
 918  0221 89            	pushw	x
 919       00000000      OFST:	set	0
 922                     ; 273   assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
 924  0222 a34800        	cpw	x,#18432
 925  0225 2505          	jrult	L051
 926  0227 a34880        	cpw	x,#18560
 927  022a 250e          	jrult	L251
 928  022c               L051:
 929  022c ae0111        	ldw	x,#273
 930  022f 89            	pushw	x
 931  0230 5f            	clrw	x
 932  0231 89            	pushw	x
 933  0232 ae0010        	ldw	x,#L73
 934  0235 cd0000        	call	_assert_failed
 936  0238 5b04          	addw	sp,#4
 937  023a               L251:
 938                     ; 276   FLASH->CR2 |= FLASH_CR2_OPT;
 940  023a 721e505b      	bset	20571,#7
 941                     ; 277   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
 943  023e 721f505c      	bres	20572,#7
 944                     ; 280   if(Address == 0x4800)
 946  0242 1e01          	ldw	x,(OFST+1,sp)
 947  0244 a34800        	cpw	x,#18432
 948  0247 2603          	jrne	L172
 949                     ; 283     *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
 951  0249 7f            	clr	(x)
 953  024a 2005          	jra	L372
 954  024c               L172:
 955                     ; 288     *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
 957  024c 7f            	clr	(x)
 958                     ; 289     *((NEAR uint8_t*)((uint16_t)(Address + (uint16_t)1 ))) = FLASH_SET_BYTE;
 960  024d a6ff          	ld	a,#255
 961  024f e701          	ld	(1,x),a
 962  0251               L372:
 963                     ; 291   FLASH_WaitForLastOperation(FLASH_MEMTYPE_PROG);
 965  0251 a6fd          	ld	a,#253
 966  0253 cd0368        	call	_FLASH_WaitForLastOperation
 968                     ; 294   FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 970  0256 721f505b      	bres	20571,#7
 971                     ; 295   FLASH->NCR2 |= FLASH_NCR2_NOPT;
 973  025a 721e505c      	bset	20572,#7
 974                     ; 296 }
 977  025e 85            	popw	x
 978  025f 81            	ret	
1042                     ; 303 uint16_t FLASH_ReadOptionByte(uint16_t Address)
1042                     ; 304 {
1043                     	switch	.text
1044  0260               _FLASH_ReadOptionByte:
1046  0260 89            	pushw	x
1047  0261 5204          	subw	sp,#4
1048       00000004      OFST:	set	4
1051                     ; 305   uint8_t value_optbyte, value_optbyte_complement = 0;
1053                     ; 306   uint16_t res_value = 0;
1055                     ; 309   assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
1057  0263 a34800        	cpw	x,#18432
1058  0266 2505          	jrult	L261
1059  0268 a34880        	cpw	x,#18560
1060  026b 250e          	jrult	L461
1061  026d               L261:
1062  026d ae0135        	ldw	x,#309
1063  0270 89            	pushw	x
1064  0271 5f            	clrw	x
1065  0272 89            	pushw	x
1066  0273 ae0010        	ldw	x,#L73
1067  0276 cd0000        	call	_assert_failed
1069  0279 5b04          	addw	sp,#4
1070  027b               L461:
1071                     ; 311   value_optbyte = *((NEAR uint8_t*)Address); /* Read option byte */
1073  027b 1e05          	ldw	x,(OFST+1,sp)
1074  027d f6            	ld	a,(x)
1075  027e 6b01          	ld	(OFST-3,sp),a
1077                     ; 312   value_optbyte_complement = *(((NEAR uint8_t*)Address) + 1); /* Read option byte complement */
1079  0280 e601          	ld	a,(1,x)
1080  0282 6b02          	ld	(OFST-2,sp),a
1082                     ; 315   if(Address == 0x4800)	 
1084  0284 a34800        	cpw	x,#18432
1085  0287 2606          	jrne	L723
1086                     ; 317     res_value =	 value_optbyte;
1088  0289 7b01          	ld	a,(OFST-3,sp)
1089  028b 5f            	clrw	x
1090  028c 97            	ld	xl,a
1093  028d 201c          	jra	L133
1094  028f               L723:
1095                     ; 321     if(value_optbyte == (uint8_t)(~value_optbyte_complement))
1097  028f 43            	cpl	a
1098  0290 1101          	cp	a,(OFST-3,sp)
1099  0292 2614          	jrne	L333
1100                     ; 323       res_value = (uint16_t)((uint16_t)value_optbyte << 8);
1102  0294 7b01          	ld	a,(OFST-3,sp)
1103  0296 97            	ld	xl,a
1104  0297 4f            	clr	a
1105  0298 02            	rlwa	x,a
1106  0299 1f03          	ldw	(OFST-1,sp),x
1108                     ; 324       res_value = res_value | (uint16_t)value_optbyte_complement;
1110  029b 5f            	clrw	x
1111  029c 7b02          	ld	a,(OFST-2,sp)
1112  029e 97            	ld	xl,a
1113  029f 01            	rrwa	x,a
1114  02a0 1a04          	or	a,(OFST+0,sp)
1115  02a2 01            	rrwa	x,a
1116  02a3 1a03          	or	a,(OFST-1,sp)
1117  02a5 01            	rrwa	x,a
1120  02a6 2003          	jra	L133
1121  02a8               L333:
1122                     ; 328       res_value = FLASH_OPTIONBYTE_ERROR;
1124  02a8 ae5555        	ldw	x,#21845
1126  02ab               L133:
1127                     ; 331   return(res_value);
1131  02ab 5b06          	addw	sp,#6
1132  02ad 81            	ret	
1207                     ; 340 void FLASH_SetLowPowerMode(FLASH_LPMode_TypeDef FLASH_LPMode)
1207                     ; 341 {
1208                     	switch	.text
1209  02ae               _FLASH_SetLowPowerMode:
1211  02ae 88            	push	a
1212       00000000      OFST:	set	0
1215                     ; 343   assert_param(IS_FLASH_LOW_POWER_MODE_OK(FLASH_LPMode));
1217  02af a104          	cp	a,#4
1218  02b1 2719          	jreq	L671
1219  02b3 a108          	cp	a,#8
1220  02b5 2715          	jreq	L671
1221  02b7 4d            	tnz	a
1222  02b8 2712          	jreq	L671
1223  02ba a10c          	cp	a,#12
1224  02bc 270e          	jreq	L671
1225  02be ae0157        	ldw	x,#343
1226  02c1 89            	pushw	x
1227  02c2 5f            	clrw	x
1228  02c3 89            	pushw	x
1229  02c4 ae0010        	ldw	x,#L73
1230  02c7 cd0000        	call	_assert_failed
1232  02ca 5b04          	addw	sp,#4
1233  02cc               L671:
1234                     ; 346   FLASH->CR1 &= (uint8_t)(~(FLASH_CR1_HALT | FLASH_CR1_AHALT)); 
1236  02cc c6505a        	ld	a,20570
1237  02cf a4f3          	and	a,#243
1238  02d1 c7505a        	ld	20570,a
1239                     ; 349   FLASH->CR1 |= (uint8_t)FLASH_LPMode; 
1241  02d4 c6505a        	ld	a,20570
1242  02d7 1a01          	or	a,(OFST+1,sp)
1243  02d9 c7505a        	ld	20570,a
1244                     ; 350 }
1247  02dc 84            	pop	a
1248  02dd 81            	ret	
1307                     ; 358 void FLASH_SetProgrammingTime(FLASH_ProgramTime_TypeDef FLASH_ProgTime)
1307                     ; 359 {
1308                     	switch	.text
1309  02de               _FLASH_SetProgrammingTime:
1311  02de 88            	push	a
1312       00000000      OFST:	set	0
1315                     ; 361   assert_param(IS_FLASH_PROGRAM_TIME_OK(FLASH_ProgTime));
1317  02df 4d            	tnz	a
1318  02e0 2711          	jreq	L012
1319  02e2 4a            	dec	a
1320  02e3 270e          	jreq	L012
1321  02e5 ae0169        	ldw	x,#361
1322  02e8 89            	pushw	x
1323  02e9 5f            	clrw	x
1324  02ea 89            	pushw	x
1325  02eb ae0010        	ldw	x,#L73
1326  02ee cd0000        	call	_assert_failed
1328  02f1 5b04          	addw	sp,#4
1329  02f3               L012:
1330                     ; 363   FLASH->CR1 &= (uint8_t)(~FLASH_CR1_FIX);
1332  02f3 7211505a      	bres	20570,#0
1333                     ; 364   FLASH->CR1 |= (uint8_t)FLASH_ProgTime;
1335  02f7 c6505a        	ld	a,20570
1336  02fa 1a01          	or	a,(OFST+1,sp)
1337  02fc c7505a        	ld	20570,a
1338                     ; 365 }
1341  02ff 84            	pop	a
1342  0300 81            	ret	
1367                     ; 372 FLASH_LPMode_TypeDef FLASH_GetLowPowerMode(void)
1367                     ; 373 {
1368                     	switch	.text
1369  0301               _FLASH_GetLowPowerMode:
1373                     ; 374   return((FLASH_LPMode_TypeDef)(FLASH->CR1 & (uint8_t)(FLASH_CR1_HALT | FLASH_CR1_AHALT)));
1375  0301 c6505a        	ld	a,20570
1376  0304 a40c          	and	a,#12
1379  0306 81            	ret	
1404                     ; 382 FLASH_ProgramTime_TypeDef FLASH_GetProgrammingTime(void)
1404                     ; 383 {
1405                     	switch	.text
1406  0307               _FLASH_GetProgrammingTime:
1410                     ; 384   return((FLASH_ProgramTime_TypeDef)(FLASH->CR1 & FLASH_CR1_FIX));
1412  0307 c6505a        	ld	a,20570
1413  030a a401          	and	a,#1
1416  030c 81            	ret	
1450                     ; 392 uint32_t FLASH_GetBootSize(void)
1450                     ; 393 {
1451                     	switch	.text
1452  030d               _FLASH_GetBootSize:
1454  030d 5204          	subw	sp,#4
1455       00000004      OFST:	set	4
1458                     ; 394   uint32_t temp = 0;
1460                     ; 397   temp = (uint32_t)((uint32_t)FLASH->FPR * (uint32_t)512);
1462  030f c6505d        	ld	a,20573
1463  0312 5f            	clrw	x
1464  0313 97            	ld	xl,a
1465  0314 90ae0200      	ldw	y,#512
1466  0318 cd0000        	call	c_umul
1468  031b 96            	ldw	x,sp
1469  031c 5c            	incw	x
1470  031d cd0000        	call	c_rtol
1473                     ; 400   if(FLASH->FPR == 0xFF)
1475  0320 c6505d        	ld	a,20573
1476  0323 4c            	inc	a
1477  0324 260d          	jrne	L554
1478                     ; 402     temp += 512;
1480  0326 ae0200        	ldw	x,#512
1481  0329 bf02          	ldw	c_lreg+2,x
1482  032b 5f            	clrw	x
1483  032c bf00          	ldw	c_lreg,x
1484  032e 96            	ldw	x,sp
1485  032f 5c            	incw	x
1486  0330 cd0000        	call	c_lgadd
1489  0333               L554:
1490                     ; 406   return(temp);
1492  0333 96            	ldw	x,sp
1493  0334 5c            	incw	x
1494  0335 cd0000        	call	c_ltor
1498  0338 5b04          	addw	sp,#4
1499  033a 81            	ret	
1602                     ; 417 FlagStatus FLASH_GetFlagStatus(FLASH_Flag_TypeDef FLASH_FLAG)
1602                     ; 418 {
1603                     	switch	.text
1604  033b               _FLASH_GetFlagStatus:
1606  033b 88            	push	a
1607  033c 88            	push	a
1608       00000001      OFST:	set	1
1611                     ; 419   FlagStatus status = RESET;
1613                     ; 421   assert_param(IS_FLASH_FLAGS_OK(FLASH_FLAG));
1615  033d a108          	cp	a,#8
1616  033f 2719          	jreq	L032
1617  0341 a104          	cp	a,#4
1618  0343 2715          	jreq	L032
1619  0345 a102          	cp	a,#2
1620  0347 2711          	jreq	L032
1621  0349 4a            	dec	a
1622  034a 270e          	jreq	L032
1623  034c ae01a5        	ldw	x,#421
1624  034f 89            	pushw	x
1625  0350 5f            	clrw	x
1626  0351 89            	pushw	x
1627  0352 ae0010        	ldw	x,#L73
1628  0355 cd0000        	call	_assert_failed
1630  0358 5b04          	addw	sp,#4
1631  035a               L032:
1632                     ; 424   if((FLASH->IAPSR & (uint8_t)FLASH_FLAG) != (uint8_t)RESET)
1634  035a c6505f        	ld	a,20575
1635  035d 1502          	bcp	a,(OFST+1,sp)
1636  035f 2704          	jreq	L525
1637                     ; 426     status = SET; /* FLASH_FLAG is set */
1639  0361 a601          	ld	a,#1
1642  0363 2001          	jra	L725
1643  0365               L525:
1644                     ; 430     status = RESET; /* FLASH_FLAG is reset*/
1646  0365 4f            	clr	a
1648  0366               L725:
1649                     ; 434   return status;
1653  0366 85            	popw	x
1654  0367 81            	ret	
1739                     ; 549 IN_RAM(FLASH_Status_TypeDef FLASH_WaitForLastOperation(FLASH_MemType_TypeDef FLASH_MemType)) 
1739                     ; 550 {
1740                     	switch	.text
1741  0368               _FLASH_WaitForLastOperation:
1743  0368 5203          	subw	sp,#3
1744       00000003      OFST:	set	3
1747                     ; 551   uint8_t flagstatus = 0x00;
1749  036a 0f03          	clr	(OFST+0,sp)
1751                     ; 552   uint16_t timeout = OPERATION_TIMEOUT;
1753  036c aeffff        	ldw	x,#65535
1754                     ; 576   UNUSED(FLASH_MemType);
1757  036f 2008          	jra	L375
1758  0371               L175:
1759                     ; 579     flagstatus = (uint8_t)(FLASH->IAPSR & (FLASH_IAPSR_EOP | FLASH_IAPSR_WR_PG_DIS));
1761  0371 c6505f        	ld	a,20575
1762  0374 a405          	and	a,#5
1763  0376 6b03          	ld	(OFST+0,sp),a
1765                     ; 580     timeout--;
1767  0378 5a            	decw	x
1768  0379               L375:
1769  0379 1f01          	ldw	(OFST-2,sp),x
1771                     ; 577   while((flagstatus == 0x00) && (timeout != 0x00))
1773  037b 7b03          	ld	a,(OFST+0,sp)
1774  037d 2603          	jrne	L775
1776  037f 5d            	tnzw	x
1777  0380 26ef          	jrne	L175
1778  0382               L775:
1779                     ; 584   if(timeout == 0x00 )
1781  0382 1e01          	ldw	x,(OFST-2,sp)
1782  0384 2602          	jrne	L106
1783                     ; 586     flagstatus = FLASH_STATUS_TIMEOUT;
1785  0386 a602          	ld	a,#2
1787  0388               L106:
1788                     ; 589   return((FLASH_Status_TypeDef)flagstatus);
1792  0388 5b03          	addw	sp,#3
1793  038a 81            	ret	
1857                     ; 599 IN_RAM(void FLASH_EraseBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType))
1857                     ; 600 {
1858                     	switch	.text
1859  038b               _FLASH_EraseBlock:
1861  038b 89            	pushw	x
1862  038c 5206          	subw	sp,#6
1863       00000006      OFST:	set	6
1866                     ; 601   uint32_t startaddress = 0;
1868                     ; 611   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
1870  038e 7b0b          	ld	a,(OFST+5,sp)
1871  0390 a1fd          	cp	a,#253
1872  0392 270b          	jreq	L442
1873  0394 a1f7          	cp	a,#247
1874  0396 2707          	jreq	L442
1875  0398 ae0263        	ldw	x,#611
1876  039b ad50          	call	LC001
1877  039d 7b0b          	ld	a,(OFST+5,sp)
1878  039f               L442:
1879                     ; 612   if(FLASH_MemType == FLASH_MEMTYPE_PROG)
1881  039f a1fd          	cp	a,#253
1882  03a1 2611          	jrne	L536
1883                     ; 614     assert_param(IS_FLASH_PROG_BLOCK_NUMBER_OK(BlockNum));
1885  03a3 1e07          	ldw	x,(OFST+1,sp)
1886  03a5 a30080        	cpw	x,#128
1887  03a8 2505          	jrult	L252
1888  03aa ae0266        	ldw	x,#614
1889  03ad ad3e          	call	LC001
1890  03af               L252:
1891                     ; 615     startaddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
1893  03af ae8000        	ldw	x,#32768
1895  03b2 200f          	jra	L736
1896  03b4               L536:
1897                     ; 619     assert_param(IS_FLASH_DATA_BLOCK_NUMBER_OK(BlockNum));
1899  03b4 1e07          	ldw	x,(OFST+1,sp)
1900  03b6 a3000a        	cpw	x,#10
1901  03b9 2505          	jrult	L062
1902  03bb ae026b        	ldw	x,#619
1903  03be ad2d          	call	LC001
1904  03c0               L062:
1905                     ; 620     startaddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
1907  03c0 ae4000        	ldw	x,#16384
1908  03c3               L736:
1909  03c3 1f05          	ldw	(OFST-1,sp),x
1910  03c5 5f            	clrw	x
1911  03c6 1f03          	ldw	(OFST-3,sp),x
1913                     ; 628     pwFlash = (PointerAttr uint32_t *)(MemoryAddressCast)(startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE));
1915  03c8 a640          	ld	a,#64
1916  03ca 1e07          	ldw	x,(OFST+1,sp)
1917  03cc cd0000        	call	c_cmulx
1919  03cf 96            	ldw	x,sp
1920  03d0 1c0003        	addw	x,#OFST-3
1921  03d3 cd0000        	call	c_ladd
1923  03d6 be02          	ldw	x,c_lreg+2
1924  03d8 1f01          	ldw	(OFST-5,sp),x
1926                     ; 632   FLASH->CR2 |= FLASH_CR2_ERASE;
1928  03da 721a505b      	bset	20571,#5
1929                     ; 633   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NERASE);
1931  03de 721b505c      	bres	20572,#5
1932                     ; 637     *pwFlash = (uint32_t)0;
1934  03e2 4f            	clr	a
1935  03e3 e703          	ld	(3,x),a
1936  03e5 e702          	ld	(2,x),a
1937  03e7 e701          	ld	(1,x),a
1938  03e9 f7            	ld	(x),a
1939                     ; 645 }
1942  03ea 5b08          	addw	sp,#8
1943  03ec 81            	ret	
1944  03ed               LC001:
1945  03ed 89            	pushw	x
1946  03ee 5f            	clrw	x
1947  03ef 89            	pushw	x
1948  03f0 ae0010        	ldw	x,#L73
1949  03f3 cd0000        	call	_assert_failed
1951  03f6 5b04          	addw	sp,#4
1952  03f8 81            	ret	
2057                     ; 656 IN_RAM(void FLASH_ProgramBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType, 
2057                     ; 657                         FLASH_ProgramMode_TypeDef FLASH_ProgMode, uint8_t *Buffer))
2057                     ; 658 {
2058                     	switch	.text
2059  03f9               _FLASH_ProgramBlock:
2061  03f9 89            	pushw	x
2062  03fa 5206          	subw	sp,#6
2063       00000006      OFST:	set	6
2066                     ; 659   uint16_t Count = 0;
2068                     ; 660   uint32_t startaddress = 0;
2070                     ; 663   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
2072  03fc 7b0b          	ld	a,(OFST+5,sp)
2073  03fe a1fd          	cp	a,#253
2074  0400 2709          	jreq	L272
2075  0402 a1f7          	cp	a,#247
2076  0404 2705          	jreq	L272
2077  0406 ae0297        	ldw	x,#663
2078  0409 ad76          	call	LC002
2079  040b               L272:
2080                     ; 664   assert_param(IS_FLASH_PROGRAM_MODE_OK(FLASH_ProgMode));
2082  040b 7b0c          	ld	a,(OFST+6,sp)
2083  040d 2709          	jreq	L203
2084  040f a110          	cp	a,#16
2085  0411 2705          	jreq	L203
2086  0413 ae0298        	ldw	x,#664
2087  0416 ad69          	call	LC002
2088  0418               L203:
2089                     ; 665   if(FLASH_MemType == FLASH_MEMTYPE_PROG)
2091  0418 7b0b          	ld	a,(OFST+5,sp)
2092  041a a1fd          	cp	a,#253
2093  041c 2611          	jrne	L317
2094                     ; 667     assert_param(IS_FLASH_PROG_BLOCK_NUMBER_OK(BlockNum));
2096  041e 1e07          	ldw	x,(OFST+1,sp)
2097  0420 a30080        	cpw	x,#128
2098  0423 2505          	jrult	L013
2099  0425 ae029b        	ldw	x,#667
2100  0428 ad57          	call	LC002
2101  042a               L013:
2102                     ; 668     startaddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
2104  042a ae8000        	ldw	x,#32768
2106  042d 200f          	jra	L517
2107  042f               L317:
2108                     ; 672     assert_param(IS_FLASH_DATA_BLOCK_NUMBER_OK(BlockNum));
2110  042f 1e07          	ldw	x,(OFST+1,sp)
2111  0431 a3000a        	cpw	x,#10
2112  0434 2505          	jrult	L613
2113  0436 ae02a0        	ldw	x,#672
2114  0439 ad46          	call	LC002
2115  043b               L613:
2116                     ; 673     startaddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
2118  043b ae4000        	ldw	x,#16384
2119  043e               L517:
2120  043e 1f03          	ldw	(OFST-3,sp),x
2121  0440 5f            	clrw	x
2122  0441 1f01          	ldw	(OFST-5,sp),x
2124                     ; 677   startaddress = startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE);
2126  0443 a640          	ld	a,#64
2127  0445 1e07          	ldw	x,(OFST+1,sp)
2128  0447 cd0000        	call	c_cmulx
2130  044a 96            	ldw	x,sp
2131  044b 5c            	incw	x
2132  044c cd0000        	call	c_lgadd
2135                     ; 680   if(FLASH_ProgMode == FLASH_PROGRAMMODE_STANDARD)
2137  044f 7b0c          	ld	a,(OFST+6,sp)
2138  0451 260a          	jrne	L717
2139                     ; 683     FLASH->CR2 |= FLASH_CR2_PRG;
2141  0453 7210505b      	bset	20571,#0
2142                     ; 684     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NPRG);
2144  0457 7211505c      	bres	20572,#0
2146  045b 2008          	jra	L127
2147  045d               L717:
2148                     ; 689     FLASH->CR2 |= FLASH_CR2_FPRG;
2150  045d 7218505b      	bset	20571,#4
2151                     ; 690     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NFPRG);
2153  0461 7219505c      	bres	20572,#4
2154  0465               L127:
2155                     ; 694   for(Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
2157  0465 5f            	clrw	x
2158  0466 1f05          	ldw	(OFST-1,sp),x
2160  0468               L327:
2161                     ; 696     *((PointerAttr uint8_t*) (MemoryAddressCast)startaddress + Count) = ((uint8_t)(Buffer[Count]));
2163  0468 1e0d          	ldw	x,(OFST+7,sp)
2164  046a 72fb05        	addw	x,(OFST-1,sp)
2165  046d f6            	ld	a,(x)
2166  046e 1e03          	ldw	x,(OFST-3,sp)
2167  0470 72fb05        	addw	x,(OFST-1,sp)
2168  0473 f7            	ld	(x),a
2169                     ; 694   for(Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
2171  0474 1e05          	ldw	x,(OFST-1,sp)
2172  0476 5c            	incw	x
2173  0477 1f05          	ldw	(OFST-1,sp),x
2177  0479 a30040        	cpw	x,#64
2178  047c 25ea          	jrult	L327
2179                     ; 698 }
2182  047e 5b08          	addw	sp,#8
2183  0480 81            	ret	
2184  0481               LC002:
2185  0481 89            	pushw	x
2186  0482 5f            	clrw	x
2187  0483 89            	pushw	x
2188  0484 ae0010        	ldw	x,#L73
2189  0487 cd0000        	call	_assert_failed
2191  048a 5b04          	addw	sp,#4
2192  048c 81            	ret	
2205                     	xdef	_FLASH_WaitForLastOperation
2206                     	xdef	_FLASH_ProgramBlock
2207                     	xdef	_FLASH_EraseBlock
2208                     	xdef	_FLASH_GetFlagStatus
2209                     	xdef	_FLASH_GetBootSize
2210                     	xdef	_FLASH_GetProgrammingTime
2211                     	xdef	_FLASH_GetLowPowerMode
2212                     	xdef	_FLASH_SetProgrammingTime
2213                     	xdef	_FLASH_SetLowPowerMode
2214                     	xdef	_FLASH_EraseOptionByte
2215                     	xdef	_FLASH_ProgramOptionByte
2216                     	xdef	_FLASH_ReadOptionByte
2217                     	xdef	_FLASH_ProgramWord
2218                     	xdef	_FLASH_ReadByte
2219                     	xdef	_FLASH_ProgramByte
2220                     	xdef	_FLASH_EraseByte
2221                     	xdef	_FLASH_ITConfig
2222                     	xdef	_FLASH_DeInit
2223                     	xdef	_FLASH_Lock
2224                     	xdef	_FLASH_Unlock
2225                     	xref	_assert_failed
2226                     	switch	.const
2227  0010               L73:
2228  0010 2e2e5c2e2e5c  	dc.b	"..\..\stm8s_spl\li"
2229  0022 627261726965  	dc.b	"braries\stm8s_stdp"
2230  0034 65726970685f  	dc.b	"eriph_driver\src\s"
2231  0046 746d38735f66  	dc.b	"tm8s_flash.c",0
2232                     	xref.b	c_lreg
2233                     	xref.b	c_x
2234                     	xref.b	c_y
2254                     	xref	c_ladd
2255                     	xref	c_cmulx
2256                     	xref	c_lgadd
2257                     	xref	c_rtol
2258                     	xref	c_umul
2259                     	xref	c_lcmp
2260                     	xref	c_ltor
2261                     	end
