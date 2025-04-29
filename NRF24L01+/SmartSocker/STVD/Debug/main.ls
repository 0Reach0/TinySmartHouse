   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.3 - 22 Aug 2024
   4                     ; Optimizer V4.6.3 - 22 Aug 2024
  48                     ; 4 void SetUp_GPIO(void)
  48                     ; 5 {
  50                     	switch	.text
  51  0000               _SetUp_GPIO:
  55                     ; 6 		GPIO_Init(OUTPUT_PIN, GPIO_MODE_OUT_PP_HIGH_FAST);
  57  0000 4bf0          	push	#240
  58  0002 4b08          	push	#8
  59  0004 ae5000        	ldw	x,#20480
  60  0007 cd0000        	call	_GPIO_Init
  62  000a 85            	popw	x
  63                     ; 7 }
  66  000b 81            	ret	
  69                     .const:	section	.text
  70  0000               L12_rxaddr:
  71  0000 02            	dc.b	2
  72  0001 02            	dc.b	2
  73  0002 02            	dc.b	2
  74  0003 02            	dc.b	2
  75  0004 02            	dc.b	2
 124                     ; 9 void Init_NRF(void)
 124                     ; 10 {
 125                     	switch	.text
 126  000c               _Init_NRF:
 128  000c 5206          	subw	sp,#6
 129       00000006      OFST:	set	6
 132                     ; 11 		uint8_t rxaddr[5] = {SOCKET_ADDRESS, SOCKET_ADDRESS, SOCKET_ADDRESS, SOCKET_ADDRESS, SOCKET_ADDRESS};
 134  000e 96            	ldw	x,sp
 135  000f 5c            	incw	x
 136  0010 90ae0000      	ldw	y,#L12_rxaddr
 137  0014 a605          	ld	a,#5
 138  0016 cd0000        	call	c_xymov
 140                     ; 13 		SPI_Init_NRF();
 142  0019 cd0000        	call	_SPI_Init_NRF
 144                     ; 14 		delay(10);
 146  001c ae000a        	ldw	x,#10
 147  001f cd0000        	call	_delay
 149                     ; 15     rx_init();
 151  0022 cd0000        	call	_rx_init
 153                     ; 16 		SET_PPE0_ADDR(rxaddr, 5);
 155  0025 4b05          	push	#5
 156  0027 96            	ldw	x,sp
 157  0028 1c0002        	addw	x,#OFST-4
 158  002b 89            	pushw	x
 159  002c a60a          	ld	a,#10
 160  002e cd0000        	call	_write_registerN
 162  0031 5b03          	addw	sp,#3
 163                     ; 17 		delay(10);
 165  0033 ae000a        	ldw	x,#10
 166  0036 cd0000        	call	_delay
 168                     ; 18 		SET_PPE0_SIZE(SOCKET_PIPE_SIZE);
 170  0039 ae1103        	ldw	x,#4355
 171  003c cd0000        	call	_write_register
 173                     ; 19 		delay(10);
 175  003f ae000a        	ldw	x,#10
 176  0042 cd0000        	call	_delay
 178                     ; 20 		status = test_rx();
 180  0045 cd0000        	call	_test_rx
 182  0048 6b06          	ld	(OFST+0,sp),a
 184                     ; 21 		if(status!= 0)
 186  004a 270b          	jreq	L54
 187                     ; 23 			GPIO_WriteLow(GPIOB, GPIO_PIN_5);
 189  004c 4b20          	push	#32
 190  004e ae5005        	ldw	x,#20485
 191  0051 cd0000        	call	_GPIO_WriteLow
 193  0054 84            	pop	a
 194  0055               L74:
 195                     ; 24 			while(1);
 197  0055 20fe          	jra	L74
 198  0057               L54:
 199                     ; 26 }
 202  0057 5b06          	addw	sp,#6
 203  0059 81            	ret	
 240                     ; 28 void process_data(uint8_t * data, uint8_t size)
 240                     ; 29 {
 241                     	switch	.text
 242  005a               _process_data:
 244  005a 89            	pushw	x
 245       00000000      OFST:	set	0
 248                     ; 30 	if(data[0]== CMD_SOCKET_ON)
 250  005b f6            	ld	a,(x)
 251  005c a150          	cp	a,#80
 252  005e 260a          	jrne	L17
 253                     ; 32 		GPIO_WriteLow(OUTPUT_PIN);		
 255  0060 4b08          	push	#8
 256  0062 ae5000        	ldw	x,#20480
 257  0065 cd0000        	call	_GPIO_WriteLow
 260  0068 200c          	jp	LC001
 261  006a               L17:
 262                     ; 34 	else if(data[0]== CMD_SOCKET_OFF)
 264  006a a151          	cp	a,#81
 265  006c 2609          	jrne	L37
 266                     ; 36 		GPIO_WriteHigh(OUTPUT_PIN);		
 268  006e 4b08          	push	#8
 269  0070 ae5000        	ldw	x,#20480
 270  0073 cd0000        	call	_GPIO_WriteHigh
 272  0076               LC001:
 273  0076 84            	pop	a
 274  0077               L37:
 275                     ; 39 }
 278  0077 85            	popw	x
 279  0078 81            	ret	
 333                     ; 43 void main(void)
 333                     ; 44 {
 334                     	switch	.text
 335  0079               _main:
 337  0079 5204          	subw	sp,#4
 338       00000004      OFST:	set	4
 341                     ; 47 	SetUp_GPIO();
 343  007b ad83          	call	_SetUp_GPIO
 345                     ; 48 	Init_NRF();
 347  007d ad8d          	call	_Init_NRF
 349  007f               L121:
 350                     ; 51         reg = read_register(STATUS_REGISTER);
 352  007f a607          	ld	a,#7
 353  0081 cd0000        	call	_read_register
 355  0084 6b01          	ld	(OFST-3,sp),a
 357                     ; 52 				delay(10);
 359  0086 ae000a        	ldw	x,#10
 360  0089 cd0000        	call	_delay
 362                     ; 53         if (reg & (1 << 6))
 364  008c 7b01          	ld	a,(OFST-3,sp)
 365  008e a540          	bcp	a,#64
 366  0090 27ed          	jreq	L121
 367                     ; 55 						GPIO_WriteLow(GPIOB, GPIO_PIN_5);
 369  0092 4b20          	push	#32
 370  0094 ae5005        	ldw	x,#20485
 371  0097 cd0000        	call	_GPIO_WriteLow
 373  009a 84            	pop	a
 374                     ; 56             rx_read(buf, 3);
 376  009b 4b03          	push	#3
 377  009d 96            	ldw	x,sp
 378  009e 1c0003        	addw	x,#OFST-1
 379  00a1 cd0000        	call	_rx_read
 381  00a4 84            	pop	a
 382                     ; 57 						process_data(buf, 3);
 384  00a5 4b03          	push	#3
 385  00a7 96            	ldw	x,sp
 386  00a8 1c0003        	addw	x,#OFST-1
 387  00ab adad          	call	_process_data
 389  00ad 84            	pop	a
 390                     ; 58             reset_status();
 392  00ae cd0000        	call	_reset_status
 394                     ; 59             delay(10);
 396  00b1 ae000a        	ldw	x,#10
 397  00b4 cd0000        	call	_delay
 399                     ; 60 						flush_rx();
 401  00b7 cd0000        	call	_flush_rx
 403                     ; 61 						GPIO_WriteHigh(GPIOB, GPIO_PIN_5);
 405  00ba 4b20          	push	#32
 406  00bc ae5005        	ldw	x,#20485
 407  00bf cd0000        	call	_GPIO_WriteHigh
 409  00c2 84            	pop	a
 410  00c3 20ba          	jra	L121
 445                     ; 69 void assert_failed(uint8_t* file, uint32_t line) {
 446                     	switch	.text
 447  00c5               _assert_failed:
 451  00c5               L541:
 452                     ; 70     while (1);
 454  00c5 20fe          	jra	L541
 467                     	xdef	_main
 468                     	xdef	_process_data
 469                     	xdef	_Init_NRF
 470                     	xdef	_SetUp_GPIO
 471                     	xref	_test_rx
 472                     	xref	_SPI_Init_NRF
 473                     	xref	_rx_read
 474                     	xref	_rx_init
 475                     	xref	_write_registerN
 476                     	xref	_write_register
 477                     	xref	_read_register
 478                     	xref	_reset_status
 479                     	xref	_flush_rx
 480                     	xref	_delay
 481                     	xref	_GPIO_WriteLow
 482                     	xref	_GPIO_WriteHigh
 483                     	xref	_GPIO_Init
 484                     	xdef	_assert_failed
 485                     	xref.b	c_x
 504                     	xref	c_xymov
 505                     	end
