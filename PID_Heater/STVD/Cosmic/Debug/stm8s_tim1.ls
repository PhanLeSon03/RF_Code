   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
   4                     ; Optimizer V4.3.6 - 29 Nov 2011
  48                     ; 52 void TIM1_DeInit(void)
  48                     ; 53 {
  50                     .text:	section	.text,new
  51  0000               _TIM1_DeInit:
  55                     ; 54     TIM1->CR1  = TIM1_CR1_RESET_VALUE;
  57  0000 725f5250      	clr	21072
  58                     ; 55     TIM1->CR2  = TIM1_CR2_RESET_VALUE;
  60  0004 725f5251      	clr	21073
  61                     ; 56     TIM1->SMCR = TIM1_SMCR_RESET_VALUE;
  63  0008 725f5252      	clr	21074
  64                     ; 57     TIM1->ETR  = TIM1_ETR_RESET_VALUE;
  66  000c 725f5253      	clr	21075
  67                     ; 58     TIM1->IER  = TIM1_IER_RESET_VALUE;
  69  0010 725f5254      	clr	21076
  70                     ; 59     TIM1->SR2  = TIM1_SR2_RESET_VALUE;
  72  0014 725f5256      	clr	21078
  73                     ; 61     TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
  75  0018 725f525c      	clr	21084
  76                     ; 62     TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
  78  001c 725f525d      	clr	21085
  79                     ; 64     TIM1->CCMR1 = 0x01;
  81  0020 35015258      	mov	21080,#1
  82                     ; 65     TIM1->CCMR2 = 0x01;
  84  0024 35015259      	mov	21081,#1
  85                     ; 66     TIM1->CCMR3 = 0x01;
  87  0028 3501525a      	mov	21082,#1
  88                     ; 67     TIM1->CCMR4 = 0x01;
  90  002c 3501525b      	mov	21083,#1
  91                     ; 69     TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
  93  0030 725f525c      	clr	21084
  94                     ; 70     TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
  96  0034 725f525d      	clr	21085
  97                     ; 71     TIM1->CCMR1 = TIM1_CCMR1_RESET_VALUE;
  99  0038 725f5258      	clr	21080
 100                     ; 72     TIM1->CCMR2 = TIM1_CCMR2_RESET_VALUE;
 102  003c 725f5259      	clr	21081
 103                     ; 73     TIM1->CCMR3 = TIM1_CCMR3_RESET_VALUE;
 105  0040 725f525a      	clr	21082
 106                     ; 74     TIM1->CCMR4 = TIM1_CCMR4_RESET_VALUE;
 108  0044 725f525b      	clr	21083
 109                     ; 75     TIM1->CNTRH = TIM1_CNTRH_RESET_VALUE;
 111  0048 725f525e      	clr	21086
 112                     ; 76     TIM1->CNTRL = TIM1_CNTRL_RESET_VALUE;
 114  004c 725f525f      	clr	21087
 115                     ; 77     TIM1->PSCRH = TIM1_PSCRH_RESET_VALUE;
 117  0050 725f5260      	clr	21088
 118                     ; 78     TIM1->PSCRL = TIM1_PSCRL_RESET_VALUE;
 120  0054 725f5261      	clr	21089
 121                     ; 79     TIM1->ARRH  = TIM1_ARRH_RESET_VALUE;
 123  0058 35ff5262      	mov	21090,#255
 124                     ; 80     TIM1->ARRL  = TIM1_ARRL_RESET_VALUE;
 126  005c 35ff5263      	mov	21091,#255
 127                     ; 81     TIM1->CCR1H = TIM1_CCR1H_RESET_VALUE;
 129  0060 725f5265      	clr	21093
 130                     ; 82     TIM1->CCR1L = TIM1_CCR1L_RESET_VALUE;
 132  0064 725f5266      	clr	21094
 133                     ; 83     TIM1->CCR2H = TIM1_CCR2H_RESET_VALUE;
 135  0068 725f5267      	clr	21095
 136                     ; 84     TIM1->CCR2L = TIM1_CCR2L_RESET_VALUE;
 138  006c 725f5268      	clr	21096
 139                     ; 85     TIM1->CCR3H = TIM1_CCR3H_RESET_VALUE;
 141  0070 725f5269      	clr	21097
 142                     ; 86     TIM1->CCR3L = TIM1_CCR3L_RESET_VALUE;
 144  0074 725f526a      	clr	21098
 145                     ; 87     TIM1->CCR4H = TIM1_CCR4H_RESET_VALUE;
 147  0078 725f526b      	clr	21099
 148                     ; 88     TIM1->CCR4L = TIM1_CCR4L_RESET_VALUE;
 150  007c 725f526c      	clr	21100
 151                     ; 89     TIM1->OISR  = TIM1_OISR_RESET_VALUE;
 153  0080 725f526f      	clr	21103
 154                     ; 90     TIM1->EGR   = 0x01; /* TIM1_EGR_UG */
 156  0084 35015257      	mov	21079,#1
 157                     ; 91     TIM1->DTR   = TIM1_DTR_RESET_VALUE;
 159  0088 725f526e      	clr	21102
 160                     ; 92     TIM1->BKR   = TIM1_BKR_RESET_VALUE;
 162  008c 725f526d      	clr	21101
 163                     ; 93     TIM1->RCR   = TIM1_RCR_RESET_VALUE;
 165  0090 725f5264      	clr	21092
 166                     ; 94     TIM1->SR1   = TIM1_SR1_RESET_VALUE;
 168  0094 725f5255      	clr	21077
 169                     ; 95 }
 172  0098 81            	ret	
 281                     ; 105 void TIM1_TimeBaseInit(uint16_t TIM1_Prescaler,
 281                     ; 106                        TIM1_CounterMode_TypeDef TIM1_CounterMode,
 281                     ; 107                        uint16_t TIM1_Period,
 281                     ; 108                        uint8_t TIM1_RepetitionCounter)
 281                     ; 109 {
 282                     .text:	section	.text,new
 283  0000               _TIM1_TimeBaseInit:
 285  0000 89            	pushw	x
 286       00000000      OFST:	set	0
 289                     ; 112     assert_param(IS_TIM1_COUNTER_MODE_OK(TIM1_CounterMode));
 291                     ; 115     TIM1->ARRH = (uint8_t)(TIM1_Period >> 8);
 293  0001 7b06          	ld	a,(OFST+6,sp)
 294  0003 c75262        	ld	21090,a
 295                     ; 116     TIM1->ARRL = (uint8_t)(TIM1_Period);
 297  0006 7b07          	ld	a,(OFST+7,sp)
 298  0008 c75263        	ld	21091,a
 299                     ; 119     TIM1->PSCRH = (uint8_t)(TIM1_Prescaler >> 8);
 301  000b 9e            	ld	a,xh
 302  000c c75260        	ld	21088,a
 303                     ; 120     TIM1->PSCRL = (uint8_t)(TIM1_Prescaler);
 305  000f 9f            	ld	a,xl
 306  0010 c75261        	ld	21089,a
 307                     ; 123     TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)(~(TIM1_CR1_CMS | TIM1_CR1_DIR)))
 307                     ; 124                            | (uint8_t)(TIM1_CounterMode));
 309  0013 c65250        	ld	a,21072
 310  0016 a48f          	and	a,#143
 311  0018 1a05          	or	a,(OFST+5,sp)
 312  001a c75250        	ld	21072,a
 313                     ; 127     TIM1->RCR = TIM1_RepetitionCounter;
 315  001d 7b08          	ld	a,(OFST+8,sp)
 316  001f c75264        	ld	21092,a
 317                     ; 129 }
 320  0022 85            	popw	x
 321  0023 81            	ret	
 606                     ; 150 void TIM1_OC1Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 606                     ; 151                   TIM1_OutputState_TypeDef TIM1_OutputState,
 606                     ; 152                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 606                     ; 153                   uint16_t TIM1_Pulse,
 606                     ; 154                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 606                     ; 155                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 606                     ; 156                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 606                     ; 157                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 606                     ; 158 {
 607                     .text:	section	.text,new
 608  0000               _TIM1_OC1Init:
 610  0000 89            	pushw	x
 611  0001 5203          	subw	sp,#3
 612       00000003      OFST:	set	3
 615                     ; 160     assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
 617                     ; 161     assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
 619                     ; 162     assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
 621                     ; 163     assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
 623                     ; 164     assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
 625                     ; 165     assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
 627                     ; 166     assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
 629                     ; 170     TIM1->CCER1 &= (uint8_t)(~( TIM1_CCER1_CC1E | TIM1_CCER1_CC1NE 
 629                     ; 171                                | TIM1_CCER1_CC1P | TIM1_CCER1_CC1NP));
 631  0003 c6525c        	ld	a,21084
 632  0006 a4f0          	and	a,#240
 633  0008 c7525c        	ld	21084,a
 634                     ; 174   TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC1E)
 634                     ; 175                                      | (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC1NE))
 634                     ; 176                            | (uint8_t)( (uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC1P)
 634                     ; 177                                         | (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC1NP)));
 636  000b 7b0c          	ld	a,(OFST+9,sp)
 637  000d a408          	and	a,#8
 638  000f 6b03          	ld	(OFST+0,sp),a
 639  0011 7b0b          	ld	a,(OFST+8,sp)
 640  0013 a402          	and	a,#2
 641  0015 1a03          	or	a,(OFST+0,sp)
 642  0017 6b02          	ld	(OFST-1,sp),a
 643  0019 7b08          	ld	a,(OFST+5,sp)
 644  001b a404          	and	a,#4
 645  001d 6b01          	ld	(OFST-2,sp),a
 646  001f 9f            	ld	a,xl
 647  0020 a401          	and	a,#1
 648  0022 1a01          	or	a,(OFST-2,sp)
 649  0024 1a02          	or	a,(OFST-1,sp)
 650  0026 ca525c        	or	a,21084
 651  0029 c7525c        	ld	21084,a
 652                     ; 180     TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) | 
 652                     ; 181                             (uint8_t)TIM1_OCMode);
 654  002c c65258        	ld	a,21080
 655  002f a48f          	and	a,#143
 656  0031 1a04          	or	a,(OFST+1,sp)
 657  0033 c75258        	ld	21080,a
 658                     ; 184     TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS1 | TIM1_OISR_OIS1N));
 660  0036 c6526f        	ld	a,21103
 661  0039 a4fc          	and	a,#252
 662  003b c7526f        	ld	21103,a
 663                     ; 186     TIM1->OISR |= (uint8_t)((uint8_t)( TIM1_OCIdleState & TIM1_OISR_OIS1 ) | 
 663                     ; 187                             (uint8_t)( TIM1_OCNIdleState & TIM1_OISR_OIS1N ));
 665  003e 7b0e          	ld	a,(OFST+11,sp)
 666  0040 a402          	and	a,#2
 667  0042 6b03          	ld	(OFST+0,sp),a
 668  0044 7b0d          	ld	a,(OFST+10,sp)
 669  0046 a401          	and	a,#1
 670  0048 1a03          	or	a,(OFST+0,sp)
 671  004a ca526f        	or	a,21103
 672  004d c7526f        	ld	21103,a
 673                     ; 190     TIM1->CCR1H = (uint8_t)(TIM1_Pulse >> 8);
 675  0050 7b09          	ld	a,(OFST+6,sp)
 676  0052 c75265        	ld	21093,a
 677                     ; 191     TIM1->CCR1L = (uint8_t)(TIM1_Pulse);
 679  0055 7b0a          	ld	a,(OFST+7,sp)
 680  0057 c75266        	ld	21094,a
 681                     ; 192 }
 684  005a 5b05          	addw	sp,#5
 685  005c 81            	ret	
 789                     ; 213 void TIM1_OC2Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 789                     ; 214                   TIM1_OutputState_TypeDef TIM1_OutputState,
 789                     ; 215                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 789                     ; 216                   uint16_t TIM1_Pulse,
 789                     ; 217                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 789                     ; 218                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 789                     ; 219                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 789                     ; 220                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 789                     ; 221 {
 790                     .text:	section	.text,new
 791  0000               _TIM1_OC2Init:
 793  0000 89            	pushw	x
 794  0001 5203          	subw	sp,#3
 795       00000003      OFST:	set	3
 798                     ; 223     assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
 800                     ; 224     assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
 802                     ; 225     assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
 804                     ; 226     assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
 806                     ; 227     assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
 808                     ; 228     assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
 810                     ; 229     assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
 812                     ; 233     TIM1->CCER1 &= (uint8_t)(~( TIM1_CCER1_CC2E | TIM1_CCER1_CC2NE | 
 812                     ; 234                                 TIM1_CCER1_CC2P | TIM1_CCER1_CC2NP));
 814  0003 c6525c        	ld	a,21084
 815  0006 a40f          	and	a,#15
 816  0008 c7525c        	ld	21084,a
 817                     ; 238     TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC2E  ) | 
 817                     ; 239                              (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC2NE )) | 
 817                     ; 240                              (uint8_t)((uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC2P  ) | 
 817                     ; 241                              (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC2NP )));
 819  000b 7b0c          	ld	a,(OFST+9,sp)
 820  000d a480          	and	a,#128
 821  000f 6b03          	ld	(OFST+0,sp),a
 822  0011 7b0b          	ld	a,(OFST+8,sp)
 823  0013 a420          	and	a,#32
 824  0015 1a03          	or	a,(OFST+0,sp)
 825  0017 6b02          	ld	(OFST-1,sp),a
 826  0019 7b08          	ld	a,(OFST+5,sp)
 827  001b a440          	and	a,#64
 828  001d 6b01          	ld	(OFST-2,sp),a
 829  001f 9f            	ld	a,xl
 830  0020 a410          	and	a,#16
 831  0022 1a01          	or	a,(OFST-2,sp)
 832  0024 1a02          	or	a,(OFST-1,sp)
 833  0026 ca525c        	or	a,21084
 834  0029 c7525c        	ld	21084,a
 835                     ; 244     TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | 
 835                     ; 245                              (uint8_t)TIM1_OCMode);
 837  002c c65259        	ld	a,21081
 838  002f a48f          	and	a,#143
 839  0031 1a04          	or	a,(OFST+1,sp)
 840  0033 c75259        	ld	21081,a
 841                     ; 248     TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS2 | TIM1_OISR_OIS2N));
 843  0036 c6526f        	ld	a,21103
 844  0039 a4f3          	and	a,#243
 845  003b c7526f        	ld	21103,a
 846                     ; 250     TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS2 & TIM1_OCIdleState) | 
 846                     ; 251                             (uint8_t)(TIM1_OISR_OIS2N & TIM1_OCNIdleState));
 848  003e 7b0e          	ld	a,(OFST+11,sp)
 849  0040 a408          	and	a,#8
 850  0042 6b03          	ld	(OFST+0,sp),a
 851  0044 7b0d          	ld	a,(OFST+10,sp)
 852  0046 a404          	and	a,#4
 853  0048 1a03          	or	a,(OFST+0,sp)
 854  004a ca526f        	or	a,21103
 855  004d c7526f        	ld	21103,a
 856                     ; 254     TIM1->CCR2H = (uint8_t)(TIM1_Pulse >> 8);
 858  0050 7b09          	ld	a,(OFST+6,sp)
 859  0052 c75267        	ld	21095,a
 860                     ; 255     TIM1->CCR2L = (uint8_t)(TIM1_Pulse);
 862  0055 7b0a          	ld	a,(OFST+7,sp)
 863  0057 c75268        	ld	21096,a
 864                     ; 257 }
 867  005a 5b05          	addw	sp,#5
 868  005c 81            	ret	
 972                     ; 278 void TIM1_OC3Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 972                     ; 279                   TIM1_OutputState_TypeDef TIM1_OutputState,
 972                     ; 280                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 972                     ; 281                   uint16_t TIM1_Pulse,
 972                     ; 282                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 972                     ; 283                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 972                     ; 284                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 972                     ; 285                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 972                     ; 286 {
 973                     .text:	section	.text,new
 974  0000               _TIM1_OC3Init:
 976  0000 89            	pushw	x
 977  0001 5203          	subw	sp,#3
 978       00000003      OFST:	set	3
 981                     ; 288     assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
 983                     ; 289     assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
 985                     ; 290     assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
 987                     ; 291     assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
 989                     ; 292     assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
 991                     ; 293     assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
 993                     ; 294     assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
 995                     ; 298     TIM1->CCER2 &= (uint8_t)(~( TIM1_CCER2_CC3E | TIM1_CCER2_CC3NE | 
 995                     ; 299                                 TIM1_CCER2_CC3P | TIM1_CCER2_CC3NP));
 997  0003 c6525d        	ld	a,21085
 998  0006 a4f0          	and	a,#240
 999  0008 c7525d        	ld	21085,a
1000                     ; 302     TIM1->CCER2 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState  & TIM1_CCER2_CC3E   ) |
1000                     ; 303                              (uint8_t)(TIM1_OutputNState & TIM1_CCER2_CC3NE  )) | 
1000                     ; 304                              (uint8_t)((uint8_t)(TIM1_OCPolarity   & TIM1_CCER2_CC3P   ) | 
1000                     ; 305                              (uint8_t)(TIM1_OCNPolarity  & TIM1_CCER2_CC3NP  )));
1002  000b 7b0c          	ld	a,(OFST+9,sp)
1003  000d a408          	and	a,#8
1004  000f 6b03          	ld	(OFST+0,sp),a
1005  0011 7b0b          	ld	a,(OFST+8,sp)
1006  0013 a402          	and	a,#2
1007  0015 1a03          	or	a,(OFST+0,sp)
1008  0017 6b02          	ld	(OFST-1,sp),a
1009  0019 7b08          	ld	a,(OFST+5,sp)
1010  001b a404          	and	a,#4
1011  001d 6b01          	ld	(OFST-2,sp),a
1012  001f 9f            	ld	a,xl
1013  0020 a401          	and	a,#1
1014  0022 1a01          	or	a,(OFST-2,sp)
1015  0024 1a02          	or	a,(OFST-1,sp)
1016  0026 ca525d        	or	a,21085
1017  0029 c7525d        	ld	21085,a
1018                     ; 308     TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) | 
1018                     ; 309                              (uint8_t)TIM1_OCMode);
1020  002c c6525a        	ld	a,21082
1021  002f a48f          	and	a,#143
1022  0031 1a04          	or	a,(OFST+1,sp)
1023  0033 c7525a        	ld	21082,a
1024                     ; 312     TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS3 | TIM1_OISR_OIS3N));
1026  0036 c6526f        	ld	a,21103
1027  0039 a4cf          	and	a,#207
1028  003b c7526f        	ld	21103,a
1029                     ; 314     TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS3 & TIM1_OCIdleState) | 
1029                     ; 315                             (uint8_t)(TIM1_OISR_OIS3N & TIM1_OCNIdleState));
1031  003e 7b0e          	ld	a,(OFST+11,sp)
1032  0040 a420          	and	a,#32
1033  0042 6b03          	ld	(OFST+0,sp),a
1034  0044 7b0d          	ld	a,(OFST+10,sp)
1035  0046 a410          	and	a,#16
1036  0048 1a03          	or	a,(OFST+0,sp)
1037  004a ca526f        	or	a,21103
1038  004d c7526f        	ld	21103,a
1039                     ; 318     TIM1->CCR3H = (uint8_t)(TIM1_Pulse >> 8);
1041  0050 7b09          	ld	a,(OFST+6,sp)
1042  0052 c75269        	ld	21097,a
1043                     ; 319     TIM1->CCR3L = (uint8_t)(TIM1_Pulse);
1045  0055 7b0a          	ld	a,(OFST+7,sp)
1046  0057 c7526a        	ld	21098,a
1047                     ; 321 }
1050  005a 5b05          	addw	sp,#5
1051  005c 81            	ret	
1125                     ; 336 void TIM1_OC4Init(TIM1_OCMode_TypeDef TIM1_OCMode,
1125                     ; 337                   TIM1_OutputState_TypeDef TIM1_OutputState,
1125                     ; 338                   uint16_t TIM1_Pulse,
1125                     ; 339                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
1125                     ; 340                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState)
1125                     ; 341 {
1126                     .text:	section	.text,new
1127  0000               _TIM1_OC4Init:
1129  0000 89            	pushw	x
1130  0001 88            	push	a
1131       00000001      OFST:	set	1
1134                     ; 343     assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
1136                     ; 344     assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
1138                     ; 345     assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
1140                     ; 346     assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
1142                     ; 349     TIM1->CCER2 &= (uint8_t)(~(TIM1_CCER2_CC4E | TIM1_CCER2_CC4P));
1144  0002 c6525d        	ld	a,21085
1145  0005 a4cf          	and	a,#207
1146  0007 c7525d        	ld	21085,a
1147                     ; 351     TIM1->CCER2 |= (uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER2_CC4E ) |  
1147                     ; 352                              (uint8_t)(TIM1_OCPolarity  & TIM1_CCER2_CC4P ));
1149  000a 7b08          	ld	a,(OFST+7,sp)
1150  000c a420          	and	a,#32
1151  000e 6b01          	ld	(OFST+0,sp),a
1152  0010 9f            	ld	a,xl
1153  0011 a410          	and	a,#16
1154  0013 1a01          	or	a,(OFST+0,sp)
1155  0015 ca525d        	or	a,21085
1156  0018 c7525d        	ld	21085,a
1157                     ; 355     TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) | 
1157                     ; 356                             TIM1_OCMode);
1159  001b c6525b        	ld	a,21083
1160  001e a48f          	and	a,#143
1161  0020 1a02          	or	a,(OFST+1,sp)
1162  0022 c7525b        	ld	21083,a
1163                     ; 359     if (TIM1_OCIdleState != TIM1_OCIDLESTATE_RESET)
1165  0025 7b09          	ld	a,(OFST+8,sp)
1166  0027 270a          	jreq	L534
1167                     ; 361         TIM1->OISR |= (uint8_t)(~TIM1_CCER2_CC4P);
1169  0029 c6526f        	ld	a,21103
1170  002c aadf          	or	a,#223
1171  002e c7526f        	ld	21103,a
1173  0031 2004          	jra	L734
1174  0033               L534:
1175                     ; 365         TIM1->OISR &= (uint8_t)(~TIM1_OISR_OIS4);
1177  0033 721d526f      	bres	21103,#6
1178  0037               L734:
1179                     ; 369     TIM1->CCR4H = (uint8_t)(TIM1_Pulse >> 8);
1181  0037 7b06          	ld	a,(OFST+5,sp)
1182  0039 c7526b        	ld	21099,a
1183                     ; 370     TIM1->CCR4L = (uint8_t)(TIM1_Pulse);
1185  003c 7b07          	ld	a,(OFST+6,sp)
1186  003e c7526c        	ld	21100,a
1187                     ; 372 }
1190  0041 5b03          	addw	sp,#3
1191  0043 81            	ret	
1396                     ; 387 void TIM1_BDTRConfig(TIM1_OSSIState_TypeDef TIM1_OSSIState,
1396                     ; 388                      TIM1_LockLevel_TypeDef TIM1_LockLevel,
1396                     ; 389                      uint8_t TIM1_DeadTime,
1396                     ; 390                      TIM1_BreakState_TypeDef TIM1_Break,
1396                     ; 391                      TIM1_BreakPolarity_TypeDef TIM1_BreakPolarity,
1396                     ; 392                      TIM1_AutomaticOutput_TypeDef TIM1_AutomaticOutput)
1396                     ; 393 {
1397                     .text:	section	.text,new
1398  0000               _TIM1_BDTRConfig:
1400  0000 89            	pushw	x
1401  0001 88            	push	a
1402       00000001      OFST:	set	1
1405                     ; 395     assert_param(IS_TIM1_OSSI_STATE_OK(TIM1_OSSIState));
1407                     ; 396     assert_param(IS_TIM1_LOCK_LEVEL_OK(TIM1_LockLevel));
1409                     ; 397     assert_param(IS_TIM1_BREAK_STATE_OK(TIM1_Break));
1411                     ; 398     assert_param(IS_TIM1_BREAK_POLARITY_OK(TIM1_BreakPolarity));
1413                     ; 399     assert_param(IS_TIM1_AUTOMATIC_OUTPUT_STATE_OK(TIM1_AutomaticOutput));
1415                     ; 401     TIM1->DTR = (uint8_t)(TIM1_DeadTime);
1417  0002 7b06          	ld	a,(OFST+5,sp)
1418  0004 c7526e        	ld	21102,a
1419                     ; 405     TIM1->BKR  =  (uint8_t)((uint8_t)(TIM1_OSSIState | (uint8_t)TIM1_LockLevel)  | 
1419                     ; 406                             (uint8_t)((uint8_t)(TIM1_Break | (uint8_t)TIM1_BreakPolarity)  | 
1419                     ; 407                             (uint8_t)TIM1_AutomaticOutput));
1421  0007 7b07          	ld	a,(OFST+6,sp)
1422  0009 1a08          	or	a,(OFST+7,sp)
1423  000b 1a09          	or	a,(OFST+8,sp)
1424  000d 6b01          	ld	(OFST+0,sp),a
1425  000f 9f            	ld	a,xl
1426  0010 1a02          	or	a,(OFST+1,sp)
1427  0012 1a01          	or	a,(OFST+0,sp)
1428  0014 c7526d        	ld	21101,a
1429                     ; 409 }
1432  0017 5b03          	addw	sp,#3
1433  0019 81            	ret	
1635                     ; 423 void TIM1_ICInit(TIM1_Channel_TypeDef TIM1_Channel,
1635                     ; 424                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
1635                     ; 425                  TIM1_ICSelection_TypeDef TIM1_ICSelection,
1635                     ; 426                  TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
1635                     ; 427                  uint8_t TIM1_ICFilter)
1635                     ; 428 {
1636                     .text:	section	.text,new
1637  0000               _TIM1_ICInit:
1639  0000 89            	pushw	x
1640       00000000      OFST:	set	0
1643                     ; 431     assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
1645                     ; 432     assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
1647                     ; 433     assert_param(IS_TIM1_IC_SELECTION_OK(TIM1_ICSelection));
1649                     ; 434     assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_ICPrescaler));
1651                     ; 435     assert_param(IS_TIM1_IC_FILTER_OK(TIM1_ICFilter));
1653                     ; 437     if (TIM1_Channel == TIM1_CHANNEL_1)
1655  0001 9e            	ld	a,xh
1656  0002 4d            	tnz	a
1657  0003 2614          	jrne	L766
1658                     ; 440         TI1_Config((uint8_t)TIM1_ICPolarity,
1658                     ; 441                    (uint8_t)TIM1_ICSelection,
1658                     ; 442                    (uint8_t)TIM1_ICFilter);
1660  0005 7b07          	ld	a,(OFST+7,sp)
1661  0007 88            	push	a
1662  0008 7b06          	ld	a,(OFST+6,sp)
1663  000a 97            	ld	xl,a
1664  000b 7b03          	ld	a,(OFST+3,sp)
1665  000d 95            	ld	xh,a
1666  000e cd0000        	call	L3_TI1_Config
1668  0011 84            	pop	a
1669                     ; 444         TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
1671  0012 7b06          	ld	a,(OFST+6,sp)
1672  0014 cd0000        	call	_TIM1_SetIC1Prescaler
1675  0017 2044          	jra	L176
1676  0019               L766:
1677                     ; 446     else if (TIM1_Channel == TIM1_CHANNEL_2)
1679  0019 7b01          	ld	a,(OFST+1,sp)
1680  001b a101          	cp	a,#1
1681  001d 2614          	jrne	L376
1682                     ; 449         TI2_Config((uint8_t)TIM1_ICPolarity,
1682                     ; 450                    (uint8_t)TIM1_ICSelection,
1682                     ; 451                    (uint8_t)TIM1_ICFilter);
1684  001f 7b07          	ld	a,(OFST+7,sp)
1685  0021 88            	push	a
1686  0022 7b06          	ld	a,(OFST+6,sp)
1687  0024 97            	ld	xl,a
1688  0025 7b03          	ld	a,(OFST+3,sp)
1689  0027 95            	ld	xh,a
1690  0028 cd0000        	call	L5_TI2_Config
1692  002b 84            	pop	a
1693                     ; 453         TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
1695  002c 7b06          	ld	a,(OFST+6,sp)
1696  002e cd0000        	call	_TIM1_SetIC2Prescaler
1699  0031 202a          	jra	L176
1700  0033               L376:
1701                     ; 455     else if (TIM1_Channel == TIM1_CHANNEL_3)
1703  0033 a102          	cp	a,#2
1704  0035 2614          	jrne	L776
1705                     ; 458         TI3_Config((uint8_t)TIM1_ICPolarity,
1705                     ; 459                    (uint8_t)TIM1_ICSelection,
1705                     ; 460                    (uint8_t)TIM1_ICFilter);
1707  0037 7b07          	ld	a,(OFST+7,sp)
1708  0039 88            	push	a
1709  003a 7b06          	ld	a,(OFST+6,sp)
1710  003c 97            	ld	xl,a
1711  003d 7b03          	ld	a,(OFST+3,sp)
1712  003f 95            	ld	xh,a
1713  0040 cd0000        	call	L7_TI3_Config
1715  0043 84            	pop	a
1716                     ; 462         TIM1_SetIC3Prescaler(TIM1_ICPrescaler);
1718  0044 7b06          	ld	a,(OFST+6,sp)
1719  0046 cd0000        	call	_TIM1_SetIC3Prescaler
1722  0049 2012          	jra	L176
1723  004b               L776:
1724                     ; 467         TI4_Config((uint8_t)TIM1_ICPolarity,
1724                     ; 468                    (uint8_t)TIM1_ICSelection,
1724                     ; 469                    (uint8_t)TIM1_ICFilter);
1726  004b 7b07          	ld	a,(OFST+7,sp)
1727  004d 88            	push	a
1728  004e 7b06          	ld	a,(OFST+6,sp)
1729  0050 97            	ld	xl,a
1730  0051 7b03          	ld	a,(OFST+3,sp)
1731  0053 95            	ld	xh,a
1732  0054 cd0000        	call	L11_TI4_Config
1734  0057 84            	pop	a
1735                     ; 471         TIM1_SetIC4Prescaler(TIM1_ICPrescaler);
1737  0058 7b06          	ld	a,(OFST+6,sp)
1738  005a cd0000        	call	_TIM1_SetIC4Prescaler
1740  005d               L176:
1741                     ; 474 }
1744  005d 85            	popw	x
1745  005e 81            	ret	
1841                     ; 490 void TIM1_PWMIConfig(TIM1_Channel_TypeDef TIM1_Channel,
1841                     ; 491                      TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
1841                     ; 492                      TIM1_ICSelection_TypeDef TIM1_ICSelection,
1841                     ; 493                      TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
1841                     ; 494                      uint8_t TIM1_ICFilter)
1841                     ; 495 {
1842                     .text:	section	.text,new
1843  0000               _TIM1_PWMIConfig:
1845  0000 89            	pushw	x
1846  0001 89            	pushw	x
1847       00000002      OFST:	set	2
1850                     ; 496     uint8_t icpolarity = TIM1_ICPOLARITY_RISING;
1852                     ; 497     uint8_t icselection = TIM1_ICSELECTION_DIRECTTI;
1854                     ; 500     assert_param(IS_TIM1_PWMI_CHANNEL_OK(TIM1_Channel));
1856                     ; 501     assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
1858                     ; 502     assert_param(IS_TIM1_IC_SELECTION_OK(TIM1_ICSelection));
1860                     ; 503     assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_ICPrescaler));
1862                     ; 506     if (TIM1_ICPolarity != TIM1_ICPOLARITY_FALLING)
1864  0002 9f            	ld	a,xl
1865  0003 4a            	dec	a
1866  0004 2702          	jreq	L157
1867                     ; 508         icpolarity = TIM1_ICPOLARITY_FALLING;
1869  0006 a601          	ld	a,#1
1871  0008               L157:
1872                     ; 512         icpolarity = TIM1_ICPOLARITY_RISING;
1874  0008 6b01          	ld	(OFST-1,sp),a
1875                     ; 516     if (TIM1_ICSelection == TIM1_ICSELECTION_DIRECTTI)
1877  000a 7b07          	ld	a,(OFST+5,sp)
1878  000c 4a            	dec	a
1879  000d 2604          	jrne	L557
1880                     ; 518         icselection = TIM1_ICSELECTION_INDIRECTTI;
1882  000f a602          	ld	a,#2
1884  0011 2002          	jra	L757
1885  0013               L557:
1886                     ; 522         icselection = TIM1_ICSELECTION_DIRECTTI;
1888  0013 a601          	ld	a,#1
1889  0015               L757:
1890  0015 6b02          	ld	(OFST+0,sp),a
1891                     ; 525     if (TIM1_Channel == TIM1_CHANNEL_1)
1893  0017 7b03          	ld	a,(OFST+1,sp)
1894  0019 2626          	jrne	L167
1895                     ; 528         TI1_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSelection,
1895                     ; 529                    (uint8_t)TIM1_ICFilter);
1897  001b 7b09          	ld	a,(OFST+7,sp)
1898  001d 88            	push	a
1899  001e 7b08          	ld	a,(OFST+6,sp)
1900  0020 97            	ld	xl,a
1901  0021 7b05          	ld	a,(OFST+3,sp)
1902  0023 95            	ld	xh,a
1903  0024 cd0000        	call	L3_TI1_Config
1905  0027 84            	pop	a
1906                     ; 532         TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
1908  0028 7b08          	ld	a,(OFST+6,sp)
1909  002a cd0000        	call	_TIM1_SetIC1Prescaler
1911                     ; 535         TI2_Config(icpolarity, icselection, TIM1_ICFilter);
1913  002d 7b09          	ld	a,(OFST+7,sp)
1914  002f 88            	push	a
1915  0030 7b03          	ld	a,(OFST+1,sp)
1916  0032 97            	ld	xl,a
1917  0033 7b02          	ld	a,(OFST+0,sp)
1918  0035 95            	ld	xh,a
1919  0036 cd0000        	call	L5_TI2_Config
1921  0039 84            	pop	a
1922                     ; 538         TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
1924  003a 7b08          	ld	a,(OFST+6,sp)
1925  003c cd0000        	call	_TIM1_SetIC2Prescaler
1928  003f 2024          	jra	L367
1929  0041               L167:
1930                     ; 543         TI2_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSelection,
1930                     ; 544                    (uint8_t)TIM1_ICFilter);
1932  0041 7b09          	ld	a,(OFST+7,sp)
1933  0043 88            	push	a
1934  0044 7b08          	ld	a,(OFST+6,sp)
1935  0046 97            	ld	xl,a
1936  0047 7b05          	ld	a,(OFST+3,sp)
1937  0049 95            	ld	xh,a
1938  004a cd0000        	call	L5_TI2_Config
1940  004d 84            	pop	a
1941                     ; 547         TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
1943  004e 7b08          	ld	a,(OFST+6,sp)
1944  0050 cd0000        	call	_TIM1_SetIC2Prescaler
1946                     ; 550         TI1_Config(icpolarity, icselection, TIM1_ICFilter);
1948  0053 7b09          	ld	a,(OFST+7,sp)
1949  0055 88            	push	a
1950  0056 7b03          	ld	a,(OFST+1,sp)
1951  0058 97            	ld	xl,a
1952  0059 7b02          	ld	a,(OFST+0,sp)
1953  005b 95            	ld	xh,a
1954  005c cd0000        	call	L3_TI1_Config
1956  005f 84            	pop	a
1957                     ; 553         TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
1959  0060 7b08          	ld	a,(OFST+6,sp)
1960  0062 cd0000        	call	_TIM1_SetIC1Prescaler
1962  0065               L367:
1963                     ; 555 }
1966  0065 5b04          	addw	sp,#4
1967  0067 81            	ret	
2022                     ; 563 void TIM1_Cmd(FunctionalState NewState)
2022                     ; 564 {
2023                     .text:	section	.text,new
2024  0000               _TIM1_Cmd:
2028                     ; 566     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2030                     ; 569     if (NewState != DISABLE)
2032  0000 4d            	tnz	a
2033  0001 2705          	jreq	L3101
2034                     ; 571         TIM1->CR1 |= TIM1_CR1_CEN;
2036  0003 72105250      	bset	21072,#0
2039  0007 81            	ret	
2040  0008               L3101:
2041                     ; 575         TIM1->CR1 &= (uint8_t)(~TIM1_CR1_CEN);
2043  0008 72115250      	bres	21072,#0
2044                     ; 577 }
2047  000c 81            	ret	
2083                     ; 585 void TIM1_CtrlPWMOutputs(FunctionalState NewState)
2083                     ; 586 {
2084                     .text:	section	.text,new
2085  0000               _TIM1_CtrlPWMOutputs:
2089                     ; 588     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2091                     ; 592     if (NewState != DISABLE)
2093  0000 4d            	tnz	a
2094  0001 2705          	jreq	L5301
2095                     ; 594         TIM1->BKR |= TIM1_BKR_MOE;
2097  0003 721e526d      	bset	21101,#7
2100  0007 81            	ret	
2101  0008               L5301:
2102                     ; 598         TIM1->BKR &= (uint8_t)(~TIM1_BKR_MOE);
2104  0008 721f526d      	bres	21101,#7
2105                     ; 600 }
2108  000c 81            	ret	
2215                     ; 619 void TIM1_ITConfig(TIM1_IT_TypeDef  TIM1_IT, FunctionalState NewState)
2215                     ; 620 {
2216                     .text:	section	.text,new
2217  0000               _TIM1_ITConfig:
2219  0000 89            	pushw	x
2220       00000000      OFST:	set	0
2223                     ; 622     assert_param(IS_TIM1_IT_OK(TIM1_IT));
2225                     ; 623     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2227                     ; 625     if (NewState != DISABLE)
2229  0001 9f            	ld	a,xl
2230  0002 4d            	tnz	a
2231  0003 2706          	jreq	L7011
2232                     ; 628         TIM1->IER |= (uint8_t)TIM1_IT;
2234  0005 9e            	ld	a,xh
2235  0006 ca5254        	or	a,21076
2237  0009 2006          	jra	L1111
2238  000b               L7011:
2239                     ; 633         TIM1->IER &= (uint8_t)(~(uint8_t)TIM1_IT);
2241  000b 7b01          	ld	a,(OFST+1,sp)
2242  000d 43            	cpl	a
2243  000e c45254        	and	a,21076
2244  0011               L1111:
2245  0011 c75254        	ld	21076,a
2246                     ; 635 }
2249  0014 85            	popw	x
2250  0015 81            	ret	
2274                     ; 642 void TIM1_InternalClockConfig(void)
2274                     ; 643 {
2275                     .text:	section	.text,new
2276  0000               _TIM1_InternalClockConfig:
2280                     ; 645     TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_SMS);
2282  0000 c65252        	ld	a,21074
2283  0003 a4f8          	and	a,#248
2284  0005 c75252        	ld	21074,a
2285                     ; 646 }
2288  0008 81            	ret	
2405                     ; 664 void TIM1_ETRClockMode1Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
2405                     ; 665                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
2405                     ; 666                               uint8_t ExtTRGFilter)
2405                     ; 667 {
2406                     .text:	section	.text,new
2407  0000               _TIM1_ETRClockMode1Config:
2409  0000 89            	pushw	x
2410       00000000      OFST:	set	0
2413                     ; 669     assert_param(IS_TIM1_EXT_PRESCALER_OK(TIM1_ExtTRGPrescaler));
2415                     ; 670     assert_param(IS_TIM1_EXT_POLARITY_OK(TIM1_ExtTRGPolarity));
2417                     ; 673     TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
2419  0001 7b05          	ld	a,(OFST+5,sp)
2420  0003 88            	push	a
2421  0004 7b02          	ld	a,(OFST+2,sp)
2422  0006 95            	ld	xh,a
2423  0007 cd0000        	call	_TIM1_ETRConfig
2425  000a 84            	pop	a
2426                     ; 676     TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~(uint8_t)(TIM1_SMCR_SMS | TIM1_SMCR_TS )))
2426                     ; 677                            | (uint8_t)((uint8_t)TIM1_SLAVEMODE_EXTERNAL1 | TIM1_TS_ETRF ));
2428  000b c65252        	ld	a,21074
2429  000e aa77          	or	a,#119
2430  0010 c75252        	ld	21074,a
2431                     ; 678 }
2434  0013 85            	popw	x
2435  0014 81            	ret	
2493                     ; 696 void TIM1_ETRClockMode2Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
2493                     ; 697                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
2493                     ; 698                               uint8_t ExtTRGFilter)
2493                     ; 699 {
2494                     .text:	section	.text,new
2495  0000               _TIM1_ETRClockMode2Config:
2497  0000 89            	pushw	x
2498       00000000      OFST:	set	0
2501                     ; 701     assert_param(IS_TIM1_EXT_PRESCALER_OK(TIM1_ExtTRGPrescaler));
2503                     ; 702     assert_param(IS_TIM1_EXT_POLARITY_OK(TIM1_ExtTRGPolarity));
2505                     ; 705     TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
2507  0001 7b05          	ld	a,(OFST+5,sp)
2508  0003 88            	push	a
2509  0004 7b02          	ld	a,(OFST+2,sp)
2510  0006 95            	ld	xh,a
2511  0007 cd0000        	call	_TIM1_ETRConfig
2513  000a 721c5253      	bset	21075,#6
2514  000e 84            	pop	a
2515                     ; 708     TIM1->ETR |= TIM1_ETR_ECE;
2517                     ; 709 }
2520  000f 85            	popw	x
2521  0010 81            	ret	
2577                     ; 727 void TIM1_ETRConfig(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
2577                     ; 728                     TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
2577                     ; 729                     uint8_t ExtTRGFilter)
2577                     ; 730 {
2578                     .text:	section	.text,new
2579  0000               _TIM1_ETRConfig:
2581  0000 89            	pushw	x
2582       00000000      OFST:	set	0
2585                     ; 732     assert_param(IS_TIM1_EXT_TRG_FILTER_OK(ExtTRGFilter));
2587                     ; 734     TIM1->ETR |= (uint8_t)((uint8_t)(TIM1_ExtTRGPrescaler | (uint8_t)TIM1_ExtTRGPolarity )|
2587                     ; 735                       (uint8_t)ExtTRGFilter );
2589  0001 9f            	ld	a,xl
2590  0002 1a01          	or	a,(OFST+1,sp)
2591  0004 1a05          	or	a,(OFST+5,sp)
2592  0006 ca5253        	or	a,21075
2593  0009 c75253        	ld	21075,a
2594                     ; 736 }
2597  000c 85            	popw	x
2598  000d 81            	ret	
2687                     ; 753 void TIM1_TIxExternalClockConfig(TIM1_TIxExternalCLK1Source_TypeDef TIM1_TIxExternalCLKSource,
2687                     ; 754                                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
2687                     ; 755                                  uint8_t ICFilter)
2687                     ; 756 {
2688                     .text:	section	.text,new
2689  0000               _TIM1_TIxExternalClockConfig:
2691  0000 89            	pushw	x
2692       00000000      OFST:	set	0
2695                     ; 758     assert_param(IS_TIM1_TIXCLK_SOURCE_OK(TIM1_TIxExternalCLKSource));
2697                     ; 759     assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
2699                     ; 760     assert_param(IS_TIM1_IC_FILTER_OK(ICFilter));
2701                     ; 763     if (TIM1_TIxExternalCLKSource == TIM1_TIXEXTERNALCLK1SOURCE_TI2)
2703  0001 9e            	ld	a,xh
2704  0002 a160          	cp	a,#96
2705  0004 260e          	jrne	L1131
2706                     ; 765         TI2_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSELECTION_DIRECTTI, (uint8_t)ICFilter);
2708  0006 7b05          	ld	a,(OFST+5,sp)
2709  0008 88            	push	a
2710  0009 ae0001        	ldw	x,#1
2711  000c 7b03          	ld	a,(OFST+3,sp)
2712  000e 95            	ld	xh,a
2713  000f cd0000        	call	L5_TI2_Config
2716  0012 200c          	jra	L3131
2717  0014               L1131:
2718                     ; 769         TI1_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSELECTION_DIRECTTI, (uint8_t)ICFilter);
2720  0014 7b05          	ld	a,(OFST+5,sp)
2721  0016 88            	push	a
2722  0017 ae0001        	ldw	x,#1
2723  001a 7b03          	ld	a,(OFST+3,sp)
2724  001c 95            	ld	xh,a
2725  001d cd0000        	call	L3_TI1_Config
2727  0020               L3131:
2728  0020 84            	pop	a
2729                     ; 773     TIM1_SelectInputTrigger((TIM1_TS_TypeDef)TIM1_TIxExternalCLKSource);
2731  0021 7b01          	ld	a,(OFST+1,sp)
2732  0023 cd0000        	call	_TIM1_SelectInputTrigger
2734                     ; 776     TIM1->SMCR |= (uint8_t)(TIM1_SLAVEMODE_EXTERNAL1);
2736  0026 c65252        	ld	a,21074
2737  0029 aa07          	or	a,#7
2738  002b c75252        	ld	21074,a
2739                     ; 777 }
2742  002e 85            	popw	x
2743  002f 81            	ret	
2828                     ; 789 void TIM1_SelectInputTrigger(TIM1_TS_TypeDef TIM1_InputTriggerSource)
2828                     ; 790 {
2829                     .text:	section	.text,new
2830  0000               _TIM1_SelectInputTrigger:
2832  0000 88            	push	a
2833       00000000      OFST:	set	0
2836                     ; 792     assert_param(IS_TIM1_TRIGGER_SELECTION_OK(TIM1_InputTriggerSource));
2838                     ; 795     TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_TS)) | (uint8_t)TIM1_InputTriggerSource);
2840  0001 c65252        	ld	a,21074
2841  0004 a48f          	and	a,#143
2842  0006 1a01          	or	a,(OFST+1,sp)
2843  0008 c75252        	ld	21074,a
2844                     ; 796 }
2847  000b 84            	pop	a
2848  000c 81            	ret	
2884                     ; 806 void TIM1_UpdateDisableConfig(FunctionalState NewState)
2884                     ; 807 {
2885                     .text:	section	.text,new
2886  0000               _TIM1_UpdateDisableConfig:
2890                     ; 809     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2892                     ; 812     if (NewState != DISABLE)
2894  0000 4d            	tnz	a
2895  0001 2705          	jreq	L1731
2896                     ; 814         TIM1->CR1 |= TIM1_CR1_UDIS;
2898  0003 72125250      	bset	21072,#1
2901  0007 81            	ret	
2902  0008               L1731:
2903                     ; 818         TIM1->CR1 &= (uint8_t)(~TIM1_CR1_UDIS);
2905  0008 72135250      	bres	21072,#1
2906                     ; 820 }
2909  000c 81            	ret	
2967                     ; 830 void TIM1_UpdateRequestConfig(TIM1_UpdateSource_TypeDef TIM1_UpdateSource)
2967                     ; 831 {
2968                     .text:	section	.text,new
2969  0000               _TIM1_UpdateRequestConfig:
2973                     ; 833     assert_param(IS_TIM1_UPDATE_SOURCE_OK(TIM1_UpdateSource));
2975                     ; 836     if (TIM1_UpdateSource != TIM1_UPDATESOURCE_GLOBAL)
2977  0000 4d            	tnz	a
2978  0001 2705          	jreq	L3241
2979                     ; 838         TIM1->CR1 |= TIM1_CR1_URS;
2981  0003 72145250      	bset	21072,#2
2984  0007 81            	ret	
2985  0008               L3241:
2986                     ; 842         TIM1->CR1 &= (uint8_t)(~TIM1_CR1_URS);
2988  0008 72155250      	bres	21072,#2
2989                     ; 844 }
2992  000c 81            	ret	
3028                     ; 853 void TIM1_SelectHallSensor(FunctionalState NewState)
3028                     ; 854 {
3029                     .text:	section	.text,new
3030  0000               _TIM1_SelectHallSensor:
3034                     ; 856     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
3036                     ; 859     if (NewState != DISABLE)
3038  0000 4d            	tnz	a
3039  0001 2705          	jreq	L5441
3040                     ; 861         TIM1->CR2 |= TIM1_CR2_TI1S;
3042  0003 721e5251      	bset	21073,#7
3045  0007 81            	ret	
3046  0008               L5441:
3047                     ; 865         TIM1->CR2 &= (uint8_t)(~TIM1_CR2_TI1S);
3049  0008 721f5251      	bres	21073,#7
3050                     ; 867 }
3053  000c 81            	ret	
3110                     ; 878 void TIM1_SelectOnePulseMode(TIM1_OPMode_TypeDef TIM1_OPMode)
3110                     ; 879 {
3111                     .text:	section	.text,new
3112  0000               _TIM1_SelectOnePulseMode:
3116                     ; 881     assert_param(IS_TIM1_OPM_MODE_OK(TIM1_OPMode));
3118                     ; 884     if (TIM1_OPMode != TIM1_OPMODE_REPETITIVE)
3120  0000 4d            	tnz	a
3121  0001 2705          	jreq	L7741
3122                     ; 886         TIM1->CR1 |= TIM1_CR1_OPM;
3124  0003 72165250      	bset	21072,#3
3127  0007 81            	ret	
3128  0008               L7741:
3129                     ; 890         TIM1->CR1 &= (uint8_t)(~TIM1_CR1_OPM);
3131  0008 72175250      	bres	21072,#3
3132                     ; 893 }
3135  000c 81            	ret	
3233                     ; 909 void TIM1_SelectOutputTrigger(TIM1_TRGOSource_TypeDef TIM1_TRGOSource)
3233                     ; 910 {
3234                     .text:	section	.text,new
3235  0000               _TIM1_SelectOutputTrigger:
3237  0000 88            	push	a
3238       00000000      OFST:	set	0
3241                     ; 912     assert_param(IS_TIM1_TRGO_SOURCE_OK(TIM1_TRGOSource));
3243                     ; 915     TIM1->CR2 = (uint8_t)((uint8_t)(TIM1->CR2 & (uint8_t)(~TIM1_CR2_MMS)) | 
3243                     ; 916                           (uint8_t) TIM1_TRGOSource);
3245  0001 c65251        	ld	a,21073
3246  0004 a48f          	and	a,#143
3247  0006 1a01          	or	a,(OFST+1,sp)
3248  0008 c75251        	ld	21073,a
3249                     ; 917 }
3252  000b 84            	pop	a
3253  000c 81            	ret	
3327                     ; 929 void TIM1_SelectSlaveMode(TIM1_SlaveMode_TypeDef TIM1_SlaveMode)
3327                     ; 930 {
3328                     .text:	section	.text,new
3329  0000               _TIM1_SelectSlaveMode:
3331  0000 88            	push	a
3332       00000000      OFST:	set	0
3335                     ; 933     assert_param(IS_TIM1_SLAVE_MODE_OK(TIM1_SlaveMode));
3337                     ; 936     TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_SMS)) |
3337                     ; 937                            (uint8_t)TIM1_SlaveMode);
3339  0001 c65252        	ld	a,21074
3340  0004 a4f8          	and	a,#248
3341  0006 1a01          	or	a,(OFST+1,sp)
3342  0008 c75252        	ld	21074,a
3343                     ; 939 }
3346  000b 84            	pop	a
3347  000c 81            	ret	
3383                     ; 947 void TIM1_SelectMasterSlaveMode(FunctionalState NewState)
3383                     ; 948 {
3384                     .text:	section	.text,new
3385  0000               _TIM1_SelectMasterSlaveMode:
3389                     ; 950     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
3391                     ; 953     if (NewState != DISABLE)
3393  0000 4d            	tnz	a
3394  0001 2705          	jreq	L3161
3395                     ; 955         TIM1->SMCR |= TIM1_SMCR_MSM;
3397  0003 721e5252      	bset	21074,#7
3400  0007 81            	ret	
3401  0008               L3161:
3402                     ; 959         TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_MSM);
3404  0008 721f5252      	bres	21074,#7
3405                     ; 961 }
3408  000c 81            	ret	
3494                     ; 983 void TIM1_EncoderInterfaceConfig(TIM1_EncoderMode_TypeDef TIM1_EncoderMode,
3494                     ; 984                                  TIM1_ICPolarity_TypeDef TIM1_IC1Polarity,
3494                     ; 985                                  TIM1_ICPolarity_TypeDef TIM1_IC2Polarity)
3494                     ; 986 {
3495                     .text:	section	.text,new
3496  0000               _TIM1_EncoderInterfaceConfig:
3498  0000 89            	pushw	x
3499       00000000      OFST:	set	0
3502                     ; 990     assert_param(IS_TIM1_ENCODER_MODE_OK(TIM1_EncoderMode));
3504                     ; 991     assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_IC1Polarity));
3506                     ; 992     assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_IC2Polarity));
3508                     ; 995     if (TIM1_IC1Polarity != TIM1_ICPOLARITY_RISING)
3510  0001 9f            	ld	a,xl
3511  0002 4d            	tnz	a
3512  0003 2706          	jreq	L7561
3513                     ; 997         TIM1->CCER1 |= TIM1_CCER1_CC1P;
3515  0005 7212525c      	bset	21084,#1
3517  0009 2004          	jra	L1661
3518  000b               L7561:
3519                     ; 1001         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
3521  000b 7213525c      	bres	21084,#1
3522  000f               L1661:
3523                     ; 1004     if (TIM1_IC2Polarity != TIM1_ICPOLARITY_RISING)
3525  000f 7b05          	ld	a,(OFST+5,sp)
3526  0011 2706          	jreq	L3661
3527                     ; 1006         TIM1->CCER1 |= TIM1_CCER1_CC2P;
3529  0013 721a525c      	bset	21084,#5
3531  0017 2004          	jra	L5661
3532  0019               L3661:
3533                     ; 1010         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
3535  0019 721b525c      	bres	21084,#5
3536  001d               L5661:
3537                     ; 1013     TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(TIM1_SMCR_MSM | TIM1_SMCR_TS))
3537                     ; 1014                            | (uint8_t) TIM1_EncoderMode);
3539  001d c65252        	ld	a,21074
3540  0020 a4f0          	and	a,#240
3541  0022 1a01          	or	a,(OFST+1,sp)
3542  0024 c75252        	ld	21074,a
3543                     ; 1017     TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_CCxS)) 
3543                     ; 1018                             | (uint8_t) CCMR_TIxDirect_Set);
3545  0027 c65258        	ld	a,21080
3546  002a a4fc          	and	a,#252
3547  002c aa01          	or	a,#1
3548  002e c75258        	ld	21080,a
3549                     ; 1019     TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_CCxS))
3549                     ; 1020                             | (uint8_t) CCMR_TIxDirect_Set);
3551  0031 c65259        	ld	a,21081
3552  0034 a4fc          	and	a,#252
3553  0036 aa01          	or	a,#1
3554  0038 c75259        	ld	21081,a
3555                     ; 1022 }
3558  003b 85            	popw	x
3559  003c 81            	ret	
3626                     ; 1035 void TIM1_PrescalerConfig(uint16_t Prescaler,
3626                     ; 1036                           TIM1_PSCReloadMode_TypeDef TIM1_PSCReloadMode)
3626                     ; 1037 {
3627                     .text:	section	.text,new
3628  0000               _TIM1_PrescalerConfig:
3630  0000 89            	pushw	x
3631       00000000      OFST:	set	0
3634                     ; 1039     assert_param(IS_TIM1_PRESCALER_RELOAD_OK(TIM1_PSCReloadMode));
3636                     ; 1042     TIM1->PSCRH = (uint8_t)(Prescaler >> 8);
3638  0001 9e            	ld	a,xh
3639  0002 c75260        	ld	21088,a
3640                     ; 1043     TIM1->PSCRL = (uint8_t)(Prescaler);
3642  0005 9f            	ld	a,xl
3643  0006 c75261        	ld	21089,a
3644                     ; 1046     TIM1->EGR = (uint8_t)TIM1_PSCReloadMode;
3646  0009 7b05          	ld	a,(OFST+5,sp)
3647  000b c75257        	ld	21079,a
3648                     ; 1048 }
3651  000e 85            	popw	x
3652  000f 81            	ret	
3688                     ; 1061 void TIM1_CounterModeConfig(TIM1_CounterMode_TypeDef TIM1_CounterMode)
3688                     ; 1062 {
3689                     .text:	section	.text,new
3690  0000               _TIM1_CounterModeConfig:
3692  0000 88            	push	a
3693       00000000      OFST:	set	0
3696                     ; 1064     assert_param(IS_TIM1_COUNTER_MODE_OK(TIM1_CounterMode));
3698                     ; 1068     TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)((uint8_t)(~TIM1_CR1_CMS) & (uint8_t)(~TIM1_CR1_DIR)))
3698                     ; 1069                           | (uint8_t)TIM1_CounterMode);
3700  0001 c65250        	ld	a,21072
3701  0004 a48f          	and	a,#143
3702  0006 1a01          	or	a,(OFST+1,sp)
3703  0008 c75250        	ld	21072,a
3704                     ; 1070 }
3707  000b 84            	pop	a
3708  000c 81            	ret	
3766                     ; 1081 void TIM1_ForcedOC1Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
3766                     ; 1082 {
3767                     .text:	section	.text,new
3768  0000               _TIM1_ForcedOC1Config:
3770  0000 88            	push	a
3771       00000000      OFST:	set	0
3774                     ; 1084     assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
3776                     ; 1087     TIM1->CCMR1 =  (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM))|
3776                     ; 1088                              (uint8_t)TIM1_ForcedAction);
3778  0001 c65258        	ld	a,21080
3779  0004 a48f          	and	a,#143
3780  0006 1a01          	or	a,(OFST+1,sp)
3781  0008 c75258        	ld	21080,a
3782                     ; 1089 }
3785  000b 84            	pop	a
3786  000c 81            	ret	
3822                     ; 1100 void TIM1_ForcedOC2Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
3822                     ; 1101 {
3823                     .text:	section	.text,new
3824  0000               _TIM1_ForcedOC2Config:
3826  0000 88            	push	a
3827       00000000      OFST:	set	0
3830                     ; 1103     assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
3832                     ; 1106     TIM1->CCMR2  =  (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM))
3832                     ; 1107                               | (uint8_t)TIM1_ForcedAction);
3834  0001 c65259        	ld	a,21081
3835  0004 a48f          	and	a,#143
3836  0006 1a01          	or	a,(OFST+1,sp)
3837  0008 c75259        	ld	21081,a
3838                     ; 1108 }
3841  000b 84            	pop	a
3842  000c 81            	ret	
3878                     ; 1120 void TIM1_ForcedOC3Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
3878                     ; 1121 {
3879                     .text:	section	.text,new
3880  0000               _TIM1_ForcedOC3Config:
3882  0000 88            	push	a
3883       00000000      OFST:	set	0
3886                     ; 1123     assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
3888                     ; 1126     TIM1->CCMR3  =  (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM))  
3888                     ; 1127                               | (uint8_t)TIM1_ForcedAction);
3890  0001 c6525a        	ld	a,21082
3891  0004 a48f          	and	a,#143
3892  0006 1a01          	or	a,(OFST+1,sp)
3893  0008 c7525a        	ld	21082,a
3894                     ; 1128 }
3897  000b 84            	pop	a
3898  000c 81            	ret	
3934                     ; 1140 void TIM1_ForcedOC4Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
3934                     ; 1141 {
3935                     .text:	section	.text,new
3936  0000               _TIM1_ForcedOC4Config:
3938  0000 88            	push	a
3939       00000000      OFST:	set	0
3942                     ; 1143     assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
3944                     ; 1146     TIM1->CCMR4  =  (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) 
3944                     ; 1147                               | (uint8_t)TIM1_ForcedAction);
3946  0001 c6525b        	ld	a,21083
3947  0004 a48f          	and	a,#143
3948  0006 1a01          	or	a,(OFST+1,sp)
3949  0008 c7525b        	ld	21083,a
3950                     ; 1148 }
3953  000b 84            	pop	a
3954  000c 81            	ret	
3990                     ; 1157 void TIM1_ARRPreloadConfig(FunctionalState NewState)
3990                     ; 1158 {
3991                     .text:	section	.text,new
3992  0000               _TIM1_ARRPreloadConfig:
3996                     ; 1160     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
3998                     ; 1163     if (NewState != DISABLE)
4000  0000 4d            	tnz	a
4001  0001 2705          	jreq	L5502
4002                     ; 1165         TIM1->CR1 |= TIM1_CR1_ARPE;
4004  0003 721e5250      	bset	21072,#7
4007  0007 81            	ret	
4008  0008               L5502:
4009                     ; 1169         TIM1->CR1 &= (uint8_t)(~TIM1_CR1_ARPE);
4011  0008 721f5250      	bres	21072,#7
4012                     ; 1171 }
4015  000c 81            	ret	
4050                     ; 1180 void TIM1_SelectCOM(FunctionalState NewState)
4050                     ; 1181 {
4051                     .text:	section	.text,new
4052  0000               _TIM1_SelectCOM:
4056                     ; 1183     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4058                     ; 1186     if (NewState != DISABLE)
4060  0000 4d            	tnz	a
4061  0001 2705          	jreq	L7702
4062                     ; 1188         TIM1->CR2 |= TIM1_CR2_COMS;
4064  0003 72145251      	bset	21073,#2
4067  0007 81            	ret	
4068  0008               L7702:
4069                     ; 1192         TIM1->CR2 &= (uint8_t)(~TIM1_CR2_COMS);
4071  0008 72155251      	bres	21073,#2
4072                     ; 1194 }
4075  000c 81            	ret	
4111                     ; 1202 void TIM1_CCPreloadControl(FunctionalState NewState)
4111                     ; 1203 {
4112                     .text:	section	.text,new
4113  0000               _TIM1_CCPreloadControl:
4117                     ; 1205     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4119                     ; 1208     if (NewState != DISABLE)
4121  0000 4d            	tnz	a
4122  0001 2705          	jreq	L1212
4123                     ; 1210         TIM1->CR2 |= TIM1_CR2_CCPC;
4125  0003 72105251      	bset	21073,#0
4128  0007 81            	ret	
4129  0008               L1212:
4130                     ; 1214         TIM1->CR2 &= (uint8_t)(~TIM1_CR2_CCPC);
4132  0008 72115251      	bres	21073,#0
4133                     ; 1216 }
4136  000c 81            	ret	
4172                     ; 1225 void TIM1_OC1PreloadConfig(FunctionalState NewState)
4172                     ; 1226 {
4173                     .text:	section	.text,new
4174  0000               _TIM1_OC1PreloadConfig:
4178                     ; 1228     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4180                     ; 1231     if (NewState != DISABLE)
4182  0000 4d            	tnz	a
4183  0001 2705          	jreq	L3412
4184                     ; 1233         TIM1->CCMR1 |= TIM1_CCMR_OCxPE;
4186  0003 72165258      	bset	21080,#3
4189  0007 81            	ret	
4190  0008               L3412:
4191                     ; 1237         TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxPE);
4193  0008 72175258      	bres	21080,#3
4194                     ; 1239 }
4197  000c 81            	ret	
4233                     ; 1248 void TIM1_OC2PreloadConfig(FunctionalState NewState)
4233                     ; 1249 {
4234                     .text:	section	.text,new
4235  0000               _TIM1_OC2PreloadConfig:
4239                     ; 1251     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4241                     ; 1254     if (NewState != DISABLE)
4243  0000 4d            	tnz	a
4244  0001 2705          	jreq	L5612
4245                     ; 1256         TIM1->CCMR2 |= TIM1_CCMR_OCxPE;
4247  0003 72165259      	bset	21081,#3
4250  0007 81            	ret	
4251  0008               L5612:
4252                     ; 1260         TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxPE);
4254  0008 72175259      	bres	21081,#3
4255                     ; 1262 }
4258  000c 81            	ret	
4294                     ; 1271 void TIM1_OC3PreloadConfig(FunctionalState NewState)
4294                     ; 1272 {
4295                     .text:	section	.text,new
4296  0000               _TIM1_OC3PreloadConfig:
4300                     ; 1274     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4302                     ; 1277     if (NewState != DISABLE)
4304  0000 4d            	tnz	a
4305  0001 2705          	jreq	L7022
4306                     ; 1279         TIM1->CCMR3 |= TIM1_CCMR_OCxPE;
4308  0003 7216525a      	bset	21082,#3
4311  0007 81            	ret	
4312  0008               L7022:
4313                     ; 1283         TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxPE);
4315  0008 7217525a      	bres	21082,#3
4316                     ; 1285 }
4319  000c 81            	ret	
4355                     ; 1295 void TIM1_OC4PreloadConfig(FunctionalState NewState)
4355                     ; 1296 {
4356                     .text:	section	.text,new
4357  0000               _TIM1_OC4PreloadConfig:
4361                     ; 1298     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4363                     ; 1301     if (NewState != DISABLE)
4365  0000 4d            	tnz	a
4366  0001 2705          	jreq	L1322
4367                     ; 1303         TIM1->CCMR4 |= TIM1_CCMR_OCxPE;
4369  0003 7216525b      	bset	21083,#3
4372  0007 81            	ret	
4373  0008               L1322:
4374                     ; 1307         TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxPE);
4376  0008 7217525b      	bres	21083,#3
4377                     ; 1309 }
4380  000c 81            	ret	
4415                     ; 1317 void TIM1_OC1FastConfig(FunctionalState NewState)
4415                     ; 1318 {
4416                     .text:	section	.text,new
4417  0000               _TIM1_OC1FastConfig:
4421                     ; 1320     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4423                     ; 1323     if (NewState != DISABLE)
4425  0000 4d            	tnz	a
4426  0001 2705          	jreq	L3522
4427                     ; 1325         TIM1->CCMR1 |= TIM1_CCMR_OCxFE;
4429  0003 72145258      	bset	21080,#2
4432  0007 81            	ret	
4433  0008               L3522:
4434                     ; 1329         TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxFE);
4436  0008 72155258      	bres	21080,#2
4437                     ; 1331 }
4440  000c 81            	ret	
4475                     ; 1341 void TIM1_OC2FastConfig(FunctionalState NewState)
4475                     ; 1342 {
4476                     .text:	section	.text,new
4477  0000               _TIM1_OC2FastConfig:
4481                     ; 1344     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4483                     ; 1347     if (NewState != DISABLE)
4485  0000 4d            	tnz	a
4486  0001 2705          	jreq	L5722
4487                     ; 1349         TIM1->CCMR2 |= TIM1_CCMR_OCxFE;
4489  0003 72145259      	bset	21081,#2
4492  0007 81            	ret	
4493  0008               L5722:
4494                     ; 1353         TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxFE);
4496  0008 72155259      	bres	21081,#2
4497                     ; 1355 }
4500  000c 81            	ret	
4535                     ; 1364 void TIM1_OC3FastConfig(FunctionalState NewState)
4535                     ; 1365 {
4536                     .text:	section	.text,new
4537  0000               _TIM1_OC3FastConfig:
4541                     ; 1367     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4543                     ; 1370     if (NewState != DISABLE)
4545  0000 4d            	tnz	a
4546  0001 2705          	jreq	L7132
4547                     ; 1372         TIM1->CCMR3 |= TIM1_CCMR_OCxFE;
4549  0003 7214525a      	bset	21082,#2
4552  0007 81            	ret	
4553  0008               L7132:
4554                     ; 1376         TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxFE);
4556  0008 7215525a      	bres	21082,#2
4557                     ; 1378 }
4560  000c 81            	ret	
4595                     ; 1387 void TIM1_OC4FastConfig(FunctionalState NewState)
4595                     ; 1388 {
4596                     .text:	section	.text,new
4597  0000               _TIM1_OC4FastConfig:
4601                     ; 1390     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4603                     ; 1393     if (NewState != DISABLE)
4605  0000 4d            	tnz	a
4606  0001 2705          	jreq	L1432
4607                     ; 1395         TIM1->CCMR4 |= TIM1_CCMR_OCxFE;
4609  0003 7214525b      	bset	21083,#2
4612  0007 81            	ret	
4613  0008               L1432:
4614                     ; 1399         TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxFE);
4616  0008 7215525b      	bres	21083,#2
4617                     ; 1401 }
4620  000c 81            	ret	
4725                     ; 1418 void TIM1_GenerateEvent(TIM1_EventSource_TypeDef TIM1_EventSource)
4725                     ; 1419 {
4726                     .text:	section	.text,new
4727  0000               _TIM1_GenerateEvent:
4731                     ; 1421     assert_param(IS_TIM1_EVENT_SOURCE_OK(TIM1_EventSource));
4733                     ; 1424     TIM1->EGR = (uint8_t)TIM1_EventSource;
4735  0000 c75257        	ld	21079,a
4736                     ; 1425 }
4739  0003 81            	ret	
4775                     ; 1436 void TIM1_OC1PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
4775                     ; 1437 {
4776                     .text:	section	.text,new
4777  0000               _TIM1_OC1PolarityConfig:
4781                     ; 1439     assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
4783                     ; 1442     if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
4785  0000 4d            	tnz	a
4786  0001 2705          	jreq	L5242
4787                     ; 1444         TIM1->CCER1 |= TIM1_CCER1_CC1P;
4789  0003 7212525c      	bset	21084,#1
4792  0007 81            	ret	
4793  0008               L5242:
4794                     ; 1448         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
4796  0008 7213525c      	bres	21084,#1
4797                     ; 1450 }
4800  000c 81            	ret	
4836                     ; 1461 void TIM1_OC1NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
4836                     ; 1462 {
4837                     .text:	section	.text,new
4838  0000               _TIM1_OC1NPolarityConfig:
4842                     ; 1464     assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
4844                     ; 1467     if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
4846  0000 4d            	tnz	a
4847  0001 2705          	jreq	L7442
4848                     ; 1469         TIM1->CCER1 |= TIM1_CCER1_CC1NP;
4850  0003 7216525c      	bset	21084,#3
4853  0007 81            	ret	
4854  0008               L7442:
4855                     ; 1473         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NP);
4857  0008 7217525c      	bres	21084,#3
4858                     ; 1475 }
4861  000c 81            	ret	
4897                     ; 1486 void TIM1_OC2PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
4897                     ; 1487 {
4898                     .text:	section	.text,new
4899  0000               _TIM1_OC2PolarityConfig:
4903                     ; 1489     assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
4905                     ; 1492     if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
4907  0000 4d            	tnz	a
4908  0001 2705          	jreq	L1742
4909                     ; 1494         TIM1->CCER1 |= TIM1_CCER1_CC2P;
4911  0003 721a525c      	bset	21084,#5
4914  0007 81            	ret	
4915  0008               L1742:
4916                     ; 1498         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
4918  0008 721b525c      	bres	21084,#5
4919                     ; 1500 }
4922  000c 81            	ret	
4958                     ; 1510 void TIM1_OC2NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
4958                     ; 1511 {
4959                     .text:	section	.text,new
4960  0000               _TIM1_OC2NPolarityConfig:
4964                     ; 1513     assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
4966                     ; 1516     if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
4968  0000 4d            	tnz	a
4969  0001 2705          	jreq	L3152
4970                     ; 1518         TIM1->CCER1 |= TIM1_CCER1_CC2NP;
4972  0003 721e525c      	bset	21084,#7
4975  0007 81            	ret	
4976  0008               L3152:
4977                     ; 1522         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NP);
4979  0008 721f525c      	bres	21084,#7
4980                     ; 1524 }
4983  000c 81            	ret	
5019                     ; 1535 void TIM1_OC3PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
5019                     ; 1536 {
5020                     .text:	section	.text,new
5021  0000               _TIM1_OC3PolarityConfig:
5025                     ; 1538     assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
5027                     ; 1541     if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
5029  0000 4d            	tnz	a
5030  0001 2705          	jreq	L5352
5031                     ; 1543         TIM1->CCER2 |= TIM1_CCER2_CC3P;
5033  0003 7212525d      	bset	21085,#1
5036  0007 81            	ret	
5037  0008               L5352:
5038                     ; 1547         TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
5040  0008 7213525d      	bres	21085,#1
5041                     ; 1549 }
5044  000c 81            	ret	
5080                     ; 1560 void TIM1_OC3NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
5080                     ; 1561 {
5081                     .text:	section	.text,new
5082  0000               _TIM1_OC3NPolarityConfig:
5086                     ; 1563     assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
5088                     ; 1566     if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
5090  0000 4d            	tnz	a
5091  0001 2705          	jreq	L7552
5092                     ; 1568         TIM1->CCER2 |= TIM1_CCER2_CC3NP;
5094  0003 7216525d      	bset	21085,#3
5097  0007 81            	ret	
5098  0008               L7552:
5099                     ; 1572         TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NP);
5101  0008 7217525d      	bres	21085,#3
5102                     ; 1574 }
5105  000c 81            	ret	
5141                     ; 1584 void TIM1_OC4PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
5141                     ; 1585 {
5142                     .text:	section	.text,new
5143  0000               _TIM1_OC4PolarityConfig:
5147                     ; 1587     assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
5149                     ; 1590     if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
5151  0000 4d            	tnz	a
5152  0001 2705          	jreq	L1062
5153                     ; 1592         TIM1->CCER2 |= TIM1_CCER2_CC4P;
5155  0003 721a525d      	bset	21085,#5
5158  0007 81            	ret	
5159  0008               L1062:
5160                     ; 1596         TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4P);
5162  0008 721b525d      	bres	21085,#5
5163                     ; 1598 }
5166  000c 81            	ret	
5211                     ; 1613 void TIM1_CCxCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
5211                     ; 1614 {
5212                     .text:	section	.text,new
5213  0000               _TIM1_CCxCmd:
5215  0000 89            	pushw	x
5216       00000000      OFST:	set	0
5219                     ; 1616     assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
5221                     ; 1617     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5223                     ; 1619     if (TIM1_Channel == TIM1_CHANNEL_1)
5225  0001 9e            	ld	a,xh
5226  0002 4d            	tnz	a
5227  0003 2610          	jrne	L7262
5228                     ; 1622         if (NewState != DISABLE)
5230  0005 9f            	ld	a,xl
5231  0006 4d            	tnz	a
5232  0007 2706          	jreq	L1362
5233                     ; 1624             TIM1->CCER1 |= TIM1_CCER1_CC1E;
5235  0009 7210525c      	bset	21084,#0
5237  000d 203e          	jra	L5362
5238  000f               L1362:
5239                     ; 1628             TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
5241  000f 7211525c      	bres	21084,#0
5242  0013 2038          	jra	L5362
5243  0015               L7262:
5244                     ; 1632     else if (TIM1_Channel == TIM1_CHANNEL_2)
5246  0015 7b01          	ld	a,(OFST+1,sp)
5247  0017 a101          	cp	a,#1
5248  0019 2610          	jrne	L7362
5249                     ; 1635         if (NewState != DISABLE)
5251  001b 7b02          	ld	a,(OFST+2,sp)
5252  001d 2706          	jreq	L1462
5253                     ; 1637             TIM1->CCER1 |= TIM1_CCER1_CC2E;
5255  001f 7218525c      	bset	21084,#4
5257  0023 2028          	jra	L5362
5258  0025               L1462:
5259                     ; 1641             TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
5261  0025 7219525c      	bres	21084,#4
5262  0029 2022          	jra	L5362
5263  002b               L7362:
5264                     ; 1644     else if (TIM1_Channel == TIM1_CHANNEL_3)
5266  002b a102          	cp	a,#2
5267  002d 2610          	jrne	L7462
5268                     ; 1647         if (NewState != DISABLE)
5270  002f 7b02          	ld	a,(OFST+2,sp)
5271  0031 2706          	jreq	L1562
5272                     ; 1649             TIM1->CCER2 |= TIM1_CCER2_CC3E;
5274  0033 7210525d      	bset	21085,#0
5276  0037 2014          	jra	L5362
5277  0039               L1562:
5278                     ; 1653             TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
5280  0039 7211525d      	bres	21085,#0
5281  003d 200e          	jra	L5362
5282  003f               L7462:
5283                     ; 1659         if (NewState != DISABLE)
5285  003f 7b02          	ld	a,(OFST+2,sp)
5286  0041 2706          	jreq	L7562
5287                     ; 1661             TIM1->CCER2 |= TIM1_CCER2_CC4E;
5289  0043 7218525d      	bset	21085,#4
5291  0047 2004          	jra	L5362
5292  0049               L7562:
5293                     ; 1665             TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4E);
5295  0049 7219525d      	bres	21085,#4
5296  004d               L5362:
5297                     ; 1668 }
5300  004d 85            	popw	x
5301  004e 81            	ret	
5346                     ; 1681 void TIM1_CCxNCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
5346                     ; 1682 {
5347                     .text:	section	.text,new
5348  0000               _TIM1_CCxNCmd:
5350  0000 89            	pushw	x
5351       00000000      OFST:	set	0
5354                     ; 1684     assert_param(IS_TIM1_COMPLEMENTARY_CHANNEL_OK(TIM1_Channel));
5356                     ; 1685     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5358                     ; 1687     if (TIM1_Channel == TIM1_CHANNEL_1)
5360  0001 9e            	ld	a,xh
5361  0002 4d            	tnz	a
5362  0003 2610          	jrne	L5072
5363                     ; 1690         if (NewState != DISABLE)
5365  0005 9f            	ld	a,xl
5366  0006 4d            	tnz	a
5367  0007 2706          	jreq	L7072
5368                     ; 1692             TIM1->CCER1 |= TIM1_CCER1_CC1NE;
5370  0009 7214525c      	bset	21084,#2
5372  000d 2029          	jra	L3172
5373  000f               L7072:
5374                     ; 1696             TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NE);
5376  000f 7215525c      	bres	21084,#2
5377  0013 2023          	jra	L3172
5378  0015               L5072:
5379                     ; 1699     else if (TIM1_Channel == TIM1_CHANNEL_2)
5381  0015 7b01          	ld	a,(OFST+1,sp)
5382  0017 4a            	dec	a
5383  0018 2610          	jrne	L5172
5384                     ; 1702         if (NewState != DISABLE)
5386  001a 7b02          	ld	a,(OFST+2,sp)
5387  001c 2706          	jreq	L7172
5388                     ; 1704             TIM1->CCER1 |= TIM1_CCER1_CC2NE;
5390  001e 721c525c      	bset	21084,#6
5392  0022 2014          	jra	L3172
5393  0024               L7172:
5394                     ; 1708             TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NE);
5396  0024 721d525c      	bres	21084,#6
5397  0028 200e          	jra	L3172
5398  002a               L5172:
5399                     ; 1714         if (NewState != DISABLE)
5401  002a 7b02          	ld	a,(OFST+2,sp)
5402  002c 2706          	jreq	L5272
5403                     ; 1716             TIM1->CCER2 |= TIM1_CCER2_CC3NE;
5405  002e 7214525d      	bset	21085,#2
5407  0032 2004          	jra	L3172
5408  0034               L5272:
5409                     ; 1720             TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NE);
5411  0034 7215525d      	bres	21085,#2
5412  0038               L3172:
5413                     ; 1723 }
5416  0038 85            	popw	x
5417  0039 81            	ret	
5462                     ; 1747 void TIM1_SelectOCxM(TIM1_Channel_TypeDef TIM1_Channel, TIM1_OCMode_TypeDef TIM1_OCMode)
5462                     ; 1748 {
5463                     .text:	section	.text,new
5464  0000               _TIM1_SelectOCxM:
5466  0000 89            	pushw	x
5467       00000000      OFST:	set	0
5470                     ; 1750     assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
5472                     ; 1751     assert_param(IS_TIM1_OCM_OK(TIM1_OCMode));
5474                     ; 1753     if (TIM1_Channel == TIM1_CHANNEL_1)
5476  0001 9e            	ld	a,xh
5477  0002 4d            	tnz	a
5478  0003 2610          	jrne	L3572
5479                     ; 1756         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
5481  0005 7211525c      	bres	21084,#0
5482                     ; 1759         TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) 
5482                     ; 1760                                 | (uint8_t)TIM1_OCMode);
5484  0009 c65258        	ld	a,21080
5485  000c a48f          	and	a,#143
5486  000e 1a02          	or	a,(OFST+2,sp)
5487  0010 c75258        	ld	21080,a
5489  0013 2038          	jra	L5572
5490  0015               L3572:
5491                     ; 1762     else if (TIM1_Channel == TIM1_CHANNEL_2)
5493  0015 7b01          	ld	a,(OFST+1,sp)
5494  0017 a101          	cp	a,#1
5495  0019 2610          	jrne	L7572
5496                     ; 1765         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
5498  001b 7219525c      	bres	21084,#4
5499                     ; 1768         TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM))
5499                     ; 1769                                 | (uint8_t)TIM1_OCMode);
5501  001f c65259        	ld	a,21081
5502  0022 a48f          	and	a,#143
5503  0024 1a02          	or	a,(OFST+2,sp)
5504  0026 c75259        	ld	21081,a
5506  0029 2022          	jra	L5572
5507  002b               L7572:
5508                     ; 1771     else if (TIM1_Channel == TIM1_CHANNEL_3)
5510  002b a102          	cp	a,#2
5511  002d 2610          	jrne	L3672
5512                     ; 1774         TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
5514  002f 7211525d      	bres	21085,#0
5515                     ; 1777         TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) 
5515                     ; 1778                                 | (uint8_t)TIM1_OCMode);
5517  0033 c6525a        	ld	a,21082
5518  0036 a48f          	and	a,#143
5519  0038 1a02          	or	a,(OFST+2,sp)
5520  003a c7525a        	ld	21082,a
5522  003d 200e          	jra	L5572
5523  003f               L3672:
5524                     ; 1783         TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4E);
5526  003f 7219525d      	bres	21085,#4
5527                     ; 1786         TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) 
5527                     ; 1787                                 | (uint8_t)TIM1_OCMode);
5529  0043 c6525b        	ld	a,21083
5530  0046 a48f          	and	a,#143
5531  0048 1a02          	or	a,(OFST+2,sp)
5532  004a c7525b        	ld	21083,a
5533  004d               L5572:
5534                     ; 1789 }
5537  004d 85            	popw	x
5538  004e 81            	ret	
5572                     ; 1798 void TIM1_SetCounter(uint16_t Counter)
5572                     ; 1799 {
5573                     .text:	section	.text,new
5574  0000               _TIM1_SetCounter:
5578                     ; 1801     TIM1->CNTRH = (uint8_t)(Counter >> 8);
5580  0000 9e            	ld	a,xh
5581  0001 c7525e        	ld	21086,a
5582                     ; 1802     TIM1->CNTRL = (uint8_t)(Counter);
5584  0004 9f            	ld	a,xl
5585  0005 c7525f        	ld	21087,a
5586                     ; 1804 }
5589  0008 81            	ret	
5623                     ; 1813 void TIM1_SetAutoreload(uint16_t Autoreload)
5623                     ; 1814 {
5624                     .text:	section	.text,new
5625  0000               _TIM1_SetAutoreload:
5629                     ; 1817     TIM1->ARRH = (uint8_t)(Autoreload >> 8);
5631  0000 9e            	ld	a,xh
5632  0001 c75262        	ld	21090,a
5633                     ; 1818     TIM1->ARRL = (uint8_t)(Autoreload);
5635  0004 9f            	ld	a,xl
5636  0005 c75263        	ld	21091,a
5637                     ; 1820 }
5640  0008 81            	ret	
5674                     ; 1829 void TIM1_SetCompare1(uint16_t Compare1)
5674                     ; 1830 {
5675                     .text:	section	.text,new
5676  0000               _TIM1_SetCompare1:
5680                     ; 1832     TIM1->CCR1H = (uint8_t)(Compare1 >> 8);
5682  0000 9e            	ld	a,xh
5683  0001 c75265        	ld	21093,a
5684                     ; 1833     TIM1->CCR1L = (uint8_t)(Compare1);
5686  0004 9f            	ld	a,xl
5687  0005 c75266        	ld	21094,a
5688                     ; 1835 }
5691  0008 81            	ret	
5725                     ; 1844 void TIM1_SetCompare2(uint16_t Compare2)
5725                     ; 1845 {
5726                     .text:	section	.text,new
5727  0000               _TIM1_SetCompare2:
5731                     ; 1847     TIM1->CCR2H = (uint8_t)(Compare2 >> 8);
5733  0000 9e            	ld	a,xh
5734  0001 c75267        	ld	21095,a
5735                     ; 1848     TIM1->CCR2L = (uint8_t)(Compare2);
5737  0004 9f            	ld	a,xl
5738  0005 c75268        	ld	21096,a
5739                     ; 1850 }
5742  0008 81            	ret	
5776                     ; 1859 void TIM1_SetCompare3(uint16_t Compare3)
5776                     ; 1860 {
5777                     .text:	section	.text,new
5778  0000               _TIM1_SetCompare3:
5782                     ; 1862     TIM1->CCR3H = (uint8_t)(Compare3 >> 8);
5784  0000 9e            	ld	a,xh
5785  0001 c75269        	ld	21097,a
5786                     ; 1863     TIM1->CCR3L = (uint8_t)(Compare3);
5788  0004 9f            	ld	a,xl
5789  0005 c7526a        	ld	21098,a
5790                     ; 1865 }
5793  0008 81            	ret	
5827                     ; 1874 void TIM1_SetCompare4(uint16_t Compare4)
5827                     ; 1875 {
5828                     .text:	section	.text,new
5829  0000               _TIM1_SetCompare4:
5833                     ; 1877     TIM1->CCR4H = (uint8_t)(Compare4 >> 8);
5835  0000 9e            	ld	a,xh
5836  0001 c7526b        	ld	21099,a
5837                     ; 1878     TIM1->CCR4L = (uint8_t)(Compare4);
5839  0004 9f            	ld	a,xl
5840  0005 c7526c        	ld	21100,a
5841                     ; 1879 }
5844  0008 81            	ret	
5880                     ; 1892 void TIM1_SetIC1Prescaler(TIM1_ICPSC_TypeDef TIM1_IC1Prescaler)
5880                     ; 1893 {
5881                     .text:	section	.text,new
5882  0000               _TIM1_SetIC1Prescaler:
5884  0000 88            	push	a
5885       00000000      OFST:	set	0
5888                     ; 1895     assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC1Prescaler));
5890                     ; 1898     TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_ICxPSC)) 
5890                     ; 1899                             | (uint8_t)TIM1_IC1Prescaler);
5892  0001 c65258        	ld	a,21080
5893  0004 a4f3          	and	a,#243
5894  0006 1a01          	or	a,(OFST+1,sp)
5895  0008 c75258        	ld	21080,a
5896                     ; 1901 }
5899  000b 84            	pop	a
5900  000c 81            	ret	
5936                     ; 1913 void TIM1_SetIC2Prescaler(TIM1_ICPSC_TypeDef TIM1_IC2Prescaler)
5936                     ; 1914 {
5937                     .text:	section	.text,new
5938  0000               _TIM1_SetIC2Prescaler:
5940  0000 88            	push	a
5941       00000000      OFST:	set	0
5944                     ; 1917     assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC2Prescaler));
5946                     ; 1920     TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_ICxPSC))
5946                     ; 1921                             | (uint8_t)TIM1_IC2Prescaler);
5948  0001 c65259        	ld	a,21081
5949  0004 a4f3          	and	a,#243
5950  0006 1a01          	or	a,(OFST+1,sp)
5951  0008 c75259        	ld	21081,a
5952                     ; 1922 }
5955  000b 84            	pop	a
5956  000c 81            	ret	
5992                     ; 1935 void TIM1_SetIC3Prescaler(TIM1_ICPSC_TypeDef TIM1_IC3Prescaler)
5992                     ; 1936 {
5993                     .text:	section	.text,new
5994  0000               _TIM1_SetIC3Prescaler:
5996  0000 88            	push	a
5997       00000000      OFST:	set	0
6000                     ; 1939     assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC3Prescaler));
6002                     ; 1942     TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | 
6002                     ; 1943                             (uint8_t)TIM1_IC3Prescaler);
6004  0001 c6525a        	ld	a,21082
6005  0004 a4f3          	and	a,#243
6006  0006 1a01          	or	a,(OFST+1,sp)
6007  0008 c7525a        	ld	21082,a
6008                     ; 1944 }
6011  000b 84            	pop	a
6012  000c 81            	ret	
6048                     ; 1956 void TIM1_SetIC4Prescaler(TIM1_ICPSC_TypeDef TIM1_IC4Prescaler)
6048                     ; 1957 {
6049                     .text:	section	.text,new
6050  0000               _TIM1_SetIC4Prescaler:
6052  0000 88            	push	a
6053       00000000      OFST:	set	0
6056                     ; 1960     assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC4Prescaler));
6058                     ; 1963     TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_ICxPSC)) |
6058                     ; 1964                             (uint8_t)TIM1_IC4Prescaler);
6060  0001 c6525b        	ld	a,21083
6061  0004 a4f3          	and	a,#243
6062  0006 1a01          	or	a,(OFST+1,sp)
6063  0008 c7525b        	ld	21083,a
6064                     ; 1965 }
6067  000b 84            	pop	a
6068  000c 81            	ret	
6120                     ; 1972 uint16_t TIM1_GetCapture1(void)
6120                     ; 1973 {
6121                     .text:	section	.text,new
6122  0000               _TIM1_GetCapture1:
6124  0000 5204          	subw	sp,#4
6125       00000004      OFST:	set	4
6128                     ; 1976     uint16_t tmpccr1 = 0;
6130                     ; 1977     uint8_t tmpccr1l=0, tmpccr1h=0;
6134                     ; 1979     tmpccr1h = TIM1->CCR1H;
6136  0002 c65265        	ld	a,21093
6137  0005 6b02          	ld	(OFST-2,sp),a
6138                     ; 1980     tmpccr1l = TIM1->CCR1L;
6140  0007 c65266        	ld	a,21094
6141  000a 6b01          	ld	(OFST-3,sp),a
6142                     ; 1982     tmpccr1 = (uint16_t)(tmpccr1l);
6144  000c 5f            	clrw	x
6145  000d 97            	ld	xl,a
6146  000e 1f03          	ldw	(OFST-1,sp),x
6147                     ; 1983     tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
6149  0010 5f            	clrw	x
6150  0011 7b02          	ld	a,(OFST-2,sp)
6151  0013 97            	ld	xl,a
6152  0014 7b04          	ld	a,(OFST+0,sp)
6153  0016 01            	rrwa	x,a
6154  0017 1a03          	or	a,(OFST-1,sp)
6155  0019 01            	rrwa	x,a
6156                     ; 1985     return (uint16_t)tmpccr1;
6160  001a 5b04          	addw	sp,#4
6161  001c 81            	ret	
6213                     ; 1993 uint16_t TIM1_GetCapture2(void)
6213                     ; 1994 {
6214                     .text:	section	.text,new
6215  0000               _TIM1_GetCapture2:
6217  0000 5204          	subw	sp,#4
6218       00000004      OFST:	set	4
6221                     ; 1997     uint16_t tmpccr2 = 0;
6223                     ; 1998     uint8_t tmpccr2l=0, tmpccr2h=0;
6227                     ; 2000     tmpccr2h = TIM1->CCR2H;
6229  0002 c65267        	ld	a,21095
6230  0005 6b02          	ld	(OFST-2,sp),a
6231                     ; 2001     tmpccr2l = TIM1->CCR2L;
6233  0007 c65268        	ld	a,21096
6234  000a 6b01          	ld	(OFST-3,sp),a
6235                     ; 2003     tmpccr2 = (uint16_t)(tmpccr2l);
6237  000c 5f            	clrw	x
6238  000d 97            	ld	xl,a
6239  000e 1f03          	ldw	(OFST-1,sp),x
6240                     ; 2004     tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
6242  0010 5f            	clrw	x
6243  0011 7b02          	ld	a,(OFST-2,sp)
6244  0013 97            	ld	xl,a
6245  0014 7b04          	ld	a,(OFST+0,sp)
6246  0016 01            	rrwa	x,a
6247  0017 1a03          	or	a,(OFST-1,sp)
6248  0019 01            	rrwa	x,a
6249                     ; 2006     return (uint16_t)tmpccr2;
6253  001a 5b04          	addw	sp,#4
6254  001c 81            	ret	
6306                     ; 2014 uint16_t TIM1_GetCapture3(void)
6306                     ; 2015 {
6307                     .text:	section	.text,new
6308  0000               _TIM1_GetCapture3:
6310  0000 5204          	subw	sp,#4
6311       00000004      OFST:	set	4
6314                     ; 2017     uint16_t tmpccr3 = 0;
6316                     ; 2018     uint8_t tmpccr3l=0, tmpccr3h=0;
6320                     ; 2020     tmpccr3h = TIM1->CCR3H;
6322  0002 c65269        	ld	a,21097
6323  0005 6b02          	ld	(OFST-2,sp),a
6324                     ; 2021     tmpccr3l = TIM1->CCR3L;
6326  0007 c6526a        	ld	a,21098
6327  000a 6b01          	ld	(OFST-3,sp),a
6328                     ; 2023     tmpccr3 = (uint16_t)(tmpccr3l);
6330  000c 5f            	clrw	x
6331  000d 97            	ld	xl,a
6332  000e 1f03          	ldw	(OFST-1,sp),x
6333                     ; 2024     tmpccr3 |= (uint16_t)((uint16_t)tmpccr3h << 8);
6335  0010 5f            	clrw	x
6336  0011 7b02          	ld	a,(OFST-2,sp)
6337  0013 97            	ld	xl,a
6338  0014 7b04          	ld	a,(OFST+0,sp)
6339  0016 01            	rrwa	x,a
6340  0017 1a03          	or	a,(OFST-1,sp)
6341  0019 01            	rrwa	x,a
6342                     ; 2026     return (uint16_t)tmpccr3;
6346  001a 5b04          	addw	sp,#4
6347  001c 81            	ret	
6399                     ; 2034 uint16_t TIM1_GetCapture4(void)
6399                     ; 2035 {
6400                     .text:	section	.text,new
6401  0000               _TIM1_GetCapture4:
6403  0000 5204          	subw	sp,#4
6404       00000004      OFST:	set	4
6407                     ; 2037     uint16_t tmpccr4 = 0;
6409                     ; 2038     uint8_t tmpccr4l=0, tmpccr4h=0;
6413                     ; 2040     tmpccr4h = TIM1->CCR4H;
6415  0002 c6526b        	ld	a,21099
6416  0005 6b02          	ld	(OFST-2,sp),a
6417                     ; 2041     tmpccr4l = TIM1->CCR4L;
6419  0007 c6526c        	ld	a,21100
6420  000a 6b01          	ld	(OFST-3,sp),a
6421                     ; 2043     tmpccr4 = (uint16_t)(tmpccr4l);
6423  000c 5f            	clrw	x
6424  000d 97            	ld	xl,a
6425  000e 1f03          	ldw	(OFST-1,sp),x
6426                     ; 2044     tmpccr4 |= (uint16_t)((uint16_t)tmpccr4h << 8);
6428  0010 5f            	clrw	x
6429  0011 7b02          	ld	a,(OFST-2,sp)
6430  0013 97            	ld	xl,a
6431  0014 7b04          	ld	a,(OFST+0,sp)
6432  0016 01            	rrwa	x,a
6433  0017 1a03          	or	a,(OFST-1,sp)
6434  0019 01            	rrwa	x,a
6435                     ; 2046     return (uint16_t)tmpccr4;
6439  001a 5b04          	addw	sp,#4
6440  001c 81            	ret	
6474                     ; 2054 uint16_t TIM1_GetCounter(void)
6474                     ; 2055 {
6475                     .text:	section	.text,new
6476  0000               _TIM1_GetCounter:
6478  0000 89            	pushw	x
6479       00000002      OFST:	set	2
6482                     ; 2056   uint16_t tmpcntr = 0;
6484                     ; 2058   tmpcntr = ((uint16_t)TIM1->CNTRH << 8);
6486  0001 c6525e        	ld	a,21086
6487  0004 97            	ld	xl,a
6488  0005 4f            	clr	a
6489  0006 02            	rlwa	x,a
6490  0007 1f01          	ldw	(OFST-1,sp),x
6491                     ; 2061     return (uint16_t)(tmpcntr | (uint16_t)(TIM1->CNTRL));
6493  0009 5f            	clrw	x
6494  000a c6525f        	ld	a,21087
6495  000d 97            	ld	xl,a
6496  000e 01            	rrwa	x,a
6497  000f 1a02          	or	a,(OFST+0,sp)
6498  0011 01            	rrwa	x,a
6499  0012 1a01          	or	a,(OFST-1,sp)
6500  0014 01            	rrwa	x,a
6503  0015 5b02          	addw	sp,#2
6504  0017 81            	ret	
6538                     ; 2069 uint16_t TIM1_GetPrescaler(void)
6538                     ; 2070 {
6539                     .text:	section	.text,new
6540  0000               _TIM1_GetPrescaler:
6542  0000 89            	pushw	x
6543       00000002      OFST:	set	2
6546                     ; 2071    uint16_t temp = 0;
6548                     ; 2073    temp = ((uint16_t)TIM1->PSCRH << 8);
6550  0001 c65260        	ld	a,21088
6551  0004 97            	ld	xl,a
6552  0005 4f            	clr	a
6553  0006 02            	rlwa	x,a
6554  0007 1f01          	ldw	(OFST-1,sp),x
6555                     ; 2076     return (uint16_t)( temp | (uint16_t)(TIM1->PSCRL));
6557  0009 5f            	clrw	x
6558  000a c65261        	ld	a,21089
6559  000d 97            	ld	xl,a
6560  000e 01            	rrwa	x,a
6561  000f 1a02          	or	a,(OFST+0,sp)
6562  0011 01            	rrwa	x,a
6563  0012 1a01          	or	a,(OFST-1,sp)
6564  0014 01            	rrwa	x,a
6567  0015 5b02          	addw	sp,#2
6568  0017 81            	ret	
6742                     ; 2097 FlagStatus TIM1_GetFlagStatus(TIM1_FLAG_TypeDef TIM1_FLAG)
6742                     ; 2098 {
6743                     .text:	section	.text,new
6744  0000               _TIM1_GetFlagStatus:
6746  0000 89            	pushw	x
6747  0001 89            	pushw	x
6748       00000002      OFST:	set	2
6751                     ; 2099     FlagStatus bitstatus = RESET;
6753                     ; 2100     uint8_t tim1_flag_l = 0, tim1_flag_h = 0;
6757                     ; 2103     assert_param(IS_TIM1_GET_FLAG_OK(TIM1_FLAG));
6759                     ; 2105     tim1_flag_l = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_FLAG);
6761  0002 9f            	ld	a,xl
6762  0003 c45255        	and	a,21077
6763  0006 6b01          	ld	(OFST-1,sp),a
6764                     ; 2106     tim1_flag_h = (uint8_t)((uint16_t)TIM1_FLAG >> 8);
6766  0008 7b03          	ld	a,(OFST+1,sp)
6767  000a 6b02          	ld	(OFST+0,sp),a
6768                     ; 2108     if ((tim1_flag_l | (uint8_t)(TIM1->SR2 & tim1_flag_h)) != 0)
6770  000c c45256        	and	a,21078
6771  000f 1a01          	or	a,(OFST-1,sp)
6772  0011 2702          	jreq	L5643
6773                     ; 2110         bitstatus = SET;
6775  0013 a601          	ld	a,#1
6777  0015               L5643:
6778                     ; 2114         bitstatus = RESET;
6780                     ; 2116     return (FlagStatus)(bitstatus);
6784  0015 5b04          	addw	sp,#4
6785  0017 81            	ret	
6820                     ; 2137 void TIM1_ClearFlag(TIM1_FLAG_TypeDef TIM1_FLAG)
6820                     ; 2138 {
6821                     .text:	section	.text,new
6822  0000               _TIM1_ClearFlag:
6824  0000 89            	pushw	x
6825       00000000      OFST:	set	0
6828                     ; 2140     assert_param(IS_TIM1_CLEAR_FLAG_OK(TIM1_FLAG));
6830                     ; 2143     TIM1->SR1 = (uint8_t)(~(uint8_t)(TIM1_FLAG));
6832  0001 9f            	ld	a,xl
6833  0002 43            	cpl	a
6834  0003 c75255        	ld	21077,a
6835                     ; 2144     TIM1->SR2 = (uint8_t)((uint8_t)(~((uint8_t)((uint16_t)TIM1_FLAG >> 8))) & 
6835                     ; 2145                           (uint8_t)0x1E);
6837  0006 7b01          	ld	a,(OFST+1,sp)
6838  0008 43            	cpl	a
6839  0009 a41e          	and	a,#30
6840  000b c75256        	ld	21078,a
6841                     ; 2146 }
6844  000e 85            	popw	x
6845  000f 81            	ret	
6909                     ; 2162 ITStatus TIM1_GetITStatus(TIM1_IT_TypeDef TIM1_IT)
6909                     ; 2163 {
6910                     .text:	section	.text,new
6911  0000               _TIM1_GetITStatus:
6913  0000 88            	push	a
6914  0001 89            	pushw	x
6915       00000002      OFST:	set	2
6918                     ; 2164     ITStatus bitstatus = RESET;
6920                     ; 2165     uint8_t TIM1_itStatus = 0, TIM1_itEnable = 0;
6924                     ; 2168     assert_param(IS_TIM1_GET_IT_OK(TIM1_IT));
6926                     ; 2170     TIM1_itStatus = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_IT);
6928  0002 c45255        	and	a,21077
6929  0005 6b01          	ld	(OFST-1,sp),a
6930                     ; 2172     TIM1_itEnable = (uint8_t)(TIM1->IER & (uint8_t)TIM1_IT);
6932  0007 c65254        	ld	a,21076
6933  000a 1403          	and	a,(OFST+1,sp)
6934  000c 6b02          	ld	(OFST+0,sp),a
6935                     ; 2174     if ((TIM1_itStatus != (uint8_t)RESET ) && (TIM1_itEnable != (uint8_t)RESET ))
6937  000e 7b01          	ld	a,(OFST-1,sp)
6938  0010 2708          	jreq	L1453
6940  0012 7b02          	ld	a,(OFST+0,sp)
6941  0014 2704          	jreq	L1453
6942                     ; 2176         bitstatus = SET;
6944  0016 a601          	ld	a,#1
6946  0018 2001          	jra	L3453
6947  001a               L1453:
6948                     ; 2180         bitstatus = RESET;
6950  001a 4f            	clr	a
6951  001b               L3453:
6952                     ; 2182     return (ITStatus)(bitstatus);
6956  001b 5b03          	addw	sp,#3
6957  001d 81            	ret	
6993                     ; 2199 void TIM1_ClearITPendingBit(TIM1_IT_TypeDef TIM1_IT)
6993                     ; 2200 {
6994                     .text:	section	.text,new
6995  0000               _TIM1_ClearITPendingBit:
6999                     ; 2202     assert_param(IS_TIM1_IT_OK(TIM1_IT));
7001                     ; 2205     TIM1->SR1 = (uint8_t)(~(uint8_t)TIM1_IT);
7003  0000 43            	cpl	a
7004  0001 c75255        	ld	21077,a
7005                     ; 2206 }
7008  0004 81            	ret	
7060                     ; 2224 static void TI1_Config(uint8_t TIM1_ICPolarity,
7060                     ; 2225                        uint8_t TIM1_ICSelection,
7060                     ; 2226                        uint8_t TIM1_ICFilter)
7060                     ; 2227 {
7061                     .text:	section	.text,new
7062  0000               L3_TI1_Config:
7064  0000 89            	pushw	x
7065       00000001      OFST:	set	1
7068                     ; 2230     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
7070  0001 7211525c      	bres	21084,#0
7071  0005 88            	push	a
7072                     ; 2233     TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF ))) | 
7072                     ; 2234                             (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7074  0006 7b06          	ld	a,(OFST+5,sp)
7075  0008 97            	ld	xl,a
7076  0009 a610          	ld	a,#16
7077  000b 42            	mul	x,a
7078  000c 9f            	ld	a,xl
7079  000d 1a03          	or	a,(OFST+2,sp)
7080  000f 6b01          	ld	(OFST+0,sp),a
7081  0011 c65258        	ld	a,21080
7082  0014 a40c          	and	a,#12
7083  0016 1a01          	or	a,(OFST+0,sp)
7084  0018 c75258        	ld	21080,a
7085                     ; 2237     if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
7087  001b 7b02          	ld	a,(OFST+1,sp)
7088  001d 2706          	jreq	L1163
7089                     ; 2239         TIM1->CCER1 |= TIM1_CCER1_CC1P;
7091  001f 7212525c      	bset	21084,#1
7093  0023 2004          	jra	L3163
7094  0025               L1163:
7095                     ; 2243         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
7097  0025 7213525c      	bres	21084,#1
7098  0029               L3163:
7099                     ; 2247     TIM1->CCER1 |=  TIM1_CCER1_CC1E;
7101  0029 7210525c      	bset	21084,#0
7102                     ; 2248 }
7105  002d 5b03          	addw	sp,#3
7106  002f 81            	ret	
7158                     ; 2266 static void TI2_Config(uint8_t TIM1_ICPolarity,
7158                     ; 2267                        uint8_t TIM1_ICSelection,
7158                     ; 2268                        uint8_t TIM1_ICFilter)
7158                     ; 2269 {
7159                     .text:	section	.text,new
7160  0000               L5_TI2_Config:
7162  0000 89            	pushw	x
7163       00000001      OFST:	set	1
7166                     ; 2271     TIM1->CCER1 &=  (uint8_t)(~TIM1_CCER1_CC2E);
7168  0001 7219525c      	bres	21084,#4
7169  0005 88            	push	a
7170                     ; 2274     TIM1->CCMR2  = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF ))) 
7170                     ; 2275                             | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7172  0006 7b06          	ld	a,(OFST+5,sp)
7173  0008 97            	ld	xl,a
7174  0009 a610          	ld	a,#16
7175  000b 42            	mul	x,a
7176  000c 9f            	ld	a,xl
7177  000d 1a03          	or	a,(OFST+2,sp)
7178  000f 6b01          	ld	(OFST+0,sp),a
7179  0011 c65259        	ld	a,21081
7180  0014 a40c          	and	a,#12
7181  0016 1a01          	or	a,(OFST+0,sp)
7182  0018 c75259        	ld	21081,a
7183                     ; 2277     if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
7185  001b 7b02          	ld	a,(OFST+1,sp)
7186  001d 2706          	jreq	L3463
7187                     ; 2279         TIM1->CCER1 |= TIM1_CCER1_CC2P;
7189  001f 721a525c      	bset	21084,#5
7191  0023 2004          	jra	L5463
7192  0025               L3463:
7193                     ; 2283         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
7195  0025 721b525c      	bres	21084,#5
7196  0029               L5463:
7197                     ; 2286     TIM1->CCER1 |=  TIM1_CCER1_CC2E;
7199  0029 7218525c      	bset	21084,#4
7200                     ; 2287 }
7203  002d 5b03          	addw	sp,#3
7204  002f 81            	ret	
7256                     ; 2305 static void TI3_Config(uint8_t TIM1_ICPolarity,
7256                     ; 2306                        uint8_t TIM1_ICSelection,
7256                     ; 2307                        uint8_t TIM1_ICFilter)
7256                     ; 2308 {
7257                     .text:	section	.text,new
7258  0000               L7_TI3_Config:
7260  0000 89            	pushw	x
7261       00000001      OFST:	set	1
7264                     ; 2310     TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC3E);
7266  0001 7211525d      	bres	21085,#0
7267  0005 88            	push	a
7268                     ; 2313     TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF))) 
7268                     ; 2314                             | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7270  0006 7b06          	ld	a,(OFST+5,sp)
7271  0008 97            	ld	xl,a
7272  0009 a610          	ld	a,#16
7273  000b 42            	mul	x,a
7274  000c 9f            	ld	a,xl
7275  000d 1a03          	or	a,(OFST+2,sp)
7276  000f 6b01          	ld	(OFST+0,sp),a
7277  0011 c6525a        	ld	a,21082
7278  0014 a40c          	and	a,#12
7279  0016 1a01          	or	a,(OFST+0,sp)
7280  0018 c7525a        	ld	21082,a
7281                     ; 2317     if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
7283  001b 7b02          	ld	a,(OFST+1,sp)
7284  001d 2706          	jreq	L5763
7285                     ; 2319         TIM1->CCER2 |= TIM1_CCER2_CC3P;
7287  001f 7212525d      	bset	21085,#1
7289  0023 2004          	jra	L7763
7290  0025               L5763:
7291                     ; 2323         TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
7293  0025 7213525d      	bres	21085,#1
7294  0029               L7763:
7295                     ; 2326     TIM1->CCER2 |=  TIM1_CCER2_CC3E;
7297  0029 7210525d      	bset	21085,#0
7298                     ; 2327 }
7301  002d 5b03          	addw	sp,#3
7302  002f 81            	ret	
7354                     ; 2346 static void TI4_Config(uint8_t TIM1_ICPolarity,
7354                     ; 2347                        uint8_t TIM1_ICSelection,
7354                     ; 2348                        uint8_t TIM1_ICFilter)
7354                     ; 2349 {
7355                     .text:	section	.text,new
7356  0000               L11_TI4_Config:
7358  0000 89            	pushw	x
7359       00000001      OFST:	set	1
7362                     ; 2352     TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC4E);
7364  0001 7219525d      	bres	21085,#4
7365  0005 88            	push	a
7366                     ; 2355     TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF )))
7366                     ; 2356                             | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7368  0006 7b06          	ld	a,(OFST+5,sp)
7369  0008 97            	ld	xl,a
7370  0009 a610          	ld	a,#16
7371  000b 42            	mul	x,a
7372  000c 9f            	ld	a,xl
7373  000d 1a03          	or	a,(OFST+2,sp)
7374  000f 6b01          	ld	(OFST+0,sp),a
7375  0011 c6525b        	ld	a,21083
7376  0014 a40c          	and	a,#12
7377  0016 1a01          	or	a,(OFST+0,sp)
7378  0018 c7525b        	ld	21083,a
7379                     ; 2359     if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
7381  001b 7b02          	ld	a,(OFST+1,sp)
7382  001d 2706          	jreq	L7273
7383                     ; 2361         TIM1->CCER2 |= TIM1_CCER2_CC4P;
7385  001f 721a525d      	bset	21085,#5
7387  0023 2004          	jra	L1373
7388  0025               L7273:
7389                     ; 2365         TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4P);
7391  0025 721b525d      	bres	21085,#5
7392  0029               L1373:
7393                     ; 2369     TIM1->CCER2 |=  TIM1_CCER2_CC4E;
7395  0029 7218525d      	bset	21085,#4
7396                     ; 2370 }
7399  002d 5b03          	addw	sp,#3
7400  002f 81            	ret	
7413                     	xdef	_TIM1_ClearITPendingBit
7414                     	xdef	_TIM1_GetITStatus
7415                     	xdef	_TIM1_ClearFlag
7416                     	xdef	_TIM1_GetFlagStatus
7417                     	xdef	_TIM1_GetPrescaler
7418                     	xdef	_TIM1_GetCounter
7419                     	xdef	_TIM1_GetCapture4
7420                     	xdef	_TIM1_GetCapture3
7421                     	xdef	_TIM1_GetCapture2
7422                     	xdef	_TIM1_GetCapture1
7423                     	xdef	_TIM1_SetIC4Prescaler
7424                     	xdef	_TIM1_SetIC3Prescaler
7425                     	xdef	_TIM1_SetIC2Prescaler
7426                     	xdef	_TIM1_SetIC1Prescaler
7427                     	xdef	_TIM1_SetCompare4
7428                     	xdef	_TIM1_SetCompare3
7429                     	xdef	_TIM1_SetCompare2
7430                     	xdef	_TIM1_SetCompare1
7431                     	xdef	_TIM1_SetAutoreload
7432                     	xdef	_TIM1_SetCounter
7433                     	xdef	_TIM1_SelectOCxM
7434                     	xdef	_TIM1_CCxNCmd
7435                     	xdef	_TIM1_CCxCmd
7436                     	xdef	_TIM1_OC4PolarityConfig
7437                     	xdef	_TIM1_OC3NPolarityConfig
7438                     	xdef	_TIM1_OC3PolarityConfig
7439                     	xdef	_TIM1_OC2NPolarityConfig
7440                     	xdef	_TIM1_OC2PolarityConfig
7441                     	xdef	_TIM1_OC1NPolarityConfig
7442                     	xdef	_TIM1_OC1PolarityConfig
7443                     	xdef	_TIM1_GenerateEvent
7444                     	xdef	_TIM1_OC4FastConfig
7445                     	xdef	_TIM1_OC3FastConfig
7446                     	xdef	_TIM1_OC2FastConfig
7447                     	xdef	_TIM1_OC1FastConfig
7448                     	xdef	_TIM1_OC4PreloadConfig
7449                     	xdef	_TIM1_OC3PreloadConfig
7450                     	xdef	_TIM1_OC2PreloadConfig
7451                     	xdef	_TIM1_OC1PreloadConfig
7452                     	xdef	_TIM1_CCPreloadControl
7453                     	xdef	_TIM1_SelectCOM
7454                     	xdef	_TIM1_ARRPreloadConfig
7455                     	xdef	_TIM1_ForcedOC4Config
7456                     	xdef	_TIM1_ForcedOC3Config
7457                     	xdef	_TIM1_ForcedOC2Config
7458                     	xdef	_TIM1_ForcedOC1Config
7459                     	xdef	_TIM1_CounterModeConfig
7460                     	xdef	_TIM1_PrescalerConfig
7461                     	xdef	_TIM1_EncoderInterfaceConfig
7462                     	xdef	_TIM1_SelectMasterSlaveMode
7463                     	xdef	_TIM1_SelectSlaveMode
7464                     	xdef	_TIM1_SelectOutputTrigger
7465                     	xdef	_TIM1_SelectOnePulseMode
7466                     	xdef	_TIM1_SelectHallSensor
7467                     	xdef	_TIM1_UpdateRequestConfig
7468                     	xdef	_TIM1_UpdateDisableConfig
7469                     	xdef	_TIM1_SelectInputTrigger
7470                     	xdef	_TIM1_TIxExternalClockConfig
7471                     	xdef	_TIM1_ETRConfig
7472                     	xdef	_TIM1_ETRClockMode2Config
7473                     	xdef	_TIM1_ETRClockMode1Config
7474                     	xdef	_TIM1_InternalClockConfig
7475                     	xdef	_TIM1_ITConfig
7476                     	xdef	_TIM1_CtrlPWMOutputs
7477                     	xdef	_TIM1_Cmd
7478                     	xdef	_TIM1_PWMIConfig
7479                     	xdef	_TIM1_ICInit
7480                     	xdef	_TIM1_BDTRConfig
7481                     	xdef	_TIM1_OC4Init
7482                     	xdef	_TIM1_OC3Init
7483                     	xdef	_TIM1_OC2Init
7484                     	xdef	_TIM1_OC1Init
7485                     	xdef	_TIM1_TimeBaseInit
7486                     	xdef	_TIM1_DeInit
7505                     	end
