   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
   4                     ; Optimizer V4.3.6 - 29 Nov 2011
  50                     ; 5 void Timer2_Init(void)
  50                     ; 6 {
  52                     .text:	section	.text,new
  53  0000               _Timer2_Init:
  57                     ; 8     TIM2_DeInit();
  59  0000 cd0000        	call	_TIM2_DeInit
  61                     ; 10     TIM2_TimeBaseInit(TIM2_PRESCALER_1, 160);
  63  0003 ae00a0        	ldw	x,#160
  64  0006 89            	pushw	x
  65  0007 4f            	clr	a
  66  0008 cd0000        	call	_TIM2_TimeBaseInit
  68  000b 85            	popw	x
  69                     ; 11 }
  72  000c 81            	ret	
 127                     ; 13 void Delay_us(uint16_t microsecond)
 127                     ; 14 {
 128                     .text:	section	.text,new
 129  0000               _Delay_us:
 131  0000 5204          	subw	sp,#4
 132       00000004      OFST:	set	4
 135                     ; 18 		_tDelayus = 160; 	
 137                     ; 19 		_microsecond= microsecond/10;
 139  0002 90ae000a      	ldw	y,#10
 140  0006 65            	divw	x,y
 141  0007 1f03          	ldw	(OFST-1,sp),x
 142                     ; 21 		CLK->PCKENR1	|= 0x30;
 144  0009 c650c7        	ld	a,20679
 145  000c aa30          	or	a,#48
 146  000e c750c7        	ld	20679,a
 147                     ; 22 		TIM2->CNTRH = 0;
 149  0011 725f530a      	clr	21258
 150                     ; 23 		TIM2->CNTRL = 138;
 152  0015 358a530b      	mov	21259,#138
 153                     ; 25     TIM2->ARRH = (uint8_t)(_tDelayus >> 8);
 155  0019 725f530d      	clr	21261
 156                     ; 26     TIM2->ARRL = (uint8_t)(_tDelayus);
 158  001d 35a0530e      	mov	21262,#160
 159                     ; 28 		TIM2_ClearFlag(TIM2_FLAG_UPDATE);
 161  0021 ae0001        	ldw	x,#1
 162  0024 cd0000        	call	_TIM2_ClearFlag
 164                     ; 29 		TIM2_Cmd(ENABLE);
 166  0027 a601          	ld	a,#1
 167  0029 cd0000        	call	_TIM2_Cmd
 170  002c 200f          	jra	L15
 171  002e               L75:
 172                     ; 33 			while(TIM2_GetFlagStatus(TIM2_FLAG_UPDATE) != SET);
 174  002e ae0001        	ldw	x,#1
 175  0031 cd0000        	call	_TIM2_GetFlagStatus
 177  0034 4a            	dec	a
 178  0035 26f7          	jrne	L75
 179                     ; 34 			TIM2_ClearFlag(TIM2_FLAG_UPDATE);
 181  0037 ae0001        	ldw	x,#1
 182  003a cd0000        	call	_TIM2_ClearFlag
 184  003d               L15:
 185                     ; 31 		while(_microsecond--)
 187  003d 1e03          	ldw	x,(OFST-1,sp)
 188  003f 5a            	decw	x
 189  0040 1f03          	ldw	(OFST-1,sp),x
 190  0042 5c            	incw	x
 191  0043 26e9          	jrne	L75
 192                     ; 37 		TIM2_Cmd(DISABLE);
 194  0045 4f            	clr	a
 195  0046 cd0000        	call	_TIM2_Cmd
 197                     ; 38 		CLK->PCKENR1	&= (~0x30);
 199  0049 c650c7        	ld	a,20679
 200  004c a4cf          	and	a,#207
 201  004e c750c7        	ld	20679,a
 202                     ; 39 }
 205  0051 5b04          	addw	sp,#4
 206  0053 81            	ret	
 241                     ; 41 void Delay_1us(void)
 241                     ; 42 {
 242                     .text:	section	.text,new
 243  0000               _Delay_1us:
 245  0000 88            	push	a
 246       00000001      OFST:	set	1
 249                     ; 44 	_oneus = 16;		//8
 251  0001 a610          	ld	a,#16
 252  0003 6b01          	ld	(OFST+0,sp),a
 254  0005 2003          	jra	L501
 255  0007               L101:
 256                     ; 47 		nop();				//1 nop() takes 1 clock cycles
 259  0007 9d            	nop	
 262  0008 7b01          	ld	a,(OFST+0,sp)
 263  000a               L501:
 264                     ; 45 	while(_oneus--)
 266  000a 0a01          	dec	(OFST+0,sp)
 267  000c 4d            	tnz	a
 268  000d 26f8          	jrne	L101
 269                     ; 49 }
 272  000f 84            	pop	a
 273  0010 81            	ret	
 297                     ; 51 void OneWire_Init(void) 
 297                     ; 52 {
 298                     .text:	section	.text,new
 299  0000               _OneWire_Init:
 303                     ; 54 	GPIO_Init(Onewire_GPIOx, Onewire_GPIO_PIN, GPIO_MODE_OUT_OD_LOW_FAST);
 305  0000 4ba0          	push	#160
 306  0002 4b04          	push	#4
 307  0004 ae500f        	ldw	x,#20495
 308  0007 cd0000        	call	_GPIO_Init
 310  000a 72155013      	bres	20499,#2
 311  000e 85            	popw	x
 312                     ; 56   Onewire_GPIOx->CR2 &= (uint8_t)(~(Onewire_GPIO_PIN));
 314                     ; 57 }
 317  000f 81            	ret	
 340                     ; 59 void Onewire_SetHIGH(void)
 340                     ; 60 {
 341                     .text:	section	.text,new
 342  0000               _Onewire_SetHIGH:
 346                     ; 62 	Onewire_GPIOx->ODR |= (uint8_t)Onewire_GPIO_PIN;
 348  0000 7214500f      	bset	20495,#2
 349                     ; 64 	Onewire_GPIOx->DDR |= (uint8_t)Onewire_GPIO_PIN;
 351  0004 72145011      	bset	20497,#2
 352                     ; 65 }
 355  0008 81            	ret	
 378                     ; 67 void Onewire_SetLOW(void)
 378                     ; 68 {
 379                     .text:	section	.text,new
 380  0000               _Onewire_SetLOW:
 384                     ; 70 	Onewire_GPIOx->ODR &= (uint8_t)(~(Onewire_GPIO_PIN));
 386  0000 7215500f      	bres	20495,#2
 387                     ; 72 	Onewire_GPIOx->DDR |= (uint8_t)Onewire_GPIO_PIN;
 389  0004 72145011      	bset	20497,#2
 390                     ; 73 }
 393  0008 81            	ret	
 416                     ; 75 void Onewire_SetINPUT(void)
 416                     ; 76 {
 417                     .text:	section	.text,new
 418  0000               _Onewire_SetINPUT:
 422                     ; 78 	Onewire_GPIOx->DDR &= (uint8_t)(~(Onewire_GPIO_PIN));
 424  0000 72155011      	bres	20497,#2
 425                     ; 79 }
 428  0004 81            	ret	
 472                     ; 81 BitStatus Onewire_GetPIN(void)
 472                     ; 82 {
 473                     .text:	section	.text,new
 474  0000               _Onewire_GetPIN:
 478                     ; 83 	return ((bool)(Onewire_GPIOx->IDR & (uint8_t)Onewire_GPIO_PIN));
 480  0000 c65010        	ld	a,20496
 481  0003 a404          	and	a,#4
 484  0005 81            	ret	
 522                     ; 86 uint8_t OneWire_Reset(void) 
 522                     ; 87 {
 523                     .text:	section	.text,new
 524  0000               _OneWire_Reset:
 526  0000 88            	push	a
 527       00000001      OFST:	set	1
 530                     ; 90 	Onewire_SetLOW();
 532  0001 cd0000        	call	_Onewire_SetLOW
 534                     ; 91 	Delay_us(480);
 536  0004 ae01e0        	ldw	x,#480
 537  0007 cd0000        	call	_Delay_us
 539                     ; 93 	Onewire_SetINPUT();
 541  000a cd0000        	call	_Onewire_SetINPUT
 543                     ; 94 	Delay_us(60);
 545  000d ae003c        	ldw	x,#60
 546  0010 cd0000        	call	_Delay_us
 548                     ; 96 	_i = Onewire_GetPIN();
 550  0013 cd0000        	call	_Onewire_GetPIN
 552  0016 6b01          	ld	(OFST+0,sp),a
 553                     ; 98 	Delay_us(420);
 555  0018 ae01a4        	ldw	x,#420
 556  001b cd0000        	call	_Delay_us
 558                     ; 100 	return _i;
 560  001e 7b01          	ld	a,(OFST+0,sp)
 563  0020 5b01          	addw	sp,#1
 564  0022 81            	ret	
 603                     ; 103 uint8_t OneWire_ReadBit(void) 
 603                     ; 104 {
 604                     .text:	section	.text,new
 605  0000               _OneWire_ReadBit:
 607  0000 88            	push	a
 608       00000001      OFST:	set	1
 611                     ; 106 	_bit = 0;
 613  0001 0f01          	clr	(OFST+0,sp)
 614                     ; 108 	Onewire_SetLOW();
 616  0003 cd0000        	call	_Onewire_SetLOW
 618                     ; 109 	Delay_1us();
 620  0006 cd0000        	call	_Delay_1us
 622                     ; 111 	Onewire_SetINPUT();
 624  0009 cd0000        	call	_Onewire_SetINPUT
 626                     ; 112 	Delay_us(10);
 628  000c ae000a        	ldw	x,#10
 629  000f cd0000        	call	_Delay_us
 631                     ; 114 	if (Onewire_GetPIN()) {
 633  0012 cd0000        	call	_Onewire_GetPIN
 635  0015 4d            	tnz	a
 636  0016 2704          	jreq	L522
 637                     ; 116 		_bit = 1;
 639  0018 a601          	ld	a,#1
 640  001a 6b01          	ld	(OFST+0,sp),a
 641  001c               L522:
 642                     ; 119 	Delay_us(30);
 644  001c ae001e        	ldw	x,#30
 645  001f cd0000        	call	_Delay_us
 647                     ; 121 	return _bit;
 649  0022 7b01          	ld	a,(OFST+0,sp)
 652  0024 5b01          	addw	sp,#1
 653  0026 81            	ret	
 698                     ; 124 uint8_t OneWire_ReadByte(void) 
 698                     ; 125 {
 699                     .text:	section	.text,new
 700  0000               _OneWire_ReadByte:
 702  0000 89            	pushw	x
 703       00000002      OFST:	set	2
 706                     ; 127 	_i = 8;
 708  0001 a608          	ld	a,#8
 709  0003 6b01          	ld	(OFST-1,sp),a
 710                     ; 128 	_byte = 0;
 712  0005 0f02          	clr	(OFST+0,sp)
 714  0007 2014          	jra	L552
 715  0009               L152:
 716                     ; 131 		_byte = _byte >> 1;
 718  0009 0402          	srl	(OFST+0,sp)
 719                     ; 132 		_byte |= (OneWire_ReadBit() << 7);
 721  000b cd0000        	call	_OneWire_ReadBit
 723  000e 97            	ld	xl,a
 724  000f a680          	ld	a,#128
 725  0011 42            	mul	x,a
 726  0012 9f            	ld	a,xl
 727  0013 1a02          	or	a,(OFST+0,sp)
 728  0015 6b02          	ld	(OFST+0,sp),a
 729                     ; 133 		Delay_us(10);
 731  0017 ae000a        	ldw	x,#10
 732  001a cd0000        	call	_Delay_us
 734  001d               L552:
 735                     ; 129 	while (_i--) 
 737  001d 7b01          	ld	a,(OFST-1,sp)
 738  001f 0a01          	dec	(OFST-1,sp)
 739  0021 4d            	tnz	a
 740  0022 26e5          	jrne	L152
 741                     ; 135 	return _byte;
 743  0024 7b02          	ld	a,(OFST+0,sp)
 746  0026 85            	popw	x
 747  0027 81            	ret	
 785                     ; 138 void OneWire_WriteBit(uint8_t bit) 
 785                     ; 139 {
 786                     .text:	section	.text,new
 787  0000               _OneWire_WriteBit:
 789  0000 88            	push	a
 790       00000000      OFST:	set	0
 793                     ; 141 	Onewire_SetLOW();
 795  0001 cd0000        	call	_Onewire_SetLOW
 797                     ; 142 	Delay_1us();
 799  0004 cd0000        	call	_Delay_1us
 801                     ; 145 	if ((bool) bit) {
 803  0007 7b01          	ld	a,(OFST+1,sp)
 804  0009 270b          	jreq	L772
 805                     ; 146 		Onewire_SetINPUT();
 807  000b cd0000        	call	_Onewire_SetINPUT
 809                     ; 147 		Delay_us(60);
 811  000e ae003c        	ldw	x,#60
 812  0011 cd0000        	call	_Delay_us
 815  0014 2009          	jra	L103
 816  0016               L772:
 817                     ; 152 	Delay_us(60);
 819  0016 ae003c        	ldw	x,#60
 820  0019 cd0000        	call	_Delay_us
 822                     ; 153 	Onewire_SetINPUT();
 824  001c cd0000        	call	_Onewire_SetINPUT
 826  001f               L103:
 827                     ; 155 }
 830  001f 84            	pop	a
 831  0020 81            	ret	
 876                     ; 157 void OneWire_WriteByte(uint8_t byte) {
 877                     .text:	section	.text,new
 878  0000               _OneWire_WriteByte:
 880  0000 88            	push	a
 881  0001 88            	push	a
 882       00000001      OFST:	set	1
 885                     ; 158 	uint8_t _i = 8;
 887  0002 a608          	ld	a,#8
 888  0004 6b01          	ld	(OFST+0,sp),a
 890  0006 2011          	jra	L133
 891  0008               L523:
 892                     ; 163 		OneWire_WriteBit(byte & 0x01);
 894  0008 7b02          	ld	a,(OFST+1,sp)
 895  000a a401          	and	a,#1
 896  000c cd0000        	call	_OneWire_WriteBit
 898                     ; 164 		byte >>= 1;
 900  000f 0402          	srl	(OFST+1,sp)
 901                     ; 165 		Delay_us(10);
 903  0011 ae000a        	ldw	x,#10
 904  0014 cd0000        	call	_Delay_us
 906  0017 7b01          	ld	a,(OFST+0,sp)
 907  0019               L133:
 908                     ; 160 	while (_i--) 
 910  0019 0a01          	dec	(OFST+0,sp)
 911  001b 4d            	tnz	a
 912  001c 26ea          	jrne	L523
 913                     ; 167 }
 916  001e 85            	popw	x
 917  001f 81            	ret	
 973                     ; 169 uint16_t OneWire_GetTemp(void)
 973                     ; 170 {
 974                     .text:	section	.text,new
 975  0000               _OneWire_GetTemp:
 977  0000 5206          	subw	sp,#6
 978       00000006      OFST:	set	6
 981                     ; 176 	if(OneWire_Reset()==0)
 983  0002 cd0000        	call	_OneWire_Reset
 985  0005 4d            	tnz	a
 986  0006 263e          	jrne	L363
 987                     ; 179 		OneWire_WriteByte(ONEWIRE_CMD_SKIPROM);
 989  0008 a6cc          	ld	a,#204
 990  000a cd0000        	call	_OneWire_WriteByte
 992                     ; 180 		OneWire_WriteByte(ONEWIRE_CMD_CONVERTT);
 994  000d a644          	ld	a,#68
 995  000f cd0000        	call	_OneWire_WriteByte
 998  0012               L763:
 999                     ; 181 		while(!OneWire_ReadBit());
1001  0012 cd0000        	call	_OneWire_ReadBit
1003  0015 4d            	tnz	a
1004  0016 27fa          	jreq	L763
1005                     ; 182 		OneWire_Reset();	
1007  0018 cd0000        	call	_OneWire_Reset
1009                     ; 183 		OneWire_WriteByte(ONEWIRE_CMD_SKIPROM);
1011  001b a6cc          	ld	a,#204
1012  001d cd0000        	call	_OneWire_WriteByte
1014                     ; 184 		OneWire_WriteByte(ONEWIRE_CMD_RSCRATCHPAD);
1016  0020 a6be          	ld	a,#190
1017  0022 cd0000        	call	_OneWire_WriteByte
1019                     ; 185 		_TempL=OneWire_ReadByte(); 
1021  0025 cd0000        	call	_OneWire_ReadByte
1023  0028 6b05          	ld	(OFST-1,sp),a
1024                     ; 186 		_TempH=OneWire_ReadByte();
1026  002a cd0000        	call	_OneWire_ReadByte
1028  002d 6b06          	ld	(OFST+0,sp),a
1029                     ; 187 		OneWire_Reset();	
1031  002f cd0000        	call	_OneWire_Reset
1033                     ; 190 		_Temp = (((uint16_t) ((_TempH & 0x07)<<8))|((uint16_t) _TempL));
1035  0032 7b05          	ld	a,(OFST-1,sp)
1036  0034 5f            	clrw	x
1037  0035 97            	ld	xl,a
1038  0036 1f01          	ldw	(OFST-5,sp),x
1039  0038 7b06          	ld	a,(OFST+0,sp)
1040  003a a407          	and	a,#7
1041  003c 5f            	clrw	x
1042  003d 97            	ld	xl,a
1043  003e 7b02          	ld	a,(OFST-4,sp)
1044  0040 01            	rrwa	x,a
1045  0041 1a01          	or	a,(OFST-5,sp)
1046  0043 01            	rrwa	x,a
1047                     ; 191 		return _Temp;
1050  0044 2001          	jra	L061
1051  0046               L363:
1052                     ; 195 		return 0;		
1054  0046 5f            	clrw	x
1056  0047               L061:
1058  0047 5b06          	addw	sp,#6
1059  0049 81            	ret	
1072                     	xdef	_OneWire_GetTemp
1073                     	xdef	_OneWire_WriteByte
1074                     	xdef	_OneWire_WriteBit
1075                     	xdef	_OneWire_ReadByte
1076                     	xdef	_OneWire_ReadBit
1077                     	xdef	_OneWire_Reset
1078                     	xdef	_Onewire_GetPIN
1079                     	xdef	_Onewire_SetINPUT
1080                     	xdef	_Onewire_SetLOW
1081                     	xdef	_Onewire_SetHIGH
1082                     	xdef	_OneWire_Init
1083                     	xdef	_Delay_1us
1084                     	xdef	_Delay_us
1085                     	xdef	_Timer2_Init
1086                     	xref	_TIM2_ClearFlag
1087                     	xref	_TIM2_GetFlagStatus
1088                     	xref	_TIM2_Cmd
1089                     	xref	_TIM2_TimeBaseInit
1090                     	xref	_TIM2_DeInit
1091                     	xref	_GPIO_Init
1110                     	end
