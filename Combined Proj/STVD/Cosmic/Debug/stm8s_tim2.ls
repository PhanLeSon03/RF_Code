   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
   4                     ; Optimizer V4.3.6 - 29 Nov 2011
  48                     ; 46 void TIM2_DeInit(void)
  48                     ; 47 {
  50                     .text:	section	.text,new
  51  0000               _TIM2_DeInit:
  55                     ; 49     TIM2->CR1 = (uint8_t)TIM2_CR1_RESET_VALUE;
  57  0000 725f5300      	clr	21248
  58                     ; 50     TIM2->IER = (uint8_t)TIM2_IER_RESET_VALUE;
  60  0004 725f5301      	clr	21249
  61                     ; 51     TIM2->SR2 = (uint8_t)TIM2_SR2_RESET_VALUE;
  63  0008 725f5303      	clr	21251
  64                     ; 54     TIM2->CCER1 = (uint8_t)TIM2_CCER1_RESET_VALUE;
  66  000c 725f5308      	clr	21256
  67                     ; 55     TIM2->CCER2 = (uint8_t)TIM2_CCER2_RESET_VALUE;
  69  0010 725f5309      	clr	21257
  70                     ; 59     TIM2->CCER1 = (uint8_t)TIM2_CCER1_RESET_VALUE;
  72  0014 725f5308      	clr	21256
  73                     ; 60     TIM2->CCER2 = (uint8_t)TIM2_CCER2_RESET_VALUE;
  75  0018 725f5309      	clr	21257
  76                     ; 61     TIM2->CCMR1 = (uint8_t)TIM2_CCMR1_RESET_VALUE;
  78  001c 725f5305      	clr	21253
  79                     ; 62     TIM2->CCMR2 = (uint8_t)TIM2_CCMR2_RESET_VALUE;
  81  0020 725f5306      	clr	21254
  82                     ; 63     TIM2->CCMR3 = (uint8_t)TIM2_CCMR3_RESET_VALUE;
  84  0024 725f5307      	clr	21255
  85                     ; 64     TIM2->CNTRH = (uint8_t)TIM2_CNTRH_RESET_VALUE;
  87  0028 725f530a      	clr	21258
  88                     ; 65     TIM2->CNTRL = (uint8_t)TIM2_CNTRL_RESET_VALUE;
  90  002c 725f530b      	clr	21259
  91                     ; 66     TIM2->PSCR = (uint8_t)TIM2_PSCR_RESET_VALUE;
  93  0030 725f530c      	clr	21260
  94                     ; 67     TIM2->ARRH  = (uint8_t)TIM2_ARRH_RESET_VALUE;
  96  0034 35ff530d      	mov	21261,#255
  97                     ; 68     TIM2->ARRL  = (uint8_t)TIM2_ARRL_RESET_VALUE;
  99  0038 35ff530e      	mov	21262,#255
 100                     ; 69     TIM2->CCR1H = (uint8_t)TIM2_CCR1H_RESET_VALUE;
 102  003c 725f530f      	clr	21263
 103                     ; 70     TIM2->CCR1L = (uint8_t)TIM2_CCR1L_RESET_VALUE;
 105  0040 725f5310      	clr	21264
 106                     ; 71     TIM2->CCR2H = (uint8_t)TIM2_CCR2H_RESET_VALUE;
 108  0044 725f5311      	clr	21265
 109                     ; 72     TIM2->CCR2L = (uint8_t)TIM2_CCR2L_RESET_VALUE;
 111  0048 725f5312      	clr	21266
 112                     ; 73     TIM2->CCR3H = (uint8_t)TIM2_CCR3H_RESET_VALUE;
 114  004c 725f5313      	clr	21267
 115                     ; 74     TIM2->CCR3L = (uint8_t)TIM2_CCR3L_RESET_VALUE;
 117  0050 725f5314      	clr	21268
 118                     ; 75     TIM2->SR1 = (uint8_t)TIM2_SR1_RESET_VALUE;
 120  0054 725f5302      	clr	21250
 121                     ; 76 }
 124  0058 81            	ret	
 292                     ; 85 void TIM2_TimeBaseInit( TIM2_Prescaler_TypeDef TIM2_Prescaler,
 292                     ; 86                         uint16_t TIM2_Period)
 292                     ; 87 {
 293                     .text:	section	.text,new
 294  0000               _TIM2_TimeBaseInit:
 296       00000000      OFST:	set	0
 299                     ; 89     TIM2->PSCR = (uint8_t)(TIM2_Prescaler);
 301  0000 c7530c        	ld	21260,a
 302  0003 88            	push	a
 303                     ; 91     TIM2->ARRH = (uint8_t)(TIM2_Period >> 8);
 305  0004 7b04          	ld	a,(OFST+4,sp)
 306  0006 c7530d        	ld	21261,a
 307                     ; 92     TIM2->ARRL = (uint8_t)(TIM2_Period);
 309  0009 7b05          	ld	a,(OFST+5,sp)
 310  000b c7530e        	ld	21262,a
 311                     ; 93 }
 314  000e 84            	pop	a
 315  000f 81            	ret	
 472                     ; 104 void TIM2_OC1Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 472                     ; 105                   TIM2_OutputState_TypeDef TIM2_OutputState,
 472                     ; 106                   uint16_t TIM2_Pulse,
 472                     ; 107                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 472                     ; 108 {
 473                     .text:	section	.text,new
 474  0000               _TIM2_OC1Init:
 476  0000 89            	pushw	x
 477  0001 88            	push	a
 478       00000001      OFST:	set	1
 481                     ; 110     assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 483                     ; 111     assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 485                     ; 112     assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 487                     ; 115     TIM2->CCER1 &= (uint8_t)(~( TIM2_CCER1_CC1E | TIM2_CCER1_CC1P));
 489  0002 c65308        	ld	a,21256
 490  0005 a4fc          	and	a,#252
 491  0007 c75308        	ld	21256,a
 492                     ; 117     TIM2->CCER1 |= (uint8_t)((uint8_t)(TIM2_OutputState & TIM2_CCER1_CC1E ) | 
 492                     ; 118                              (uint8_t)(TIM2_OCPolarity & TIM2_CCER1_CC1P));
 494  000a 7b08          	ld	a,(OFST+7,sp)
 495  000c a402          	and	a,#2
 496  000e 6b01          	ld	(OFST+0,sp),a
 497  0010 9f            	ld	a,xl
 498  0011 a401          	and	a,#1
 499  0013 1a01          	or	a,(OFST+0,sp)
 500  0015 ca5308        	or	a,21256
 501  0018 c75308        	ld	21256,a
 502                     ; 121     TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM)) |
 502                     ; 122                             (uint8_t)TIM2_OCMode);
 504  001b c65305        	ld	a,21253
 505  001e a48f          	and	a,#143
 506  0020 1a02          	or	a,(OFST+1,sp)
 507  0022 c75305        	ld	21253,a
 508                     ; 125     TIM2->CCR1H = (uint8_t)(TIM2_Pulse >> 8);
 510  0025 7b06          	ld	a,(OFST+5,sp)
 511  0027 c7530f        	ld	21263,a
 512                     ; 126     TIM2->CCR1L = (uint8_t)(TIM2_Pulse);
 514  002a 7b07          	ld	a,(OFST+6,sp)
 515  002c c75310        	ld	21264,a
 516                     ; 127 }
 519  002f 5b03          	addw	sp,#3
 520  0031 81            	ret	
 584                     ; 138 void TIM2_OC2Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 584                     ; 139                   TIM2_OutputState_TypeDef TIM2_OutputState,
 584                     ; 140                   uint16_t TIM2_Pulse,
 584                     ; 141                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 584                     ; 142 {
 585                     .text:	section	.text,new
 586  0000               _TIM2_OC2Init:
 588  0000 89            	pushw	x
 589  0001 88            	push	a
 590       00000001      OFST:	set	1
 593                     ; 144     assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 595                     ; 145     assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 597                     ; 146     assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 599                     ; 150     TIM2->CCER1 &= (uint8_t)(~( TIM2_CCER1_CC2E |  TIM2_CCER1_CC2P ));
 601  0002 c65308        	ld	a,21256
 602  0005 a4cf          	and	a,#207
 603  0007 c75308        	ld	21256,a
 604                     ; 152     TIM2->CCER1 |= (uint8_t)((uint8_t)(TIM2_OutputState  & TIM2_CCER1_CC2E ) |
 604                     ; 153                         (uint8_t)(TIM2_OCPolarity & TIM2_CCER1_CC2P));
 606  000a 7b08          	ld	a,(OFST+7,sp)
 607  000c a420          	and	a,#32
 608  000e 6b01          	ld	(OFST+0,sp),a
 609  0010 9f            	ld	a,xl
 610  0011 a410          	and	a,#16
 611  0013 1a01          	or	a,(OFST+0,sp)
 612  0015 ca5308        	or	a,21256
 613  0018 c75308        	ld	21256,a
 614                     ; 157     TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM)) | 
 614                     ; 158                             (uint8_t)TIM2_OCMode);
 616  001b c65306        	ld	a,21254
 617  001e a48f          	and	a,#143
 618  0020 1a02          	or	a,(OFST+1,sp)
 619  0022 c75306        	ld	21254,a
 620                     ; 162     TIM2->CCR2H = (uint8_t)(TIM2_Pulse >> 8);
 622  0025 7b06          	ld	a,(OFST+5,sp)
 623  0027 c75311        	ld	21265,a
 624                     ; 163     TIM2->CCR2L = (uint8_t)(TIM2_Pulse);
 626  002a 7b07          	ld	a,(OFST+6,sp)
 627  002c c75312        	ld	21266,a
 628                     ; 164 }
 631  002f 5b03          	addw	sp,#3
 632  0031 81            	ret	
 696                     ; 175 void TIM2_OC3Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 696                     ; 176                   TIM2_OutputState_TypeDef TIM2_OutputState,
 696                     ; 177                   uint16_t TIM2_Pulse,
 696                     ; 178                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 696                     ; 179 {
 697                     .text:	section	.text,new
 698  0000               _TIM2_OC3Init:
 700  0000 89            	pushw	x
 701  0001 88            	push	a
 702       00000001      OFST:	set	1
 705                     ; 181     assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 707                     ; 182     assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 709                     ; 183     assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 711                     ; 185     TIM2->CCER2 &= (uint8_t)(~( TIM2_CCER2_CC3E  | TIM2_CCER2_CC3P));
 713  0002 c65309        	ld	a,21257
 714  0005 a4fc          	and	a,#252
 715  0007 c75309        	ld	21257,a
 716                     ; 187     TIM2->CCER2 |= (uint8_t)((uint8_t)(TIM2_OutputState & TIM2_CCER2_CC3E) |  
 716                     ; 188                              (uint8_t)(TIM2_OCPolarity & TIM2_CCER2_CC3P));
 718  000a 7b08          	ld	a,(OFST+7,sp)
 719  000c a402          	and	a,#2
 720  000e 6b01          	ld	(OFST+0,sp),a
 721  0010 9f            	ld	a,xl
 722  0011 a401          	and	a,#1
 723  0013 1a01          	or	a,(OFST+0,sp)
 724  0015 ca5309        	or	a,21257
 725  0018 c75309        	ld	21257,a
 726                     ; 191     TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM)) |
 726                     ; 192                             (uint8_t)TIM2_OCMode);
 728  001b c65307        	ld	a,21255
 729  001e a48f          	and	a,#143
 730  0020 1a02          	or	a,(OFST+1,sp)
 731  0022 c75307        	ld	21255,a
 732                     ; 195     TIM2->CCR3H = (uint8_t)(TIM2_Pulse >> 8);
 734  0025 7b06          	ld	a,(OFST+5,sp)
 735  0027 c75313        	ld	21267,a
 736                     ; 196     TIM2->CCR3L = (uint8_t)(TIM2_Pulse);
 738  002a 7b07          	ld	a,(OFST+6,sp)
 739  002c c75314        	ld	21268,a
 740                     ; 198 }
 743  002f 5b03          	addw	sp,#3
 744  0031 81            	ret	
 937                     ; 210 void TIM2_ICInit(TIM2_Channel_TypeDef TIM2_Channel,
 937                     ; 211                  TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
 937                     ; 212                  TIM2_ICSelection_TypeDef TIM2_ICSelection,
 937                     ; 213                  TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
 937                     ; 214                  uint8_t TIM2_ICFilter)
 937                     ; 215 {
 938                     .text:	section	.text,new
 939  0000               _TIM2_ICInit:
 941  0000 89            	pushw	x
 942       00000000      OFST:	set	0
 945                     ; 217     assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
 947                     ; 218     assert_param(IS_TIM2_IC_POLARITY_OK(TIM2_ICPolarity));
 949                     ; 219     assert_param(IS_TIM2_IC_SELECTION_OK(TIM2_ICSelection));
 951                     ; 220     assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_ICPrescaler));
 953                     ; 221     assert_param(IS_TIM2_IC_FILTER_OK(TIM2_ICFilter));
 955                     ; 223     if (TIM2_Channel == TIM2_CHANNEL_1)
 957  0001 9e            	ld	a,xh
 958  0002 4d            	tnz	a
 959  0003 2614          	jrne	L104
 960                     ; 226         TI1_Config((uint8_t)TIM2_ICPolarity,
 960                     ; 227                    (uint8_t)TIM2_ICSelection,
 960                     ; 228                    (uint8_t)TIM2_ICFilter);
 962  0005 7b07          	ld	a,(OFST+7,sp)
 963  0007 88            	push	a
 964  0008 7b06          	ld	a,(OFST+6,sp)
 965  000a 97            	ld	xl,a
 966  000b 7b03          	ld	a,(OFST+3,sp)
 967  000d 95            	ld	xh,a
 968  000e cd0000        	call	L3_TI1_Config
 970  0011 84            	pop	a
 971                     ; 231         TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
 973  0012 7b06          	ld	a,(OFST+6,sp)
 974  0014 cd0000        	call	_TIM2_SetIC1Prescaler
 977  0017 202b          	jra	L304
 978  0019               L104:
 979                     ; 233     else if (TIM2_Channel == TIM2_CHANNEL_2)
 981  0019 7b01          	ld	a,(OFST+1,sp)
 982  001b 4a            	dec	a
 983  001c 2614          	jrne	L504
 984                     ; 236         TI2_Config((uint8_t)TIM2_ICPolarity,
 984                     ; 237                    (uint8_t)TIM2_ICSelection,
 984                     ; 238                    (uint8_t)TIM2_ICFilter);
 986  001e 7b07          	ld	a,(OFST+7,sp)
 987  0020 88            	push	a
 988  0021 7b06          	ld	a,(OFST+6,sp)
 989  0023 97            	ld	xl,a
 990  0024 7b03          	ld	a,(OFST+3,sp)
 991  0026 95            	ld	xh,a
 992  0027 cd0000        	call	L5_TI2_Config
 994  002a 84            	pop	a
 995                     ; 241         TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
 997  002b 7b06          	ld	a,(OFST+6,sp)
 998  002d cd0000        	call	_TIM2_SetIC2Prescaler
