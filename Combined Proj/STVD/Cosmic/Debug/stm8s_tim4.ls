   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
   4                     ; Optimizer V4.3.6 - 29 Nov 2011
  48                     ; 43 void TIM4_DeInit(void)
  48                     ; 44 {
  50                     .text:	section	.text,new
  51  0000               _TIM4_DeInit:
  55                     ; 45     TIM4->CR1 = TIM4_CR1_RESET_VALUE;
  57  0000 725f5340      	clr	21312
  58                     ; 46     TIM4->IER = TIM4_IER_RESET_VALUE;
  60  0004 725f5341      	clr	21313
  61                     ; 47     TIM4->CNTR = TIM4_CNTR_RESET_VALUE;
  63  0008 725f5344      	clr	21316
  64                     ; 48     TIM4->PSCR = TIM4_PSCR_RESET_VALUE;
  66  000c 725f5345      	clr	21317
  67                     ; 49     TIM4->ARR = TIM4_ARR_RESET_VALUE;
  69  0010 35ff5346      	mov	21318,#255
  70                     ; 50     TIM4->SR1 = TIM4_SR1_RESET_VALUE;
  72  0014 725f5342      	clr	21314
  73                     ; 51 }
  76  0018 81            	ret	
 182                     ; 59 void TIM4_TimeBaseInit(TIM4_Prescaler_TypeDef TIM4_Prescaler, uint8_t TIM4_Period)
 182                     ; 60 {
 183                     .text:	section	.text,new
 184  0000               _TIM4_TimeBaseInit:
 188                     ; 62     assert_param(IS_TIM4_PRESCALER_OK(TIM4_Prescaler));
 190                     ; 64     TIM4->PSCR = (uint8_t)(TIM4_Prescaler);
 192  0000 9e            	ld	a,xh
 193  0001 c75345        	ld	21317,a
 194                     ; 66     TIM4->ARR = (uint8_t)(TIM4_Period);
 196  0004 9f            	ld	a,xl
 197  0005 c75346        	ld	21318,a
 198                     ; 67 }
 201  0008 81            	ret	
 256                     ; 77 void TIM4_Cmd(FunctionalState NewState)
 256                     ; 78 {
 257                     .text:	section	.text,new
 258  0000               _TIM4_Cmd:
 262                     ; 80     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 264                     ; 83     if (NewState != DISABLE)
 266  0000 4d            	tnz	a
 267  0001 2705          	jreq	L511
 268                     ; 85         TIM4->CR1 |= TIM4_CR1_CEN;
 270  0003 72105340      	bset	21312,#0
 273  0007 81            	ret	
 274  0008               L511:
 275                     ; 89         TIM4->CR1 &= (uint8_t)(~TIM4_CR1_CEN);
 277  0008 72115340      	bres	21312,#0
 278                     ; 91 }
 281  000c 81            	ret	
 339                     ; 103 void TIM4_ITConfig(TIM4_IT_TypeDef TIM4_IT, FunctionalState NewState)
 339                     ; 104 {
 340                     .text:	section	.text,new
 341  0000               _TIM4_ITConfig:
 343  0000 89            	pushw	x
 344       00000000      OFST:	set	0
 347                     ; 106     assert_param(IS_TIM4_IT_OK(TIM4_IT));
 349                     ; 107     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 351                     ; 109     if (NewState != DISABLE)
 353  0001 9f            	ld	a,xl
 354  0002 4d            	tnz	a
 355  0003 2706          	jreq	L151
 356                     ; 112         TIM4->IER |= (uint8_t)TIM4_IT;
 358  0005 9e            	ld	a,xh
 359  0006 ca5341        	or	a,21313
 361  0009 2006          	jra	L351
 362  000b               L151:
 363                     ; 117         TIM4->IER &= (uint8_t)(~TIM4_IT);
 365  000b 7b01          	ld	a,(OFST+1,sp)
 366  000d 43            	cpl	a
 367  000e c45341        	and	a,21313
 368  0011               L351:
 369  0011 c75341        	ld	21313,a
 370                     ; 119 }
 373  0014 85            	popw	x
 374  0015 81            	ret	
 410                     ; 127 void TIM4_UpdateDisableConfig(FunctionalState NewState)
 410                     ; 128 {
 411                     .text:	section	.text,new
 412  0000               _TIM4_UpdateDisableConfig:
 416                     ; 130     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 418                     ; 133     if (NewState != DISABLE)
 420  0000 4d            	tnz	a
 421  0001 2705          	jreq	L371
 422                     ; 135         TIM4->CR1 |= TIM4_CR1_UDIS;
 424  0003 72125340      	bset	21312,#1
 427  0007 81            	ret	
 428  0008               L371:
 429                     ; 139         TIM4->CR1 &= (uint8_t)(~TIM4_CR1_UDIS);
 431  0008 72135340      	bres	21312,#1
 432                     ; 141 }
 435  000c 81            	ret	
 493                     ; 151 void TIM4_UpdateRequestConfig(TIM4_UpdateSource_TypeDef TIM4_UpdateSource)
 493                     ; 152 {
 494                     .text:	section	.text,new
 495  0000               _TIM4_UpdateRequestConfig:
 499                     ; 154     assert_param(IS_TIM4_UPDATE_SOURCE_OK(TIM4_UpdateSource));
 501                     ; 157     if (TIM4_UpdateSource != TIM4_UPDATESOURCE_GLOBAL)
 503  0000 4d            	tnz	a
 504  0001 2705          	jreq	L522
 505                     ; 159         TIM4->CR1 |= TIM4_CR1_URS;
 507  0003 72145340      	bset	21312,#2
 510  0007 81            	ret	
 511  0008               L522:
 512                     ; 163         TIM4->CR1 &= (uint8_t)(~TIM4_CR1_URS);
 514  0008 72155340      	bres	21312,#2
 515                     ; 165 }
 518  000c 81            	ret	
 575                     ; 175 void TIM4_SelectOnePulseMode(TIM4_OPMode_TypeDef TIM4_OPMode)
 575                     ; 176 {
 576                     .text:	section	.text,new
 577  0000               _TIM4_SelectOnePulseMode:
 581                     ; 178     assert_param(IS_TIM4_OPM_MODE_OK(TIM4_OPMode));
 583                     ; 181     if (TIM4_OPMode != TIM4_OPMODE_REPETITIVE)
 585  0000 4d            	tnz	a
 586  0001 2705          	jreq	L752
 587                     ; 183         TIM4->CR1 |= TIM4_CR1_OPM;
 589  0003 72165340      	bset	21312,#3
 592  0007 81            	ret	
 593  0008               L752:
 594                     ; 187         TIM4->CR1 &= (uint8_t)(~TIM4_CR1_OPM);
 596  0008 72175340      	bres	21312,#3
 597                     ; 190 }
 600  000c 81            	ret	
 668                     ; 212 void TIM4_PrescalerConfig(TIM4_Prescaler_TypeDef Prescaler, TIM4_PSCReloadMode_TypeDef TIM4_PSCReloadMode)
 668                     ; 213 {
 669                     .text:	section	.text,new
 670  0000               _TIM4_PrescalerConfig:
 674                     ; 215     assert_param(IS_TIM4_PRESCALER_RELOAD_OK(TIM4_PSCReloadMode));
 676                     ; 216     assert_param(IS_TIM4_PRESCALER_OK(Prescaler));
 678                     ; 219     TIM4->PSCR = (uint8_t)Prescaler;
 680  0000 9e            	ld	a,xh
 681  0001 c75345        	ld	21317,a
 682                     ; 222     TIM4->EGR = (uint8_t)TIM4_PSCReloadMode;
 684  0004 9f            	ld	a,xl
 685  0005 c75343        	ld	21315,a
 686                     ; 223 }
 689  0008 81            	ret	
 725                     ; 231 void TIM4_ARRPreloadConfig(FunctionalState NewState)
 725                     ; 232 {
 726                     .text:	section	.text,new
 727  0000               _TIM4_ARRPreloadConfig:
 731                     ; 234     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 733                     ; 237     if (NewState != DISABLE)
 735  0000 4d            	tnz	a
 736  0001 2705          	jreq	L333
 737                     ; 239         TIM4->CR1 |= TIM4_CR1_ARPE;
 739  0003 721e5340      	bset	21312,#7
 742  0007 81            	ret	
 743  0008               L333:
 744                     ; 243         TIM4->CR1 &= (uint8_t)(~TIM4_CR1_ARPE);
 746  0008 721f5340      	bres	21312,#7
 747                     ; 245 }
 750  000c 81            	ret	
 799                     ; 254 void TIM4_GenerateEvent(TIM4_EventSource_TypeDef TIM4_EventSource)
 799                     ; 255 {
 800                     .text:	section	.text,new
 801  0000               _TIM4_GenerateEvent:
 805                     ; 257     assert_param(IS_TIM4_EVENT_SOURCE_OK(TIM4_EventSource));
 807                     ; 260     TIM4->EGR = (uint8_t)(TIM4_EventSource);
 809  0000 c75343        	ld	21315,a
 810                     ; 261 }
 813  0003 81            	ret	
 847                     ; 270 void TIM4_SetCounter(uint8_t Counter)
 847                     ; 271 {
 848                     .text:	section	.text,new
 849  0000               _TIM4_SetCounter:
 853                     ; 273     TIM4->CNTR = (uint8_t)(Counter);
 855  0000 c75344        	ld	21316,a
 856                     ; 274 }
 859  0003 81            	ret	
 893                     ; 283 void TIM4_SetAutoreload(uint8_t Autoreload)
 893                     ; 284 {
 894                     .text:	section	.text,new
 895  0000               _TIM4_SetAutoreload:
 899                     ; 286     TIM4->ARR = (uint8_t)(Autoreload);
 901  0000 c75346        	ld	21318,a
 902                     ; 287 }
 905  0003 81            	ret	
 928                     ; 294 uint8_t TIM4_GetCounter(void)
 928                     ; 295 {
 929                     .text:	section	.text,new
 930  0000               _TIM4_GetCounter:
 934                     ; 297     return (uint8_t)(TIM4->CNTR);
 936  0000 c65344        	ld	a,21316
 939  0003 81            	ret	
 963                     ; 305 TIM4_Prescaler_TypeDef TIM4_GetPrescaler(void)
 963                     ; 306 {
 964                     .text:	section	.text,new
 965  0000               _TIM4_GetPrescaler:
 969                     ; 308     return (TIM4_Prescaler_TypeDef)(TIM4->PSCR);
 971  0000 c65345        	ld	a,21317
 974  0003 81            	ret	
1053                     ; 318 FlagStatus TIM4_GetFlagStatus(TIM4_FLAG_TypeDef TIM4_FLAG)
1053                     ; 319 {
1054                     .text:	section	.text,new
1055  0000               _TIM4_GetFlagStatus:
1057  0000 88            	push	a
1058       00000001      OFST:	set	1
1061                     ; 320     FlagStatus bitstatus = RESET;
1063                     ; 323     assert_param(IS_TIM4_GET_FLAG_OK(TIM4_FLAG));
1065                     ; 325   if ((TIM4->SR1 & (uint8_t)TIM4_FLAG)  != 0)
1067  0001 c45342        	and	a,21314
1068  0004 2702          	jreq	L774
1069                     ; 327     bitstatus = SET;
1071  0006 a601          	ld	a,#1
1073  0008               L774:
1074                     ; 331     bitstatus = RESET;
1076                     ; 333   return ((FlagStatus)bitstatus);
1080  0008 5b01          	addw	sp,#1
1081  000a 81            	ret	
1116                     ; 343 void TIM4_ClearFlag(TIM4_FLAG_TypeDef TIM4_FLAG)
1116                     ; 344 {
1117                     .text:	section	.text,new
1118  0000               _TIM4_ClearFlag:
1122                     ; 346     assert_param(IS_TIM4_GET_FLAG_OK(TIM4_FLAG));
1124                     ; 349     TIM4->SR1 = (uint8_t)(~TIM4_FLAG);
1126  0000 43            	cpl	a
1127  0001 c75342        	ld	21314,a
1128                     ; 351 }
1131  0004 81            	ret	
1195                     ; 360 ITStatus TIM4_GetITStatus(TIM4_IT_TypeDef TIM4_IT)
1195                     ; 361 {
1196                     .text:	section	.text,new
1197  0000               _TIM4_GetITStatus:
1199  0000 88            	push	a
1200  0001 89            	pushw	x
1201       00000002      OFST:	set	2
1204                     ; 362     ITStatus bitstatus = RESET;
1206                     ; 364   uint8_t itstatus = 0x0, itenable = 0x0;
1210                     ; 367   assert_param(IS_TIM4_IT_OK(TIM4_IT));
1212                     ; 369   itstatus = (uint8_t)(TIM4->SR1 & (uint8_t)TIM4_IT);
1214  0002 c45342        	and	a,21314
1215  0005 6b01          	ld	(OFST-1,sp),a
1216                     ; 371   itenable = (uint8_t)(TIM4->IER & (uint8_t)TIM4_IT);
1218  0007 c65341        	ld	a,21313
1219  000a 1403          	and	a,(OFST+1,sp)
1220  000c 6b02          	ld	(OFST+0,sp),a
1221                     ; 373   if ((itstatus != (uint8_t)RESET ) && (itenable != (uint8_t)RESET ))
1223  000e 7b01          	ld	a,(OFST-1,sp)
1224  0010 2708          	jreq	L355
1226  0012 7b02          	ld	a,(OFST+0,sp)
1227  0014 2704          	jreq	L355
1228                     ; 375     bitstatus = (ITStatus)SET;
1230  0016 a601          	ld	a,#1
1232  0018 2001          	jra	L555
1233  001a               L355:
1234                     ; 379     bitstatus = (ITStatus)RESET;
1236  001a 4f            	clr	a
1237  001b               L555:
1238                     ; 381   return ((ITStatus)bitstatus);
1242  001b 5b03          	addw	sp,#3
1243  001d 81            	ret	
1279                     ; 391 void TIM4_ClearITPendingBit(TIM4_IT_TypeDef TIM4_IT)
1279                     ; 392 {
1280                     .text:	section	.text,new
1281  0000               _TIM4_ClearITPendingBit:
1285                     ; 394     assert_param(IS_TIM4_IT_OK(TIM4_IT));
1287                     ; 397     TIM4->SR1 = (uint8_t)(~TIM4_IT);
1289  0000 43            	cpl	a
1290  0001 c75342        	ld	21314,a
1291                     ; 398 }
1294  0004 81            	ret	
1307                     	xdef	_TIM4_ClearITPendingBit
1308                     	xdef	_TIM4_GetITStatus
1309                     	xdef	_TIM4_ClearFlag
1310                     	xdef	_TIM4_GetFlagStatus
1311                     	xdef	_TIM4_GetPrescaler
1312                     	xdef	_TIM4_GetCounter
1313                     	xdef	_TIM4_SetAutoreload
1314                     	xdef	_TIM4_SetCounter
1315                     	xdef	_TIM4_GenerateEvent
1316                     	xdef	_TIM4_ARRPreloadConfig
1317                     	xdef	_TIM4_PrescalerConfig
1318                     	xdef	_TIM4_SelectOnePulseMode
1319                     	xdef	_TIM4_UpdateRequestConfig
1320                     	xdef	_TIM4_UpdateDisableConfig
1321                     	xdef	_TIM4_ITConfig
1322                     	xdef	_TIM4_Cmd
1323                     	xdef	_TIM4_TimeBaseInit
1324                     	xdef	_TIM4_DeInit
1343                     	end
