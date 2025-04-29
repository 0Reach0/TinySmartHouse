   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.3 - 22 Aug 2024
   4                     ; Optimizer V4.6.3 - 22 Aug 2024
  80                     ; 87 void FLASH_Unlock(FLASH_MemType_TypeDef FLASH_MemType)
  80                     ; 88 {
  82                     	switch	.text
  83  0000               _FLASH_Unlock:
  85  0000 88            	push	a
  86       00000000      OFST:	set	0
  89                     ; 90   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
  91  0001 a1fd          	cp	a,#253
  92  0003 2712          	jreq	L21
  93  0005 a1f7          	cp	a,#247
  94  0007 270e          	jreq	L21
  95  0009 ae005a        	ldw	x,#90
  96  000c 89            	pushw	x
  97  000d 5f            	clrw	x
  98  000e 89            	pushw	x
  99  000f ae0010        	ldw	x,#L73
 100  0012 cd0000        	call	_assert_failed
 102  0015 5b04          	addw	sp,#4
 103  0017               L21:
 104                     ; 93   if(FLASH_MemType == FLASH_MEMTYPE_PROG)
 106  0017 7b01          	ld	a,(OFST+1,sp)
 107  0019 a1fd          	cp	a,#253
 108  001b 260a          	jrne	L14
 109                     ; 95     FLASH->PUKR = FLASH_RASS_KEY1;
 111  001d 35565062      	mov	20578,#86
 112                     ; 96     FLASH->PUKR = FLASH_RASS_KEY2;
 114  0021 35ae5062      	mov	20578,#174
 116  0025 2008          	jra	L34
 117  0027               L14:
 118                     ; 101     FLASH->DUKR = FLASH_RASS_KEY2; /* Warning: keys are reversed on data memory !!! */
 120  0027 35ae5064      	mov	20580,#174
 121                     ; 102     FLASH->DUKR = FLASH_RASS_KEY1;
 123  002b 35565064      	mov	20580,#86
 124  002f               L34:
 125                     ; 104 }
 128  002f 84            	pop	a
 129  0030 81            	ret	
 165                     ; 112 void FLASH_Lock(FLASH_MemType_TypeDef FLASH_MemType)
 165                     ; 113 {
 166                     	switch	.text
 167  0031               _FLASH_Lock:
 169  0031 88            	push	a
 170       00000000      OFST:	set	0
 173                     ; 115   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
 175  0032 a1fd          	cp	a,#253
 176  0034 2712          	jreq	L42
 177  0036 a1f7          	cp	a,#247
 178  0038 270e          	jreq	L42
 179  003a ae0073        	ldw	x,#115
 180  003d 89            	pushw	x
 181  003e 5f            	clrw	x
 182  003f 89            	pushw	x
 183  0040 ae0010        	ldw	x,#L73
 184  0043 cd0000        	call	_assert_failed
 186  0046 5b04          	addw	sp,#4
 187  0048               L42:
 188                     ; 118   FLASH->IAPSR &= (uint8_t)FLASH_MemType;
 190  0048 c6505f        	ld	a,20575
 191  004b 1401          	and	a,(OFST+1,sp)
 192  004d c7505f        	ld	20575,a
 193                     ; 119 }
 196  0050 84            	pop	a
 197  0051 81            	ret	
 220                     ; 126 void FLASH_DeInit(void)
 220                     ; 127 {
 221                     	switch	.text
 222  0052               _FLASH_DeInit:
 226                     ; 128   FLASH->CR1 = FLASH_CR1_RESET_VALUE;
 228  0052 725f505a      	clr	20570
 229                     ; 129   FLASH->CR2 = FLASH_CR2_RESET_VALUE;
 231  0056 725f505b      	clr	20571
 232                     ; 130   FLASH->NCR2 = FLASH_NCR2_RESET_VALUE;
 234  005a 35ff505c      	mov	20572,#255
 235                     ; 131   FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_DUL);
 237  005e 7217505f      	bres	20575,#3
 238                     ; 132   FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_PUL);
 240  0062 7213505f      	bres	20575,#1
 241                     ; 133   (void) FLASH->IAPSR; /* Reading of this register causes the clearing of status flags */
 243  0066 c6505f        	ld	a,20575
 244                     ; 134 }
 247  0069 81            	ret	
 303                     ; 142 void FLASH_ITConfig(FunctionalState NewState)
 303                     ; 143 {
 304                     	switch	.text
 305  006a               _FLASH_ITConfig:
 307  006a 88            	push	a
 308       00000000      OFST:	set	0
 311                     ; 145   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 313  006b 4d            	tnz	a
 314  006c 2711          	jreq	L04
 315  006e 4a            	dec	a
 316  006f 270e          	jreq	L04
 317  0071 ae0091        	ldw	x,#145
 318  0074 89            	pushw	x
 319  0075 5f            	clrw	x
 320  0076 89            	pushw	x
 321  0077 ae0010        	ldw	x,#L73
 322  007a cd0000        	call	_assert_failed
 324  007d 5b04          	addw	sp,#4
 325  007f               L04:
 326                     ; 147   if(NewState != DISABLE)
 328  007f 7b01          	ld	a,(OFST+1,sp)
 329  0081 2706          	jreq	L121
 330                     ; 149     FLASH->CR1 |= FLASH_CR1_IE; /* Enables the interrupt sources */
 332  0083 7212505a      	bset	20570,#1
 334  0087 2004          	jra	L321
 335  0089               L121:
 336                     ; 153     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_IE); /* Disables the interrupt sources */
 338  0089 7213505a      	bres	20570,#1
 339  008d               L321:
 340                     ; 155 }
 343  008d 84            	pop	a
 344  008e 81            	ret	
 379                     .const:	section	.text
 380  0000               L45:
 381  0000 00008000      	dc.l	32768
 382  0004               L65:
 383  0004 0000a000      	dc.l	40960
 384  0008               L06:
 385  0008 00004000      	dc.l	16384
 386  000c               L26:
 387  000c 00004280      	dc.l	17024
 388                     ; 164 void FLASH_EraseByte(uint32_t Address)
 388                     ; 165 {
 389                     	switch	.text
 390  008f               _FLASH_EraseByte:
 392       00000000      OFST:	set	0
 395                     ; 167   assert_param(IS_FLASH_ADDRESS_OK(Address));
 397  008f 96            	ldw	x,sp
 398  0090 1c0003        	addw	x,#OFST+3
 399  0093 cd0000        	call	c_ltor
 401  0096 ae0000        	ldw	x,#L45
 402  0099 cd0000        	call	c_lcmp
 404  009c 250f          	jrult	L25
 405  009e 96            	ldw	x,sp
 406  009f 1c0003        	addw	x,#OFST+3
 407  00a2 cd0000        	call	c_ltor
 409  00a5 ae0004        	ldw	x,#L65
 410  00a8 cd0000        	call	c_lcmp
 412  00ab 252c          	jrult	L46
 413  00ad               L25:
 414  00ad 96            	ldw	x,sp
 415  00ae 1c0003        	addw	x,#OFST+3
 416  00b1 cd0000        	call	c_ltor
 418  00b4 ae0008        	ldw	x,#L06
 419  00b7 cd0000        	call	c_lcmp
 421  00ba 250f          	jrult	L64
 422  00bc 96            	ldw	x,sp
 423  00bd 1c0003        	addw	x,#OFST+3
 424  00c0 cd0000        	call	c_ltor
 426  00c3 ae000c        	ldw	x,#L26
 427  00c6 cd0000        	call	c_lcmp
 429  00c9 250e          	jrult	L46
 430  00cb               L64:
 431  00cb ae00a7        	ldw	x,#167
 432  00ce 89            	pushw	x
 433  00cf 5f            	clrw	x
 434  00d0 89            	pushw	x
 435  00d1 ae0010        	ldw	x,#L73
 436  00d4 cd0000        	call	_assert_failed
 438  00d7 5b04          	addw	sp,#4
 439  00d9               L46:
 440                     ; 170   *(PointerAttr uint8_t*) (MemoryAddressCast)Address = FLASH_CLEAR_BYTE; 
 442  00d9 1e05          	ldw	x,(OFST+5,sp)
 443  00db 7f            	clr	(x)
 444                     ; 171 }
 447  00dc 81            	ret	
 491                     ; 181 void FLASH_ProgramByte(uint32_t Address, uint8_t Data)
 491                     ; 182 {
 492                     	switch	.text
 493  00dd               _FLASH_ProgramByte:
 495       00000000      OFST:	set	0
 498                     ; 184   assert_param(IS_FLASH_ADDRESS_OK(Address));
 500  00dd 96            	ldw	x,sp
 501  00de 1c0003        	addw	x,#OFST+3
 502  00e1 cd0000        	call	c_ltor
 504  00e4 ae0000        	ldw	x,#L45
 505  00e7 cd0000        	call	c_lcmp
 507  00ea 250f          	jrult	L67
 508  00ec 96            	ldw	x,sp
 509  00ed 1c0003        	addw	x,#OFST+3
 510  00f0 cd0000        	call	c_ltor
 512  00f3 ae0004        	ldw	x,#L65
 513  00f6 cd0000        	call	c_lcmp
 515  00f9 252c          	jrult	L001
 516  00fb               L67:
 517  00fb 96            	ldw	x,sp
 518  00fc 1c0003        	addw	x,#OFST+3
 519  00ff cd0000        	call	c_ltor
 521  0102 ae0008        	ldw	x,#L06
 522  0105 cd0000        	call	c_lcmp
 524  0108 250f          	jrult	L27
 525  010a 96            	ldw	x,sp
 526  010b 1c0003        	addw	x,#OFST+3
 527  010e cd0000        	call	c_ltor
 529  0111 ae000c        	ldw	x,#L26
 530  0114 cd0000        	call	c_lcmp
 532  0117 250e          	jrult	L001
 533  0119               L27:
 534  0119 ae00b8        	ldw	x,#184
 535  011c 89            	pushw	x
 536  011d 5f            	clrw	x
 537  011e 89            	pushw	x
 538  011f ae0010        	ldw	x,#L73
 539  0122 cd0000        	call	_assert_failed
 541  0125 5b04          	addw	sp,#4
 542  0127               L001:
 543                     ; 185   *(PointerAttr uint8_t*) (MemoryAddressCast)Address = Data;
 545  0127 1e05          	ldw	x,(OFST+5,sp)
 546  0129 7b07          	ld	a,(OFST+7,sp)
 547  012b f7            	ld	(x),a
 548                     ; 186 }
 551  012c 81            	ret	
 586                     ; 195 uint8_t FLASH_ReadByte(uint32_t Address)
 586                     ; 196 {
 587                     	switch	.text
 588  012d               _FLASH_ReadByte:
 590       00000000      OFST:	set	0
 593                     ; 198   assert_param(IS_FLASH_ADDRESS_OK(Address));
 595  012d 96            	ldw	x,sp
 596  012e 1c0003        	addw	x,#OFST+3
 597  0131 cd0000        	call	c_ltor
 599  0134 ae0000        	ldw	x,#L45
 600  0137 cd0000        	call	c_lcmp
 602  013a 250f          	jrult	L211
 603  013c 96            	ldw	x,sp
 604  013d 1c0003        	addw	x,#OFST+3
 605  0140 cd0000        	call	c_ltor
 607  0143 ae0004        	ldw	x,#L65
 608  0146 cd0000        	call	c_lcmp
 610  0149 252c          	jrult	L411
 611  014b               L211:
 612  014b 96            	ldw	x,sp
 613  014c 1c0003        	addw	x,#OFST+3
 614  014f cd0000        	call	c_ltor
 616  0152 ae0008        	ldw	x,#L06
 617  0155 cd0000        	call	c_lcmp
 619  0158 250f          	jrult	L601
 620  015a 96            	ldw	x,sp
 621  015b 1c0003        	addw	x,#OFST+3
 622  015e cd0000        	call	c_ltor
 624  0161 ae000c        	ldw	x,#L26
 625  0164 cd0000        	call	c_lcmp
 627  0167 250e          	jrult	L411
 628  0169               L601:
 629  0169 ae00c6        	ldw	x,#198
 630  016c 89            	pushw	x
 631  016d 5f            	clrw	x
 632  016e 89            	pushw	x
 633  016f ae0010        	ldw	x,#L73
 634  0172 cd0000        	call	_assert_failed
 636  0175 5b04          	addw	sp,#4
 637  0177               L411:
 638                     ; 201   return(*(PointerAttr uint8_t *) (MemoryAddressCast)Address); 
 640  0177 1e05          	ldw	x,(OFST+5,sp)
 641  0179 f6            	ld	a,(x)
 644  017a 81            	ret	
 688                     ; 212 void FLASH_ProgramWord(uint32_t Address, uint32_t Data)
 688                     ; 213 {
 689                     	switch	.text
 690  017b               _FLASH_ProgramWord:
 692       00000000      OFST:	set	0
 695                     ; 215   assert_param(IS_FLASH_ADDRESS_OK(Address));
 697  017b 96            	ldw	x,sp
 698  017c 1c0003        	addw	x,#OFST+3
 699  017f cd0000        	call	c_ltor
 701  0182 ae0000        	ldw	x,#L45
 702  0185 cd0000        	call	c_lcmp
 704  0188 250f          	jrult	L621
 705  018a 96            	ldw	x,sp
 706  018b 1c0003        	addw	x,#OFST+3
 707  018e cd0000        	call	c_ltor
 709  0191 ae0004        	ldw	x,#L65
 710  0194 cd0000        	call	c_lcmp
 712  0197 252c          	jrult	L031
 713  0199               L621:
 714  0199 96            	ldw	x,sp
 715  019a 1c0003        	addw	x,#OFST+3
 716  019d cd0000        	call	c_ltor
 718  01a0 ae0008        	ldw	x,#L06
 719  01a3 cd0000        	call	c_lcmp
 721  01a6 250f          	jrult	L221
 722  01a8 96            	ldw	x,sp
 723  01a9 1c0003        	addw	x,#OFST+3
 724  01ac cd0000        	call	c_ltor
 726  01af ae000c        	ldw	x,#L26
 727  01b2 cd0000        	call	c_lcmp
 729  01b5 250e          	jrult	L031
 730  01b7               L221:
 731  01b7 ae00d7        	ldw	x,#215
 732  01ba 89            	pushw	x
 733  01bb 5f            	clrw	x
 734  01bc 89            	pushw	x
 735  01bd ae0010        	ldw	x,#L73
 736  01c0 cd0000        	call	_assert_failed
 738  01c3 5b04          	addw	sp,#4
 739  01c5               L031:
 740                     ; 218   FLASH->CR2 |= FLASH_CR2_WPRG;
 742  01c5 721c505b      	bset	20571,#6
 743                     ; 219   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NWPRG);
 745  01c9 721d505c      	bres	20572,#6
 746                     ; 222   *((PointerAttr uint8_t*)(MemoryAddressCast)Address)       = *((uint8_t*)(&Data));
 748  01cd 1e05          	ldw	x,(OFST+5,sp)
 749  01cf 7b07          	ld	a,(OFST+7,sp)
 750  01d1 f7            	ld	(x),a
 751                     ; 224   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 1) = *((uint8_t*)(&Data)+1); 
 753  01d2 7b08          	ld	a,(OFST+8,sp)
 754  01d4 e701          	ld	(1,x),a
 755                     ; 226   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 2) = *((uint8_t*)(&Data)+2); 
 757  01d6 7b09          	ld	a,(OFST+9,sp)
 758  01d8 e702          	ld	(2,x),a
 759                     ; 228   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 3) = *((uint8_t*)(&Data)+3); 
 761  01da 7b0a          	ld	a,(OFST+10,sp)
 762  01dc e703          	ld	(3,x),a
 763                     ; 229 }
 766  01de 81            	ret	
 812                     ; 237 void FLASH_ProgramOptionByte(uint16_t Address, uint8_t Data)
 812                     ; 238 {
 813                     	switch	.text
 814  01df               _FLASH_ProgramOptionByte:
 816  01df 89            	pushw	x
 817       00000000      OFST:	set	0
 820                     ; 240   assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
 822  01e0 a34800        	cpw	x,#18432
 823  01e3 2505          	jrult	L631
 824  01e5 a34880        	cpw	x,#18560
 825  01e8 250e          	jrult	L041
 826  01ea               L631:
 827  01ea ae00f0        	ldw	x,#240
 828  01ed 89            	pushw	x
 829  01ee 5f            	clrw	x
 830  01ef 89            	pushw	x
 831  01f0 ae0010        	ldw	x,#L73
 832  01f3 cd0000        	call	_assert_failed
 834  01f6 5b04          	addw	sp,#4
 835  01f8               L041:
 836                     ; 243   FLASH->CR2 |= FLASH_CR2_OPT;
 838  01f8 721e505b      	bset	20571,#7
 839                     ; 244   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
 841  01fc 721f505c      	bres	20572,#7
 842                     ; 247   if(Address == 0x4800)
 844  0200 1e01          	ldw	x,(OFST+1,sp)
 845  0202 a34800        	cpw	x,#18432
 846  0205 2605          	jrne	L742
 847                     ; 250     *((NEAR uint8_t*)Address) = Data;
 849  0207 7b05          	ld	a,(OFST+5,sp)
 850  0209 f7            	ld	(x),a
 852  020a 2006          	jra	L152
 853  020c               L742:
 854                     ; 255     *((NEAR uint8_t*)Address) = Data;
 856  020c 7b05          	ld	a,(OFST+5,sp)
 857  020e f7            	ld	(x),a
 858                     ; 256     *((NEAR uint8_t*)((uint16_t)(Address + 1))) = (uint8_t)(~Data);
 860  020f 43            	cpl	a
 861  0210 e701          	ld	(1,x),a
 862  0212               L152:
 863                     ; 258   FLASH_WaitForLastOperation(FLASH_MEMTYPE_PROG);
 865  0212 a6fd          	ld	a,#253
 866  0214 cd0368        	call	_FLASH_WaitForLastOperation
 868                     ; 261   FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 870  0217 721f505b      	bres	20571,#7
 871                     ; 262   FLASH->NCR2 |= FLASH_NCR2_NOPT;
 873  021b 721e505c      	bset	20572,#7
 874                     ; 263 }
 877  021f 85            	popw	x
 878  0220 81            	ret	
 915                     ; 270 void FLASH_EraseOptionByte(uint16_t Address)
 915                     ; 271 {
 916                     	switch	.text
 917  0221               _FLASH_EraseOptionByte:
 919  0221 89            	pushw	x
 920       00000000      OFST:	set	0
 923                     ; 273   assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
 925  0222 a34800        	cpw	x,#18432
 926  0225 2505          	jrult	L051
 927  0227 a34880        	cpw	x,#18560
 928  022a 250e          	jrult	L251
 929  022c               L051:
 930  022c ae0111        	ldw	x,#273
 931  022f 89            	pushw	x
 932  0230 5f            	clrw	x
 933  0231 89            	pushw	x
 934  0232 ae0010        	ldw	x,#L73
 935  0235 cd0000        	call	_assert_failed
 937  0238 5b04          	addw	sp,#4
 938  023a               L251:
 939                     ; 276   FLASH->CR2 |= FLASH_CR2_OPT;
 941  023a 721e505b      	bset	20571,#7
 942                     ; 277   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
 944  023e 721f505c      	bres	20572,#7
 945                     ; 280   if(Address == 0x4800)
 947  0242 1e01          	ldw	x,(OFST+1,sp)
 948  0244 a34800        	cpw	x,#18432
 949  0247 2603          	jrne	L172
 950                     ; 283     *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
 952  0249 7f            	clr	(x)
 954  024a 2005          	jra	L372
 955  024c               L172:
 956                     ; 288     *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
 958  024c 7f            	clr	(x)
 959                     ; 289     *((NEAR uint8_t*)((uint16_t)(Address + (uint16_t)1 ))) = FLASH_SET_BYTE;
 961  024d a6ff          	ld	a,#255
 962  024f e701          	ld	(1,x),a
 963  0251               L372:
 964                     ; 291   FLASH_WaitForLastOperation(FLASH_MEMTYPE_PROG);
 966  0251 a6fd          	ld	a,#253
 967  0253 cd0368        	call	_FLASH_WaitForLastOperation
 969                     ; 294   FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 971  0256 721f505b      	bres	20571,#7
 972                     ; 295   FLASH->NCR2 |= FLASH_NCR2_NOPT;
 974  025a 721e505c      	bset	20572,#7
 975                     ; 296 }
 978  025e 85            	popw	x
 979  025f 81            	ret	
