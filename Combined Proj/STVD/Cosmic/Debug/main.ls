   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
   4                     ; Optimizer V4.3.6 - 29 Nov 2011
  87                     ; 192 int16_t main(void) 
  87                     ; 193 {
  89                     .text:	section	.text,new
  90  0000               _main:
  92  0000 5220          	subw	sp,#32
  93       00000020      OFST:	set	32
  96                     ; 204 		CLK_Config();			//	Initialization of the clock 
  98  0002 cd0000        	call	_CLK_Config
 100                     ; 205 		GPIO_Initial();		// 	DI @ PD2
 102  0005 cd0000        	call	_GPIO_Initial
 104                     ; 206 		Timer1_Init();		//	1Khz, Interrupt 20ms
 106  0008 cd0000        	call	_Timer1_Init
 108                     ; 207 		Timer2_Init();		//	For Delay function @ Onewire.h 16Mhz, period = 160
 110  000b cd0000        	call	_Timer2_Init
 112                     ; 208 		Timer3_Init();		//	PWM 16Mz, duty cyle 0>>100
 114  000e cd0000        	call	_Timer3_Init
 116                     ; 209 		UART_Init();			//	9600
 118  0011 cd0000        	call	_UART_Init
 120                     ; 210 		ADC_Init();				//	4Mz, ADC Channnel 2
 122  0014 cd0000        	call	_ADC_Init
 124                     ; 211 		OneWire_Init();
 126  0017 cd0000        	call	_OneWire_Init
 128                     ; 214 		ADC1_StartConversion();
 130  001a cd0000        	call	_ADC1_StartConversion
 132                     ; 220     enableInterrupts();
 135  001d 9a            	rim	
 137  001e               L33:
 138                     ; 225 		if (flgTrig==1)
 140  001e b600          	ld	a,_flgTrig
 141  0020 4a            	dec	a
 142  0021 26fb          	jrne	L33
 143                     ; 228 				cntOS++;
 145  0023 be0c          	ldw	x,_cntOS
 146  0025 5c            	incw	x
 147  0026 bf0c          	ldw	_cntOS,x
 148                     ; 234 				if (cntOS==100)
 150  0028 a30064        	cpw	x,#100
 151  002b 265a          	jrne	L14
 152                     ; 248 							PWM_SetDuty_Freq(TIM3_PRESCALER_8,100);
 154  002d ae0064        	ldw	x,#100
 155  0030 89            	pushw	x
 156  0031 a603          	ld	a,#3
 157  0033 cd0000        	call	_PWM_SetDuty_Freq
 159  0036 85            	popw	x
 160                     ; 249 							_tmp = OneWire_GetTemp();
 162  0037 cd0000        	call	_OneWire_GetTemp
 164  003a 1f1f          	ldw	(OFST-1,sp),x
 165                     ; 250 							if(_tmp!= 0)
 167  003c 272f          	jreq	L34
 168                     ; 252 								sprintf(chBufTEMP,"Temp: %d (%d.%d)\r\n",_tmp,_tmp>>4,(uint16_t) (((uint8_t)(_tmp&0x0f))*625));
 170  003e 7b20          	ld	a,(OFST+0,sp)
 171  0040 a40f          	and	a,#15
 172  0042 5f            	clrw	x
 173  0043 97            	ld	xl,a
 174  0044 90ae0271      	ldw	y,#625
 175  0048 cd0000        	call	c_imul
 177  004b 89            	pushw	x
 178  004c 1e21          	ldw	x,(OFST+1,sp)
 179  004e 54            	srlw	x
 180  004f 54            	srlw	x
 181  0050 54            	srlw	x
 182  0051 54            	srlw	x
 183  0052 89            	pushw	x
 184  0053 1e23          	ldw	x,(OFST+3,sp)
 185  0055 89            	pushw	x
 186  0056 ae0000        	ldw	x,#L54
 187  0059 89            	pushw	x
 188  005a 96            	ldw	x,sp
 189  005b 1c0009        	addw	x,#OFST-23
 190  005e cd0000        	call	_sprintf
 192  0061 5b08          	addw	sp,#8
 193                     ; 253 								SendStrUART(chBufTEMP);
 195  0063 96            	ldw	x,sp
 196  0064 5c            	incw	x
 197  0065 cd0000        	call	_SendStrUART
 200  0068               L74:
 201                     ; 296 						cntOS = 0;
 203  0068 5f            	clrw	x
 204  0069 bf0c          	ldw	_cntOS,x
 205  006b 201a          	jra	L14
 206  006d               L34:
 207                     ; 257 								PWM_SetDuty_Freq(TIM3_PRESCALER_8,100);
 209  006d ae0064        	ldw	x,#100
 210  0070 89            	pushw	x
 211  0071 a603          	ld	a,#3
 212  0073 cd0000        	call	_PWM_SetDuty_Freq
 214  0076 a678          	ld	a,#120
 215  0078 85            	popw	x
 216                     ; 258 								UART2_SendData8('x');
 218  0079 cd0000        	call	_UART2_SendData8
 221  007c               L35:
 222                     ; 259 								while(!UART2_GetFlagStatus(UART2_FLAG_TC));
 224  007c ae0040        	ldw	x,#64
 225  007f cd0000        	call	_UART2_GetFlagStatus
 227  0082 4d            	tnz	a
 228  0083 27f7          	jreq	L35
 229  0085 20e1          	jra	L74
 230  0087               L14:
 231                     ; 298 			flgTrig=0;
 233  0087 3f00          	clr	_flgTrig
 234  0089 2093          	jra	L33
 309                     ; 303 int32 PID_Calc(int32 Inp,int32 Sp)
 309                     ; 304 {
 310                     .text:	section	.text,new
 311  0000               _PID_Calc:
 313  0000 5210          	subw	sp,#16
 314       00000010      OFST:	set	16
 317                     ; 309 	 _Err = Sp - Inp;
 319  0002 96            	ldw	x,sp
 320  0003 1c0017        	addw	x,#OFST+7
 321  0006 cd0000        	call	c_ltor
 323  0009 96            	ldw	x,sp
 324  000a 1c0013        	addw	x,#OFST+3
 325  000d cd0000        	call	c_lsub
 327  0010 96            	ldw	x,sp
 328  0011 1c000d        	addw	x,#OFST-3
 329  0014 cd0000        	call	c_rtol
 331                     ; 310    ErrSum += _Err;
 333  0017 96            	ldw	x,sp
 334  0018 1c000d        	addw	x,#OFST-3
 335  001b cd0000        	call	c_ltor
 337  001e ae0012        	ldw	x,#_ErrSum
 338  0021 cd0000        	call	c_lgadd
 340                     ; 311 	 _ErrDif =  _Err - ErrOld;
 342  0024 96            	ldw	x,sp
 343  0025 1c000d        	addw	x,#OFST-3
 344  0028 cd0000        	call	c_ltor
 346  002b ae000e        	ldw	x,#_ErrOld
 347  002e cd0000        	call	c_lsub
 349  0031 96            	ldw	x,sp
 350  0032 1c0009        	addw	x,#OFST-7
 351  0035 cd0000        	call	c_rtol
 353                     ; 314     _Out =  Kp * _Err + Ki * ErrSum + Kd * _ErrDif;//Kp=1 Ki=0.01  Kd=0.001
 355  0038 be00          	ldw	x,_Kd
 356  003a cd0000        	call	c_itolx
 358  003d 96            	ldw	x,sp
 359  003e 1c0009        	addw	x,#OFST-7
 360  0041 cd0000        	call	c_lmul
 362  0044 96            	ldw	x,sp
 363  0045 1c0005        	addw	x,#OFST-11
 364  0048 cd0000        	call	c_rtol
 366  004b be02          	ldw	x,_Ki
 367  004d cd0000        	call	c_itolx
 369  0050 ae0012        	ldw	x,#_ErrSum
 370  0053 cd0000        	call	c_lmul
 372  0056 96            	ldw	x,sp
 373  0057 5c            	incw	x
 374  0058 cd0000        	call	c_rtol
 376  005b be04          	ldw	x,_Kp
 377  005d cd0000        	call	c_itolx
 379  0060 96            	ldw	x,sp
 380  0061 1c000d        	addw	x,#OFST-3
 381  0064 cd0000        	call	c_lmul
 383  0067 96            	ldw	x,sp
 384  0068 5c            	incw	x
 385  0069 cd0000        	call	c_ladd
 387  006c 96            	ldw	x,sp
 388  006d 1c0005        	addw	x,#OFST-11
 389  0070 cd0000        	call	c_ladd
 391  0073 96            	ldw	x,sp
 392  0074 1c0009        	addw	x,#OFST-7
 393  0077 cd0000        	call	c_rtol
 395                     ; 317    ErrOld = _Err;
 397  007a 1e0f          	ldw	x,(OFST-1,sp)
 398  007c bf10          	ldw	_ErrOld+2,x
 399  007e 1e0d          	ldw	x,(OFST-3,sp)
 400  0080 bf0e          	ldw	_ErrOld,x
 401                     ; 319 	 return _Out;
 403  0082 96            	ldw	x,sp
 404  0083 1c0009        	addw	x,#OFST-7
 405  0086 cd0000        	call	c_ltor
 409  0089 5b10          	addw	sp,#16
 410  008b 81            	ret	
 473                     ; 323 void GetStrUART(char *Data,char *DataUARTbuff, int8_t DataLength)
 473                     ; 324 {
 474                     .text:	section	.text,new
 475  0000               _GetStrUART:
 477  0000 89            	pushw	x
 478  0001 88            	push	a
 479       00000001      OFST:	set	1
 482                     ; 326 	for(i = 0;i<DataLength;i++)
 484  0002 0f01          	clr	(OFST+0,sp)
 486  0004 201a          	jra	L351
 487  0006               L741:
 488                     ; 328 		Data[i]=DataUARTbuff[i];
 490  0006 5f            	clrw	x
 491  0007 4d            	tnz	a
 492  0008 2a01          	jrpl	L25
 493  000a 53            	cplw	x
 494  000b               L25:
 495  000b 97            	ld	xl,a
 496  000c 72fb02        	addw	x,(OFST+1,sp)
 497  000f 905f          	clrw	y
 498  0011 4d            	tnz	a
 499  0012 2a02          	jrpl	L45
 500  0014 9053          	cplw	y
 501  0016               L45:
 502  0016 9097          	ld	yl,a
 503  0018 72f906        	addw	y,(OFST+5,sp)
 504  001b 90f6          	ld	a,(y)
 505  001d f7            	ld	(x),a
 506                     ; 326 	for(i = 0;i<DataLength;i++)
 508  001e 0c01          	inc	(OFST+0,sp)
 509  0020               L351:
 512  0020 7b01          	ld	a,(OFST+0,sp)
 513  0022 1108          	cp	a,(OFST+7,sp)
 514  0024 2fe0          	jrslt	L741
 515                     ; 330 	Data[i]='\0';
 517  0026 5f            	clrw	x
 518  0027 4d            	tnz	a
 519  0028 2a01          	jrpl	L65
 520  002a 53            	cplw	x
 521  002b               L65:
 522  002b 97            	ld	xl,a
 523  002c 72fb02        	addw	x,(OFST+1,sp)
 524                     ; 331 }
 527  002f 5b03          	addw	sp,#3
 528  0031 7f            	clr	(x)
 529  0032 81            	ret	
 575                     ; 333 void SendStrUART(char *Data)
 575                     ; 334 {
 576                     .text:	section	.text,new
 577  0000               _SendStrUART:
 579  0000 89            	pushw	x
 580  0001 88            	push	a
 581       00000001      OFST:	set	1
 584                     ; 335 	char i=0;
 586  0002 0f01          	clr	(OFST+0,sp)
 588  0004 201a          	jra	L502
 589  0006               L102:
 590                     ; 338 				UART2_SendData8(Data[i]);
 592  0006 7b02          	ld	a,(OFST+1,sp)
 593  0008 97            	ld	xl,a
 594  0009 7b03          	ld	a,(OFST+2,sp)
 595  000b 1b01          	add	a,(OFST+0,sp)
 596  000d 2401          	jrnc	L46
 597  000f 5c            	incw	x
 598  0010               L46:
 599  0010 02            	rlwa	x,a
 600  0011 f6            	ld	a,(x)
 601  0012 cd0000        	call	_UART2_SendData8
 604  0015               L312:
 605                     ; 339 				while(!UART2_GetFlagStatus(UART2_FLAG_TC));
 607  0015 ae0040        	ldw	x,#64
 608  0018 cd0000        	call	_UART2_GetFlagStatus
 610  001b 4d            	tnz	a
 611  001c 27f7          	jreq	L312
 612                     ; 340 				i++;
 614  001e 0c01          	inc	(OFST+0,sp)
 615  0020               L502:
 616                     ; 336 	while(Data[i]!='\0')
 618  0020 7b02          	ld	a,(OFST+1,sp)
 619  0022 97            	ld	xl,a
 620  0023 7b03          	ld	a,(OFST+2,sp)
 621  0025 1b01          	add	a,(OFST+0,sp)
 622  0027 2401          	jrnc	L07
 623  0029 5c            	incw	x
 624  002a               L07:
 625  002a 02            	rlwa	x,a
 626  002b f6            	ld	a,(x)
 627  002c 26d8          	jrne	L102
 628                     ; 342 }
 631  002e 5b03          	addw	sp,#3
 632  0030 81            	ret	
 675                     ; 344 uint16_t GetLM35(uint16_t ADC_result )
 675                     ; 345 {
 676                     .text:	section	.text,new
 677  0000               _GetLM35:
 679  0000 89            	pushw	x
 680       00000002      OFST:	set	2
 683                     ; 346 	uint16_t temp = (uint16_t) ADC_result * 5;  //5V input and 10 bits ADC and factor 100 of LM35
 685  0001 90ae0005      	ldw	y,#5
 686  0005 cd0000        	call	c_imul
 688                     ; 347 	return temp;
 692  0008 5b02          	addw	sp,#2
 693  000a 81            	ret	
 718                     ; 350 void CLK_Config(void)
 718                     ; 351 {
 719                     .text:	section	.text,new
 720  0000               _CLK_Config:
 724                     ; 352 	  CLK_HSICmd(ENABLE);
 726  0000 a601          	ld	a,#1
 727  0002 cd0000        	call	_CLK_HSICmd
 729                     ; 355     CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
 731  0005 4f            	clr	a
 733                     ; 356 }
 736  0006 cc0000        	jp	_CLK_HSIPrescalerConfig
 763                     ; 358 void Timer1_Init(void)
 763                     ; 359 {
 764                     .text:	section	.text,new
 765  0000               _Timer1_Init:
 769                     ; 361     TIM1_DeInit();
 771  0000 cd0000        	call	_TIM1_DeInit
 773                     ; 367     TIM1_TimeBaseInit(16000, TIM1_COUNTERMODE_UP, 20, 0);
 775  0003 4b00          	push	#0
 776  0005 ae0014        	ldw	x,#20
 777  0008 89            	pushw	x
 778  0009 4b00          	push	#0
 779  000b ae3e80        	ldw	x,#16000
 780  000e cd0000        	call	_TIM1_TimeBaseInit
 782  0011 5b04          	addw	sp,#4
 783                     ; 369     TIM1_ITConfig(TIM1_IT_UPDATE, ENABLE);
 785  0013 ae0101        	ldw	x,#257
 786  0016 cd0000        	call	_TIM1_ITConfig
 788                     ; 372     TIM1_Cmd(ENABLE);
 790  0019 a601          	ld	a,#1
 792                     ; 373 }
 795  001b cc0000        	jp	_TIM1_Cmd
 822                     ; 377 void Timer3_Init(void)
 822                     ; 378 {
 823                     .text:	section	.text,new
 824  0000               _Timer3_Init:
 828                     ; 380     TIM3_DeInit();
 830  0000 cd0000        	call	_TIM3_DeInit
 832                     ; 382     TIM3_TimeBaseInit(TIM3_PRESCALER_16, 1000);
 834  0003 ae03e8        	ldw	x,#1000
 835  0006 89            	pushw	x
 836  0007 a604          	ld	a,#4
 837  0009 cd0000        	call	_TIM3_TimeBaseInit
 839  000c 85            	popw	x
 840                     ; 388 		TIM3_OC2Init(TIM3_OCMODE_PWM1,TIM3_OUTPUTSTATE_ENABLE,500,TIM3_OCPOLARITY_LOW );
 842  000d 4b22          	push	#34
 843  000f ae01f4        	ldw	x,#500
 844  0012 89            	pushw	x
 845  0013 ae6011        	ldw	x,#24593
 846  0016 cd0000        	call	_TIM3_OC2Init
 848  0019 5b03          	addw	sp,#3
 849                     ; 398     TIM3_Cmd(ENABLE);
 851  001b a601          	ld	a,#1
 853                     ; 399 }
 856  001d cc0000        	jp	_TIM3_Cmd
 882                     ; 401 void ADC_Init(void)
 882                     ; 402 {
 883                     .text:	section	.text,new
 884  0000               _ADC_Init:
 888                     ; 404 		ADC1_DeInit;
 890                     ; 413 		ADC1_Init(ADC1_CONVERSIONMODE_CONTINUOUS, ADC1_CHANNEL_2, ADC1_PRESSEL_FCPU_D4, ADC1_EXTTRIG_TIM, DISABLE, ADC1_ALIGN_RIGHT, ADC1_SCHMITTTRIG_CHANNEL2, DISABLE);
 892  0000 4b00          	push	#0
 893  0002 4b02          	push	#2
 894  0004 4b08          	push	#8
 895  0006 4b00          	push	#0
 896  0008 4b00          	push	#0
 897  000a 4b20          	push	#32
 898  000c ae0102        	ldw	x,#258
 899  000f cd0000        	call	_ADC1_Init
 901  0012 5b06          	addw	sp,#6
 902                     ; 415 		ADC1_Cmd(ENABLE);
 904  0014 a601          	ld	a,#1
 906                     ; 416 }
 909  0016 cc0000        	jp	_ADC1_Cmd
 935                     ; 418 void UART_Init(void)
 935                     ; 419 {
 936                     .text:	section	.text,new
 937  0000               _UART_Init:
 941                     ; 421 		UART2_DeInit();
 943  0000 cd0000        	call	_UART2_DeInit
 945                     ; 429 		UART2_Init((u32)9600, UART2_WORDLENGTH_8D,UART2_STOPBITS_1, UART2_PARITY_NO, UART2_SYNCMODE_CLOCK_DISABLE  ,UART2_MODE_TXRX_ENABLE);
 947  0003 4b0c          	push	#12
 948  0005 4b80          	push	#128
 949  0007 4b00          	push	#0
 950  0009 4b00          	push	#0
 951  000b 4b00          	push	#0
 952  000d ae2580        	ldw	x,#9600
 953  0010 89            	pushw	x
 954  0011 5f            	clrw	x
 955  0012 89            	pushw	x
 956  0013 cd0000        	call	_UART2_Init
 958  0016 5b09          	addw	sp,#9
 959                     ; 431 		UART2_Cmd(ENABLE);
 961  0018 a601          	ld	a,#1
 963                     ; 432 }
 966  001a cc0000        	jp	_UART2_Cmd
 991                     ; 433 void GPIO_Initial(void)
 991                     ; 434 {
 992                     .text:	section	.text,new
 993  0000               _GPIO_Initial:
 997                     ; 436 		GPIO_DeInit(GPIOD);
 999  0000 ae500f        	ldw	x,#20495
1000  0003 cd0000        	call	_GPIO_DeInit
1002                     ; 439 		GPIO_Init(GPIOD, GPIO_PIN_4, GPIO_MODE_OUT_PP_LOW_FAST);
1004  0006 4be0          	push	#224
1005  0008 4b10          	push	#16
1006  000a ae500f        	ldw	x,#20495
1007  000d cd0000        	call	_GPIO_Init
1009  0010 85            	popw	x
1010                     ; 440 }
1013  0011 81            	ret	
1184                     ; 442 void PWM_SetDuty_Freq(TIM3_Prescaler_TypeDef PWM_Freq, int16 PWM_DutyCyle)
1184                     ; 443 {
1185                     .text:	section	.text,new
1186  0000               _PWM_SetDuty_Freq:
1188  0000 88            	push	a
1189       00000000      OFST:	set	0
1192                     ; 444 	if(TIM3_GetPrescaler() != PWM_Freq)
1194  0001 cd0000        	call	_TIM3_GetPrescaler
1196  0004 1101          	cp	a,(OFST+1,sp)
1197  0006 2709          	jreq	L704
1198                     ; 446 		TIM3_PrescalerConfig(PWM_Freq, TIM3_PSCRELOADMODE_IMMEDIATE);
1200  0008 ae0001        	ldw	x,#1
1201  000b 7b01          	ld	a,(OFST+1,sp)
1202  000d 95            	ld	xh,a
1203  000e cd0000        	call	_TIM3_PrescalerConfig
1205  0011               L704:
1206                     ; 448 	TIM3_SetCompare2(PWM_DutyCyle);
1208  0011 1e04          	ldw	x,(OFST+4,sp)
1209  0013 cd0000        	call	_TIM3_SetCompare2
1211                     ; 449 }
1214  0016 84            	pop	a
1215  0017 81            	ret	
1311                     	xdef	_main
1312                     	xdef	_PID_Calc
1313                     	xdef	_GetLM35
1314                     	xdef	_PWM_SetDuty_Freq
1315                     	xdef	_GetStrUART
1316                     	xdef	_SendStrUART
1317                     	xdef	_UART_Init
1318                     	xdef	_ADC_Init
1319                     	xdef	_GPIO_Initial
1320                     	xdef	_Timer3_Init
1321                     	xdef	_Timer1_Init
1322                     	xdef	_CLK_Config
1323                     	switch	.ubsct
1324  0000               _Kd:
1325  0000 0000          	ds.b	2
1326                     	xdef	_Kd
1327  0002               _Ki:
1328  0002 0000          	ds.b	2
1329                     	xdef	_Ki
1330  0004               _Kp:
1331  0004 0000          	ds.b	2
1332                     	xdef	_Kp
1333  0006               _Setpoint:
1334  0006 0000          	ds.b	2
1335                     	xdef	_Setpoint
1336  0008               _Output:
1337  0008 0000          	ds.b	2
1338                     	xdef	_Output
1339  000a               _Input:
1340  000a 0000          	ds.b	2
1341                     	xdef	_Input
1342  000c               _cntOS:
1343  000c 0000          	ds.b	2
1344                     	xdef	_cntOS
1345  000e               _ErrOld:
1346  000e 00000000      	ds.b	4
1347                     	xdef	_ErrOld
1348  0012               _ErrSum:
1349  0012 00000000      	ds.b	4
1350                     	xdef	_ErrSum
1351                     	xref.b	_flgTrig
1352                     	xref	_OneWire_GetTemp
1353                     	xref	_OneWire_Init
1354                     	xref	_Timer2_Init
1355                     	xref	_sprintf
1356                     	xref	_UART2_GetFlagStatus
1357                     	xref	_UART2_SendData8
1358                     	xref	_UART2_Cmd
1359                     	xref	_UART2_Init
1360                     	xref	_UART2_DeInit
1361                     	xref	_TIM3_GetPrescaler
1362                     	xref	_TIM3_SetCompare2
1363                     	xref	_TIM3_PrescalerConfig
1364                     	xref	_TIM3_Cmd
1365                     	xref	_TIM3_OC2Init
1366                     	xref	_TIM3_TimeBaseInit
1367                     	xref	_TIM3_DeInit
1368                     	xref	_TIM1_ITConfig
1369                     	xref	_TIM1_Cmd
1370                     	xref	_TIM1_TimeBaseInit
1371                     	xref	_TIM1_DeInit
1372                     	xref	_GPIO_Init
1373                     	xref	_GPIO_DeInit
1374                     	xref	_CLK_HSIPrescalerConfig
1375                     	xref	_CLK_HSICmd
1376                     	xref	_ADC1_StartConversion
1377                     	xref	_ADC1_Cmd
1378                     	xref	_ADC1_Init
1379                     	xref	_ADC1_DeInit
1380                     .const:	section	.text
1381  0000               L54:
1382  0000 54656d703a20  	dc.b	"Temp: %d (%d.%d)",13
1383  0011 0a00          	dc.b	10,0
1384                     	xref.b	c_x
1404                     	xref	c_ladd
1405                     	xref	c_lmul
1406                     	xref	c_itolx
1407                     	xref	c_lgadd
1408                     	xref	c_rtol
1409                     	xref	c_lsub
1410                     	xref	c_ltor
1411                     	xref	c_imul
1412                     	end
