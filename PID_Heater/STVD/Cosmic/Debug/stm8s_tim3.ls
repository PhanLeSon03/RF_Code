   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
   4                     ; Optimizer V4.3.6 - 29 Nov 2011
  48                     ; 45 void TIM3_DeInit(void)
  48                     ; 46 {
  50                     .text:	section	.text,new
  51  0000               _TIM3_DeInit:
  55                     ; 48     TIM3->CR1 = (uint8_t)TIM3_CR1_RESET_VALUE;
  57  0000 725f5320      	clr	21280
  58                     ; 49     TIM3->IER = (uint8_t)TIM3_IER_RESET_VALUE;
  60  0004 725f5321      	clr	21281
  61                     ; 50     TIM3->SR2 = (uint8_t)TIM3_SR2_RESET_VALUE;
  63  0008 725f5323      	clr	21283
  64                     ; 53     TIM3->CCER1 = (uint8_t)TIM3_CCER1_RESET_VALUE;
  66  000c 725f5327      	clr	21287
  67                     ; 56     TIM3->CCER1 = (uint8_t)TIM3_CCER1_RESET_VALUE;
  69  0010 725f5327      	clr	21287
  70                     ; 57     TIM3->CCMR1 = (uint8_t)TIM3_CCMR1_RESET_VALUE;
  72  0014 725f5325      	clr	21285
  73                     ; 58     TIM3->CCMR2 = (uint8_t)TIM3_CCMR2_RESET_VALUE;
  75  0018 725f5326      	clr	21286
  76                     ; 59     TIM3->CNTRH = (uint8_t)TIM3_CNTRH_RESET_VALUE;
  78  001c 725f5328      	clr	21288
  79                     ; 60     TIM3->CNTRL = (uint8_t)TIM3_CNTRL_RESET_VALUE;
  81  0020 725f5329      	clr	21289
  82                     ; 61     TIM3->PSCR = (uint8_t)TIM3_PSCR_RESET_VALUE;
  84  0024 725f532a      	clr	21290
  85                     ; 62     TIM3->ARRH  = (uint8_t)TIM3_ARRH_RESET_VALUE;
  87  0028 35ff532b      	mov	21291,#255
  88                     ; 63     TIM3->ARRL  = (uint8_t)TIM3_ARRL_RESET_VALUE;
  90  002c 35ff532c      	mov	21292,#255
  91                     ; 64     TIM3->CCR1H = (uint8_t)TIM3_CCR1H_RESET_VALUE;
  93  0030 725f532d      	clr	21293
  94                     ; 65     TIM3->CCR1L = (uint8_t)TIM3_CCR1L_RESET_VALUE;
  96  0034 725f532e      	clr	21294
  97                     ; 66     TIM3->CCR2H = (uint8_t)TIM3_CCR2H_RESET_VALUE;
  99  0038 725f532f      	clr	21295
 100                     ; 67     TIM3->CCR2L = (uint8_t)TIM3_CCR2L_RESET_VALUE;
 102  003c 725f5330      	clr	21296
 103                     ; 68     TIM3->SR1 = (uint8_t)TIM3_SR1_RESET_VALUE;
 105  0040 725f5322      	clr	21282
 106                     ; 69 }
 109  0044 81            	ret	
 277                     ; 78 void TIM3_TimeBaseInit( TIM3_Prescaler_TypeDef TIM3_Prescaler,
 277                     ; 79                         uint16_t TIM3_Period)
 277                     ; 80 {
 278                     .text:	section	.text,new
 279  0000               _TIM3_TimeBaseInit:
 281       00000000      OFST:	set	0
 284                     ; 82     TIM3->PSCR = (uint8_t)(TIM3_Prescaler);
 286  0000 c7532a        	ld	21290,a
 287  0003 88            	push	a
 288                     ; 84     TIM3->ARRH = (uint8_t)(TIM3_Period >> 8);
 290  0004 7b04          	ld	a,(OFST+4,sp)
 291  0006 c7532b        	ld	21291,a
 292                     ; 85     TIM3->ARRL = (uint8_t)(TIM3_Period);
 294  0009 7b05          	ld	a,(OFST+5,sp)
 295  000b c7532c        	ld	21292,a
 296                     ; 86 }
 299  000e 84            	pop	a
 300  000f 81            	ret	
 457                     ; 96 void TIM3_OC1Init(TIM3_OCMode_TypeDef TIM3_OCMode,
 457                     ; 97                   TIM3_OutputState_TypeDef TIM3_OutputState,
 457                     ; 98                   uint16_t TIM3_Pulse,
 457                     ; 99                   TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
 457                     ; 100 {
 458                     .text:	section	.text,new
 459  0000               _TIM3_OC1Init:
 461  0000 89            	pushw	x
 462  0001 88            	push	a
 463       00000001      OFST:	set	1
 466                     ; 102     assert_param(IS_TIM3_OC_MODE_OK(TIM3_OCMode));
 468                     ; 103     assert_param(IS_TIM3_OUTPUT_STATE_OK(TIM3_OutputState));
 470                     ; 104     assert_param(IS_TIM3_OC_POLARITY_OK(TIM3_OCPolarity));
 472                     ; 107     TIM3->CCER1 &= (uint8_t)(~( TIM3_CCER1_CC1E | TIM3_CCER1_CC1P));
 474  0002 c65327        	ld	a,21287
 475  0005 a4fc          	and	a,#252
 476  0007 c75327        	ld	21287,a
 477                     ; 109     TIM3->CCER1 |= (uint8_t)((uint8_t)(TIM3_OutputState  & TIM3_CCER1_CC1E   ) | (uint8_t)(TIM3_OCPolarity   & TIM3_CCER1_CC1P   ));
 479  000a 7b08          	ld	a,(OFST+7,sp)
 480  000c a402          	and	a,#2
 481  000e 6b01          	ld	(OFST+0,sp),a
 482  0010 9f            	ld	a,xl
 483  0011 a401          	and	a,#1
 484  0013 1a01          	or	a,(OFST+0,sp)
 485  0015 ca5327        	or	a,21287
 486  0018 c75327        	ld	21287,a
 487                     ; 112     TIM3->CCMR1 = (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_OCMode);
 489  001b c65325        	ld	a,21285
 490  001e a48f          	and	a,#143
 491  0020 1a02          	or	a,(OFST+1,sp)
 492  0022 c75325        	ld	21285,a
 493                     ; 115     TIM3->CCR1H = (uint8_t)(TIM3_Pulse >> 8);
 495  0025 7b06          	ld	a,(OFST+5,sp)
 496  0027 c7532d        	ld	21293,a
 497                     ; 116     TIM3->CCR1L = (uint8_t)(TIM3_Pulse);
 499  002a 7b07          	ld	a,(OFST+6,sp)
 500  002c c7532e        	ld	21294,a
 501                     ; 117 }
 504  002f 5b03          	addw	sp,#3
 505  0031 81            	ret	
 569                     ; 128 void TIM3_OC2Init(TIM3_OCMode_TypeDef TIM3_OCMode,
 569                     ; 129                   TIM3_OutputState_TypeDef TIM3_OutputState,
 569                     ; 130                   uint16_t TIM3_Pulse,
 569                     ; 131                   TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
 569                     ; 132 {
 570                     .text:	section	.text,new
 571  0000               _TIM3_OC2Init:
 573  0000 89            	pushw	x
 574  0001 88            	push	a
 575       00000001      OFST:	set	1
 578                     ; 134     assert_param(IS_TIM3_OC_MODE_OK(TIM3_OCMode));
 580                     ; 135     assert_param(IS_TIM3_OUTPUT_STATE_OK(TIM3_OutputState));
 582                     ; 136     assert_param(IS_TIM3_OC_POLARITY_OK(TIM3_OCPolarity));
 584                     ; 140     TIM3->CCER1 &= (uint8_t)(~( TIM3_CCER1_CC2E |  TIM3_CCER1_CC2P ));
 586  0002 c65327        	ld	a,21287
 587  0005 a4cf          	and	a,#207
 588  0007 c75327        	ld	21287,a
 589                     ; 142     TIM3->CCER1 |= (uint8_t)((uint8_t)(TIM3_OutputState  & TIM3_CCER1_CC2E   ) | (uint8_t)(TIM3_OCPolarity   & TIM3_CCER1_CC2P ));
 591  000a 7b08          	ld	a,(OFST+7,sp)
 592  000c a420          	and	a,#32
 593  000e 6b01          	ld	(OFST+0,sp),a
 594  0010 9f            	ld	a,xl
 595  0011 a410          	and	a,#16
 596  0013 1a01          	or	a,(OFST+0,sp)
 597  0015 ca5327        	or	a,21287
 598  0018 c75327        	ld	21287,a
 599                     ; 146     TIM3->CCMR2 = (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_OCMode);
 601  001b c65326        	ld	a,21286
 602  001e a48f          	and	a,#143
 603  0020 1a02          	or	a,(OFST+1,sp)
 604  0022 c75326        	ld	21286,a
 605                     ; 150     TIM3->CCR2H = (uint8_t)(TIM3_Pulse >> 8);
 607  0025 7b06          	ld	a,(OFST+5,sp)
 608  0027 c7532f        	ld	21295,a
 609                     ; 151     TIM3->CCR2L = (uint8_t)(TIM3_Pulse);
 611  002a 7b07          	ld	a,(OFST+6,sp)
 612  002c c75330        	ld	21296,a
 613                     ; 152 }
 616  002f 5b03          	addw	sp,#3
 617  0031 81            	ret	
 801                     ; 163 void TIM3_ICInit(TIM3_Channel_TypeDef TIM3_Channel,
 801                     ; 164                  TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
 801                     ; 165                  TIM3_ICSelection_TypeDef TIM3_ICSelection,
 801                     ; 166                  TIM3_ICPSC_TypeDef TIM3_ICPrescaler,
 801                     ; 167                  uint8_t TIM3_ICFilter)
 801                     ; 168 {
 802                     .text:	section	.text,new
 803  0000               _TIM3_ICInit:
 805  0000 89            	pushw	x
 806       00000000      OFST:	set	0
 809                     ; 170     assert_param(IS_TIM3_CHANNEL_OK(TIM3_Channel));
 811                     ; 171     assert_param(IS_TIM3_IC_POLARITY_OK(TIM3_ICPolarity));
 813                     ; 172     assert_param(IS_TIM3_IC_SELECTION_OK(TIM3_ICSelection));
 815                     ; 173     assert_param(IS_TIM3_IC_PRESCALER_OK(TIM3_ICPrescaler));
 817                     ; 174     assert_param(IS_TIM3_IC_FILTER_OK(TIM3_ICFilter));
 819                     ; 176     if (TIM3_Channel != TIM3_CHANNEL_2)
 821  0001 9e            	ld	a,xh
 822  0002 4a            	dec	a
 823  0003 2714          	jreq	L343
 824                     ; 179         TI1_Config((uint8_t)TIM3_ICPolarity,
 824                     ; 180                    (uint8_t)TIM3_ICSelection,
 824                     ; 181                    (uint8_t)TIM3_ICFilter);
 826  0005 7b07          	ld	a,(OFST+7,sp)
 827  0007 88            	push	a
 828  0008 7b06          	ld	a,(OFST+6,sp)
 829  000a 97            	ld	xl,a
 830  000b 7b03          	ld	a,(OFST+3,sp)
 831  000d 95            	ld	xh,a
 832  000e cd0000        	call	L3_TI1_Config
 834  0011 84            	pop	a
 835                     ; 184         TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
 837  0012 7b06          	ld	a,(OFST+6,sp)
 838  0014 cd0000        	call	_TIM3_SetIC1Prescaler
 841  0017 2012          	jra	L543
 842  0019               L343:
 843                     ; 189         TI2_Config((uint8_t)TIM3_ICPolarity,
 843                     ; 190                    (uint8_t)TIM3_ICSelection,
 843                     ; 191                    (uint8_t)TIM3_ICFilter);
 845  0019 7b07          	ld	a,(OFST+7,sp)
 846  001b 88            	push	a
 847  001c 7b06          	ld	a,(OFST+6,sp)
 848  001e 97            	ld	xl,a
 849  001f 7b03          	ld	a,(OFST+3,sp)
 850  0021 95            	ld	xh,a
 851  0022 cd0000        	call	L5_TI2_Config
 853  0025 84            	pop	a
 854                     ; 194         TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
 856  0026 7b06          	ld	a,(OFST+6,sp)
 857  0028 cd0000        	call	_TIM3_SetIC2Prescaler
 859  002b               L543:
 860                     ; 196 }
 863  002b 85            	popw	x
 864  002c 81            	ret	
 960                     ; 206 void TIM3_PWMIConfig(TIM3_Channel_TypeDef TIM3_Channel,
 960                     ; 207                      TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
 960                     ; 208                      TIM3_ICSelection_TypeDef TIM3_ICSelection,
 960                     ; 209                      TIM3_ICPSC_TypeDef TIM3_ICPrescaler,
 960                     ; 210                      uint8_t TIM3_ICFilter)
 960                     ; 211 {
 961                     .text:	section	.text,new
 962  0000               _TIM3_PWMIConfig:
 964  0000 89            	pushw	x
 965  0001 89            	pushw	x
 966       00000002      OFST:	set	2
 969                     ; 212     uint8_t icpolarity = (uint8_t)TIM3_ICPOLARITY_RISING;
 971                     ; 213     uint8_t icselection = (uint8_t)TIM3_ICSELECTION_DIRECTTI;
 973                     ; 216     assert_param(IS_TIM3_PWMI_CHANNEL_OK(TIM3_Channel));
 975                     ; 217     assert_param(IS_TIM3_IC_POLARITY_OK(TIM3_ICPolarity));
 977                     ; 218     assert_param(IS_TIM3_IC_SELECTION_OK(TIM3_ICSelection));
 979                     ; 219     assert_param(IS_TIM3_IC_PRESCALER_OK(TIM3_ICPrescaler));
 981                     ; 222     if (TIM3_ICPolarity != TIM3_ICPOLARITY_FALLING)
 983  0002 9f            	ld	a,xl
 984  0003 a144          	cp	a,#68
 985  0005 2706          	jreq	L514
 986                     ; 224         icpolarity = (uint8_t)TIM3_ICPOLARITY_FALLING;
 988  0007 a644          	ld	a,#68
 989  0009 6b01          	ld	(OFST-1,sp),a
 991  000b 2002          	jra	L714
 992  000d               L514:
 993                     ; 228         icpolarity = (uint8_t)TIM3_ICPOLARITY_RISING;
 995  000d 0f01          	clr	(OFST-1,sp)
 996  000f               L714:
 997                     ; 232     if (TIM3_ICSelection == TIM3_ICSELECTION_DIRECTTI)
 999  000f 7b07          	ld	a,(OFST+5,sp)
1000  0011 4a            	dec	a
1001  0012 2604          	jrne	L124
1002                     ; 234         icselection = (uint8_t)TIM3_ICSELECTION_INDIRECTTI;
1004  0014 a602          	ld	a,#2
1006  0016 2002          	jra	L324
1007  0018               L124:
1008                     ; 238         icselection = (uint8_t)TIM3_ICSELECTION_DIRECTTI;
1010  0018 a601          	ld	a,#1
1011  001a               L324:
1012  001a 6b02          	ld	(OFST+0,sp),a
1013                     ; 241     if (TIM3_Channel != TIM3_CHANNEL_2)
1015  001c 7b03          	ld	a,(OFST+1,sp)
1016  001e 4a            	dec	a
1017  001f 2726          	jreq	L524
1018                     ; 244         TI1_Config((uint8_t)TIM3_ICPolarity, (uint8_t)TIM3_ICSelection,
1018                     ; 245                    (uint8_t)TIM3_ICFilter);
1020  0021 7b09          	ld	a,(OFST+7,sp)
1021  0023 88            	push	a
1022  0024 7b08          	ld	a,(OFST+6,sp)
1023  0026 97            	ld	xl,a
1024  0027 7b05          	ld	a,(OFST+3,sp)
1025  0029 95            	ld	xh,a
1026  002a cd0000        	call	L3_TI1_Config
1028  002d 84            	pop	a
1029                     ; 248         TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
1031  002e 7b08          	ld	a,(OFST+6,sp)
1032  0030 cd0000        	call	_TIM3_SetIC1Prescaler
1034                     ; 251         TI2_Config(icpolarity, icselection, TIM3_ICFilter);
1036  0033 7b09          	ld	a,(OFST+7,sp)
1037  0035 88            	push	a
1038  0036 7b03          	ld	a,(OFST+1,sp)
1039  0038 97            	ld	xl,a
1040  0039 7b02          	ld	a,(OFST+0,sp)
1041  003b 95            	ld	xh,a
1042  003c cd0000        	call	L5_TI2_Config
1044  003f 84            	pop	a
1045                     ; 254         TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
1047  0040 7b08          	ld	a,(OFST+6,sp)
1048  0042 cd0000        	call	_TIM3_SetIC2Prescaler
1051  0045 2024          	jra	L724
1052  0047               L524:
1053                     ; 259         TI2_Config((uint8_t)TIM3_ICPolarity, (uint8_t)TIM3_ICSelection,
1053                     ; 260                    (uint8_t)TIM3_ICFilter);
1055  0047 7b09          	ld	a,(OFST+7,sp)
1056  0049 88            	push	a
1057  004a 7b08          	ld	a,(OFST+6,sp)
1058  004c 97            	ld	xl,a
1059  004d 7b05          	ld	a,(OFST+3,sp)
1060  004f 95            	ld	xh,a
1061  0050 cd0000        	call	L5_TI2_Config
1063  0053 84            	pop	a
1064                     ; 263         TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
1066  0054 7b08          	ld	a,(OFST+6,sp)
1067  0056 cd0000        	call	_TIM3_SetIC2Prescaler
1069                     ; 266         TI1_Config(icpolarity, icselection, TIM3_ICFilter);
1071  0059 7b09          	ld	a,(OFST+7,sp)
1072  005b 88            	push	a
1073  005c 7b03          	ld	a,(OFST+1,sp)
1074  005e 97            	ld	xl,a
1075  005f 7b02          	ld	a,(OFST+0,sp)
1076  0061 95            	ld	xh,a
1077  0062 cd0000        	call	L3_TI1_Config
1079  0065 84            	pop	a
1080                     ; 269         TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
1082  0066 7b08          	ld	a,(OFST+6,sp)
1083  0068 cd0000        	call	_TIM3_SetIC1Prescaler
1085  006b               L724:
1086                     ; 271 }
1089  006b 5b04          	addw	sp,#4
1090  006d 81            	ret	
1145                     ; 280 void TIM3_Cmd(FunctionalState NewState)
1145                     ; 281 {
1146                     .text:	section	.text,new
1147  0000               _TIM3_Cmd:
1151                     ; 283     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1153                     ; 286     if (NewState != DISABLE)
1155  0000 4d            	tnz	a
1156  0001 2705          	jreq	L754
1157                     ; 288         TIM3->CR1 |= (uint8_t)TIM3_CR1_CEN;
1159  0003 72105320      	bset	21280,#0
1162  0007 81            	ret	
1163  0008               L754:
1164                     ; 292         TIM3->CR1 &= (uint8_t)(~TIM3_CR1_CEN);
1166  0008 72115320      	bres	21280,#0
1167                     ; 294 }
1170  000c 81            	ret	
1242                     ; 309 void TIM3_ITConfig(TIM3_IT_TypeDef TIM3_IT, FunctionalState NewState)
1242                     ; 310 {
1243                     .text:	section	.text,new
1244  0000               _TIM3_ITConfig:
1246  0000 89            	pushw	x
1247       00000000      OFST:	set	0
1250                     ; 312     assert_param(IS_TIM3_IT_OK(TIM3_IT));
1252                     ; 313     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1254                     ; 315     if (NewState != DISABLE)
1256  0001 9f            	ld	a,xl
1257  0002 4d            	tnz	a
1258  0003 2706          	jreq	L715
1259                     ; 318         TIM3->IER |= (uint8_t)TIM3_IT;
1261  0005 9e            	ld	a,xh
1262  0006 ca5321        	or	a,21281
1264  0009 2006          	jra	L125
1265  000b               L715:
1266                     ; 323         TIM3->IER &= (uint8_t)(~TIM3_IT);
1268  000b 7b01          	ld	a,(OFST+1,sp)
1269  000d 43            	cpl	a
1270  000e c45321        	and	a,21281
1271  0011               L125:
1272  0011 c75321        	ld	21281,a
1273                     ; 325 }
1276  0014 85            	popw	x
1277  0015 81            	ret	
1313                     ; 334 void TIM3_UpdateDisableConfig(FunctionalState NewState)
1313                     ; 335 {
1314                     .text:	section	.text,new
1315  0000               _TIM3_UpdateDisableConfig:
1319                     ; 337     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1321                     ; 340     if (NewState != DISABLE)
1323  0000 4d            	tnz	a
1324  0001 2705          	jreq	L145
1325                     ; 342         TIM3->CR1 |= TIM3_CR1_UDIS;
1327  0003 72125320      	bset	21280,#1
1330  0007 81            	ret	
1331  0008               L145:
1332                     ; 346         TIM3->CR1 &= (uint8_t)(~TIM3_CR1_UDIS);
1334  0008 72135320      	bres	21280,#1
1335                     ; 348 }
1338  000c 81            	ret	
1396                     ; 358 void TIM3_UpdateRequestConfig(TIM3_UpdateSource_TypeDef TIM3_UpdateSource)
1396                     ; 359 {
1397                     .text:	section	.text,new
1398  0000               _TIM3_UpdateRequestConfig:
1402                     ; 361     assert_param(IS_TIM3_UPDATE_SOURCE_OK(TIM3_UpdateSource));
1404                     ; 364     if (TIM3_UpdateSource != TIM3_UPDATESOURCE_GLOBAL)
1406  0000 4d            	tnz	a
1407  0001 2705          	jreq	L375
1408                     ; 366         TIM3->CR1 |= TIM3_CR1_URS;
1410  0003 72145320      	bset	21280,#2
1413  0007 81            	ret	
1414  0008               L375:
1415                     ; 370         TIM3->CR1 &= (uint8_t)(~TIM3_CR1_URS);
1417  0008 72155320      	bres	21280,#2
1418                     ; 372 }
1421  000c 81            	ret	
1478                     ; 383 void TIM3_SelectOnePulseMode(TIM3_OPMode_TypeDef TIM3_OPMode)
1478                     ; 384 {
1479                     .text:	section	.text,new
1480  0000               _TIM3_SelectOnePulseMode:
1484                     ; 386     assert_param(IS_TIM3_OPM_MODE_OK(TIM3_OPMode));
1486                     ; 389     if (TIM3_OPMode != TIM3_OPMODE_REPETITIVE)
1488  0000 4d            	tnz	a
1489  0001 2705          	jreq	L526
1490                     ; 391         TIM3->CR1 |= TIM3_CR1_OPM;
1492  0003 72165320      	bset	21280,#3
1495  0007 81            	ret	
1496  0008               L526:
1497                     ; 395         TIM3->CR1 &= (uint8_t)(~TIM3_CR1_OPM);
1499  0008 72175320      	bres	21280,#3
1500                     ; 398 }
1503  000c 81            	ret	
1571                     ; 429 void TIM3_PrescalerConfig(TIM3_Prescaler_TypeDef Prescaler,
1571                     ; 430                           TIM3_PSCReloadMode_TypeDef TIM3_PSCReloadMode)
1571                     ; 431 {
1572                     .text:	section	.text,new
1573  0000               _TIM3_PrescalerConfig:
1577                     ; 433     assert_param(IS_TIM3_PRESCALER_RELOAD_OK(TIM3_PSCReloadMode));
1579                     ; 434     assert_param(IS_TIM3_PRESCALER_OK(Prescaler));
1581                     ; 437     TIM3->PSCR = (uint8_t)Prescaler;
1583  0000 9e            	ld	a,xh
1584  0001 c7532a        	ld	21290,a
1585                     ; 440     TIM3->EGR = (uint8_t)TIM3_PSCReloadMode;
1587  0004 9f            	ld	a,xl
1588  0005 c75324        	ld	21284,a
1589                     ; 441 }
1592  0008 81            	ret	
1650                     ; 452 void TIM3_ForcedOC1Config(TIM3_ForcedAction_TypeDef TIM3_ForcedAction)
1650                     ; 453 {
1651                     .text:	section	.text,new
1652  0000               _TIM3_ForcedOC1Config:
1654  0000 88            	push	a
1655       00000000      OFST:	set	0
1658                     ; 455     assert_param(IS_TIM3_FORCED_ACTION_OK(TIM3_ForcedAction));
1660                     ; 458     TIM3->CCMR1 =  (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~TIM3_CCMR_OCM))  | (uint8_t)TIM3_ForcedAction);
1662  0001 c65325        	ld	a,21285
1663  0004 a48f          	and	a,#143
1664  0006 1a01          	or	a,(OFST+1,sp)
1665  0008 c75325        	ld	21285,a
1666                     ; 459 }
1669  000b 84            	pop	a
1670  000c 81            	ret	
1706                     ; 470 void TIM3_ForcedOC2Config(TIM3_ForcedAction_TypeDef TIM3_ForcedAction)
1706                     ; 471 {
1707                     .text:	section	.text,new
1708  0000               _TIM3_ForcedOC2Config:
1710  0000 88            	push	a
1711       00000000      OFST:	set	0
1714                     ; 473     assert_param(IS_TIM3_FORCED_ACTION_OK(TIM3_ForcedAction));
1716                     ; 476     TIM3->CCMR2 =  (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_ForcedAction);
1718  0001 c65326        	ld	a,21286
1719  0004 a48f          	and	a,#143
1720  0006 1a01          	or	a,(OFST+1,sp)
1721  0008 c75326        	ld	21286,a
1722                     ; 477 }
1725  000b 84            	pop	a
1726  000c 81            	ret	
1762                     ; 486 void TIM3_ARRPreloadConfig(FunctionalState NewState)
1762                     ; 487 {
1763                     .text:	section	.text,new
1764  0000               _TIM3_ARRPreloadConfig:
1768                     ; 489     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1770                     ; 492     if (NewState != DISABLE)
1772  0000 4d            	tnz	a
1773  0001 2705          	jreq	L547
1774                     ; 494         TIM3->CR1 |= TIM3_CR1_ARPE;
1776  0003 721e5320      	bset	21280,#7
1779  0007 81            	ret	
1780  0008               L547:
1781                     ; 498         TIM3->CR1 &= (uint8_t)(~TIM3_CR1_ARPE);
1783  0008 721f5320      	bres	21280,#7
1784                     ; 500 }
1787  000c 81            	ret	
1823                     ; 509 void TIM3_OC1PreloadConfig(FunctionalState NewState)
1823                     ; 510 {
1824                     .text:	section	.text,new
1825  0000               _TIM3_OC1PreloadConfig:
1829                     ; 512     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1831                     ; 515     if (NewState != DISABLE)
1833  0000 4d            	tnz	a
1834  0001 2705          	jreq	L767
1835                     ; 517         TIM3->CCMR1 |= TIM3_CCMR_OCxPE;
1837  0003 72165325      	bset	21285,#3
1840  0007 81            	ret	
1841  0008               L767:
1842                     ; 521         TIM3->CCMR1 &= (uint8_t)(~TIM3_CCMR_OCxPE);
1844  0008 72175325      	bres	21285,#3
1845                     ; 523 }
1848  000c 81            	ret	
1884                     ; 532 void TIM3_OC2PreloadConfig(FunctionalState NewState)
1884                     ; 533 {
1885                     .text:	section	.text,new
1886  0000               _TIM3_OC2PreloadConfig:
1890                     ; 535     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1892                     ; 538     if (NewState != DISABLE)
1894  0000 4d            	tnz	a
1895  0001 2705          	jreq	L1101
1896                     ; 540         TIM3->CCMR2 |= TIM3_CCMR_OCxPE;
1898  0003 72165326      	bset	21286,#3
1901  0007 81            	ret	
1902  0008               L1101:
1903                     ; 544         TIM3->CCMR2 &= (uint8_t)(~TIM3_CCMR_OCxPE);
1905  0008 72175326      	bres	21286,#3
1906                     ; 546 }
1909  000c 81            	ret	
1974                     ; 557 void TIM3_GenerateEvent(TIM3_EventSource_TypeDef TIM3_EventSource)
1974                     ; 558 {
1975                     .text:	section	.text,new
1976  0000               _TIM3_GenerateEvent:
1980                     ; 560     assert_param(IS_TIM3_EVENT_SOURCE_OK(TIM3_EventSource));
1982                     ; 563     TIM3->EGR = (uint8_t)TIM3_EventSource;
1984  0000 c75324        	ld	21284,a
1985                     ; 564 }
1988  0003 81            	ret	
2024                     ; 575 void TIM3_OC1PolarityConfig(TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
2024                     ; 576 {
2025                     .text:	section	.text,new
2026  0000               _TIM3_OC1PolarityConfig:
2030                     ; 578     assert_param(IS_TIM3_OC_POLARITY_OK(TIM3_OCPolarity));
2032                     ; 581     if (TIM3_OCPolarity != TIM3_OCPOLARITY_HIGH)
2034  0000 4d            	tnz	a
2035  0001 2705          	jreq	L3601
2036                     ; 583         TIM3->CCER1 |= TIM3_CCER1_CC1P;
2038  0003 72125327      	bset	21287,#1
2041  0007 81            	ret	
2042  0008               L3601:
2043                     ; 587         TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1P);
2045  0008 72135327      	bres	21287,#1
2046                     ; 589 }
2049  000c 81            	ret	
2085                     ; 600 void TIM3_OC2PolarityConfig(TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
2085                     ; 601 {
2086                     .text:	section	.text,new
2087  0000               _TIM3_OC2PolarityConfig:
2091                     ; 603     assert_param(IS_TIM3_OC_POLARITY_OK(TIM3_OCPolarity));
2093                     ; 606     if (TIM3_OCPolarity != TIM3_OCPOLARITY_HIGH)
2095  0000 4d            	tnz	a
2096  0001 2705          	jreq	L5011
2097                     ; 608         TIM3->CCER1 |= TIM3_CCER1_CC2P;
2099  0003 721a5327      	bset	21287,#5
2102  0007 81            	ret	
2103  0008               L5011:
2104                     ; 612         TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC2P);
2106  0008 721b5327      	bres	21287,#5
2107                     ; 614 }
2110  000c 81            	ret	
2155                     ; 627 void TIM3_CCxCmd(TIM3_Channel_TypeDef TIM3_Channel, FunctionalState NewState)
2155                     ; 628 {
2156                     .text:	section	.text,new
2157  0000               _TIM3_CCxCmd:
2159  0000 89            	pushw	x
2160       00000000      OFST:	set	0
2163                     ; 630     assert_param(IS_TIM3_CHANNEL_OK(TIM3_Channel));
2165                     ; 631     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2167                     ; 633     if (TIM3_Channel == TIM3_CHANNEL_1)
2169  0001 9e            	ld	a,xh
2170  0002 4d            	tnz	a
2171  0003 2610          	jrne	L3311
2172                     ; 636         if (NewState != DISABLE)
2174  0005 9f            	ld	a,xl
2175  0006 4d            	tnz	a
2176  0007 2706          	jreq	L5311
2177                     ; 638             TIM3->CCER1 |= TIM3_CCER1_CC1E;
2179  0009 72105327      	bset	21287,#0
2181  000d 2014          	jra	L1411
2182  000f               L5311:
2183                     ; 642             TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1E);
2185  000f 72115327      	bres	21287,#0
2186  0013 200e          	jra	L1411
2187  0015               L3311:
2188                     ; 649         if (NewState != DISABLE)
2190  0015 7b02          	ld	a,(OFST+2,sp)
2191  0017 2706          	jreq	L3411
2192                     ; 651             TIM3->CCER1 |= TIM3_CCER1_CC2E;
2194  0019 72185327      	bset	21287,#4
2196  001d 2004          	jra	L1411
2197  001f               L3411:
2198                     ; 655             TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC2E);
2200  001f 72195327      	bres	21287,#4
2201  0023               L1411:
2202                     ; 659 }
2205  0023 85            	popw	x
2206  0024 81            	ret	
2251                     ; 680 void TIM3_SelectOCxM(TIM3_Channel_TypeDef TIM3_Channel, TIM3_OCMode_TypeDef TIM3_OCMode)
2251                     ; 681 {
2252                     .text:	section	.text,new
2253  0000               _TIM3_SelectOCxM:
2255  0000 89            	pushw	x
2256       00000000      OFST:	set	0
2259                     ; 683     assert_param(IS_TIM3_CHANNEL_OK(TIM3_Channel));
2261                     ; 684     assert_param(IS_TIM3_OCM_OK(TIM3_OCMode));
2263                     ; 686     if (TIM3_Channel == TIM3_CHANNEL_1)
2265  0001 9e            	ld	a,xh
2266  0002 4d            	tnz	a
2267  0003 2610          	jrne	L1711
2268                     ; 689         TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1E);
2270  0005 72115327      	bres	21287,#0
2271                     ; 692         TIM3->CCMR1 = (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_OCMode);
2273  0009 c65325        	ld	a,21285
2274  000c a48f          	and	a,#143
2275  000e 1a02          	or	a,(OFST+2,sp)
2276  0010 c75325        	ld	21285,a
2278  0013 200e          	jra	L3711
2279  0015               L1711:
2280                     ; 697         TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC2E);
2282  0015 72195327      	bres	21287,#4
2283                     ; 700         TIM3->CCMR2 = (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_OCMode);
2285  0019 c65326        	ld	a,21286
2286  001c a48f          	and	a,#143
2287  001e 1a02          	or	a,(OFST+2,sp)
2288  0020 c75326        	ld	21286,a
2289  0023               L3711:
2290                     ; 702 }
2293  0023 85            	popw	x
2294  0024 81            	ret	
2328                     ; 711 void TIM3_SetCounter(uint16_t Counter)
2328                     ; 712 {
2329                     .text:	section	.text,new
2330  0000               _TIM3_SetCounter:
2334                     ; 714     TIM3->CNTRH = (uint8_t)(Counter >> 8);
2336  0000 9e            	ld	a,xh
2337  0001 c75328        	ld	21288,a
2338                     ; 715     TIM3->CNTRL = (uint8_t)(Counter);
2340  0004 9f            	ld	a,xl
2341  0005 c75329        	ld	21289,a
2342                     ; 717 }
2345  0008 81            	ret	
2379                     ; 726 void TIM3_SetAutoreload(uint16_t Autoreload)
2379                     ; 727 {
2380                     .text:	section	.text,new
2381  0000               _TIM3_SetAutoreload:
2385                     ; 729     TIM3->ARRH = (uint8_t)(Autoreload >> 8);
2387  0000 9e            	ld	a,xh
2388  0001 c7532b        	ld	21291,a
2389                     ; 730     TIM3->ARRL = (uint8_t)(Autoreload);
2391  0004 9f            	ld	a,xl
2392  0005 c7532c        	ld	21292,a
2393                     ; 731 }
2396  0008 81            	ret	
2430                     ; 740 void TIM3_SetCompare1(uint16_t Compare1)
2430                     ; 741 {
2431                     .text:	section	.text,new
2432  0000               _TIM3_SetCompare1:
2436                     ; 743     TIM3->CCR1H = (uint8_t)(Compare1 >> 8);
2438  0000 9e            	ld	a,xh
2439  0001 c7532d        	ld	21293,a
2440                     ; 744     TIM3->CCR1L = (uint8_t)(Compare1);
2442  0004 9f            	ld	a,xl
2443  0005 c7532e        	ld	21294,a
2444                     ; 745 }
2447  0008 81            	ret	
2481                     ; 754 void TIM3_SetCompare2(uint16_t Compare2)
2481                     ; 755 {
2482                     .text:	section	.text,new
2483  0000               _TIM3_SetCompare2:
2487                     ; 757     TIM3->CCR2H = (uint8_t)(Compare2 >> 8);
2489  0000 9e            	ld	a,xh
2490  0001 c7532f        	ld	21295,a
2491                     ; 758     TIM3->CCR2L = (uint8_t)(Compare2);
2493  0004 9f            	ld	a,xl
2494  0005 c75330        	ld	21296,a
2495                     ; 759 }
2498  0008 81            	ret	
2534                     ; 772 void TIM3_SetIC1Prescaler(TIM3_ICPSC_TypeDef TIM3_IC1Prescaler)
2534                     ; 773 {
2535                     .text:	section	.text,new
2536  0000               _TIM3_SetIC1Prescaler:
2538  0000 88            	push	a
2539       00000000      OFST:	set	0
2542                     ; 775     assert_param(IS_TIM3_IC_PRESCALER_OK(TIM3_IC1Prescaler));
2544                     ; 778     TIM3->CCMR1 = (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~TIM3_CCMR_ICxPSC)) | (uint8_t)TIM3_IC1Prescaler);
2546  0001 c65325        	ld	a,21285
2547  0004 a4f3          	and	a,#243
2548  0006 1a01          	or	a,(OFST+1,sp)
2549  0008 c75325        	ld	21285,a
2550                     ; 779 }
2553  000b 84            	pop	a
2554  000c 81            	ret	
2590                     ; 791 void TIM3_SetIC2Prescaler(TIM3_ICPSC_TypeDef TIM3_IC2Prescaler)
2590                     ; 792 {
2591                     .text:	section	.text,new
2592  0000               _TIM3_SetIC2Prescaler:
2594  0000 88            	push	a
2595       00000000      OFST:	set	0
2598                     ; 794     assert_param(IS_TIM3_IC_PRESCALER_OK(TIM3_IC2Prescaler));
2600                     ; 797     TIM3->CCMR2 = (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~TIM3_CCMR_ICxPSC)) | (uint8_t)TIM3_IC2Prescaler);
2602  0001 c65326        	ld	a,21286
2603  0004 a4f3          	and	a,#243
2604  0006 1a01          	or	a,(OFST+1,sp)
2605  0008 c75326        	ld	21286,a
2606                     ; 798 }
2609  000b 84            	pop	a
2610  000c 81            	ret	
2662                     ; 804 uint16_t TIM3_GetCapture1(void)
2662                     ; 805 {
2663                     .text:	section	.text,new
2664  0000               _TIM3_GetCapture1:
2666  0000 5204          	subw	sp,#4
2667       00000004      OFST:	set	4
2670                     ; 807     uint16_t tmpccr1 = 0;
2672                     ; 808     uint8_t tmpccr1l=0, tmpccr1h=0;
2676                     ; 810     tmpccr1h = TIM3->CCR1H;
2678  0002 c6532d        	ld	a,21293
2679  0005 6b02          	ld	(OFST-2,sp),a
2680                     ; 811     tmpccr1l = TIM3->CCR1L;
2682  0007 c6532e        	ld	a,21294
2683  000a 6b01          	ld	(OFST-3,sp),a
2684                     ; 813     tmpccr1 = (uint16_t)(tmpccr1l);
2686  000c 5f            	clrw	x
2687  000d 97            	ld	xl,a
2688  000e 1f03          	ldw	(OFST-1,sp),x
2689                     ; 814     tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
2691  0010 5f            	clrw	x
2692  0011 7b02          	ld	a,(OFST-2,sp)
2693  0013 97            	ld	xl,a
2694  0014 7b04          	ld	a,(OFST+0,sp)
2695  0016 01            	rrwa	x,a
2696  0017 1a03          	or	a,(OFST-1,sp)
2697  0019 01            	rrwa	x,a
2698                     ; 816     return (uint16_t)tmpccr1;
2702  001a 5b04          	addw	sp,#4
2703  001c 81            	ret	
2755                     ; 824 uint16_t TIM3_GetCapture2(void)
2755                     ; 825 {
2756                     .text:	section	.text,new
2757  0000               _TIM3_GetCapture2:
2759  0000 5204          	subw	sp,#4
2760       00000004      OFST:	set	4
2763                     ; 827     uint16_t tmpccr2 = 0;
2765                     ; 828     uint8_t tmpccr2l=0, tmpccr2h=0;
2769                     ; 830     tmpccr2h = TIM3->CCR2H;
2771  0002 c6532f        	ld	a,21295
2772  0005 6b02          	ld	(OFST-2,sp),a
2773                     ; 831     tmpccr2l = TIM3->CCR2L;
2775  0007 c65330        	ld	a,21296
2776  000a 6b01          	ld	(OFST-3,sp),a
2777                     ; 833     tmpccr2 = (uint16_t)(tmpccr2l);
2779  000c 5f            	clrw	x
2780  000d 97            	ld	xl,a
2781  000e 1f03          	ldw	(OFST-1,sp),x
2782                     ; 834     tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
2784  0010 5f            	clrw	x
2785  0011 7b02          	ld	a,(OFST-2,sp)
2786  0013 97            	ld	xl,a
2787  0014 7b04          	ld	a,(OFST+0,sp)
2788  0016 01            	rrwa	x,a
2789  0017 1a03          	or	a,(OFST-1,sp)
2790  0019 01            	rrwa	x,a
2791                     ; 836     return (uint16_t)tmpccr2;
2795  001a 5b04          	addw	sp,#4
2796  001c 81            	ret	
2830                     ; 844 uint16_t TIM3_GetCounter(void)
2830                     ; 845 {
2831                     .text:	section	.text,new
2832  0000               _TIM3_GetCounter:
2834  0000 89            	pushw	x
2835       00000002      OFST:	set	2
2838                     ; 846    uint16_t tmpcntr = 0;
2840                     ; 848    tmpcntr = ((uint16_t)TIM3->CNTRH << 8);
2842  0001 c65328        	ld	a,21288
2843  0004 97            	ld	xl,a
2844  0005 4f            	clr	a
2845  0006 02            	rlwa	x,a
2846  0007 1f01          	ldw	(OFST-1,sp),x
2847                     ; 850     return (uint16_t)( tmpcntr| (uint16_t)(TIM3->CNTRL));
2849  0009 5f            	clrw	x
2850  000a c65329        	ld	a,21289
2851  000d 97            	ld	xl,a
2852  000e 01            	rrwa	x,a
2853  000f 1a02          	or	a,(OFST+0,sp)
2854  0011 01            	rrwa	x,a
2855  0012 1a01          	or	a,(OFST-1,sp)
2856  0014 01            	rrwa	x,a
2859  0015 5b02          	addw	sp,#2
2860  0017 81            	ret	
2884                     ; 859 TIM3_Prescaler_TypeDef TIM3_GetPrescaler(void)
2884                     ; 860 {
2885                     .text:	section	.text,new
2886  0000               _TIM3_GetPrescaler:
2890                     ; 862     return (TIM3_Prescaler_TypeDef)(TIM3->PSCR);
2892  0000 c6532a        	ld	a,21290
2895  0003 81            	ret	
3020                     ; 877 FlagStatus TIM3_GetFlagStatus(TIM3_FLAG_TypeDef TIM3_FLAG)
3020                     ; 878 {
3021                     .text:	section	.text,new
3022  0000               _TIM3_GetFlagStatus:
3024  0000 89            	pushw	x
3025  0001 89            	pushw	x
3026       00000002      OFST:	set	2
3029                     ; 879    FlagStatus bitstatus = RESET;
3031                     ; 880    uint8_t tim3_flag_l = 0, tim3_flag_h = 0;
3035                     ; 883     assert_param(IS_TIM3_GET_FLAG_OK(TIM3_FLAG));
3037                     ; 885     tim3_flag_l = (uint8_t)(TIM3->SR1 & (uint8_t)TIM3_FLAG);
3039  0002 9f            	ld	a,xl
3040  0003 c45322        	and	a,21282
3041  0006 6b01          	ld	(OFST-1,sp),a
3042                     ; 886     tim3_flag_h = (uint8_t)((uint16_t)TIM3_FLAG >> 8);
3044  0008 7b03          	ld	a,(OFST+1,sp)
3045  000a 6b02          	ld	(OFST+0,sp),a
3046                     ; 888     if (((tim3_flag_l) | (uint8_t)(TIM3->SR2 & tim3_flag_h)) != (uint8_t)RESET )
3048  000c c45323        	and	a,21283
3049  000f 1a01          	or	a,(OFST-1,sp)
3050  0011 2702          	jreq	L3051
3051                     ; 890         bitstatus = SET;
3053  0013 a601          	ld	a,#1
3055  0015               L3051:
3056                     ; 894         bitstatus = RESET;
3058                     ; 896     return (FlagStatus)bitstatus;
3062  0015 5b04          	addw	sp,#4
3063  0017 81            	ret	
3098                     ; 911 void TIM3_ClearFlag(TIM3_FLAG_TypeDef TIM3_FLAG)
3098                     ; 912 {
3099                     .text:	section	.text,new
3100  0000               _TIM3_ClearFlag:
3102  0000 89            	pushw	x
3103       00000000      OFST:	set	0
3106                     ; 914     assert_param(IS_TIM3_CLEAR_FLAG_OK(TIM3_FLAG));
3108                     ; 917     TIM3->SR1 = (uint8_t)(~((uint8_t)(TIM3_FLAG)));
3110  0001 9f            	ld	a,xl
3111  0002 43            	cpl	a
3112  0003 c75322        	ld	21282,a
3113                     ; 918     TIM3->SR2 = (uint8_t)(~((uint8_t)((uint16_t)TIM3_FLAG >> 8)));
3115  0006 7b01          	ld	a,(OFST+1,sp)
3116  0008 43            	cpl	a
3117  0009 c75323        	ld	21283,a
3118                     ; 919 }
3121  000c 85            	popw	x
3122  000d 81            	ret	
3186                     ; 932 ITStatus TIM3_GetITStatus(TIM3_IT_TypeDef TIM3_IT)
3186                     ; 933 {
3187                     .text:	section	.text,new
3188  0000               _TIM3_GetITStatus:
3190  0000 88            	push	a
3191  0001 89            	pushw	x
3192       00000002      OFST:	set	2
3195                     ; 934     ITStatus bitstatus = RESET;
3197                     ; 935     uint8_t TIM3_itStatus = 0, TIM3_itEnable = 0;
3201                     ; 938     assert_param(IS_TIM3_GET_IT_OK(TIM3_IT));
3203                     ; 940     TIM3_itStatus = (uint8_t)(TIM3->SR1 & TIM3_IT);
3205  0002 c45322        	and	a,21282
3206  0005 6b01          	ld	(OFST-1,sp),a
3207                     ; 942     TIM3_itEnable = (uint8_t)(TIM3->IER & TIM3_IT);
3209  0007 c65321        	ld	a,21281
3210  000a 1403          	and	a,(OFST+1,sp)
3211  000c 6b02          	ld	(OFST+0,sp),a
3212                     ; 944     if ((TIM3_itStatus != (uint8_t)RESET ) && (TIM3_itEnable != (uint8_t)RESET ))
3214  000e 7b01          	ld	a,(OFST-1,sp)
3215  0010 2708          	jreq	L7551
3217  0012 7b02          	ld	a,(OFST+0,sp)
3218  0014 2704          	jreq	L7551
3219                     ; 946         bitstatus = SET;
3221  0016 a601          	ld	a,#1
3223  0018 2001          	jra	L1651
3224  001a               L7551:
3225                     ; 950         bitstatus = RESET;
3227  001a 4f            	clr	a
3228  001b               L1651:
3229                     ; 952     return (ITStatus)(bitstatus);
3233  001b 5b03          	addw	sp,#3
3234  001d 81            	ret	
3270                     ; 965 void TIM3_ClearITPendingBit(TIM3_IT_TypeDef TIM3_IT)
3270                     ; 966 {
3271                     .text:	section	.text,new
3272  0000               _TIM3_ClearITPendingBit:
3276                     ; 968     assert_param(IS_TIM3_IT_OK(TIM3_IT));
3278                     ; 971     TIM3->SR1 = (uint8_t)(~TIM3_IT);
3280  0000 43            	cpl	a
3281  0001 c75322        	ld	21282,a
3282                     ; 972 }
3285  0004 81            	ret	
3337                     ; 991 static void TI1_Config(uint8_t TIM3_ICPolarity,
3337                     ; 992                        uint8_t TIM3_ICSelection,
3337                     ; 993                        uint8_t TIM3_ICFilter)
3337                     ; 994 {
3338                     .text:	section	.text,new
3339  0000               L3_TI1_Config:
3341  0000 89            	pushw	x
3342       00000001      OFST:	set	1
3345                     ; 996     TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1E);
3347  0001 72115327      	bres	21287,#0
3348  0005 88            	push	a
3349                     ; 999     TIM3->CCMR1 = (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~( TIM3_CCMR_CCxS | TIM3_CCMR_ICxF))) | (uint8_t)(( (TIM3_ICSelection)) | ((uint8_t)( TIM3_ICFilter << 4))));
3351  0006 7b06          	ld	a,(OFST+5,sp)
3352  0008 97            	ld	xl,a
3353  0009 a610          	ld	a,#16
3354  000b 42            	mul	x,a
3355  000c 9f            	ld	a,xl
3356  000d 1a03          	or	a,(OFST+2,sp)
3357  000f 6b01          	ld	(OFST+0,sp),a
3358  0011 c65325        	ld	a,21285
3359  0014 a40c          	and	a,#12
3360  0016 1a01          	or	a,(OFST+0,sp)
3361  0018 c75325        	ld	21285,a
3362                     ; 1002     if (TIM3_ICPolarity != TIM3_ICPOLARITY_RISING)
3364  001b 7b02          	ld	a,(OFST+1,sp)
3365  001d 2706          	jreq	L7261
3366                     ; 1004         TIM3->CCER1 |= TIM3_CCER1_CC1P;
3368  001f 72125327      	bset	21287,#1
3370  0023 2004          	jra	L1361
3371  0025               L7261:
3372                     ; 1008         TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1P);
3374  0025 72135327      	bres	21287,#1
3375  0029               L1361:
3376                     ; 1011     TIM3->CCER1 |= TIM3_CCER1_CC1E;
3378  0029 72105327      	bset	21287,#0
3379                     ; 1012 }
3382  002d 5b03          	addw	sp,#3
3383  002f 81            	ret	
3435                     ; 1031 static void TI2_Config(uint8_t TIM3_ICPolarity,
3435                     ; 1032                        uint8_t TIM3_ICSelection,
3435                     ; 1033                        uint8_t TIM3_ICFilter)
3435                     ; 1034 {
3436                     .text:	section	.text,new
3437  0000               L5_TI2_Config:
3439  0000 89            	pushw	x
3440       00000001      OFST:	set	1
3443                     ; 1036     TIM3->CCER1 &=  (uint8_t)(~TIM3_CCER1_CC2E);
3445  0001 72195327      	bres	21287,#4
3446  0005 88            	push	a
3447                     ; 1039     TIM3->CCMR2 = (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~( TIM3_CCMR_CCxS |
3447                     ; 1040                   TIM3_CCMR_ICxF    ))) | (uint8_t)(( (TIM3_ICSelection)) | 
3447                     ; 1041                   ((uint8_t)( TIM3_ICFilter << 4))));
3449  0006 7b06          	ld	a,(OFST+5,sp)
3450  0008 97            	ld	xl,a
3451  0009 a610          	ld	a,#16
3452  000b 42            	mul	x,a
3453  000c 9f            	ld	a,xl
3454  000d 1a03          	or	a,(OFST+2,sp)
3455  000f 6b01          	ld	(OFST+0,sp),a
3456  0011 c65326        	ld	a,21286
3457  0014 a40c          	and	a,#12
3458  0016 1a01          	or	a,(OFST+0,sp)
3459  0018 c75326        	ld	21286,a
3460                     ; 1044     if (TIM3_ICPolarity != TIM3_ICPOLARITY_RISING)
3462  001b 7b02          	ld	a,(OFST+1,sp)
3463  001d 2706          	jreq	L1661
3464                     ; 1046         TIM3->CCER1 |= TIM3_CCER1_CC2P;
3466  001f 721a5327      	bset	21287,#5
3468  0023 2004          	jra	L3661
3469  0025               L1661:
3470                     ; 1050         TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC2P);
3472  0025 721b5327      	bres	21287,#5
3473  0029               L3661:
3474                     ; 1054     TIM3->CCER1 |= TIM3_CCER1_CC2E;
3476  0029 72185327      	bset	21287,#4
3477                     ; 1056 }
3480  002d 5b03          	addw	sp,#3
3481  002f 81            	ret	
3494                     	xdef	_TIM3_ClearITPendingBit
3495                     	xdef	_TIM3_GetITStatus
3496                     	xdef	_TIM3_ClearFlag
3497                     	xdef	_TIM3_GetFlagStatus
3498                     	xdef	_TIM3_GetPrescaler
3499                     	xdef	_TIM3_GetCounter
3500                     	xdef	_TIM3_GetCapture2
3501                     	xdef	_TIM3_GetCapture1
3502                     	xdef	_TIM3_SetIC2Prescaler
3503                     	xdef	_TIM3_SetIC1Prescaler
3504                     	xdef	_TIM3_SetCompare2
3505                     	xdef	_TIM3_SetCompare1
3506                     	xdef	_TIM3_SetAutoreload
3507                     	xdef	_TIM3_SetCounter
3508                     	xdef	_TIM3_SelectOCxM
3509                     	xdef	_TIM3_CCxCmd
3510                     	xdef	_TIM3_OC2PolarityConfig
3511                     	xdef	_TIM3_OC1PolarityConfig
3512                     	xdef	_TIM3_GenerateEvent
3513                     	xdef	_TIM3_OC2PreloadConfig
3514                     	xdef	_TIM3_OC1PreloadConfig
3515                     	xdef	_TIM3_ARRPreloadConfig
3516                     	xdef	_TIM3_ForcedOC2Config
3517                     	xdef	_TIM3_ForcedOC1Config
3518                     	xdef	_TIM3_PrescalerConfig
3519                     	xdef	_TIM3_SelectOnePulseMode
3520                     	xdef	_TIM3_UpdateRequestConfig
3521                     	xdef	_TIM3_UpdateDisableConfig
3522                     	xdef	_TIM3_ITConfig
3523                     	xdef	_TIM3_Cmd
3524                     	xdef	_TIM3_PWMIConfig
3525                     	xdef	_TIM3_ICInit
3526                     	xdef	_TIM3_OC2Init
3527                     	xdef	_TIM3_OC1Init
3528                     	xdef	_TIM3_TimeBaseInit
3529                     	xdef	_TIM3_DeInit
3548                     	end