1043                     ; 303 uint16_t FLASH_ReadOptionByte(uint16_t Address)
1043                     ; 304 {
1044                     	switch	.text
1045  0260               _FLASH_ReadOptionByte:
1047  0260 89            	pushw	x
1048  0261 5204          	subw	sp,#4
1049       00000004      OFST:	set	4
1052                     ; 305   uint8_t value_optbyte, value_optbyte_complement = 0;
1054                     ; 306   uint16_t res_value = 0;
1056                     ; 309   assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
1058  0263 a34800        	cpw	x,#18432
1059  0266 2505          	jrult	L261
1060  0268 a34880        	cpw	x,#18560
1061  026b 250e          	jrult	L461
1062  026d               L261:
1063  026d ae0135        	ldw	x,#309
1064  0270 89            	pushw	x
1065  0271 5f            	clrw	x
1066  0272 89            	pushw	x
1067  0273 ae0010        	ldw	x,#L73
1068  0276 cd0000        	call	_assert_failed
1070  0279 5b04          	addw	sp,#4
1071  027b               L461:
1072                     ; 311   value_optbyte = *((NEAR uint8_t*)Address); /* Read option byte */
1074  027b 1e05          	ldw	x,(OFST+1,sp)
1075  027d f6            	ld	a,(x)
1076  027e 6b01          	ld	(OFST-3,sp),a
1078                     ; 312   value_optbyte_complement = *(((NEAR uint8_t*)Address) + 1); /* Read option byte complement */
1080  0280 e601          	ld	a,(1,x)
1081  0282 6b02          	ld	(OFST-2,sp),a
1083                     ; 315   if(Address == 0x4800)	 
1085  0284 a34800        	cpw	x,#18432
1086  0287 2606          	jrne	L723
1087                     ; 317     res_value =	 value_optbyte;
1089  0289 7b01          	ld	a,(OFST-3,sp)
1090  028b 5f            	clrw	x
1091  028c 97            	ld	xl,a
1094  028d 201c          	jra	L133
1095  028f               L723:
1096                     ; 321     if(value_optbyte == (uint8_t)(~value_optbyte_complement))
1098  028f 43            	cpl	a
1099  0290 1101          	cp	a,(OFST-3,sp)
1100  0292 2614          	jrne	L333
1101                     ; 323       res_value = (uint16_t)((uint16_t)value_optbyte << 8);
1103  0294 7b01          	ld	a,(OFST-3,sp)
1104  0296 97            	ld	xl,a
1105  0297 4f            	clr	a
1106  0298 02            	rlwa	x,a
1107  0299 1f03          	ldw	(OFST-1,sp),x
1109                     ; 324       res_value = res_value | (uint16_t)value_optbyte_complement;
1111  029b 5f            	clrw	x
1112  029c 7b02          	ld	a,(OFST-2,sp)
1113  029e 97            	ld	xl,a
1114  029f 01            	rrwa	x,a
1115  02a0 1a04          	or	a,(OFST+0,sp)
1116  02a2 01            	rrwa	x,a
1117  02a3 1a03          	or	a,(OFST-1,sp)
1118  02a5 01            	rrwa	x,a
1121  02a6 2003          	jra	L133
1122  02a8               L333:
1123                     ; 328       res_value = FLASH_OPTIONBYTE_ERROR;
1125  02a8 ae5555        	ldw	x,#21845
1127  02ab               L133:
1128                     ; 331   return(res_value);
1132  02ab 5b06          	addw	sp,#6
1133  02ad 81            	ret	
1208                     ; 340 void FLASH_SetLowPowerMode(FLASH_LPMode_TypeDef FLASH_LPMode)
1208                     ; 341 {
1209                     	switch	.text
1210  02ae               _FLASH_SetLowPowerMode:
1212  02ae 88            	push	a
1213       00000000      OFST:	set	0
1216                     ; 343   assert_param(IS_FLASH_LOW_POWER_MODE_OK(FLASH_LPMode));
1218  02af a104          	cp	a,#4
1219  02b1 2719          	jreq	L671
1220  02b3 a108          	cp	a,#8
1221  02b5 2715          	jreq	L671
1222  02b7 4d            	tnz	a
1223  02b8 2712          	jreq	L671
1224  02ba a10c          	cp	a,#12
1225  02bc 270e          	jreq	L671
1226  02be ae0157        	ldw	x,#343
1227  02c1 89            	pushw	x
1228  02c2 5f            	clrw	x
1229  02c3 89            	pushw	x
1230  02c4 ae0010        	ldw	x,#L73
1231  02c7 cd0000        	call	_assert_failed
1233  02ca 5b04          	addw	sp,#4
1234  02cc               L671:
1235                     ; 346   FLASH->CR1 &= (uint8_t)(~(FLASH_CR1_HALT | FLASH_CR1_AHALT)); 
1237  02cc c6505a        	ld	a,20570
1238  02cf a4f3          	and	a,#243
1239  02d1 c7505a        	ld	20570,a
1240                     ; 349   FLASH->CR1 |= (uint8_t)FLASH_LPMode; 
1242  02d4 c6505a        	ld	a,20570
1243  02d7 1a01          	or	a,(OFST+1,sp)
1244  02d9 c7505a        	ld	20570,a
1245                     ; 350 }
1248  02dc 84            	pop	a
1249  02dd 81            	ret	
1308                     ; 358 void FLASH_SetProgrammingTime(FLASH_ProgramTime_TypeDef FLASH_ProgTime)
1308                     ; 359 {
1309                     	switch	.text
1310  02de               _FLASH_SetProgrammingTime:
1312  02de 88            	push	a
1313       00000000      OFST:	set	0
1316                     ; 361   assert_param(IS_FLASH_PROGRAM_TIME_OK(FLASH_ProgTime));
1318  02df 4d            	tnz	a
1319  02e0 2711          	jreq	L012
1320  02e2 4a            	dec	a
1321  02e3 270e          	jreq	L012
1322  02e5 ae0169        	ldw	x,#361
1323  02e8 89            	pushw	x
1324  02e9 5f            	clrw	x
1325  02ea 89            	pushw	x
1326  02eb ae0010        	ldw	x,#L73
1327  02ee cd0000        	call	_assert_failed
1329  02f1 5b04          	addw	sp,#4
1330  02f3               L012:
1331                     ; 363   FLASH->CR1 &= (uint8_t)(~FLASH_CR1_FIX);
1333  02f3 7211505a      	bres	20570,#0
1334                     ; 364   FLASH->CR1 |= (uint8_t)FLASH_ProgTime;
1336  02f7 c6505a        	ld	a,20570
1337  02fa 1a01          	or	a,(OFST+1,sp)
1338  02fc c7505a        	ld	20570,a
1339                     ; 365 }
1342  02ff 84            	pop	a
1343  0300 81            	ret	
1368                     ; 372 FLASH_LPMode_TypeDef FLASH_GetLowPowerMode(void)
1368                     ; 373 {
1369                     	switch	.text
1370  0301               _FLASH_GetLowPowerMode:
1374                     ; 374   return((FLASH_LPMode_TypeDef)(FLASH->CR1 & (uint8_t)(FLASH_CR1_HALT | FLASH_CR1_AHALT)));
1376  0301 c6505a        	ld	a,20570
1377  0304 a40c          	and	a,#12
1380  0306 81            	ret	
1405                     ; 382 FLASH_ProgramTime_TypeDef FLASH_GetProgrammingTime(void)
1405                     ; 383 {
1406                     	switch	.text
1407  0307               _FLASH_GetProgrammingTime:
1411                     ; 384   return((FLASH_ProgramTime_TypeDef)(FLASH->CR1 & FLASH_CR1_FIX));
1413  0307 c6505a        	ld	a,20570
1414  030a a401          	and	a,#1
1417  030c 81            	ret	
1451                     ; 392 uint32_t FLASH_GetBootSize(void)
1451                     ; 393 {
1452                     	switch	.text
1453  030d               _FLASH_GetBootSize:
1455  030d 5204          	subw	sp,#4
1456       00000004      OFST:	set	4
1459                     ; 394   uint32_t temp = 0;
1461                     ; 397   temp = (uint32_t)((uint32_t)FLASH->FPR * (uint32_t)512);
1463  030f c6505d        	ld	a,20573
1464  0312 5f            	clrw	x
1465  0313 97            	ld	xl,a
1466  0314 90ae0200      	ldw	y,#512
1467  0318 cd0000        	call	c_umul
1469  031b 96            	ldw	x,sp
1470  031c 5c            	incw	x
1471  031d cd0000        	call	c_rtol
1474                     ; 400   if(FLASH->FPR == 0xFF)
1476  0320 c6505d        	ld	a,20573
1477  0323 4c            	inc	a
1478  0324 260d          	jrne	L554
1479                     ; 402     temp += 512;
1481  0326 ae0200        	ldw	x,#512
1482  0329 bf02          	ldw	c_lreg+2,x
1483  032b 5f            	clrw	x
1484  032c bf00          	ldw	c_lreg,x
1485  032e 96            	ldw	x,sp
1486  032f 5c            	incw	x
1487  0330 cd0000        	call	c_lgadd
1490  0333               L554:
1491                     ; 406   return(temp);
1493  0333 96            	ldw	x,sp
1494  0334 5c            	incw	x
1495  0335 cd0000        	call	c_ltor
1499  0338 5b04          	addw	sp,#4
1500  033a 81            	ret	
1603                     ; 417 FlagStatus FLASH_GetFlagStatus(FLASH_Flag_TypeDef FLASH_FLAG)
1603                     ; 418 {
1604                     	switch	.text
1605  033b               _FLASH_GetFlagStatus:
1607  033b 88            	push	a
1608  033c 88            	push	a
1609       00000001      OFST:	set	1
1612                     ; 419   FlagStatus status = RESET;
1614                     ; 421   assert_param(IS_FLASH_FLAGS_OK(FLASH_FLAG));
1616  033d a108          	cp	a,#8
1617  033f 2719          	jreq	L032
1618  0341 a104          	cp	a,#4
1619  0343 2715          	jreq	L032
1620  0345 a102          	cp	a,#2
1621  0347 2711          	jreq	L032
1622  0349 4a            	dec	a
1623  034a 270e          	jreq	L032
1624  034c ae01a5        	ldw	x,#421
1625  034f 89            	pushw	x
1626  0350 5f            	clrw	x
1627  0351 89            	pushw	x
1628  0352 ae0010        	ldw	x,#L73
1629  0355 cd0000        	call	_assert_failed
1631  0358 5b04          	addw	sp,#4
1632  035a               L032:
1633                     ; 424   if((FLASH->IAPSR & (uint8_t)FLASH_FLAG) != (uint8_t)RESET)
1635  035a c6505f        	ld	a,20575
1636  035d 1502          	bcp	a,(OFST+1,sp)
1637  035f 2704          	jreq	L525
1638                     ; 426     status = SET; /* FLASH_FLAG is set */
1640  0361 a601          	ld	a,#1
1643  0363 2001          	jra	L725
1644  0365               L525:
1645                     ; 430     status = RESET; /* FLASH_FLAG is reset*/
1647  0365 4f            	clr	a
1649  0366               L725:
1650                     ; 434   return status;
1654  0366 85            	popw	x
1655  0367 81            	ret	
1740                     ; 549 IN_RAM(FLASH_Status_TypeDef FLASH_WaitForLastOperation(FLASH_MemType_TypeDef FLASH_MemType)) 
1740                     ; 550 {
1741                     	switch	.text
1742  0368               _FLASH_WaitForLastOperation:
1744  0368 5203          	subw	sp,#3
1745       00000003      OFST:	set	3
1748                     ; 551   uint8_t flagstatus = 0x00;
1750  036a 0f03          	clr	(OFST+0,sp)
1752                     ; 552   uint16_t timeout = OPERATION_TIMEOUT;
1754  036c aeffff        	ldw	x,#65535
1755                     ; 576   UNUSED(FLASH_MemType);
1758  036f 2008          	jra	L375
1759  0371               L175:
1760                     ; 579     flagstatus = (uint8_t)(FLASH->IAPSR & (FLASH_IAPSR_EOP | FLASH_IAPSR_WR_PG_DIS));
1762  0371 c6505f        	ld	a,20575
1763  0374 a405          	and	a,#5
1764  0376 6b03          	ld	(OFST+0,sp),a
1766                     ; 580     timeout--;
1768  0378 5a            	decw	x
1769  0379               L375:
1770  0379 1f01          	ldw	(OFST-2,sp),x
1772                     ; 577   while((flagstatus == 0x00) && (timeout != 0x00))
1774  037b 7b03          	ld	a,(OFST+0,sp)
1775  037d 2603          	jrne	L775
1777  037f 5d            	tnzw	x
1778  0380 26ef          	jrne	L175
1779  0382               L775:
1780                     ; 584   if(timeout == 0x00 )
1782  0382 1e01          	ldw	x,(OFST-2,sp)
1783  0384 2602          	jrne	L106
1784                     ; 586     flagstatus = FLASH_STATUS_TIMEOUT;
1786  0386 a602          	ld	a,#2
1788  0388               L106:
1789                     ; 589   return((FLASH_Status_TypeDef)flagstatus);
1793  0388 5b03          	addw	sp,#3
1794  038a 81            	ret	
1858                     ; 599 IN_RAM(void FLASH_EraseBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType))
1858                     ; 600 {
1859                     	switch	.text
1860  038b               _FLASH_EraseBlock:
1862  038b 89            	pushw	x
1863  038c 5206          	subw	sp,#6
1864       00000006      OFST:	set	6
1867                     ; 601   uint32_t startaddress = 0;
1869                     ; 611   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
1871  038e 7b0b          	ld	a,(OFST+5,sp)
1872  0390 a1fd          	cp	a,#253
1873  0392 270b          	jreq	L442
1874  0394 a1f7          	cp	a,#247
1875  0396 2707          	jreq	L442
1876  0398 ae0263        	ldw	x,#611
1877  039b ad50          	call	LC001
1878  039d 7b0b          	ld	a,(OFST+5,sp)
1879  039f               L442:
1880                     ; 612   if(FLASH_MemType == FLASH_MEMTYPE_PROG)
1882  039f a1fd          	cp	a,#253
1883  03a1 2611          	jrne	L536
1884                     ; 614     assert_param(IS_FLASH_PROG_BLOCK_NUMBER_OK(BlockNum));
1886  03a3 1e07          	ldw	x,(OFST+1,sp)
1887  03a5 a30080        	cpw	x,#128
1888  03a8 2505          	jrult	L252
1889  03aa ae0266        	ldw	x,#614
1890  03ad ad3e          	call	LC001
1891  03af               L252:
1892                     ; 615     startaddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
1894  03af ae8000        	ldw	x,#32768
1896  03b2 200f          	jra	L736
1897  03b4               L536:
1898                     ; 619     assert_param(IS_FLASH_DATA_BLOCK_NUMBER_OK(BlockNum));
1900  03b4 1e07          	ldw	x,(OFST+1,sp)
1901  03b6 a3000a        	cpw	x,#10
1902  03b9 2505          	jrult	L062
1903  03bb ae026b        	ldw	x,#619
1904  03be ad2d          	call	LC001
1905  03c0               L062:
1906                     ; 620     startaddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
1908  03c0 ae4000        	ldw	x,#16384
1909  03c3               L736:
1910  03c3 1f05          	ldw	(OFST-1,sp),x
1911  03c5 5f            	clrw	x
1912  03c6 1f03          	ldw	(OFST-3,sp),x
1914                     ; 628     pwFlash = (PointerAttr uint32_t *)(MemoryAddressCast)(startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE));
1916  03c8 a640          	ld	a,#64
1917  03ca 1e07          	ldw	x,(OFST+1,sp)
1918  03cc cd0000        	call	c_cmulx
1920  03cf 96            	ldw	x,sp
1921  03d0 1c0003        	addw	x,#OFST-3
1922  03d3 cd0000        	call	c_ladd
1924  03d6 be02          	ldw	x,c_lreg+2
1925  03d8 1f01          	ldw	(OFST-5,sp),x
1927                     ; 632   FLASH->CR2 |= FLASH_CR2_ERASE;
1929  03da 721a505b      	bset	20571,#5
1930                     ; 633   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NERASE);
1932  03de 721b505c      	bres	20572,#5
1933                     ; 637     *pwFlash = (uint32_t)0;
1935  03e2 4f            	clr	a
1936  03e3 e703          	ld	(3,x),a
1937  03e5 e702          	ld	(2,x),a
1938  03e7 e701          	ld	(1,x),a
1939  03e9 f7            	ld	(x),a
1940                     ; 645 }
1943  03ea 5b08          	addw	sp,#8
1944  03ec 81            	ret	
1945  03ed               LC001:
1946  03ed 89            	pushw	x
1947  03ee 5f            	clrw	x
1948  03ef 89            	pushw	x
1949  03f0 ae0010        	ldw	x,#L73
1950  03f3 cd0000        	call	_assert_failed
1952  03f6 5b04          	addw	sp,#4
1953  03f8 81            	ret	
2058                     ; 656 IN_RAM(void FLASH_ProgramBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType, 
2058                     ; 657                         FLASH_ProgramMode_TypeDef FLASH_ProgMode, uint8_t *Buffer))
2058                     ; 658 {
2059                     	switch	.text
2060  03f9               _FLASH_ProgramBlock:
2062  03f9 89            	pushw	x
2063  03fa 5206          	subw	sp,#6
2064       00000006      OFST:	set	6
2067                     ; 659   uint16_t Count = 0;
2069                     ; 660   uint32_t startaddress = 0;
2071                     ; 663   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
2073  03fc 7b0b          	ld	a,(OFST+5,sp)
2074  03fe a1fd          	cp	a,#253
2075  0400 2709          	jreq	L272
2076  0402 a1f7          	cp	a,#247
2077  0404 2705          	jreq	L272
2078  0406 ae0297        	ldw	x,#663
2079  0409 ad76          	call	LC002
2080  040b               L272:
2081                     ; 664   assert_param(IS_FLASH_PROGRAM_MODE_OK(FLASH_ProgMode));
2083  040b 7b0c          	ld	a,(OFST+6,sp)
2084  040d 2709          	jreq	L203
2085  040f a110          	cp	a,#16
2086  0411 2705          	jreq	L203
2087  0413 ae0298        	ldw	x,#664
2088  0416 ad69          	call	LC002
2089  0418               L203:
2090                     ; 665   if(FLASH_MemType == FLASH_MEMTYPE_PROG)
2092  0418 7b0b          	ld	a,(OFST+5,sp)
2093  041a a1fd          	cp	a,#253
2094  041c 2611          	jrne	L317
2095                     ; 667     assert_param(IS_FLASH_PROG_BLOCK_NUMBER_OK(BlockNum));
2097  041e 1e07          	ldw	x,(OFST+1,sp)
2098  0420 a30080        	cpw	x,#128
2099  0423 2505          	jrult	L013
2100  0425 ae029b        	ldw	x,#667
2101  0428 ad57          	call	LC002
2102  042a               L013:
2103                     ; 668     startaddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
2105  042a ae8000        	ldw	x,#32768
2107  042d 200f          	jra	L517
2108  042f               L317:
2109                     ; 672     assert_param(IS_FLASH_DATA_BLOCK_NUMBER_OK(BlockNum));
2111  042f 1e07          	ldw	x,(OFST+1,sp)
2112  0431 a3000a        	cpw	x,#10
2113  0434 2505          	jrult	L613
2114  0436 ae02a0        	ldw	x,#672
2115  0439 ad46          	call	LC002
2116  043b               L613:
2117                     ; 673     startaddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
2119  043b ae4000        	ldw	x,#16384
2120  043e               L517:
2121  043e 1f03          	ldw	(OFST-3,sp),x
2122  0440 5f            	clrw	x
2123  0441 1f01          	ldw	(OFST-5,sp),x
2125                     ; 677   startaddress = startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE);
2127  0443 a640          	ld	a,#64
2128  0445 1e07          	ldw	x,(OFST+1,sp)
2129  0447 cd0000        	call	c_cmulx
2131  044a 96            	ldw	x,sp
2132  044b 5c            	incw	x
2133  044c cd0000        	call	c_lgadd
2136                     ; 680   if(FLASH_ProgMode == FLASH_PROGRAMMODE_STANDARD)
2138  044f 7b0c          	ld	a,(OFST+6,sp)
2139  0451 260a          	jrne	L717
2140                     ; 683     FLASH->CR2 |= FLASH_CR2_PRG;
2142  0453 7210505b      	bset	20571,#0
2143                     ; 684     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NPRG);
2145  0457 7211505c      	bres	20572,#0
2147  045b 2008          	jra	L127
2148  045d               L717:
2149                     ; 689     FLASH->CR2 |= FLASH_CR2_FPRG;
2151  045d 7218505b      	bset	20571,#4
2152                     ; 690     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NFPRG);
2154  0461 7219505c      	bres	20572,#4
2155  0465               L127:
2156                     ; 694   for(Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
2158  0465 5f            	clrw	x
2159  0466 1f05          	ldw	(OFST-1,sp),x
2161  0468               L327:
2162                     ; 696     *((PointerAttr uint8_t*) (MemoryAddressCast)startaddress + Count) = ((uint8_t)(Buffer[Count]));
2164  0468 1e0d          	ldw	x,(OFST+7,sp)
2165  046a 72fb05        	addw	x,(OFST-1,sp)
2166  046d f6            	ld	a,(x)
2167  046e 1e03          	ldw	x,(OFST-3,sp)
2168  0470 72fb05        	addw	x,(OFST-1,sp)
2169  0473 f7            	ld	(x),a
2170                     ; 694   for(Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
2172  0474 1e05          	ldw	x,(OFST-1,sp)
2173  0476 5c            	incw	x
2174  0477 1f05          	ldw	(OFST-1,sp),x
2178  0479 a30040        	cpw	x,#64
2179  047c 25ea          	jrult	L327
2180                     ; 698 }
2183  047e 5b08          	addw	sp,#8
2184  0480 81            	ret	
2185  0481               LC002:
2186  0481 89            	pushw	x
2187  0482 5f            	clrw	x
2188  0483 89            	pushw	x
2189  0484 ae0010        	ldw	x,#L73
2190  0487 cd0000        	call	_assert_failed
2192  048a 5b04          	addw	sp,#4
2193  048c 81            	ret	
2206                     	xdef	_FLASH_WaitForLastOperation
2207                     	xdef	_FLASH_ProgramBlock
2208                     	xdef	_FLASH_EraseBlock
2209                     	xdef	_FLASH_GetFlagStatus
2210                     	xdef	_FLASH_GetBootSize
2211                     	xdef	_FLASH_GetProgrammingTime
2212                     	xdef	_FLASH_GetLowPowerMode
2213                     	xdef	_FLASH_SetProgrammingTime
2214                     	xdef	_FLASH_SetLowPowerMode
2215                     	xdef	_FLASH_EraseOptionByte
2216                     	xdef	_FLASH_ProgramOptionByte
2217                     	xdef	_FLASH_ReadOptionByte
2218                     	xdef	_FLASH_ProgramWord
2219                     	xdef	_FLASH_ReadByte
2220                     	xdef	_FLASH_ProgramByte
2221                     	xdef	_FLASH_EraseByte
2222                     	xdef	_FLASH_ITConfig
2223                     	xdef	_FLASH_DeInit
2224                     	xdef	_FLASH_Lock
2225                     	xdef	_FLASH_Unlock
2226                     	xref	_assert_failed
2227                     	switch	.const
2228  0010               L73:
2229  0010 2e2e5c2e2e5c  	dc.b	"..\..\stm8s_spl\li"
2230  0022 627261726965  	dc.b	"braries\stm8s_stdp"
2231  0034 65726970685f  	dc.b	"eriph_driver\src\s"
2232  0046 746d38735f66  	dc.b	"tm8s_flash.c",0
2233                     	xref.b	c_lreg
2234                     	xref.b	c_x
2235                     	xref.b	c_y
2255                     	xref	c_ladd
2256                     	xref	c_cmulx
2257                     	xref	c_lgadd
2258                     	xref	c_rtol
2259                     	xref	c_umul
2260                     	xref	c_lcmp
2261                     	xref	c_ltor
2262                     	end
