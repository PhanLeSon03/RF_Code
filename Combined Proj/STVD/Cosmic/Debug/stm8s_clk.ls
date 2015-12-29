   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
   4                     ; Optimizer V4.3.6 - 29 Nov 2011
  20                     .const:	section	.text
  21  0000               _HSIDivFactor:
  22  0000 01            	dc.b	1
  23  0001 02            	dc.b	2
  24  0002 04            	dc.b	4
  25  0003 08            	dc.b	8
  26  0004               _CLKPrescTable:
  27  0004 01            	dc.b	1
  28  0005 02            	dc.b	2
  29  0006 04            	dc.b	4
  30  0007 08            	dc.b	8
  31  0008 0a            	dc.b	10
  32  0009 10            	dc.b	16
  33  000a 14            	dc.b	20
  34  000b 28            	dc.b	40
  63                     ; 66 void CLK_DeInit(void)
  63                     ; 67 {
  65                     .text:	section	.text,new
  66  0000               _CLK_DeInit:
  70                     ; 69     CLK->ICKR = CLK_ICKR_RESET_VALUE;
  72  0000 350150c0      	mov	20672,#1
  73                     ; 70     CLK->ECKR = CLK_ECKR_RESET_VALUE;
  75  0004 725f50c1      	clr	20673
  76                     ; 71     CLK->SWR  = CLK_SWR_RESET_VALUE;
  78  0008 35e150c4      	mov	20676,#225
  79                     ; 72     CLK->SWCR = CLK_SWCR_RESET_VALUE;
  81  000c 725f50c5      	clr	20677
  82                     ; 73     CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
  84  0010 351850c6      	mov	20678,#24
  85                     ; 74     CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
  87  0014 35ff50c7      	mov	20679,#255
  88                     ; 75     CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
  90  0018 35ff50ca      	mov	20682,#255
  91                     ; 76     CLK->CSSR = CLK_CSSR_RESET_VALUE;
  93  001c 725f50c8      	clr	20680
  94                     ; 77     CLK->CCOR = CLK_CCOR_RESET_VALUE;
  96  0020 725f50c9      	clr	20681
  98  0024               L52:
  99                     ; 78     while ((CLK->CCOR & CLK_CCOR_CCOEN)!= 0)
 101  0024 720050c9fb    	btjt	20681,#0,L52
 102                     ; 80     CLK->CCOR = CLK_CCOR_RESET_VALUE;
 104  0029 725f50c9      	clr	20681
 105                     ; 81     CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
 107  002d 725f50cc      	clr	20684
 108                     ; 82     CLK->SWIMCCR = CLK_SWIMCCR_RESET_VALUE;
 110  0031 725f50cd      	clr	20685
 111                     ; 84 }
 114  0035 81            	ret	
 170                     ; 95 void CLK_FastHaltWakeUpCmd(FunctionalState NewState)
 170                     ; 96 {
 171                     .text:	section	.text,new
 172  0000               _CLK_FastHaltWakeUpCmd:
 176                     ; 99     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 178                     ; 101     if (NewState != DISABLE)
 180  0000 4d            	tnz	a
 181  0001 2705          	jreq	L75
 182                     ; 104         CLK->ICKR |= CLK_ICKR_FHWU;
 184  0003 721450c0      	bset	20672,#2
 187  0007 81            	ret	
 188  0008               L75:
 189                     ; 109         CLK->ICKR &= (uint8_t)(~CLK_ICKR_FHWU);
 191  0008 721550c0      	bres	20672,#2
 192                     ; 112 }
 195  000c 81            	ret	
 230                     ; 119 void CLK_HSECmd(FunctionalState NewState)
 230                     ; 120 {
 231                     .text:	section	.text,new
 232  0000               _CLK_HSECmd:
 236                     ; 123     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 238                     ; 125     if (NewState != DISABLE)
 240  0000 4d            	tnz	a
 241  0001 2705          	jreq	L101
 242                     ; 128         CLK->ECKR |= CLK_ECKR_HSEEN;
 244  0003 721050c1      	bset	20673,#0
 247  0007 81            	ret	
 248  0008               L101:
 249                     ; 133         CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
 251  0008 721150c1      	bres	20673,#0
 252                     ; 136 }
 255  000c 81            	ret	
 290                     ; 143 void CLK_HSICmd(FunctionalState NewState)
 290                     ; 144 {
 291                     .text:	section	.text,new
 292  0000               _CLK_HSICmd:
 296                     ; 147     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 298                     ; 149     if (NewState != DISABLE)
 300  0000 4d            	tnz	a
 301  0001 2705          	jreq	L321
 302                     ; 152         CLK->ICKR |= CLK_ICKR_HSIEN;
 304  0003 721050c0      	bset	20672,#0
 307  0007 81            	ret	
 308  0008               L321:
 309                     ; 157         CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
 311  0008 721150c0      	bres	20672,#0
 312                     ; 160 }
 315  000c 81            	ret	
 350                     ; 167 void CLK_LSICmd(FunctionalState NewState)
 350                     ; 168 {
 351                     .text:	section	.text,new
 352  0000               _CLK_LSICmd:
 356                     ; 171     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 358                     ; 173     if (NewState != DISABLE)
 360  0000 4d            	tnz	a
 361  0001 2705          	jreq	L541
 362                     ; 176         CLK->ICKR |= CLK_ICKR_LSIEN;
 364  0003 721650c0      	bset	20672,#3
 367  0007 81            	ret	
 368  0008               L541:
 369                     ; 181         CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
 371  0008 721750c0      	bres	20672,#3
 372                     ; 184 }
 375  000c 81            	ret	
 410                     ; 192 void CLK_CCOCmd(FunctionalState NewState)
 410                     ; 193 {
 411                     .text:	section	.text,new
 412  0000               _CLK_CCOCmd:
 416                     ; 196     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 418                     ; 198     if (NewState != DISABLE)
 420  0000 4d            	tnz	a
 421  0001 2705          	jreq	L761
 422                     ; 201         CLK->CCOR |= CLK_CCOR_CCOEN;
 424  0003 721050c9      	bset	20681,#0
 427  0007 81            	ret	
 428  0008               L761:
 429                     ; 206         CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOEN);
 431  0008 721150c9      	bres	20681,#0
 432                     ; 209 }
 435  000c 81            	ret	
 470                     ; 218 void CLK_ClockSwitchCmd(FunctionalState NewState)
 470                     ; 219 {
 471                     .text:	section	.text,new
 472  0000               _CLK_ClockSwitchCmd:
 476                     ; 222     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 478                     ; 224     if (NewState != DISABLE )
 480  0000 4d            	tnz	a
 481  0001 2705          	jreq	L112
 482                     ; 227         CLK->SWCR |= CLK_SWCR_SWEN;
 484  0003 721250c5      	bset	20677,#1
 487  0007 81            	ret	
 488  0008               L112:
 489                     ; 232         CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWEN);
 491  0008 721350c5      	bres	20677,#1
 492                     ; 235 }
 495  000c 81            	ret	
 531                     ; 245 void CLK_SlowActiveHaltWakeUpCmd(FunctionalState NewState)
 531                     ; 246 {
 532                     .text:	section	.text,new
 533  0000               _CLK_SlowActiveHaltWakeUpCmd:
 537                     ; 249     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 539                     ; 251     if (NewState != DISABLE)
 541  0000 4d            	tnz	a
 542  0001 2705          	jreq	L332
 543                     ; 254         CLK->ICKR |= CLK_ICKR_SWUAH;
 545  0003 721a50c0      	bset	20672,#5
 548  0007 81            	ret	
 549  0008               L332:
 550                     ; 259         CLK->ICKR &= (uint8_t)(~CLK_ICKR_SWUAH);
 552  0008 721b50c0      	bres	20672,#5
 553                     ; 262 }
 556  000c 81            	ret	
 715                     ; 272 void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
 715                     ; 273 {
 716                     .text:	section	.text,new
 717  0000               _CLK_PeripheralClockConfig:
 719  0000 89            	pushw	x
 720       00000000      OFST:	set	0
 723                     ; 276     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 725                     ; 277     assert_param(IS_CLK_PERIPHERAL_OK(CLK_Peripheral));
 727                     ; 279     if (((uint8_t)CLK_Peripheral & (uint8_t)0x10) == 0x00)
 729  0001 9e            	ld	a,xh
 730  0002 a510          	bcp	a,#16
 731  0004 2626          	jrne	L123
 732                     ; 281         if (NewState != DISABLE)
 734  0006 7b02          	ld	a,(OFST+2,sp)
 735  0008 270f          	jreq	L323
 736                     ; 284             CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
 738  000a 7b01          	ld	a,(OFST+1,sp)
 739  000c ad44          	call	LC003
 740  000e 2704          	jreq	L62
 741  0010               L03:
 742  0010 48            	sll	a
 743  0011 5a            	decw	x
 744  0012 26fc          	jrne	L03
 745  0014               L62:
 746  0014 ca50c7        	or	a,20679
 748  0017 200e          	jp	LC002
 749  0019               L323:
 750                     ; 289             CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
 752  0019 7b01          	ld	a,(OFST+1,sp)
 753  001b ad35          	call	LC003
 754  001d 2704          	jreq	L23
 755  001f               L43:
 756  001f 48            	sll	a
 757  0020 5a            	decw	x
 758  0021 26fc          	jrne	L43
 759  0023               L23:
 760  0023 43            	cpl	a
 761  0024 c450c7        	and	a,20679
 762  0027               LC002:
 763  0027 c750c7        	ld	20679,a
 764  002a 2024          	jra	L723
 765  002c               L123:
 766                     ; 294         if (NewState != DISABLE)
 768  002c 7b02          	ld	a,(OFST+2,sp)
 769  002e 270f          	jreq	L133
 770                     ; 297             CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
 772  0030 7b01          	ld	a,(OFST+1,sp)
 773  0032 ad1e          	call	LC003
 774  0034 2704          	jreq	L63
 775  0036               L04:
 776  0036 48            	sll	a
 777  0037 5a            	decw	x
 778  0038 26fc          	jrne	L04
 779  003a               L63:
 780  003a ca50ca        	or	a,20682
 782  003d 200e          	jp	LC001
 783  003f               L133:
 784                     ; 302             CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
 786  003f 7b01          	ld	a,(OFST+1,sp)
 787  0041 ad0f          	call	LC003
 788  0043 2704          	jreq	L24
 789  0045               L44:
 790  0045 48            	sll	a
 791  0046 5a            	decw	x
 792  0047 26fc          	jrne	L44
 793  0049               L24:
 794  0049 43            	cpl	a
 795  004a c450ca        	and	a,20682
 796  004d               LC001:
 797  004d c750ca        	ld	20682,a
 798  0050               L723:
 799                     ; 306 }
 802  0050 85            	popw	x
 803  0051 81            	ret	
 804  0052               LC003:
 805  0052 a40f          	and	a,#15
 806  0054 5f            	clrw	x
 807  0055 97            	ld	xl,a
 808  0056 a601          	ld	a,#1
 809  0058 5d            	tnzw	x
 810  0059 81            	ret	
 998                     ; 319 ErrorStatus CLK_ClockSwitchConfig(CLK_SwitchMode_TypeDef CLK_SwitchMode, CLK_Source_TypeDef CLK_NewClock, FunctionalState ITState, CLK_CurrentClockState_TypeDef CLK_CurrentClockState)
 998                     ; 320 {
 999                     .text:	section	.text,new
1000  0000               _CLK_ClockSwitchConfig:
1002  0000 89            	pushw	x
1003  0001 5204          	subw	sp,#4
1004       00000004      OFST:	set	4
1007                     ; 323     uint16_t DownCounter = CLK_TIMEOUT;
1009  0003 ae0491        	ldw	x,#1169
1010  0006 1f03          	ldw	(OFST-1,sp),x
1011                     ; 324     ErrorStatus Swif = ERROR;
1013                     ; 327     assert_param(IS_CLK_SOURCE_OK(CLK_NewClock));
1015                     ; 328     assert_param(IS_CLK_SWITCHMODE_OK(CLK_SwitchMode));
1017                     ; 329     assert_param(IS_FUNCTIONALSTATE_OK(ITState));
1019                     ; 330     assert_param(IS_CLK_CURRENTCLOCKSTATE_OK(CLK_CurrentClockState));
1021                     ; 333     clock_master = (CLK_Source_TypeDef)CLK->CMSR;
1023  0008 c650c3        	ld	a,20675
1024  000b 6b01          	ld	(OFST-3,sp),a
1025                     ; 336     if (CLK_SwitchMode == CLK_SWITCHMODE_AUTO)
1027  000d 7b05          	ld	a,(OFST+1,sp)
1028  000f 4a            	dec	a
1029  0010 262d          	jrne	L544
1030                     ; 340         CLK->SWCR |= CLK_SWCR_SWEN;
1032  0012 721250c5      	bset	20677,#1
1033                     ; 343         if (ITState != DISABLE)
1035  0016 7b09          	ld	a,(OFST+5,sp)
1036  0018 2706          	jreq	L744
1037                     ; 345             CLK->SWCR |= CLK_SWCR_SWIEN;
1039  001a 721450c5      	bset	20677,#2
1041  001e 2004          	jra	L154
1042  0020               L744:
1043                     ; 349             CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
1045  0020 721550c5      	bres	20677,#2
1046  0024               L154:
1047                     ; 353         CLK->SWR = (uint8_t)CLK_NewClock;
1049  0024 7b06          	ld	a,(OFST+2,sp)
1050  0026 c750c4        	ld	20676,a
1052  0029 2003          	jra	L754
1053  002b               L354:
1054                     ; 357             DownCounter--;
1056  002b 5a            	decw	x
1057  002c 1f03          	ldw	(OFST-1,sp),x
1058  002e               L754:
1059                     ; 355         while ((((CLK->SWCR & CLK_SWCR_SWBSY) != 0 )&& (DownCounter != 0)))
1061  002e 720150c504    	btjf	20677,#0,L364
1063  0033 1e03          	ldw	x,(OFST-1,sp)
1064  0035 26f4          	jrne	L354
1065  0037               L364:
1066                     ; 360         if (DownCounter != 0)
1068  0037 1e03          	ldw	x,(OFST-1,sp)
1069                     ; 362             Swif = SUCCESS;
1071  0039 2617          	jrne	LC004
1072                     ; 366             Swif = ERROR;
1074  003b 0f02          	clr	(OFST-2,sp)
1075  003d 2017          	jra	L174
1076  003f               L544:
1077                     ; 374         if (ITState != DISABLE)
1079  003f 7b09          	ld	a,(OFST+5,sp)
1080  0041 2706          	jreq	L374
1081                     ; 376             CLK->SWCR |= CLK_SWCR_SWIEN;
1083  0043 721450c5      	bset	20677,#2
1085  0047 2004          	jra	L574
1086  0049               L374:
1087                     ; 380             CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
1089  0049 721550c5      	bres	20677,#2
1090  004d               L574:
1091                     ; 384         CLK->SWR = (uint8_t)CLK_NewClock;
1093  004d 7b06          	ld	a,(OFST+2,sp)
1094  004f c750c4        	ld	20676,a
1095                     ; 388         Swif = SUCCESS;
1097  0052               LC004:
1099  0052 a601          	ld	a,#1
1100  0054 6b02          	ld	(OFST-2,sp),a
1101  0056               L174:
1102                     ; 393     if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSI))
1104  0056 7b0a          	ld	a,(OFST+6,sp)
1105  0058 260c          	jrne	L774
1107  005a 7b01          	ld	a,(OFST-3,sp)
1108  005c a1e1          	cp	a,#225
1109  005e 2606          	jrne	L774
1110                     ; 395         CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
1112  0060 721150c0      	bres	20672,#0
1114  0064 201e          	jra	L105
1115  0066               L774:
1116                     ; 397     else if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_LSI))
1118  0066 7b0a          	ld	a,(OFST+6,sp)
1119  0068 260c          	jrne	L305
1121  006a 7b01          	ld	a,(OFST-3,sp)
1122  006c a1d2          	cp	a,#210
1123  006e 2606          	jrne	L305
1124                     ; 399         CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
1126  0070 721750c0      	bres	20672,#3
1128  0074 200e          	jra	L105
1129  0076               L305:
1130                     ; 401     else if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSE))
1132  0076 7b0a          	ld	a,(OFST+6,sp)
1133  0078 260a          	jrne	L105
1135  007a 7b01          	ld	a,(OFST-3,sp)
1136  007c a1b4          	cp	a,#180
1137  007e 2604          	jrne	L105
1138                     ; 403         CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
1140  0080 721150c1      	bres	20673,#0
1141  0084               L105:
1142                     ; 406     return(Swif);
1144  0084 7b02          	ld	a,(OFST-2,sp)
1147  0086 5b06          	addw	sp,#6
1148  0088 81            	ret	
1286                     ; 416 void CLK_HSIPrescalerConfig(CLK_Prescaler_TypeDef HSIPrescaler)
1286                     ; 417 {
1287                     .text:	section	.text,new
1288  0000               _CLK_HSIPrescalerConfig:
1290  0000 88            	push	a
1291       00000000      OFST:	set	0
1294                     ; 420     assert_param(IS_CLK_HSIPRESCALER_OK(HSIPrescaler));
1296                     ; 423     CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
1298  0001 c650c6        	ld	a,20678
1299  0004 a4e7          	and	a,#231
1300  0006 c750c6        	ld	20678,a
1301                     ; 426     CLK->CKDIVR |= (uint8_t)HSIPrescaler;
1303  0009 c650c6        	ld	a,20678
1304  000c 1a01          	or	a,(OFST+1,sp)
1305  000e c750c6        	ld	20678,a
1306                     ; 428 }
1309  0011 84            	pop	a
1310  0012 81            	ret	
1445                     ; 439 void CLK_CCOConfig(CLK_Output_TypeDef CLK_CCO)
1445                     ; 440 {
1446                     .text:	section	.text,new
1447  0000               _CLK_CCOConfig:
1449  0000 88            	push	a
1450       00000000      OFST:	set	0
1453                     ; 443     assert_param(IS_CLK_OUTPUT_OK(CLK_CCO));
1455                     ; 446     CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOSEL);
1457  0001 c650c9        	ld	a,20681
1458  0004 a4e1          	and	a,#225
1459  0006 c750c9        	ld	20681,a
1460                     ; 449     CLK->CCOR |= (uint8_t)CLK_CCO;
1462  0009 c650c9        	ld	a,20681
1463  000c 1a01          	or	a,(OFST+1,sp)
1464  000e c750c9        	ld	20681,a
1465                     ; 452     CLK->CCOR |= CLK_CCOR_CCOEN;
1467                     ; 454 }
1470  0011 84            	pop	a
1471  0012 721050c9      	bset	20681,#0
1472  0016 81            	ret	
1537                     ; 464 void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState NewState)
1537                     ; 465 {
1538                     .text:	section	.text,new
1539  0000               _CLK_ITConfig:
1541  0000 89            	pushw	x
1542       00000000      OFST:	set	0
1545                     ; 468     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1547                     ; 469     assert_param(IS_CLK_IT_OK(CLK_IT));
1549                     ; 471     if (NewState != DISABLE)
1551  0001 9f            	ld	a,xl
1552  0002 4d            	tnz	a
1553  0003 2715          	jreq	L507
1554                     ; 473         switch (CLK_IT)
1556  0005 9e            	ld	a,xh
1558                     ; 481         default:
1558                     ; 482             break;
1559  0006 a00c          	sub	a,#12
1560  0008 270a          	jreq	L146
1561  000a a010          	sub	a,#16
1562  000c 2620          	jrne	L317
1563                     ; 475         case CLK_IT_SWIF: /* Enable the clock switch interrupt */
1563                     ; 476             CLK->SWCR |= CLK_SWCR_SWIEN;
1565  000e 721450c5      	bset	20677,#2
1566                     ; 477             break;
1568  0012 201a          	jra	L317
1569  0014               L146:
1570                     ; 478         case CLK_IT_CSSD: /* Enable the clock security system detection interrupt */
1570                     ; 479             CLK->CSSR |= CLK_CSSR_CSSDIE;
1572  0014 721450c8      	bset	20680,#2
1573                     ; 480             break;
1575  0018 2014          	jra	L317
1576                     ; 481         default:
1576                     ; 482             break;
1579  001a               L507:
1580                     ; 487         switch (CLK_IT)
1582  001a 7b01          	ld	a,(OFST+1,sp)
1584                     ; 495         default:
1584                     ; 496             break;
1585  001c a00c          	sub	a,#12
1586  001e 270a          	jreq	L746
1587  0020 a010          	sub	a,#16
1588  0022 260a          	jrne	L317
1589                     ; 489         case CLK_IT_SWIF: /* Disable the clock switch interrupt */
1589                     ; 490             CLK->SWCR  &= (uint8_t)(~CLK_SWCR_SWIEN);
1591  0024 721550c5      	bres	20677,#2
1592                     ; 491             break;
1594  0028 2004          	jra	L317
1595  002a               L746:
1596                     ; 492         case CLK_IT_CSSD: /* Disable the clock security system detection interrupt */
1596                     ; 493             CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDIE);
1598  002a 721550c8      	bres	20680,#2
1599                     ; 494             break;
1600  002e               L317:
1601                     ; 500 }
1604  002e 85            	popw	x
1605  002f 81            	ret	
1606                     ; 495         default:
1606                     ; 496             break;
1642                     ; 507 void CLK_SYSCLKConfig(CLK_Prescaler_TypeDef CLK_Prescaler)
1642                     ; 508 {
1643                     .text:	section	.text,new
1644  0000               _CLK_SYSCLKConfig:
1646  0000 88            	push	a
1647       00000000      OFST:	set	0
1650                     ; 511     assert_param(IS_CLK_PRESCALER_OK(CLK_Prescaler));
1652                     ; 513     if (((uint8_t)CLK_Prescaler & (uint8_t)0x80) == 0x00) /* Bit7 = 0 means HSI divider */
1654  0001 a580          	bcp	a,#128
1655  0003 260e          	jrne	L737
1656                     ; 515         CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
1658  0005 c650c6        	ld	a,20678
1659  0008 a4e7          	and	a,#231
1660  000a c750c6        	ld	20678,a
1661                     ; 516         CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_HSIDIV);
1663  000d 7b01          	ld	a,(OFST+1,sp)
1664  000f a418          	and	a,#24
1666  0011 200c          	jra	L147
1667  0013               L737:
1668                     ; 520         CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_CPUDIV);
1670  0013 c650c6        	ld	a,20678
1671  0016 a4f8          	and	a,#248
1672  0018 c750c6        	ld	20678,a
1673                     ; 521         CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_CPUDIV);
1675  001b 7b01          	ld	a,(OFST+1,sp)
1676  001d a407          	and	a,#7
1677  001f               L147:
1678  001f ca50c6        	or	a,20678
1679  0022 c750c6        	ld	20678,a
1680                     ; 524 }
1683  0025 84            	pop	a
1684  0026 81            	ret	
1740                     ; 531 void CLK_SWIMConfig(CLK_SWIMDivider_TypeDef CLK_SWIMDivider)
1740                     ; 532 {
1741                     .text:	section	.text,new
1742  0000               _CLK_SWIMConfig:
1746                     ; 535     assert_param(IS_CLK_SWIMDIVIDER_OK(CLK_SWIMDivider));
1748                     ; 537     if (CLK_SWIMDivider != CLK_SWIMDIVIDER_2)
1750  0000 4d            	tnz	a
1751  0001 2705          	jreq	L177
1752                     ; 540         CLK->SWIMCCR |= CLK_SWIMCCR_SWIMDIV;
1754  0003 721050cd      	bset	20685,#0
1757  0007 81            	ret	
1758  0008               L177:
1759                     ; 545         CLK->SWIMCCR &= (uint8_t)(~CLK_SWIMCCR_SWIMDIV);
1761  0008 721150cd      	bres	20685,#0
1762                     ; 548 }
1765  000c 81            	ret	
1789                     ; 557 void CLK_ClockSecuritySystemEnable(void)
1789                     ; 558 {
1790                     .text:	section	.text,new
1791  0000               _CLK_ClockSecuritySystemEnable:
1795                     ; 560     CLK->CSSR |= CLK_CSSR_CSSEN;
1797  0000 721050c8      	bset	20680,#0
1798                     ; 561 }
1801  0004 81            	ret	
1826                     ; 569 CLK_Source_TypeDef CLK_GetSYSCLKSource(void)
1826                     ; 570 {
1827                     .text:	section	.text,new
1828  0000               _CLK_GetSYSCLKSource:
1832                     ; 571     return((CLK_Source_TypeDef)CLK->CMSR);
1834  0000 c650c3        	ld	a,20675
1837  0003 81            	ret	
1900                     ; 579 uint32_t CLK_GetClockFreq(void)
1900                     ; 580 {
1901                     .text:	section	.text,new
1902  0000               _CLK_GetClockFreq:
1904  0000 5209          	subw	sp,#9
1905       00000009      OFST:	set	9
1908                     ; 582     uint32_t clockfrequency = 0;
1910                     ; 583     CLK_Source_TypeDef clocksource = CLK_SOURCE_HSI;
1912                     ; 584     uint8_t tmp = 0, presc = 0;
1916                     ; 587     clocksource = (CLK_Source_TypeDef)CLK->CMSR;
1918  0002 c650c3        	ld	a,20675
1919  0005 6b09          	ld	(OFST+0,sp),a
1920                     ; 589     if (clocksource == CLK_SOURCE_HSI)
1922  0007 a1e1          	cp	a,#225
1923  0009 2634          	jrne	L7401
1924                     ; 591         tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_HSIDIV);
1926  000b c650c6        	ld	a,20678
1927  000e a418          	and	a,#24
1928  0010 44            	srl	a
1929  0011 44            	srl	a
1930  0012 44            	srl	a
1931                     ; 592         tmp = (uint8_t)(tmp >> 3);
1933                     ; 593         presc = HSIDivFactor[tmp];
1935  0013 5f            	clrw	x
1936  0014 97            	ld	xl,a
1937  0015 d60000        	ld	a,(_HSIDivFactor,x)
1938  0018 6b09          	ld	(OFST+0,sp),a
1939                     ; 594         clockfrequency = HSI_VALUE / presc;
1941  001a b703          	ld	c_lreg+3,a
1942  001c 3f02          	clr	c_lreg+2
1943  001e 3f01          	clr	c_lreg+1
1944  0020 3f00          	clr	c_lreg
1945  0022 96            	ldw	x,sp
1946  0023 5c            	incw	x
1947  0024 cd0000        	call	c_rtol
1949  0027 ae2400        	ldw	x,#9216
1950  002a bf02          	ldw	c_lreg+2,x
1951  002c ae00f4        	ldw	x,#244
1952  002f bf00          	ldw	c_lreg,x
1953  0031 96            	ldw	x,sp
1954  0032 5c            	incw	x
1955  0033 cd0000        	call	c_ludv
1957  0036 96            	ldw	x,sp
1958  0037 1c0005        	addw	x,#OFST-4
1959  003a cd0000        	call	c_rtol
1962  003d 2018          	jra	L1501
1963  003f               L7401:
1964                     ; 596     else if ( clocksource == CLK_SOURCE_LSI)
1966  003f a1d2          	cp	a,#210
1967  0041 260a          	jrne	L3501
1968                     ; 598         clockfrequency = LSI_VALUE;
1970  0043 aef400        	ldw	x,#62464
1971  0046 1f07          	ldw	(OFST-2,sp),x
1972  0048 ae0001        	ldw	x,#1
1974  004b 2008          	jp	LC005
1975  004d               L3501:
1976                     ; 602         clockfrequency = HSE_VALUE;
1978  004d ae2400        	ldw	x,#9216
1979  0050 1f07          	ldw	(OFST-2,sp),x
1980  0052 ae00f4        	ldw	x,#244
1981  0055               LC005:
1982  0055 1f05          	ldw	(OFST-4,sp),x
1983  0057               L1501:
1984                     ; 605     return((uint32_t)clockfrequency);
1986  0057 96            	ldw	x,sp
1987  0058 1c0005        	addw	x,#OFST-4
1988  005b cd0000        	call	c_ltor
1992  005e 5b09          	addw	sp,#9
1993  0060 81            	ret	
2092                     ; 616 void CLK_AdjustHSICalibrationValue(CLK_HSITrimValue_TypeDef CLK_HSICalibrationValue)
2092                     ; 617 {
2093                     .text:	section	.text,new
2094  0000               _CLK_AdjustHSICalibrationValue:
2096  0000 88            	push	a
2097       00000000      OFST:	set	0
2100                     ; 620     assert_param(IS_CLK_HSITRIMVALUE_OK(CLK_HSICalibrationValue));
2102                     ; 623     CLK->HSITRIMR = (uint8_t)( (uint8_t)(CLK->HSITRIMR & (uint8_t)(~CLK_HSITRIMR_HSITRIM))|((uint8_t)CLK_HSICalibrationValue));
2104  0001 c650cc        	ld	a,20684
2105  0004 a4f8          	and	a,#248
2106  0006 1a01          	or	a,(OFST+1,sp)
2107  0008 c750cc        	ld	20684,a
2108                     ; 625 }
2111  000b 84            	pop	a
2112  000c 81            	ret	
2136                     ; 636 void CLK_SYSCLKEmergencyClear(void)
2136                     ; 637 {
2137                     .text:	section	.text,new
2138  0000               _CLK_SYSCLKEmergencyClear:
2142                     ; 638     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWBSY);
2144  0000 721150c5      	bres	20677,#0
2145                     ; 639 }
2148  0004 81            	ret	
2301                     ; 648 FlagStatus CLK_GetFlagStatus(CLK_Flag_TypeDef CLK_FLAG)
2301                     ; 649 {
2302                     .text:	section	.text,new
2303  0000               _CLK_GetFlagStatus:
2305  0000 89            	pushw	x
2306  0001 5203          	subw	sp,#3
2307       00000003      OFST:	set	3
2310                     ; 651     uint16_t statusreg = 0;
2312                     ; 652     uint8_t tmpreg = 0;
2314                     ; 653     FlagStatus bitstatus = RESET;
2316                     ; 656     assert_param(IS_CLK_FLAG_OK(CLK_FLAG));
2318                     ; 659     statusreg = (uint16_t)((uint16_t)CLK_FLAG & (uint16_t)0xFF00);
2320  0003 01            	rrwa	x,a
2321  0004 4f            	clr	a
2322  0005 02            	rlwa	x,a
2323  0006 1f01          	ldw	(OFST-2,sp),x
2324                     ; 662     if (statusreg == 0x0100) /* The flag to check is in ICKRregister */
2326  0008 a30100        	cpw	x,#256
2327  000b 2605          	jrne	L1221
2328                     ; 664         tmpreg = CLK->ICKR;
2330  000d c650c0        	ld	a,20672
2332  0010 2021          	jra	L3221
2333  0012               L1221:
2334                     ; 666     else if (statusreg == 0x0200) /* The flag to check is in ECKRregister */
2336  0012 a30200        	cpw	x,#512
2337  0015 2605          	jrne	L5221
2338                     ; 668         tmpreg = CLK->ECKR;
2340  0017 c650c1        	ld	a,20673
2342  001a 2017          	jra	L3221
2343  001c               L5221:
2344                     ; 670     else if (statusreg == 0x0300) /* The flag to check is in SWIC register */
2346  001c a30300        	cpw	x,#768
2347  001f 2605          	jrne	L1321
2348                     ; 672         tmpreg = CLK->SWCR;
2350  0021 c650c5        	ld	a,20677
2352  0024 200d          	jra	L3221
2353  0026               L1321:
2354                     ; 674     else if (statusreg == 0x0400) /* The flag to check is in CSS register */
2356  0026 a30400        	cpw	x,#1024
2357  0029 2605          	jrne	L5321
2358                     ; 676         tmpreg = CLK->CSSR;
2360  002b c650c8        	ld	a,20680
2362  002e 2003          	jra	L3221
2363  0030               L5321:
2364                     ; 680         tmpreg = CLK->CCOR;
2366  0030 c650c9        	ld	a,20681
2367  0033               L3221:
2368  0033 6b03          	ld	(OFST+0,sp),a
2369                     ; 683     if ((tmpreg & (uint8_t)CLK_FLAG) != (uint8_t)RESET)
2371  0035 7b05          	ld	a,(OFST+2,sp)
2372  0037 1503          	bcp	a,(OFST+0,sp)
2373  0039 2704          	jreq	L1421
2374                     ; 685         bitstatus = SET;
2376  003b a601          	ld	a,#1
2378  003d 2001          	jra	L3421
2379  003f               L1421:
2380                     ; 689         bitstatus = RESET;
2382  003f 4f            	clr	a
2383  0040               L3421:
2384                     ; 693     return((FlagStatus)bitstatus);
2388  0040 5b05          	addw	sp,#5
2389  0042 81            	ret	
2435                     ; 703 ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
2435                     ; 704 {
2436                     .text:	section	.text,new
2437  0000               _CLK_GetITStatus:
2439  0000 88            	push	a
2440  0001 88            	push	a
2441       00000001      OFST:	set	1
2444                     ; 706     ITStatus bitstatus = RESET;
2446                     ; 709     assert_param(IS_CLK_IT_OK(CLK_IT));
2448                     ; 711     if (CLK_IT == CLK_IT_SWIF)
2450  0002 a11c          	cp	a,#28
2451  0004 2609          	jrne	L7621
2452                     ; 714         if ((CLK->SWCR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2454  0006 c450c5        	and	a,20677
2455  0009 a10c          	cp	a,#12
2456  000b 260f          	jrne	L7721
2457                     ; 716             bitstatus = SET;
2459  000d 2009          	jp	LC007
2460                     ; 720             bitstatus = RESET;
2461  000f               L7621:
2462                     ; 726         if ((CLK->CSSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2464  000f c650c8        	ld	a,20680
2465  0012 1402          	and	a,(OFST+1,sp)
2466  0014 a10c          	cp	a,#12
2467  0016 2604          	jrne	L7721
2468                     ; 728             bitstatus = SET;
2470  0018               LC007:
2472  0018 a601          	ld	a,#1
2474  001a 2001          	jra	L5721
2475  001c               L7721:
2476                     ; 732             bitstatus = RESET;
2479  001c 4f            	clr	a
2480  001d               L5721:
2481                     ; 737     return bitstatus;
2485  001d 85            	popw	x
2486  001e 81            	ret	
2522                     ; 747 void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
2522                     ; 748 {
2523                     .text:	section	.text,new
2524  0000               _CLK_ClearITPendingBit:
2528                     ; 751     assert_param(IS_CLK_IT_OK(CLK_IT));
2530                     ; 753     if (CLK_IT == (uint8_t)CLK_IT_CSSD)
2532  0000 a10c          	cp	a,#12
2533  0002 2605          	jrne	L1231
2534                     ; 756         CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSD);
2536  0004 721750c8      	bres	20680,#3
2539  0008 81            	ret	
2540  0009               L1231:
2541                     ; 761         CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIF);
2543  0009 721750c5      	bres	20677,#3
2544                     ; 764 }
2547  000d 81            	ret	
2582                     	xdef	_CLKPrescTable
2583                     	xdef	_HSIDivFactor
2584                     	xdef	_CLK_ClearITPendingBit
2585                     	xdef	_CLK_GetITStatus
2586                     	xdef	_CLK_GetFlagStatus
2587                     	xdef	_CLK_GetSYSCLKSource
2588                     	xdef	_CLK_GetClockFreq
2589                     	xdef	_CLK_AdjustHSICalibrationValue
2590                     	xdef	_CLK_SYSCLKEmergencyClear
2591                     	xdef	_CLK_ClockSecuritySystemEnable
2592                     	xdef	_CLK_SWIMConfig
2593                     	xdef	_CLK_SYSCLKConfig
2594                     	xdef	_CLK_ITConfig
2595                     	xdef	_CLK_CCOConfig
2596                     	xdef	_CLK_HSIPrescalerConfig
2597                     	xdef	_CLK_ClockSwitchConfig
2598                     	xdef	_CLK_PeripheralClockConfig
2599                     	xdef	_CLK_SlowActiveHaltWakeUpCmd
2600                     	xdef	_CLK_FastHaltWakeUpCmd
2601                     	xdef	_CLK_ClockSwitchCmd
2602                     	xdef	_CLK_CCOCmd
2603                     	xdef	_CLK_LSICmd
2604                     	xdef	_CLK_HSICmd
2605                     	xdef	_CLK_HSECmd
2606                     	xdef	_CLK_DeInit
2607                     	xref.b	c_lreg
2608                     	xref.b	c_x
2627                     	xref	c_ltor
2628                     	xref	c_ludv
2629                     	xref	c_rtol
2630                     	end
