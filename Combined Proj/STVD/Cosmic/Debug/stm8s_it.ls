   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
   4                     ; Optimizer V4.3.6 - 29 Nov 2011
  20                     	bsct
  21  0000               _lenUART:
  22  0000 00            	dc.b	0
  52                     ; 46 INTERRUPT_HANDLER(NonHandledInterrupt, 25)
  52                     ; 47 {
  53                     .text:	section	.text,new
  54  0000               f_NonHandledInterrupt:
  58                     ; 51 }
  61  0000 80            	iret	
  83                     ; 59 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
  83                     ; 60 {
  84                     .text:	section	.text,new
  85  0000               f_TRAP_IRQHandler:
  89                     ; 64 }
  92  0000 80            	iret	
 114                     ; 70 INTERRUPT_HANDLER(TLI_IRQHandler, 0)
 114                     ; 71 {
 115                     .text:	section	.text,new
 116  0000               f_TLI_IRQHandler:
 120                     ; 75 }
 123  0000 80            	iret	
 145                     ; 82 INTERRUPT_HANDLER(AWU_IRQHandler, 1)
 145                     ; 83 {
 146                     .text:	section	.text,new
 147  0000               f_AWU_IRQHandler:
 151                     ; 87 }
 154  0000 80            	iret	
 176                     ; 94 INTERRUPT_HANDLER(CLK_IRQHandler, 2)
 176                     ; 95 {
 177                     .text:	section	.text,new
 178  0000               f_CLK_IRQHandler:
 182                     ; 99 }
 185  0000 80            	iret	
 208                     ; 106 INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
 208                     ; 107 {
 209                     .text:	section	.text,new
 210  0000               f_EXTI_PORTA_IRQHandler:
 214                     ; 111 }
 217  0000 80            	iret	
 240                     ; 118 INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
 240                     ; 119 {
 241                     .text:	section	.text,new
 242  0000               f_EXTI_PORTB_IRQHandler:
 246                     ; 123 }
 249  0000 80            	iret	
 272                     ; 130 INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
 272                     ; 131 {
 273                     .text:	section	.text,new
 274  0000               f_EXTI_PORTC_IRQHandler:
 278                     ; 135 }
 281  0000 80            	iret	
 304                     ; 142 INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
 304                     ; 143 {
 305                     .text:	section	.text,new
 306  0000               f_EXTI_PORTD_IRQHandler:
 310                     ; 147 }
 313  0000 80            	iret	
 336                     ; 154 INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
 336                     ; 155 {
 337                     .text:	section	.text,new
 338  0000               f_EXTI_PORTE_IRQHandler:
 342                     ; 159 }
 345  0000 80            	iret	
 367                     ; 205 INTERRUPT_HANDLER(SPI_IRQHandler, 10)
 367                     ; 206 {
 368                     .text:	section	.text,new
 369  0000               f_SPI_IRQHandler:
 373                     ; 210 }
 376  0000 80            	iret	
 401                     ; 217 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
 401                     ; 218 {
 402                     .text:	section	.text,new
 403  0000               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
 405  0000 8a            	push	cc
 406  0001 84            	pop	a
 407  0002 a4bf          	and	a,#191
 408  0004 88            	push	a
 409  0005 86            	pop	cc
 410  0006 3b0002        	push	c_x+2
 411  0009 be00          	ldw	x,c_x
 412  000b 89            	pushw	x
 413  000c 3b0002        	push	c_y+2
 414  000f be00          	ldw	x,c_y
 415  0011 89            	pushw	x
 418                     ; 223 	flgTrig = 1; 
 420  0012 a601          	ld	a,#1
 421  0014 b714          	ld	_flgTrig,a
 422                     ; 225     TIM1_ClearITPendingBit(TIM1_IT_UPDATE);
 424  0016 cd0000        	call	_TIM1_ClearITPendingBit
 426                     ; 226 }
 429  0019 85            	popw	x
 430  001a bf00          	ldw	c_y,x
 431  001c 320002        	pop	c_y+2
 432  001f 85            	popw	x
 433  0020 bf00          	ldw	c_x,x
 434  0022 320002        	pop	c_x+2
 435  0025 80            	iret	
 458                     ; 233 INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
 458                     ; 234 {
 459                     .text:	section	.text,new
 460  0000               f_TIM1_CAP_COM_IRQHandler:
 464                     ; 238 }
 467  0000 80            	iret	
 490                     ; 270  INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
 490                     ; 271 {
 491                     .text:	section	.text,new
 492  0000               f_TIM2_UPD_OVF_BRK_IRQHandler:
 496                     ; 275 }
 499  0000 80            	iret	
 522                     ; 282  INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
 522                     ; 283 {
 523                     .text:	section	.text,new
 524  0000               f_TIM2_CAP_COM_IRQHandler:
 528                     ; 287 }
 531  0000 80            	iret	
 554                     ; 296  INTERRUPT_HANDLER(TIM3_UPD_OVF_BRK_IRQHandler, 15)
 554                     ; 297 {
 555                     .text:	section	.text,new
 556  0000               f_TIM3_UPD_OVF_BRK_IRQHandler:
 560                     ; 301 }
 563  0000 80            	iret	
 586                     ; 308  INTERRUPT_HANDLER(TIM3_CAP_COM_IRQHandler, 16)
 586                     ; 309 {
 587                     .text:	section	.text,new
 588  0000               f_TIM3_CAP_COM_IRQHandler:
 592                     ; 313 }
 595  0000 80            	iret	
 617                     ; 348 INTERRUPT_HANDLER(I2C_IRQHandler, 19)
 617                     ; 349 {
 618                     .text:	section	.text,new
 619  0000               f_I2C_IRQHandler:
 623                     ; 353 }
 626  0000 80            	iret	
 649                     ; 361  INTERRUPT_HANDLER(UART2_TX_IRQHandler, 20)
 649                     ; 362 {
 650                     .text:	section	.text,new
 651  0000               f_UART2_TX_IRQHandler:
 655                     ; 366   }
 658  0000 80            	iret	
 697                     ; 373  INTERRUPT_HANDLER(UART2_RX_IRQHandler, 21)
 697                     ; 374 {
 698                     .text:	section	.text,new
 699  0000               f_UART2_RX_IRQHandler:
 701  0000 8a            	push	cc
 702  0001 84            	pop	a
 703  0002 a4bf          	and	a,#191
 704  0004 88            	push	a
 705  0005 86            	pop	cc
 706       00000001      OFST:	set	1
 707  0006 3b0002        	push	c_x+2
 708  0009 be00          	ldw	x,c_x
 709  000b 89            	pushw	x
 710  000c 3b0002        	push	c_y+2
 711  000f be00          	ldw	x,c_y
 712  0011 89            	pushw	x
 713  0012 88            	push	a
 716                     ; 380 		if(UART2_GetFlagStatus(UART2_FLAG_RXNE))
 718  0013 ae0020        	ldw	x,#32
 719  0016 cd0000        	call	_UART2_GetFlagStatus
 721  0019 4d            	tnz	a
 722  001a 2729          	jreq	L752
 723                     ; 382 					x=	UART2_ReceiveData8();
 725  001c cd0000        	call	_UART2_ReceiveData8
 727  001f 6b01          	ld	(OFST+0,sp),a
 728                     ; 384 					if((x == '\r')||(x == '\n')||(x == '\0')) 
 730  0021 a10d          	cp	a,#13
 731  0023 2708          	jreq	L362
 733  0025 a10a          	cp	a,#10
 734  0027 2704          	jreq	L362
 736  0029 7b01          	ld	a,(OFST+0,sp)
 737  002b 260b          	jrne	L162
 738  002d               L362:
 739                     ; 386 						cUART[lenUART] = '\0';
 741  002d 5f            	clrw	x
 742  002e b600          	ld	a,_lenUART
 743  0030 2a01          	jrpl	L26
 744  0032 53            	cplw	x
 745  0033               L26:
 746  0033 97            	ld	xl,a
 747  0034 6f00          	clr	(_cUART,x)
 749  0036 200d          	jra	L752
 750  0038               L162:
 751                     ; 390 						cUART[lenUART] = x;
 753  0038 5f            	clrw	x
 754  0039 b600          	ld	a,_lenUART
 755  003b 2a01          	jrpl	L46
 756  003d 53            	cplw	x
 757  003e               L46:
 758  003e 97            	ld	xl,a
 759  003f 7b01          	ld	a,(OFST+0,sp)
 760  0041 e700          	ld	(_cUART,x),a
 761                     ; 391 						lenUART++;
 763  0043 3c00          	inc	_lenUART
 764  0045               L752:
 765                     ; 394 		UART2_ClearITPendingBit(UART2_IT_RXNE);		
 767  0045 ae0255        	ldw	x,#597
 768  0048 cd0000        	call	_UART2_ClearITPendingBit
 770                     ; 395   }
 773  004b 84            	pop	a
 774  004c 85            	popw	x
 775  004d bf00          	ldw	c_y,x
 776  004f 320002        	pop	c_y+2
 777  0052 85            	popw	x
 778  0053 bf00          	ldw	c_x,x
 779  0055 320002        	pop	c_x+2
 780  0058 80            	iret	
 802                     ; 443  INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
 802                     ; 444 {
 803                     .text:	section	.text,new
 804  0000               f_ADC1_IRQHandler:
 808                     ; 449 }
 811  0000 80            	iret	
 834                     ; 470  INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
 834                     ; 471 {
 835                     .text:	section	.text,new
 836  0000               f_TIM4_UPD_OVF_IRQHandler:
 840                     ; 475 }
 843  0000 80            	iret	
 866                     ; 483 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
 866                     ; 484 {
 867                     .text:	section	.text,new
 868  0000               f_EEPROM_EEC_IRQHandler:
 872                     ; 488 }
 875  0000 80            	iret	
 917                     	xdef	_lenUART
 918                     	switch	.ubsct
 919  0000               _cUART:
 920  0000 000000000000  	ds.b	20
 921                     	xdef	_cUART
 922  0014               _flgTrig:
 923  0014 00            	ds.b	1
 924                     	xdef	_flgTrig
 925                     	xdef	f_EEPROM_EEC_IRQHandler
 926                     	xdef	f_TIM4_UPD_OVF_IRQHandler
 927                     	xdef	f_ADC1_IRQHandler
 928                     	xdef	f_UART2_TX_IRQHandler
 929                     	xdef	f_UART2_RX_IRQHandler
 930                     	xdef	f_I2C_IRQHandler
 931                     	xdef	f_TIM3_CAP_COM_IRQHandler
 932                     	xdef	f_TIM3_UPD_OVF_BRK_IRQHandler
 933                     	xdef	f_TIM2_CAP_COM_IRQHandler
 934                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
 935                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
 936                     	xdef	f_TIM1_CAP_COM_IRQHandler
 937                     	xdef	f_SPI_IRQHandler
 938                     	xdef	f_EXTI_PORTE_IRQHandler
 939                     	xdef	f_EXTI_PORTD_IRQHandler
 940                     	xdef	f_EXTI_PORTC_IRQHandler
 941                     	xdef	f_EXTI_PORTB_IRQHandler
 942                     	xdef	f_EXTI_PORTA_IRQHandler
 943                     	xdef	f_CLK_IRQHandler
 944                     	xdef	f_AWU_IRQHandler
 945                     	xdef	f_TLI_IRQHandler
 946                     	xdef	f_TRAP_IRQHandler
 947                     	xdef	f_NonHandledInterrupt
 948                     	xref	_UART2_ClearITPendingBit
 949                     	xref	_UART2_GetFlagStatus
 950                     	xref	_UART2_ReceiveData8
 951                     	xref	_TIM1_ClearITPendingBit
 952                     	xref.b	c_x
 953                     	xref.b	c_y
 973                     	end
