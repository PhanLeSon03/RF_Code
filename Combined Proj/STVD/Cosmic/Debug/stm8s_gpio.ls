   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
   4                     ; Optimizer V4.3.6 - 29 Nov 2011
 114                     ; 47 void GPIO_DeInit(GPIO_TypeDef* GPIOx)
 114                     ; 48 {
 116                     .text:	section	.text,new
 117  0000               _GPIO_DeInit:
 121                     ; 49     GPIOx->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
 123  0000 7f            	clr	(x)
 124                     ; 50     GPIOx->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
 126  0001 6f02          	clr	(2,x)
 127                     ; 51     GPIOx->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
 129  0003 6f03          	clr	(3,x)
 130                     ; 52     GPIOx->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
 132  0005 6f04          	clr	(4,x)
 133                     ; 53 }
 136  0007 81            	ret	
 376                     ; 65 void GPIO_Init(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, GPIO_Mode_TypeDef GPIO_Mode)
 376                     ; 66 {
 377                     .text:	section	.text,new
 378  0000               _GPIO_Init:
 380  0000 89            	pushw	x
 381       00000000      OFST:	set	0
 384                     ; 71     assert_param(IS_GPIO_MODE_OK(GPIO_Mode));
 386                     ; 72     assert_param(IS_GPIO_PIN_OK(GPIO_Pin));
 388                     ; 75   GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 390  0001 7b05          	ld	a,(OFST+5,sp)
 391  0003 43            	cpl	a
 392  0004 e404          	and	a,(4,x)
 393  0006 e704          	ld	(4,x),a
 394                     ; 81     if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x80) != (uint8_t)0x00) /* Output mode */
 396  0008 7b06          	ld	a,(OFST+6,sp)
 397  000a 2a18          	jrpl	L771
 398                     ; 83         if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x10) != (uint8_t)0x00) /* High level */
 400  000c a510          	bcp	a,#16
 401  000e 2705          	jreq	L102
 402                     ; 85             GPIOx->ODR |= (uint8_t)GPIO_Pin;
 404  0010 f6            	ld	a,(x)
 405  0011 1a05          	or	a,(OFST+5,sp)
 407  0013 2006          	jra	L302
 408  0015               L102:
 409                     ; 89             GPIOx->ODR &= (uint8_t)(~(GPIO_Pin));
 411  0015 1e01          	ldw	x,(OFST+1,sp)
 412  0017 7b05          	ld	a,(OFST+5,sp)
 413  0019 43            	cpl	a
 414  001a f4            	and	a,(x)
 415  001b               L302:
 416  001b f7            	ld	(x),a
 417                     ; 92         GPIOx->DDR |= (uint8_t)GPIO_Pin;
 419  001c 1e01          	ldw	x,(OFST+1,sp)
 420  001e e602          	ld	a,(2,x)
 421  0020 1a05          	or	a,(OFST+5,sp)
 423  0022 2007          	jra	L502
 424  0024               L771:
 425                     ; 97         GPIOx->DDR &= (uint8_t)(~(GPIO_Pin));
 427  0024 1e01          	ldw	x,(OFST+1,sp)
 428  0026 7b05          	ld	a,(OFST+5,sp)
 429  0028 43            	cpl	a
 430  0029 e402          	and	a,(2,x)
 431  002b               L502:
 432  002b e702          	ld	(2,x),a
 433                     ; 104     if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x40) != (uint8_t)0x00) /* Pull-Up or Push-Pull */
 435  002d 7b06          	ld	a,(OFST+6,sp)
 436  002f a540          	bcp	a,#64
 437  0031 2706          	jreq	L702
 438                     ; 106         GPIOx->CR1 |= (uint8_t)GPIO_Pin;
 440  0033 e603          	ld	a,(3,x)
 441  0035 1a05          	or	a,(OFST+5,sp)
 443  0037 2005          	jra	L112
 444  0039               L702:
 445                     ; 110         GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
 447  0039 7b05          	ld	a,(OFST+5,sp)
 448  003b 43            	cpl	a
 449  003c e403          	and	a,(3,x)
 450  003e               L112:
 451  003e e703          	ld	(3,x),a
 452                     ; 117     if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x20) != (uint8_t)0x00) /* Interrupt or Slow slope */
 454  0040 7b06          	ld	a,(OFST+6,sp)
 455  0042 a520          	bcp	a,#32
 456  0044 2706          	jreq	L312
 457                     ; 119         GPIOx->CR2 |= (uint8_t)GPIO_Pin;
 459  0046 e604          	ld	a,(4,x)
 460  0048 1a05          	or	a,(OFST+5,sp)
 462  004a 2005          	jra	L512
 463  004c               L312:
 464                     ; 123         GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 466  004c 7b05          	ld	a,(OFST+5,sp)
 467  004e 43            	cpl	a
 468  004f e404          	and	a,(4,x)
 469  0051               L512:
 470  0051 e704          	ld	(4,x),a
 471                     ; 125 }
 474  0053 85            	popw	x
 475  0054 81            	ret	
 521                     ; 135 void GPIO_Write(GPIO_TypeDef* GPIOx, uint8_t PortVal)
 521                     ; 136 {
 522                     .text:	section	.text,new
 523  0000               _GPIO_Write:
 525  0000 89            	pushw	x
 526       00000000      OFST:	set	0
 529                     ; 137     GPIOx->ODR = PortVal;
 531  0001 1e01          	ldw	x,(OFST+1,sp)
 532  0003 7b05          	ld	a,(OFST+5,sp)
 533  0005 f7            	ld	(x),a
 534                     ; 138 }
 537  0006 85            	popw	x
 538  0007 81            	ret	
 585                     ; 148 void GPIO_WriteHigh(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 585                     ; 149 {
 586                     .text:	section	.text,new
 587  0000               _GPIO_WriteHigh:
 589  0000 89            	pushw	x
 590       00000000      OFST:	set	0
 593                     ; 150     GPIOx->ODR |= (uint8_t)PortPins;
 595  0001 f6            	ld	a,(x)
 596  0002 1a05          	or	a,(OFST+5,sp)
 597  0004 f7            	ld	(x),a
 598                     ; 151 }
 601  0005 85            	popw	x
 602  0006 81            	ret	
 649                     ; 161 void GPIO_WriteLow(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 649                     ; 162 {
 650                     .text:	section	.text,new
 651  0000               _GPIO_WriteLow:
 653  0000 89            	pushw	x
 654       00000000      OFST:	set	0
 657                     ; 163     GPIOx->ODR &= (uint8_t)(~PortPins);
 659  0001 7b05          	ld	a,(OFST+5,sp)
 660  0003 43            	cpl	a
 661  0004 f4            	and	a,(x)
 662  0005 f7            	ld	(x),a
 663                     ; 164 }
 666  0006 85            	popw	x
 667  0007 81            	ret	
 714                     ; 174 void GPIO_WriteReverse(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 714                     ; 175 {
 715                     .text:	section	.text,new
 716  0000               _GPIO_WriteReverse:
 718  0000 89            	pushw	x
 719       00000000      OFST:	set	0
 722                     ; 176     GPIOx->ODR ^= (uint8_t)PortPins;
 724  0001 f6            	ld	a,(x)
 725  0002 1805          	xor	a,(OFST+5,sp)
 726  0004 f7            	ld	(x),a
 727                     ; 177 }
 730  0005 85            	popw	x
 731  0006 81            	ret	
 769                     ; 185 uint8_t GPIO_ReadOutputData(GPIO_TypeDef* GPIOx)
 769                     ; 186 {
 770                     .text:	section	.text,new
 771  0000               _GPIO_ReadOutputData:
 775                     ; 187     return ((uint8_t)GPIOx->ODR);
 777  0000 f6            	ld	a,(x)
 780  0001 81            	ret	
 817                     ; 196 uint8_t GPIO_ReadInputData(GPIO_TypeDef* GPIOx)
 817                     ; 197 {
 818                     .text:	section	.text,new
 819  0000               _GPIO_ReadInputData:
 823                     ; 198     return ((uint8_t)GPIOx->IDR);
 825  0000 e601          	ld	a,(1,x)
 828  0002 81            	ret	
 896                     ; 207 BitStatus GPIO_ReadInputPin(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
 896                     ; 208 {
 897                     .text:	section	.text,new
 898  0000               _GPIO_ReadInputPin:
 900  0000 89            	pushw	x
 901       00000000      OFST:	set	0
 904                     ; 209     return ((BitStatus)(GPIOx->IDR & (uint8_t)GPIO_Pin));
 906  0001 e601          	ld	a,(1,x)
 907  0003 1405          	and	a,(OFST+5,sp)
 910  0005 85            	popw	x
 911  0006 81            	ret	
 989                     ; 219 void GPIO_ExternalPullUpConfig(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, FunctionalState NewState)
 989                     ; 220 {
 990                     .text:	section	.text,new
 991  0000               _GPIO_ExternalPullUpConfig:
 993  0000 89            	pushw	x
 994       00000000      OFST:	set	0
 997                     ; 222     assert_param(IS_GPIO_PIN_OK(GPIO_Pin));
 999                     ; 223     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1001                     ; 225     if (NewState != DISABLE) /* External Pull-Up Set*/
1003  0001 7b06          	ld	a,(OFST+6,sp)
1004  0003 2706          	jreq	L374
1005                     ; 227         GPIOx->CR1 |= (uint8_t)GPIO_Pin;
1007  0005 e603          	ld	a,(3,x)
1008  0007 1a05          	or	a,(OFST+5,sp)
1010  0009 2007          	jra	L574
1011  000b               L374:
1012                     ; 230         GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
1014  000b 1e01          	ldw	x,(OFST+1,sp)
1015  000d 7b05          	ld	a,(OFST+5,sp)
1016  000f 43            	cpl	a
1017  0010 e403          	and	a,(3,x)
1018  0012               L574:
1019  0012 e703          	ld	(3,x),a
1020                     ; 232 }
1023  0014 85            	popw	x
1024  0015 81            	ret	
1037                     	xdef	_GPIO_ExternalPullUpConfig
1038                     	xdef	_GPIO_ReadInputPin
1039                     	xdef	_GPIO_ReadOutputData
1040                     	xdef	_GPIO_ReadInputData
1041                     	xdef	_GPIO_WriteReverse
1042                     	xdef	_GPIO_WriteLow
1043                     	xdef	_GPIO_WriteHigh
1044                     	xdef	_GPIO_Write
1045                     	xdef	_GPIO_Init
1046                     	xdef	_GPIO_DeInit
1065                     	end