1001  0030 2012          	jra	L304
1002  0032               L504:
1003                     ; 246         TI3_Config((uint8_t)TIM2_ICPolarity,
1003                     ; 247                    (uint8_t)TIM2_ICSelection,
1003                     ; 248                    (uint8_t)TIM2_ICFilter);
1005  0032 7b07          	ld	a,(OFST+7,sp)
1006  0034 88            	push	a
1007  0035 7b06          	ld	a,(OFST+6,sp)
1008  0037 97            	ld	xl,a
1009  0038 7b03          	ld	a,(OFST+3,sp)
1010  003a 95            	ld	xh,a
1011  003b cd0000        	call	L7_TI3_Config
1013  003e 84            	pop	a
1014                     ; 251         TIM2_SetIC3Prescaler(TIM2_ICPrescaler);
1016  003f 7b06          	ld	a,(OFST+6,sp)
1017  0041 cd0000        	call	_TIM2_SetIC3Prescaler
1019  0044               L304:
1020                     ; 253 }
1023  0044 85            	popw	x
1024  0045 81            	ret	
1120                     ; 265 void TIM2_PWMIConfig(TIM2_Channel_TypeDef TIM2_Channel,
1120                     ; 266                      TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
1120                     ; 267                      TIM2_ICSelection_TypeDef TIM2_ICSelection,
1120                     ; 268                      TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
1120                     ; 269                      uint8_t TIM2_ICFilter)
1120                     ; 270 {
1121                     .text:	section	.text,new
1122  0000               _TIM2_PWMIConfig:
1124  0000 89            	pushw	x
1125  0001 89            	pushw	x
1126       00000002      OFST:	set	2
1129                     ; 271     uint8_t icpolarity = (uint8_t)TIM2_ICPOLARITY_RISING;
1131                     ; 272     uint8_t icselection = (uint8_t)TIM2_ICSELECTION_DIRECTTI;
1133                     ; 275     assert_param(IS_TIM2_PWMI_CHANNEL_OK(TIM2_Channel));
1135                     ; 276     assert_param(IS_TIM2_IC_POLARITY_OK(TIM2_ICPolarity));
1137                     ; 277     assert_param(IS_TIM2_IC_SELECTION_OK(TIM2_ICSelection));
1139                     ; 278     assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_ICPrescaler));
1141                     ; 281     if (TIM2_ICPolarity != TIM2_ICPOLARITY_FALLING)
1143  0002 9f            	ld	a,xl
1144  0003 a144          	cp	a,#68
1145  0005 2706          	jreq	L754
1146                     ; 283         icpolarity = (uint8_t)TIM2_ICPOLARITY_FALLING;
1148  0007 a644          	ld	a,#68
1149  0009 6b01          	ld	(OFST-1,sp),a
1151  000b 2002          	jra	L164
1152  000d               L754:
1153                     ; 287         icpolarity = (uint8_t)TIM2_ICPOLARITY_RISING;
1155  000d 0f01          	clr	(OFST-1,sp)
1156  000f               L164:
1157                     ; 291     if (TIM2_ICSelection == TIM2_ICSELECTION_DIRECTTI)
1159  000f 7b07          	ld	a,(OFST+5,sp)
1160  0011 4a            	dec	a
1161  0012 2604          	jrne	L364
1162                     ; 293         icselection = (uint8_t)TIM2_ICSELECTION_INDIRECTTI;
1164  0014 a602          	ld	a,#2
1166  0016 2002          	jra	L564
1167  0018               L364:
1168                     ; 297         icselection = (uint8_t)TIM2_ICSELECTION_DIRECTTI;
1170  0018 a601          	ld	a,#1
1171  001a               L564:
1172  001a 6b02          	ld	(OFST+0,sp),a
1173                     ; 300     if (TIM2_Channel == TIM2_CHANNEL_1)
1175  001c 7b03          	ld	a,(OFST+1,sp)
1176  001e 2626          	jrne	L764
1177                     ; 303         TI1_Config((uint8_t)TIM2_ICPolarity, (uint8_t)TIM2_ICSelection,
1177                     ; 304                    (uint8_t)TIM2_ICFilter);
1179  0020 7b09          	ld	a,(OFST+7,sp)
1180  0022 88            	push	a
1181  0023 7b08          	ld	a,(OFST+6,sp)
1182  0025 97            	ld	xl,a
1183  0026 7b05          	ld	a,(OFST+3,sp)
1184  0028 95            	ld	xh,a
1185  0029 cd0000        	call	L3_TI1_Config
1187  002c 84            	pop	a
1188                     ; 307         TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1190  002d 7b08          	ld	a,(OFST+6,sp)
1191  002f cd0000        	call	_TIM2_SetIC1Prescaler
1193                     ; 310         TI2_Config(icpolarity, icselection, TIM2_ICFilter);
1195  0032 7b09          	ld	a,(OFST+7,sp)
1196  0034 88            	push	a
1197  0035 7b03          	ld	a,(OFST+1,sp)
1198  0037 97            	ld	xl,a
1199  0038 7b02          	ld	a,(OFST+0,sp)
1200  003a 95            	ld	xh,a
1201  003b cd0000        	call	L5_TI2_Config
1203  003e 84            	pop	a
1204                     ; 313         TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1206  003f 7b08          	ld	a,(OFST+6,sp)
1207  0041 cd0000        	call	_TIM2_SetIC2Prescaler
1210  0044 2024          	jra	L174
1211  0046               L764:
1212                     ; 318         TI2_Config((uint8_t)TIM2_ICPolarity, (uint8_t)TIM2_ICSelection,
1212                     ; 319                    (uint8_t)TIM2_ICFilter);
1214  0046 7b09          	ld	a,(OFST+7,sp)
1215  0048 88            	push	a
1216  0049 7b08          	ld	a,(OFST+6,sp)
1217  004b 97            	ld	xl,a
1218  004c 7b05          	ld	a,(OFST+3,sp)
1219  004e 95            	ld	xh,a
1220  004f cd0000        	call	L5_TI2_Config
1222  0052 84            	pop	a
1223                     ; 322         TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1225  0053 7b08          	ld	a,(OFST+6,sp)
1226  0055 cd0000        	call	_TIM2_SetIC2Prescaler
1228                     ; 325         TI1_Config((uint8_t)icpolarity, icselection, (uint8_t)TIM2_ICFilter);
1230  0058 7b09          	ld	a,(OFST+7,sp)
1231  005a 88            	push	a
1232  005b 7b03          	ld	a,(OFST+1,sp)
1233  005d 97            	ld	xl,a
1234  005e 7b02          	ld	a,(OFST+0,sp)
1235  0060 95            	ld	xh,a
1236  0061 cd0000        	call	L3_TI1_Config
1238  0064 84            	pop	a
1239                     ; 328         TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1241  0065 7b08          	ld	a,(OFST+6,sp)
1242  0067 cd0000        	call	_TIM2_SetIC1Prescaler
1244  006a               L174:
1245                     ; 330 }
1248  006a 5b04          	addw	sp,#4
1249  006c 81            	ret	
1304                     ; 339 void TIM2_Cmd(FunctionalState NewState)
1304                     ; 340 {
1305                     .text:	section	.text,new
1306  0000               _TIM2_Cmd:
1310                     ; 342     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1312                     ; 345     if (NewState != DISABLE)
1314  0000 4d            	tnz	a
1315  0001 2705          	jreq	L125
1316                     ; 347         TIM2->CR1 |= (uint8_t)TIM2_CR1_CEN;
1318  0003 72105300      	bset	21248,#0
1321  0007 81            	ret	
1322  0008               L125:
1323                     ; 351         TIM2->CR1 &= (uint8_t)(~TIM2_CR1_CEN);
1325  0008 72115300      	bres	21248,#0
1326                     ; 353 }
1329  000c 81            	ret	
1408                     ; 369 void TIM2_ITConfig(TIM2_IT_TypeDef TIM2_IT, FunctionalState NewState)
1408                     ; 370 {
1409                     .text:	section	.text,new
1410  0000               _TIM2_ITConfig:
1412  0000 89            	pushw	x
1413       00000000      OFST:	set	0
1416                     ; 372     assert_param(IS_TIM2_IT_OK(TIM2_IT));
1418                     ; 373     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1420                     ; 375     if (NewState != DISABLE)
1422  0001 9f            	ld	a,xl
1423  0002 4d            	tnz	a
1424  0003 2706          	jreq	L365
1425                     ; 378         TIM2->IER |= (uint8_t)TIM2_IT;
1427  0005 9e            	ld	a,xh
1428  0006 ca5301        	or	a,21249
1430  0009 2006          	jra	L565
1431  000b               L365:
1432                     ; 383         TIM2->IER &= (uint8_t)(~TIM2_IT);
1434  000b 7b01          	ld	a,(OFST+1,sp)
1435  000d 43            	cpl	a
1436  000e c45301        	and	a,21249
1437  0011               L565:
1438  0011 c75301        	ld	21249,a
1439                     ; 385 }
1442  0014 85            	popw	x
1443  0015 81            	ret	
1479                     ; 394 void TIM2_UpdateDisableConfig(FunctionalState NewState)
1479                     ; 395 {
1480                     .text:	section	.text,new
1481  0000               _TIM2_UpdateDisableConfig:
1485                     ; 397     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1487                     ; 400     if (NewState != DISABLE)
1489  0000 4d            	tnz	a
1490  0001 2705          	jreq	L506
1491                     ; 402         TIM2->CR1 |= (uint8_t)TIM2_CR1_UDIS;
1493  0003 72125300      	bset	21248,#1
1496  0007 81            	ret	
1497  0008               L506:
1498                     ; 406         TIM2->CR1 &= (uint8_t)(~TIM2_CR1_UDIS);
1500  0008 72135300      	bres	21248,#1
1501                     ; 408 }
1504  000c 81            	ret	
1562                     ; 418 void TIM2_UpdateRequestConfig(TIM2_UpdateSource_TypeDef TIM2_UpdateSource)
1562                     ; 419 {
1563                     .text:	section	.text,new
1564  0000               _TIM2_UpdateRequestConfig:
1568                     ; 421     assert_param(IS_TIM2_UPDATE_SOURCE_OK(TIM2_UpdateSource));
1570                     ; 424     if (TIM2_UpdateSource != TIM2_UPDATESOURCE_GLOBAL)
1572  0000 4d            	tnz	a
1573  0001 2705          	jreq	L736
1574                     ; 426         TIM2->CR1 |= (uint8_t)TIM2_CR1_URS;
1576  0003 72145300      	bset	21248,#2
1579  0007 81            	ret	
1580  0008               L736:
1581                     ; 430         TIM2->CR1 &= (uint8_t)(~TIM2_CR1_URS);
1583  0008 72155300      	bres	21248,#2
1584                     ; 432 }
1587  000c 81            	ret	
1644                     ; 443 void TIM2_SelectOnePulseMode(TIM2_OPMode_TypeDef TIM2_OPMode)
1644                     ; 444 {
1645                     .text:	section	.text,new
1646  0000               _TIM2_SelectOnePulseMode:
1650                     ; 446     assert_param(IS_TIM2_OPM_MODE_OK(TIM2_OPMode));
1652                     ; 449     if (TIM2_OPMode != TIM2_OPMODE_REPETITIVE)
1654  0000 4d            	tnz	a
1655  0001 2705          	jreq	L176
1656                     ; 451         TIM2->CR1 |= (uint8_t)TIM2_CR1_OPM;
1658  0003 72165300      	bset	21248,#3
1661  0007 81            	ret	
1662  0008               L176:
1663                     ; 455         TIM2->CR1 &= (uint8_t)(~TIM2_CR1_OPM);
1665  0008 72175300      	bres	21248,#3
1666                     ; 458 }
1669  000c 81            	ret	
1737                     ; 489 void TIM2_PrescalerConfig(TIM2_Prescaler_TypeDef Prescaler,
1737                     ; 490                           TIM2_PSCReloadMode_TypeDef TIM2_PSCReloadMode)
1737                     ; 491 {
1738                     .text:	section	.text,new
1739  0000               _TIM2_PrescalerConfig:
1743                     ; 493     assert_param(IS_TIM2_PRESCALER_RELOAD_OK(TIM2_PSCReloadMode));
1745                     ; 494     assert_param(IS_TIM2_PRESCALER_OK(Prescaler));
1747                     ; 497     TIM2->PSCR = (uint8_t)Prescaler;
1749  0000 9e            	ld	a,xh
1750  0001 c7530c        	ld	21260,a
1751                     ; 500     TIM2->EGR = (uint8_t)TIM2_PSCReloadMode;
1753  0004 9f            	ld	a,xl
1754  0005 c75304        	ld	21252,a
1755                     ; 501 }
1758  0008 81            	ret	
1816                     ; 512 void TIM2_ForcedOC1Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
1816                     ; 513 {
1817                     .text:	section	.text,new
1818  0000               _TIM2_ForcedOC1Config:
1820  0000 88            	push	a
1821       00000000      OFST:	set	0
1824                     ; 515     assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
1826                     ; 518     TIM2->CCMR1  =  (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM))  
1826                     ; 519                               | (uint8_t)TIM2_ForcedAction);
1828  0001 c65305        	ld	a,21253
1829  0004 a48f          	and	a,#143
1830  0006 1a01          	or	a,(OFST+1,sp)
1831  0008 c75305        	ld	21253,a
1832                     ; 520 }
1835  000b 84            	pop	a
1836  000c 81            	ret	
1872                     ; 531 void TIM2_ForcedOC2Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
1872                     ; 532 {
1873                     .text:	section	.text,new
1874  0000               _TIM2_ForcedOC2Config:
1876  0000 88            	push	a
1877       00000000      OFST:	set	0
1880                     ; 534     assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
1882                     ; 537     TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM))  
1882                     ; 538                             | (uint8_t)TIM2_ForcedAction);
1884  0001 c65306        	ld	a,21254
1885  0004 a48f          	and	a,#143
1886  0006 1a01          	or	a,(OFST+1,sp)
1887  0008 c75306        	ld	21254,a
1888                     ; 539 }
1891  000b 84            	pop	a
1892  000c 81            	ret	
1928                     ; 550 void TIM2_ForcedOC3Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
1928                     ; 551 {
1929                     .text:	section	.text,new
1930  0000               _TIM2_ForcedOC3Config:
1932  0000 88            	push	a
1933       00000000      OFST:	set	0
1936                     ; 553     assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
1938                     ; 556     TIM2->CCMR3  =  (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM))
1938                     ; 557                               | (uint8_t)TIM2_ForcedAction);
1940  0001 c65307        	ld	a,21255
1941  0004 a48f          	and	a,#143
1942  0006 1a01          	or	a,(OFST+1,sp)
1943  0008 c75307        	ld	21255,a
1944                     ; 558 }
1947  000b 84            	pop	a
1948  000c 81            	ret	
1984                     ; 567 void TIM2_ARRPreloadConfig(FunctionalState NewState)
1984                     ; 568 {
1985                     .text:	section	.text,new
1986  0000               _TIM2_ARRPreloadConfig:
1990                     ; 570     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1992                     ; 573     if (NewState != DISABLE)
1994  0000 4d            	tnz	a
1995  0001 2705          	jreq	L7201
1996                     ; 575         TIM2->CR1 |= (uint8_t)TIM2_CR1_ARPE;
1998  0003 721e5300      	bset	21248,#7
2001  0007 81            	ret	
2002  0008               L7201:
2003                     ; 579         TIM2->CR1 &= (uint8_t)(~TIM2_CR1_ARPE);
2005  0008 721f5300      	bres	21248,#7
2006                     ; 581 }
2009  000c 81            	ret	
2045                     ; 590 void TIM2_OC1PreloadConfig(FunctionalState NewState)
2045                     ; 591 {
2046                     .text:	section	.text,new
2047  0000               _TIM2_OC1PreloadConfig:
2051                     ; 593     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2053                     ; 596     if (NewState != DISABLE)
2055  0000 4d            	tnz	a
2056  0001 2705          	jreq	L1501
2057                     ; 598         TIM2->CCMR1 |= (uint8_t)TIM2_CCMR_OCxPE;
2059  0003 72165305      	bset	21253,#3
2062  0007 81            	ret	
2063  0008               L1501:
2064                     ; 602         TIM2->CCMR1 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2066  0008 72175305      	bres	21253,#3
2067                     ; 604 }
2070  000c 81            	ret	
2106                     ; 613 void TIM2_OC2PreloadConfig(FunctionalState NewState)
2106                     ; 614 {
2107                     .text:	section	.text,new
2108  0000               _TIM2_OC2PreloadConfig:
2112                     ; 616     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2114                     ; 619     if (NewState != DISABLE)
2116  0000 4d            	tnz	a
2117  0001 2705          	jreq	L3701
2118                     ; 621         TIM2->CCMR2 |= (uint8_t)TIM2_CCMR_OCxPE;
2120  0003 72165306      	bset	21254,#3
2123  0007 81            	ret	
2124  0008               L3701:
2125                     ; 625         TIM2->CCMR2 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2127  0008 72175306      	bres	21254,#3
2128                     ; 627 }
2131  000c 81            	ret	
2167                     ; 636 void TIM2_OC3PreloadConfig(FunctionalState NewState)
2167                     ; 637 {
2168                     .text:	section	.text,new
2169  0000               _TIM2_OC3PreloadConfig:
2173                     ; 639     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2175                     ; 642     if (NewState != DISABLE)
2177  0000 4d            	tnz	a
2178  0001 2705          	jreq	L5111
2179                     ; 644         TIM2->CCMR3 |= (uint8_t)TIM2_CCMR_OCxPE;
2181  0003 72165307      	bset	21255,#3
2184  0007 81            	ret	
2185  0008               L5111:
2186                     ; 648         TIM2->CCMR3 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2188  0008 72175307      	bres	21255,#3
2189                     ; 650 }
2192  000c 81            	ret	
2265                     ; 663 void TIM2_GenerateEvent(TIM2_EventSource_TypeDef TIM2_EventSource)
2265                     ; 664 {
2266                     .text:	section	.text,new
2267  0000               _TIM2_GenerateEvent:
2271                     ; 666     assert_param(IS_TIM2_EVENT_SOURCE_OK(TIM2_EventSource));
2273                     ; 669     TIM2->EGR = (uint8_t)TIM2_EventSource;
2275  0000 c75304        	ld	21252,a
2276                     ; 670 }
2279  0003 81            	ret	
2315                     ; 681 void TIM2_OC1PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
2315                     ; 682 {
2316                     .text:	section	.text,new
2317  0000               _TIM2_OC1PolarityConfig:
2321                     ; 684     assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
2323                     ; 687     if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
2325  0000 4d            	tnz	a
2326  0001 2705          	jreq	L1711
2327                     ; 689         TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC1P;
2329  0003 72125308      	bset	21256,#1
2332  0007 81            	ret	
2333  0008               L1711:
2334                     ; 693         TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1P);
2336  0008 72135308      	bres	21256,#1
2337                     ; 695 }
2340  000c 81            	ret	
2376                     ; 706 void TIM2_OC2PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
2376                     ; 707 {
2377                     .text:	section	.text,new
2378  0000               _TIM2_OC2PolarityConfig:
2382                     ; 709     assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
2384                     ; 712     if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
2386  0000 4d            	tnz	a
2387  0001 2705          	jreq	L3121
2388                     ; 714         TIM2->CCER1 |= TIM2_CCER1_CC2P;
2390  0003 721a5308      	bset	21256,#5
2393  0007 81            	ret	
2394  0008               L3121:
2395                     ; 718         TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2P);
2397  0008 721b5308      	bres	21256,#5
2398                     ; 720 }
2401  000c 81            	ret	
2437                     ; 731 void TIM2_OC3PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
2437                     ; 732 {
2438                     .text:	section	.text,new
2439  0000               _TIM2_OC3PolarityConfig:
2443                     ; 734     assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
2445                     ; 737     if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
2447  0000 4d            	tnz	a
2448  0001 2705          	jreq	L5321
2449                     ; 739         TIM2->CCER2 |= (uint8_t)TIM2_CCER2_CC3P;
2451  0003 72125309      	bset	21257,#1
2454  0007 81            	ret	
2455  0008               L5321:
2456                     ; 743         TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3P);
2458  0008 72135309      	bres	21257,#1
2459                     ; 745 }
2462  000c 81            	ret	
2507                     ; 759 void TIM2_CCxCmd(TIM2_Channel_TypeDef TIM2_Channel, FunctionalState NewState)
2507                     ; 760 {
2508                     .text:	section	.text,new
2509  0000               _TIM2_CCxCmd:
2511  0000 89            	pushw	x
2512       00000000      OFST:	set	0
2515                     ; 762     assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
2517                     ; 763     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2519                     ; 765     if (TIM2_Channel == TIM2_CHANNEL_1)
2521  0001 9e            	ld	a,xh
2522  0002 4d            	tnz	a
2523  0003 2610          	jrne	L3621
2524                     ; 768         if (NewState != DISABLE)
2526  0005 9f            	ld	a,xl
2527  0006 4d            	tnz	a
2528  0007 2706          	jreq	L5621
2529                     ; 770             TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC1E;
2531  0009 72105308      	bset	21256,#0
2533  000d 2029          	jra	L1721
2534  000f               L5621:
2535                     ; 774             TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
2537  000f 72115308      	bres	21256,#0
2538  0013 2023          	jra	L1721
2539  0015               L3621:
2540                     ; 778     else if (TIM2_Channel == TIM2_CHANNEL_2)
2542  0015 7b01          	ld	a,(OFST+1,sp)
2543  0017 4a            	dec	a
2544  0018 2610          	jrne	L3721
2545                     ; 781         if (NewState != DISABLE)
2547  001a 7b02          	ld	a,(OFST+2,sp)
2548  001c 2706          	jreq	L5721
2549                     ; 783             TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC2E;
2551  001e 72185308      	bset	21256,#4
2553  0022 2014          	jra	L1721
2554  0024               L5721:
2555                     ; 787             TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
2557  0024 72195308      	bres	21256,#4
2558  0028 200e          	jra	L1721
2559  002a               L3721:
2560                     ; 793         if (NewState != DISABLE)
2562  002a 7b02          	ld	a,(OFST+2,sp)
2563  002c 2706          	jreq	L3031
2564                     ; 795             TIM2->CCER2 |= (uint8_t)TIM2_CCER2_CC3E;
2566  002e 72105309      	bset	21257,#0
2568  0032 2004          	jra	L1721
2569  0034               L3031:
2570                     ; 799             TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3E);
2572  0034 72115309      	bres	21257,#0
2573  0038               L1721:
2574                     ; 802 }
2577  0038 85            	popw	x
2578  0039 81            	ret	
2623                     ; 824 void TIM2_SelectOCxM(TIM2_Channel_TypeDef TIM2_Channel, TIM2_OCMode_TypeDef TIM2_OCMode)
2623                     ; 825 {
2624                     .text:	section	.text,new
2625  0000               _TIM2_SelectOCxM:
2627  0000 89            	pushw	x
2628       00000000      OFST:	set	0
2631                     ; 827     assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
2633                     ; 828     assert_param(IS_TIM2_OCM_OK(TIM2_OCMode));
2635                     ; 830     if (TIM2_Channel == TIM2_CHANNEL_1)
2637  0001 9e            	ld	a,xh
2638  0002 4d            	tnz	a
2639  0003 2610          	jrne	L1331
2640                     ; 833         TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
2642  0005 72115308      	bres	21256,#0
2643                     ; 836         TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM))
2643                     ; 837                                | (uint8_t)TIM2_OCMode);
2645  0009 c65305        	ld	a,21253
2646  000c a48f          	and	a,#143
2647  000e 1a02          	or	a,(OFST+2,sp)
2648  0010 c75305        	ld	21253,a
2650  0013 2023          	jra	L3331
2651  0015               L1331:
2652                     ; 839     else if (TIM2_Channel == TIM2_CHANNEL_2)
2654  0015 7b01          	ld	a,(OFST+1,sp)
2655  0017 4a            	dec	a
2656  0018 2610          	jrne	L5331
2657                     ; 842         TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
2659  001a 72195308      	bres	21256,#4
2660                     ; 845         TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM))
2660                     ; 846                                 | (uint8_t)TIM2_OCMode);
2662  001e c65306        	ld	a,21254
2663  0021 a48f          	and	a,#143
2664  0023 1a02          	or	a,(OFST+2,sp)
2665  0025 c75306        	ld	21254,a
2667  0028 200e          	jra	L3331
2668  002a               L5331:
2669                     ; 851         TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3E);
2671  002a 72115309      	bres	21257,#0
2672                     ; 854         TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM))
2672                     ; 855                                 | (uint8_t)TIM2_OCMode);
2674  002e c65307        	ld	a,21255
2675  0031 a48f          	and	a,#143
2676  0033 1a02          	or	a,(OFST+2,sp)
2677  0035 c75307        	ld	21255,a
2678  0038               L3331:
2679                     ; 857 }
2682  0038 85            	popw	x
2683  0039 81            	ret	
2717                     ; 866 void TIM2_SetCounter(uint16_t Counter)
2717                     ; 867 {
2718                     .text:	section	.text,new
2719  0000               _TIM2_SetCounter:
2723                     ; 869     TIM2->CNTRH = (uint8_t)(Counter >> 8);
2725  0000 9e            	ld	a,xh
2726  0001 c7530a        	ld	21258,a
2727                     ; 870     TIM2->CNTRL = (uint8_t)(Counter);
2729  0004 9f            	ld	a,xl
2730  0005 c7530b        	ld	21259,a
2731                     ; 872 }
2734  0008 81            	ret	
2768                     ; 881 void TIM2_SetAutoreload(uint16_t Autoreload)
2768                     ; 882 {
2769                     .text:	section	.text,new
2770  0000               _TIM2_SetAutoreload:
2774                     ; 885     TIM2->ARRH = (uint8_t)(Autoreload >> 8);
2776  0000 9e            	ld	a,xh
2777  0001 c7530d        	ld	21261,a
2778                     ; 886     TIM2->ARRL = (uint8_t)(Autoreload);
2780  0004 9f            	ld	a,xl
2781  0005 c7530e        	ld	21262,a
2782                     ; 888 }
2785  0008 81            	ret	
2819                     ; 897 void TIM2_SetCompare1(uint16_t Compare1)
2819                     ; 898 {
2820                     .text:	section	.text,new
2821  0000               _TIM2_SetCompare1:
2825                     ; 900     TIM2->CCR1H = (uint8_t)(Compare1 >> 8);
2827  0000 9e            	ld	a,xh
2828  0001 c7530f        	ld	21263,a
2829                     ; 901     TIM2->CCR1L = (uint8_t)(Compare1);
2831  0004 9f            	ld	a,xl
2832  0005 c75310        	ld	21264,a
2833                     ; 903 }
2836  0008 81            	ret	
2870                     ; 912 void TIM2_SetCompare2(uint16_t Compare2)
2870                     ; 913 {
2871                     .text:	section	.text,new
2872  0000               _TIM2_SetCompare2:
2876                     ; 915     TIM2->CCR2H = (uint8_t)(Compare2 >> 8);
2878  0000 9e            	ld	a,xh
2879  0001 c75311        	ld	21265,a
2880                     ; 916     TIM2->CCR2L = (uint8_t)(Compare2);
2882  0004 9f            	ld	a,xl
2883  0005 c75312        	ld	21266,a
2884                     ; 918 }
2887  0008 81            	ret	
2921                     ; 927 void TIM2_SetCompare3(uint16_t Compare3)
2921                     ; 928 {
2922                     .text:	section	.text,new
2923  0000               _TIM2_SetCompare3:
2927                     ; 930     TIM2->CCR3H = (uint8_t)(Compare3 >> 8);
2929  0000 9e            	ld	a,xh
2930  0001 c75313        	ld	21267,a
2931                     ; 931     TIM2->CCR3L = (uint8_t)(Compare3);
2933  0004 9f            	ld	a,xl
2934  0005 c75314        	ld	21268,a
2935                     ; 933 }
2938  0008 81            	ret	
2974                     ; 946 void TIM2_SetIC1Prescaler(TIM2_ICPSC_TypeDef TIM2_IC1Prescaler)
2974                     ; 947 {
2975                     .text:	section	.text,new
2976  0000               _TIM2_SetIC1Prescaler:
2978  0000 88            	push	a
2979       00000000      OFST:	set	0
2982                     ; 949     assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC1Prescaler));
2984                     ; 952     TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_ICxPSC))
2984                     ; 953                             | (uint8_t)TIM2_IC1Prescaler);
2986  0001 c65305        	ld	a,21253
2987  0004 a4f3          	and	a,#243
2988  0006 1a01          	or	a,(OFST+1,sp)
2989  0008 c75305        	ld	21253,a
2990                     ; 954 }
2993  000b 84            	pop	a
2994  000c 81            	ret	
3030                     ; 966 void TIM2_SetIC2Prescaler(TIM2_ICPSC_TypeDef TIM2_IC2Prescaler)
3030                     ; 967 {
3031                     .text:	section	.text,new
3032  0000               _TIM2_SetIC2Prescaler:
3034  0000 88            	push	a
3035       00000000      OFST:	set	0
3038                     ; 969     assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC2Prescaler));
3040                     ; 972     TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_ICxPSC))
3040                     ; 973                             | (uint8_t)TIM2_IC2Prescaler);
3042  0001 c65306        	ld	a,21254
3043  0004 a4f3          	and	a,#243
3044  0006 1a01          	or	a,(OFST+1,sp)
3045  0008 c75306        	ld	21254,a
3046                     ; 974 }
3049  000b 84            	pop	a
3050  000c 81            	ret	
3086                     ; 986 void TIM2_SetIC3Prescaler(TIM2_ICPSC_TypeDef TIM2_IC3Prescaler)
3086                     ; 987 {
3087                     .text:	section	.text,new
3088  0000               _TIM2_SetIC3Prescaler:
3090  0000 88            	push	a
3091       00000000      OFST:	set	0
3094                     ; 990     assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC3Prescaler));
3096                     ; 992     TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_ICxPSC))
3096                     ; 993                             | (uint8_t)TIM2_IC3Prescaler);
3098  0001 c65307        	ld	a,21255
3099  0004 a4f3          	and	a,#243
3100  0006 1a01          	or	a,(OFST+1,sp)
3101  0008 c75307        	ld	21255,a
3102                     ; 994 }
3105  000b 84            	pop	a
3106  000c 81            	ret	
3158                     ; 1001 uint16_t TIM2_GetCapture1(void)
3158                     ; 1002 {
3159                     .text:	section	.text,new
3160  0000               _TIM2_GetCapture1:
3162  0000 5204          	subw	sp,#4
3163       00000004      OFST:	set	4
3166                     ; 1004     uint16_t tmpccr1 = 0;
3168                     ; 1005     uint8_t tmpccr1l=0, tmpccr1h=0;
3172                     ; 1007     tmpccr1h = TIM2->CCR1H;
3174  0002 c6530f        	ld	a,21263
3175  0005 6b02          	ld	(OFST-2,sp),a
3176                     ; 1008     tmpccr1l = TIM2->CCR1L;
3178  0007 c65310        	ld	a,21264
3179  000a 6b01          	ld	(OFST-3,sp),a
3180                     ; 1010     tmpccr1 = (uint16_t)(tmpccr1l);
3182  000c 5f            	clrw	x
3183  000d 97            	ld	xl,a
3184  000e 1f03          	ldw	(OFST-1,sp),x
3185                     ; 1011     tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
3187  0010 5f            	clrw	x
3188  0011 7b02          	ld	a,(OFST-2,sp)
3189  0013 97            	ld	xl,a
3190  0014 7b04          	ld	a,(OFST+0,sp)
3191  0016 01            	rrwa	x,a
3192  0017 1a03          	or	a,(OFST-1,sp)
3193  0019 01            	rrwa	x,a
3194                     ; 1013     return (uint16_t)tmpccr1;
3198  001a 5b04          	addw	sp,#4
3199  001c 81            	ret	
3251                     ; 1021 uint16_t TIM2_GetCapture2(void)
3251                     ; 1022 {
3252                     .text:	section	.text,new
3253  0000               _TIM2_GetCapture2:
3255  0000 5204          	subw	sp,#4
3256       00000004      OFST:	set	4
3259                     ; 1024     uint16_t tmpccr2 = 0;
3261                     ; 1025     uint8_t tmpccr2l=0, tmpccr2h=0;
3265                     ; 1027     tmpccr2h = TIM2->CCR2H;
3267  0002 c65311        	ld	a,21265
3268  0005 6b02          	ld	(OFST-2,sp),a
3269                     ; 1028     tmpccr2l = TIM2->CCR2L;
3271  0007 c65312        	ld	a,21266
3272  000a 6b01          	ld	(OFST-3,sp),a
3273                     ; 1030     tmpccr2 = (uint16_t)(tmpccr2l);
3275  000c 5f            	clrw	x
3276  000d 97            	ld	xl,a
3277  000e 1f03          	ldw	(OFST-1,sp),x
3278                     ; 1031     tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
3280  0010 5f            	clrw	x
3281  0011 7b02          	ld	a,(OFST-2,sp)
3282  0013 97            	ld	xl,a
3283  0014 7b04          	ld	a,(OFST+0,sp)
3284  0016 01            	rrwa	x,a
3285  0017 1a03          	or	a,(OFST-1,sp)
3286  0019 01            	rrwa	x,a
3287                     ; 1033     return (uint16_t)tmpccr2;
3291  001a 5b04          	addw	sp,#4
3292  001c 81            	ret	
3344                     ; 1041 uint16_t TIM2_GetCapture3(void)
3344                     ; 1042 {
3345                     .text:	section	.text,new
3346  0000               _TIM2_GetCapture3:
3348  0000 5204          	subw	sp,#4
3349       00000004      OFST:	set	4
3352                     ; 1044     uint16_t tmpccr3 = 0;
3354                     ; 1045     uint8_t tmpccr3l=0, tmpccr3h=0;
3358                     ; 1047     tmpccr3h = TIM2->CCR3H;
3360  0002 c65313        	ld	a,21267
3361  0005 6b02          	ld	(OFST-2,sp),a
3362                     ; 1048     tmpccr3l = TIM2->CCR3L;
3364  0007 c65314        	ld	a,21268
3365  000a 6b01          	ld	(OFST-3,sp),a
3366                     ; 1050     tmpccr3 = (uint16_t)(tmpccr3l);
3368  000c 5f            	clrw	x
3369  000d 97            	ld	xl,a
3370  000e 1f03          	ldw	(OFST-1,sp),x
3371                     ; 1051     tmpccr3 |= (uint16_t)((uint16_t)tmpccr3h << 8);
3373  0010 5f            	clrw	x
3374  0011 7b02          	ld	a,(OFST-2,sp)
3375  0013 97            	ld	xl,a
3376  0014 7b04          	ld	a,(OFST+0,sp)
3377  0016 01            	rrwa	x,a
3378  0017 1a03          	or	a,(OFST-1,sp)
3379  0019 01            	rrwa	x,a
3380                     ; 1053     return (uint16_t)tmpccr3;
3384  001a 5b04          	addw	sp,#4
3385  001c 81            	ret	
3419                     ; 1061 uint16_t TIM2_GetCounter(void)
3419                     ; 1062 {
3420                     .text:	section	.text,new
3421  0000               _TIM2_GetCounter:
3423  0000 89            	pushw	x
3424       00000002      OFST:	set	2
3427                     ; 1063      uint16_t tmpcntr = 0;
3429                     ; 1065     tmpcntr =  ((uint16_t)TIM2->CNTRH << 8);
3431  0001 c6530a        	ld	a,21258
3432  0004 97            	ld	xl,a
3433  0005 4f            	clr	a
3434  0006 02            	rlwa	x,a
3435  0007 1f01          	ldw	(OFST-1,sp),x
3436                     ; 1067     return (uint16_t)( tmpcntr| (uint16_t)(TIM2->CNTRL));
3438  0009 5f            	clrw	x
3439  000a c6530b        	ld	a,21259
3440  000d 97            	ld	xl,a
3441  000e 01            	rrwa	x,a
3442  000f 1a02          	or	a,(OFST+0,sp)
3443  0011 01            	rrwa	x,a
3444  0012 1a01          	or	a,(OFST-1,sp)
3445  0014 01            	rrwa	x,a
3448  0015 5b02          	addw	sp,#2
3449  0017 81            	ret	
3473                     ; 1076 TIM2_Prescaler_TypeDef TIM2_GetPrescaler(void)
3473                     ; 1077 {
3474                     .text:	section	.text,new
3475  0000               _TIM2_GetPrescaler:
3479                     ; 1079     return (TIM2_Prescaler_TypeDef)(TIM2->PSCR);
3481  0000 c6530c        	ld	a,21260
3484  0003 81            	ret	
3623                     ; 1096 FlagStatus TIM2_GetFlagStatus(TIM2_FLAG_TypeDef TIM2_FLAG)
3623                     ; 1097 {
3624                     .text:	section	.text,new
3625  0000               _TIM2_GetFlagStatus:
3627  0000 89            	pushw	x
3628  0001 89            	pushw	x
3629       00000002      OFST:	set	2
3632                     ; 1098     FlagStatus bitstatus = RESET;
3634                     ; 1099     uint8_t tim2_flag_l = 0, tim2_flag_h = 0;
3638                     ; 1102     assert_param(IS_TIM2_GET_FLAG_OK(TIM2_FLAG));
3640                     ; 1104     tim2_flag_l = (uint8_t)(TIM2->SR1 & (uint8_t)TIM2_FLAG);
3642  0002 9f            	ld	a,xl
3643  0003 c45302        	and	a,21250
3644  0006 6b01          	ld	(OFST-1,sp),a
3645                     ; 1105     tim2_flag_h = (uint8_t)((uint16_t)TIM2_FLAG >> 8);
3647  0008 7b03          	ld	a,(OFST+1,sp)
3648  000a 6b02          	ld	(OFST+0,sp),a
3649                     ; 1107     if ((tim2_flag_l | (uint8_t)(TIM2->SR2 & tim2_flag_h)) != (uint8_t)RESET )
3651  000c c45303        	and	a,21251
3652  000f 1a01          	or	a,(OFST-1,sp)
3653  0011 2702          	jreq	L5371
3654                     ; 1109         bitstatus = SET;
3656  0013 a601          	ld	a,#1
3658  0015               L5371:
3659                     ; 1113         bitstatus = RESET;
3661                     ; 1115     return (FlagStatus)bitstatus;
3665  0015 5b04          	addw	sp,#4
3666  0017 81            	ret	
3701                     ; 1132 void TIM2_ClearFlag(TIM2_FLAG_TypeDef TIM2_FLAG)
3701                     ; 1133 {
3702                     .text:	section	.text,new
3703  0000               _TIM2_ClearFlag:
3707                     ; 1135     assert_param(IS_TIM2_CLEAR_FLAG_OK(TIM2_FLAG));
3709                     ; 1138     TIM2->SR1 = (uint8_t)(~((uint8_t)(TIM2_FLAG)));
3711  0000 9f            	ld	a,xl
3712  0001 43            	cpl	a
3713  0002 c75302        	ld	21250,a
3714                     ; 1139     TIM2->SR2 = (uint8_t)(~((uint8_t)((uint8_t)TIM2_FLAG >> 8)));
3716  0005 35ff5303      	mov	21251,#255
3717                     ; 1140 }
3720  0009 81            	ret	
3784                     ; 1154 ITStatus TIM2_GetITStatus(TIM2_IT_TypeDef TIM2_IT)
3784                     ; 1155 {
3785                     .text:	section	.text,new
3786  0000               _TIM2_GetITStatus:
3788  0000 88            	push	a
3789  0001 89            	pushw	x
3790       00000002      OFST:	set	2
3793                     ; 1156     ITStatus bitstatus = RESET;
3795                     ; 1157     uint8_t TIM2_itStatus = 0, TIM2_itEnable = 0;
3799                     ; 1160     assert_param(IS_TIM2_GET_IT_OK(TIM2_IT));
3801                     ; 1162     TIM2_itStatus = (uint8_t)(TIM2->SR1 & TIM2_IT);
3803  0002 c45302        	and	a,21250
3804  0005 6b01          	ld	(OFST-1,sp),a
3805                     ; 1164     TIM2_itEnable = (uint8_t)(TIM2->IER & TIM2_IT);
3807  0007 c65301        	ld	a,21249
3808  000a 1403          	and	a,(OFST+1,sp)
3809  000c 6b02          	ld	(OFST+0,sp),a
3810                     ; 1166     if ((TIM2_itStatus != (uint8_t)RESET ) && (TIM2_itEnable != (uint8_t)RESET ))
3812  000e 7b01          	ld	a,(OFST-1,sp)
3813  0010 2708          	jreq	L1102
3815  0012 7b02          	ld	a,(OFST+0,sp)
3816  0014 2704          	jreq	L1102
3817                     ; 1168         bitstatus = SET;
3819  0016 a601          	ld	a,#1
3821  0018 2001          	jra	L3102
3822  001a               L1102:
3823                     ; 1172         bitstatus = RESET;
3825  001a 4f            	clr	a
3826  001b               L3102:
3827                     ; 1174     return (ITStatus)(bitstatus);
3831  001b 5b03          	addw	sp,#3
3832  001d 81            	ret	
3868                     ; 1188 void TIM2_ClearITPendingBit(TIM2_IT_TypeDef TIM2_IT)
3868                     ; 1189 {
3869                     .text:	section	.text,new
3870  0000               _TIM2_ClearITPendingBit:
3874                     ; 1191     assert_param(IS_TIM2_IT_OK(TIM2_IT));
3876                     ; 1194     TIM2->SR1 = (uint8_t)(~TIM2_IT);
3878  0000 43            	cpl	a
3879  0001 c75302        	ld	21250,a
3880                     ; 1195 }
3883  0004 81            	ret	
3935                     ; 1214 static void TI1_Config(uint8_t TIM2_ICPolarity,
3935                     ; 1215                        uint8_t TIM2_ICSelection,
3935                     ; 1216                        uint8_t TIM2_ICFilter)
3935                     ; 1217 {
3936                     .text:	section	.text,new
3937  0000               L3_TI1_Config:
3939  0000 89            	pushw	x
3940       00000001      OFST:	set	1
3943                     ; 1219     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
3945  0001 72115308      	bres	21256,#0
3946  0005 88            	push	a
3947                     ; 1222     TIM2->CCMR1  = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~(uint8_t)( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF )))
3947                     ; 1223                              | (uint8_t)(((TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
3949  0006 7b06          	ld	a,(OFST+5,sp)
3950  0008 97            	ld	xl,a
3951  0009 a610          	ld	a,#16
3952  000b 42            	mul	x,a
3953  000c 9f            	ld	a,xl
3954  000d 1a03          	or	a,(OFST+2,sp)
3955  000f 6b01          	ld	(OFST+0,sp),a
3956  0011 c65305        	ld	a,21253
3957  0014 a40c          	and	a,#12
3958  0016 1a01          	or	a,(OFST+0,sp)
3959  0018 c75305        	ld	21253,a
3960                     ; 1226     if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
3962  001b 7b02          	ld	a,(OFST+1,sp)
3963  001d 2706          	jreq	L1602
3964                     ; 1228         TIM2->CCER1 |= TIM2_CCER1_CC1P;
3966  001f 72125308      	bset	21256,#1
3968  0023 2004          	jra	L3602
3969  0025               L1602:
3970                     ; 1232         TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1P);
3972  0025 72135308      	bres	21256,#1
3973  0029               L3602:
3974                     ; 1235     TIM2->CCER1 |= TIM2_CCER1_CC1E;
3976  0029 72105308      	bset	21256,#0
3977                     ; 1236 }
3980  002d 5b03          	addw	sp,#3
3981  002f 81            	ret	
4033                     ; 1255 static void TI2_Config(uint8_t TIM2_ICPolarity,
4033                     ; 1256                        uint8_t TIM2_ICSelection,
4033                     ; 1257                        uint8_t TIM2_ICFilter)
4033                     ; 1258 {
4034                     .text:	section	.text,new
4035  0000               L5_TI2_Config:
4037  0000 89            	pushw	x
4038       00000001      OFST:	set	1
4041                     ; 1260     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
4043  0001 72195308      	bres	21256,#4
4044  0005 88            	push	a
4045                     ; 1263     TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~(uint8_t)( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF ))) 
4045                     ; 1264                             | (uint8_t)(( (TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
4047  0006 7b06          	ld	a,(OFST+5,sp)
4048  0008 97            	ld	xl,a
4049  0009 a610          	ld	a,#16
4050  000b 42            	mul	x,a
4051  000c 9f            	ld	a,xl
4052  000d 1a03          	or	a,(OFST+2,sp)
4053  000f 6b01          	ld	(OFST+0,sp),a
4054  0011 c65306        	ld	a,21254
4055  0014 a40c          	and	a,#12
4056  0016 1a01          	or	a,(OFST+0,sp)
4057  0018 c75306        	ld	21254,a
4058                     ; 1268     if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
4060  001b 7b02          	ld	a,(OFST+1,sp)
4061  001d 2706          	jreq	L3112
4062                     ; 1270         TIM2->CCER1 |= TIM2_CCER1_CC2P;
4064  001f 721a5308      	bset	21256,#5
4066  0023 2004          	jra	L5112
4067  0025               L3112:
4068                     ; 1274         TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2P);
4070  0025 721b5308      	bres	21256,#5
4071  0029               L5112:
4072                     ; 1278     TIM2->CCER1 |= TIM2_CCER1_CC2E;
4074  0029 72185308      	bset	21256,#4
4075                     ; 1280 }
4078  002d 5b03          	addw	sp,#3
4079  002f 81            	ret	
4131                     ; 1296 static void TI3_Config(uint8_t TIM2_ICPolarity, uint8_t TIM2_ICSelection,
4131                     ; 1297                        uint8_t TIM2_ICFilter)
4131                     ; 1298 {
4132                     .text:	section	.text,new
4133  0000               L7_TI3_Config:
4135  0000 89            	pushw	x
4136       00000001      OFST:	set	1
4139                     ; 1300     TIM2->CCER2 &=  (uint8_t)(~TIM2_CCER2_CC3E);
4141  0001 72115309      	bres	21257,#0
4142  0005 88            	push	a
4143                     ; 1303     TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF))) 
4143                     ; 1304                             | (uint8_t)(( (TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
4145  0006 7b06          	ld	a,(OFST+5,sp)
4146  0008 97            	ld	xl,a
4147  0009 a610          	ld	a,#16
4148  000b 42            	mul	x,a
4149  000c 9f            	ld	a,xl
4150  000d 1a03          	or	a,(OFST+2,sp)
4151  000f 6b01          	ld	(OFST+0,sp),a
4152  0011 c65307        	ld	a,21255
4153  0014 a40c          	and	a,#12
4154  0016 1a01          	or	a,(OFST+0,sp)
4155  0018 c75307        	ld	21255,a
4156                     ; 1308     if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
4158  001b 7b02          	ld	a,(OFST+1,sp)
4159  001d 2706          	jreq	L5412
4160                     ; 1310         TIM2->CCER2 |= TIM2_CCER2_CC3P;
4162  001f 72125309      	bset	21257,#1
4164  0023 2004          	jra	L7412
4165  0025               L5412:
4166                     ; 1314         TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3P);
4168  0025 72135309      	bres	21257,#1
4169  0029               L7412:
4170                     ; 1317     TIM2->CCER2 |= TIM2_CCER2_CC3E;
4172  0029 72105309      	bset	21257,#0
4173                     ; 1318 }
4176  002d 5b03          	addw	sp,#3
4177  002f 81            	ret	
4190                     	xdef	_TIM2_ClearITPendingBit
4191                     	xdef	_TIM2_GetITStatus
4192                     	xdef	_TIM2_ClearFlag
4193                     	xdef	_TIM2_GetFlagStatus
4194                     	xdef	_TIM2_GetPrescaler
4195                     	xdef	_TIM2_GetCounter
4196                     	xdef	_TIM2_GetCapture3
4197                     	xdef	_TIM2_GetCapture2
4198                     	xdef	_TIM2_GetCapture1
4199                     	xdef	_TIM2_SetIC3Prescaler
4200                     	xdef	_TIM2_SetIC2Prescaler
4201                     	xdef	_TIM2_SetIC1Prescaler
4202                     	xdef	_TIM2_SetCompare3
4203                     	xdef	_TIM2_SetCompare2
4204                     	xdef	_TIM2_SetCompare1
4205                     	xdef	_TIM2_SetAutoreload
4206                     	xdef	_TIM2_SetCounter
4207                     	xdef	_TIM2_SelectOCxM
4208                     	xdef	_TIM2_CCxCmd
4209                     	xdef	_TIM2_OC3PolarityConfig
4210                     	xdef	_TIM2_OC2PolarityConfig
4211                     	xdef	_TIM2_OC1PolarityConfig
4212                     	xdef	_TIM2_GenerateEvent
4213                     	xdef	_TIM2_OC3PreloadConfig
4214                     	xdef	_TIM2_OC2PreloadConfig
4215                     	xdef	_TIM2_OC1PreloadConfig
4216                     	xdef	_TIM2_ARRPreloadConfig
4217                     	xdef	_TIM2_ForcedOC3Config
4218                     	xdef	_TIM2_ForcedOC2Config
4219                     	xdef	_TIM2_ForcedOC1Config
4220                     	xdef	_TIM2_PrescalerConfig
4221                     	xdef	_TIM2_SelectOnePulseMode
4222                     	xdef	_TIM2_UpdateRequestConfig
4223                     	xdef	_TIM2_UpdateDisableConfig
4224                     	xdef	_TIM2_ITConfig
4225                     	xdef	_TIM2_Cmd
4226                     	xdef	_TIM2_PWMIConfig
4227                     	xdef	_TIM2_ICInit
4228                     	xdef	_TIM2_OC3Init
4229                     	xdef	_TIM2_OC2Init
4230                     	xdef	_TIM2_OC1Init
4231                     	xdef	_TIM2_TimeBaseInit
4232                     	xdef	_TIM2_DeInit
4251                     	end
