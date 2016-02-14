   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
   4                     ; Optimizer V4.3.6 - 29 Nov 2011
  48                     ; 47 void UART2_DeInit(void)
  48                     ; 48 {
  50                     .text:	section	.text,new
  51  0000               _UART2_DeInit:
  55                     ; 51     (void) UART2->SR;
  57  0000 c65240        	ld	a,21056
  58                     ; 52     (void)UART2->DR;
  60  0003 c65241        	ld	a,21057
  61                     ; 54     UART2->BRR2 = UART2_BRR2_RESET_VALUE;  /*  Set UART2_BRR2 to reset value 0x00 */
  63  0006 725f5243      	clr	21059
  64                     ; 55     UART2->BRR1 = UART2_BRR1_RESET_VALUE;  /*  Set UART2_BRR1 to reset value 0x00 */
  66  000a 725f5242      	clr	21058
  67                     ; 57     UART2->CR1 = UART2_CR1_RESET_VALUE; /*  Set UART2_CR1 to reset value 0x00  */
  69  000e 725f5244      	clr	21060
  70                     ; 58     UART2->CR2 = UART2_CR2_RESET_VALUE; /*  Set UART2_CR2 to reset value 0x00  */
  72  0012 725f5245      	clr	21061
  73                     ; 59     UART2->CR3 = UART2_CR3_RESET_VALUE; /*  Set UART2_CR3 to reset value 0x00  */
  75  0016 725f5246      	clr	21062
  76                     ; 60     UART2->CR4 = UART2_CR4_RESET_VALUE; /*  Set UART2_CR4 to reset value 0x00  */
  78  001a 725f5247      	clr	21063
  79                     ; 61     UART2->CR5 = UART2_CR5_RESET_VALUE; /*  Set UART2_CR5 to reset value 0x00  */
  81  001e 725f5248      	clr	21064
  82                     ; 62     UART2->CR6 = UART2_CR6_RESET_VALUE; /*  Set UART2_CR6 to reset value 0x00  */
  84  0022 725f5249      	clr	21065
  85                     ; 64 }
  88  0026 81            	ret	
 409                     .const:	section	.text
 410  0000               L41:
 411  0000 00000064      	dc.l	100
 412                     ; 80 void UART2_Init(uint32_t BaudRate, UART2_WordLength_TypeDef WordLength, UART2_StopBits_TypeDef StopBits, UART2_Parity_TypeDef Parity, UART2_SyncMode_TypeDef SyncMode, UART2_Mode_TypeDef Mode)
 412                     ; 81 {
 413                     .text:	section	.text,new
 414  0000               _UART2_Init:
 416       0000000e      OFST:	set	14
 419                     ; 82     uint8_t BRR2_1 = 0, BRR2_2 = 0;
 423                     ; 83     uint32_t BaudRate_Mantissa = 0, BaudRate_Mantissa100 = 0;
 427                     ; 86     assert_param(IS_UART2_BAUDRATE_OK(BaudRate));
 429                     ; 87     assert_param(IS_UART2_WORDLENGTH_OK(WordLength));
 431                     ; 88     assert_param(IS_UART2_STOPBITS_OK(StopBits));
 433                     ; 89     assert_param(IS_UART2_PARITY_OK(Parity));
 435                     ; 90     assert_param(IS_UART2_MODE_OK((uint8_t)Mode));
 437                     ; 91     assert_param(IS_UART2_SYNCMODE_OK((uint8_t)SyncMode));
 439                     ; 94     UART2->CR1 &= (uint8_t)(~UART2_CR1_M);
 441  0000 72195244      	bres	21060,#4
 442  0004 520e          	subw	sp,#14
 443                     ; 96     UART2->CR1 |= (uint8_t)WordLength; 
 445  0006 c65244        	ld	a,21060
 446  0009 1a15          	or	a,(OFST+7,sp)
 447  000b c75244        	ld	21060,a
 448                     ; 99     UART2->CR3 &= (uint8_t)(~UART2_CR3_STOP);
 450  000e c65246        	ld	a,21062
 451  0011 a4cf          	and	a,#207
 452  0013 c75246        	ld	21062,a
 453                     ; 101     UART2->CR3 |= (uint8_t)StopBits; 
 455  0016 c65246        	ld	a,21062
 456  0019 1a16          	or	a,(OFST+8,sp)
 457  001b c75246        	ld	21062,a
 458                     ; 104     UART2->CR1 &= (uint8_t)(~(UART2_CR1_PCEN | UART2_CR1_PS  ));
 460  001e c65244        	ld	a,21060
 461  0021 a4f9          	and	a,#249
 462  0023 c75244        	ld	21060,a
 463                     ; 106     UART2->CR1 |= (uint8_t)Parity;
 465  0026 c65244        	ld	a,21060
 466  0029 1a17          	or	a,(OFST+9,sp)
 467  002b c75244        	ld	21060,a
 468                     ; 109     UART2->BRR1 &= (uint8_t)(~UART2_BRR1_DIVM);
 470  002e 725f5242      	clr	21058
 471                     ; 111     UART2->BRR2 &= (uint8_t)(~UART2_BRR2_DIVM);
 473  0032 c65243        	ld	a,21059
 474  0035 a40f          	and	a,#15
 475  0037 c75243        	ld	21059,a
 476                     ; 113     UART2->BRR2 &= (uint8_t)(~UART2_BRR2_DIVF);
 478  003a c65243        	ld	a,21059
 479  003d a4f0          	and	a,#240
 480  003f c75243        	ld	21059,a
 481                     ; 116     BaudRate_Mantissa    = ((uint32_t)CLK_GetClockFreq() / (BaudRate << 4));
 483  0042 96            	ldw	x,sp
 484  0043 cd0116        	call	LC001
 486  0046 96            	ldw	x,sp
 487  0047 5c            	incw	x
 488  0048 cd0000        	call	c_rtol
 490  004b cd0000        	call	_CLK_GetClockFreq
 492  004e 96            	ldw	x,sp
 493  004f 5c            	incw	x
 494  0050 cd0000        	call	c_ludv
 496  0053 96            	ldw	x,sp
 497  0054 1c000b        	addw	x,#OFST-3
 498  0057 cd0000        	call	c_rtol
 500                     ; 117     BaudRate_Mantissa100 = (((uint32_t)CLK_GetClockFreq() * 100) / (BaudRate << 4));
 502  005a 96            	ldw	x,sp
 503  005b cd0116        	call	LC001
 505  005e 96            	ldw	x,sp
 506  005f 5c            	incw	x
 507  0060 cd0000        	call	c_rtol
 509  0063 cd0000        	call	_CLK_GetClockFreq
 511  0066 a664          	ld	a,#100
 512  0068 cd0000        	call	c_smul
 514  006b 96            	ldw	x,sp
 515  006c 5c            	incw	x
 516  006d cd0000        	call	c_ludv
 518  0070 96            	ldw	x,sp
 519  0071 1c0007        	addw	x,#OFST-7
 520  0074 cd0000        	call	c_rtol
 522                     ; 121     BRR2_1 = (uint8_t)((uint8_t)(((BaudRate_Mantissa100 - (BaudRate_Mantissa * 100))
 522                     ; 122                         << 4) / 100) & (uint8_t)0x0F); 
 524  0077 96            	ldw	x,sp
 525  0078 1c000b        	addw	x,#OFST-3
 526  007b cd0000        	call	c_ltor
 528  007e a664          	ld	a,#100
 529  0080 cd0000        	call	c_smul
 531  0083 96            	ldw	x,sp
 532  0084 5c            	incw	x
 533  0085 cd0000        	call	c_rtol
 535  0088 96            	ldw	x,sp
 536  0089 1c0007        	addw	x,#OFST-7
 537  008c cd0000        	call	c_ltor
 539  008f 96            	ldw	x,sp
 540  0090 5c            	incw	x
 541  0091 cd0000        	call	c_lsub
 543  0094 a604          	ld	a,#4
 544  0096 cd0000        	call	c_llsh
 546  0099 ae0000        	ldw	x,#L41
 547  009c cd0000        	call	c_ludv
 549  009f b603          	ld	a,c_lreg+3
 550  00a1 a40f          	and	a,#15
 551  00a3 6b05          	ld	(OFST-9,sp),a
 552                     ; 123     BRR2_2 = (uint8_t)((BaudRate_Mantissa >> 4) & (uint8_t)0xF0);
 554  00a5 96            	ldw	x,sp
 555  00a6 1c000b        	addw	x,#OFST-3
 556  00a9 cd0000        	call	c_ltor
 558  00ac a604          	ld	a,#4
 559  00ae cd0000        	call	c_lursh
 561  00b1 b603          	ld	a,c_lreg+3
 562  00b3 a4f0          	and	a,#240
 563  00b5 b703          	ld	c_lreg+3,a
 564  00b7 3f02          	clr	c_lreg+2
 565  00b9 3f01          	clr	c_lreg+1
 566  00bb 3f00          	clr	c_lreg
 567  00bd 6b06          	ld	(OFST-8,sp),a
 568                     ; 125     UART2->BRR2 = (uint8_t)(BRR2_1 | BRR2_2);
 570  00bf 1a05          	or	a,(OFST-9,sp)
 571  00c1 c75243        	ld	21059,a
 572                     ; 127     UART2->BRR1 = (uint8_t)BaudRate_Mantissa;           
 574  00c4 7b0e          	ld	a,(OFST+0,sp)
 575  00c6 c75242        	ld	21058,a
 576                     ; 130     UART2->CR2 &= (uint8_t)~(UART2_CR2_TEN | UART2_CR2_REN);
 578  00c9 c65245        	ld	a,21061
 579  00cc a4f3          	and	a,#243
 580  00ce c75245        	ld	21061,a
 581                     ; 132     UART2->CR3 &= (uint8_t)~(UART2_CR3_CPOL | UART2_CR3_CPHA | UART2_CR3_LBCL);
 583  00d1 c65246        	ld	a,21062
 584  00d4 a4f8          	and	a,#248
 585  00d6 c75246        	ld	21062,a
 586                     ; 134     UART2->CR3 |= (uint8_t)((uint8_t)SyncMode & (uint8_t)(UART2_CR3_CPOL | \
 586                     ; 135                                               UART2_CR3_CPHA | UART2_CR3_LBCL));
 588  00d9 7b18          	ld	a,(OFST+10,sp)
 589  00db a407          	and	a,#7
 590  00dd ca5246        	or	a,21062
 591  00e0 c75246        	ld	21062,a
 592                     ; 137     if ((uint8_t)(Mode & UART2_MODE_TX_ENABLE))
 594  00e3 7b19          	ld	a,(OFST+11,sp)
 595  00e5 a504          	bcp	a,#4
 596  00e7 2706          	jreq	L302
 597                     ; 140         UART2->CR2 |= (uint8_t)UART2_CR2_TEN;
 599  00e9 72165245      	bset	21061,#3
 601  00ed 2004          	jra	L502
 602  00ef               L302:
 603                     ; 145         UART2->CR2 &= (uint8_t)(~UART2_CR2_TEN);
 605  00ef 72175245      	bres	21061,#3
 606  00f3               L502:
 607                     ; 147     if ((uint8_t)(Mode & UART2_MODE_RX_ENABLE))
 609  00f3 a508          	bcp	a,#8
 610  00f5 2706          	jreq	L702
 611                     ; 150         UART2->CR2 |= (uint8_t)UART2_CR2_REN;
 613  00f7 72145245      	bset	21061,#2
 615  00fb 2004          	jra	L112
 616  00fd               L702:
 617                     ; 155         UART2->CR2 &= (uint8_t)(~UART2_CR2_REN);
 619  00fd 72155245      	bres	21061,#2
 620  0101               L112:
 621                     ; 159     if ((uint8_t)(SyncMode & UART2_SYNCMODE_CLOCK_DISABLE))
 623  0101 7b18          	ld	a,(OFST+10,sp)
 624  0103 2a06          	jrpl	L312
 625                     ; 162         UART2->CR3 &= (uint8_t)(~UART2_CR3_CKEN); 
 627  0105 72175246      	bres	21062,#3
 629  0109 2008          	jra	L512
 630  010b               L312:
 631                     ; 166         UART2->CR3 |= (uint8_t)((uint8_t)SyncMode & UART2_CR3_CKEN);
 633  010b a408          	and	a,#8
 634  010d ca5246        	or	a,21062
 635  0110 c75246        	ld	21062,a
 636  0113               L512:
 637                     ; 168 }
 640  0113 5b0e          	addw	sp,#14
 641  0115 81            	ret	
 642  0116               LC001:
 643  0116 1c0011        	addw	x,#OFST+3
 644  0119 cd0000        	call	c_ltor
 646  011c a604          	ld	a,#4
 647  011e cc0000        	jp	c_llsh
 702                     ; 176 void UART2_Cmd(FunctionalState NewState)
 702                     ; 177 {
 703                     .text:	section	.text,new
 704  0000               _UART2_Cmd:
 708                     ; 179     if (NewState != DISABLE)
 710  0000 4d            	tnz	a
 711  0001 2705          	jreq	L542
 712                     ; 182         UART2->CR1 &= (uint8_t)(~UART2_CR1_UARTD);
 714  0003 721b5244      	bres	21060,#5
 717  0007 81            	ret	
 718  0008               L542:
 719                     ; 187         UART2->CR1 |= UART2_CR1_UARTD; 
 721  0008 721a5244      	bset	21060,#5
 722                     ; 189 }
 725  000c 81            	ret	
 857                     ; 206 void UART2_ITConfig(UART2_IT_TypeDef UART2_IT, FunctionalState NewState)
 857                     ; 207 {
 858                     .text:	section	.text,new
 859  0000               _UART2_ITConfig:
 861  0000 89            	pushw	x
 862  0001 89            	pushw	x
 863       00000002      OFST:	set	2
 866                     ; 208     uint8_t uartreg = 0, itpos = 0x00;
 870                     ; 211     assert_param(IS_UART2_CONFIG_IT_OK(UART2_IT));
 872                     ; 212     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 874                     ; 215     uartreg = (uint8_t)((uint16_t)UART2_IT >> 0x08);
 876  0002 9e            	ld	a,xh
 877  0003 6b01          	ld	(OFST-1,sp),a
 878                     ; 218     itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART2_IT & (uint8_t)0x0F));
 880  0005 9f            	ld	a,xl
 881  0006 a40f          	and	a,#15
 882  0008 5f            	clrw	x
 883  0009 97            	ld	xl,a
 884  000a a601          	ld	a,#1
 885  000c 5d            	tnzw	x
 886  000d 2704          	jreq	L22
 887  000f               L42:
 888  000f 48            	sll	a
 889  0010 5a            	decw	x
 890  0011 26fc          	jrne	L42
 891  0013               L22:
 892  0013 6b02          	ld	(OFST+0,sp),a
 893                     ; 220     if (NewState != DISABLE)
 895  0015 7b07          	ld	a,(OFST+5,sp)
 896  0017 272a          	jreq	L133
 897                     ; 223         if (uartreg == 0x01)
 899  0019 7b01          	ld	a,(OFST-1,sp)
 900  001b a101          	cp	a,#1
 901  001d 2607          	jrne	L333
 902                     ; 225             UART2->CR1 |= itpos;
 904  001f c65244        	ld	a,21060
 905  0022 1a02          	or	a,(OFST+0,sp)
 907  0024 2029          	jp	LC004
 908  0026               L333:
 909                     ; 227         else if (uartreg == 0x02)
 911  0026 a102          	cp	a,#2
 912  0028 2607          	jrne	L733
 913                     ; 229             UART2->CR2 |= itpos;
 915  002a c65245        	ld	a,21061
 916  002d 1a02          	or	a,(OFST+0,sp)
 918  002f 202d          	jp	LC003
 919  0031               L733:
 920                     ; 231         else if (uartreg == 0x03)
 922  0031 a103          	cp	a,#3
 923  0033 2607          	jrne	L343
 924                     ; 233             UART2->CR4 |= itpos;
 926  0035 c65247        	ld	a,21063
 927  0038 1a02          	or	a,(OFST+0,sp)
 929  003a 2031          	jp	LC005
 930  003c               L343:
 931                     ; 237             UART2->CR6 |= itpos;
 933  003c c65249        	ld	a,21065
 934  003f 1a02          	or	a,(OFST+0,sp)
 935  0041 2035          	jp	LC002
 936  0043               L133:
 937                     ; 243         if (uartreg == 0x01)
 939  0043 7b01          	ld	a,(OFST-1,sp)
 940  0045 a101          	cp	a,#1
 941  0047 260b          	jrne	L153
 942                     ; 245             UART2->CR1 &= (uint8_t)(~itpos);
 944  0049 7b02          	ld	a,(OFST+0,sp)
 945  004b 43            	cpl	a
 946  004c c45244        	and	a,21060
 947  004f               LC004:
 948  004f c75244        	ld	21060,a
 950  0052 2027          	jra	L743
 951  0054               L153:
 952                     ; 247         else if (uartreg == 0x02)
 954  0054 a102          	cp	a,#2
 955  0056 260b          	jrne	L553
 956                     ; 249             UART2->CR2 &= (uint8_t)(~itpos);
 958  0058 7b02          	ld	a,(OFST+0,sp)
 959  005a 43            	cpl	a
 960  005b c45245        	and	a,21061
 961  005e               LC003:
 962  005e c75245        	ld	21061,a
 964  0061 2018          	jra	L743
 965  0063               L553:
 966                     ; 251         else if (uartreg == 0x03)
 968  0063 a103          	cp	a,#3
 969  0065 260b          	jrne	L163
 970                     ; 253             UART2->CR4 &= (uint8_t)(~itpos);
 972  0067 7b02          	ld	a,(OFST+0,sp)
 973  0069 43            	cpl	a
 974  006a c45247        	and	a,21063
 975  006d               LC005:
 976  006d c75247        	ld	21063,a
 978  0070 2009          	jra	L743
 979  0072               L163:
 980                     ; 257             UART2->CR6 &= (uint8_t)(~itpos);
 982  0072 7b02          	ld	a,(OFST+0,sp)
 983  0074 43            	cpl	a
 984  0075 c45249        	and	a,21065
 985  0078               LC002:
 986  0078 c75249        	ld	21065,a
 987  007b               L743:
 988                     ; 260 }
 991  007b 5b04          	addw	sp,#4
 992  007d 81            	ret	
1049                     ; 267 void UART2_IrDAConfig(UART2_IrDAMode_TypeDef UART2_IrDAMode)
1049                     ; 268 {
1050                     .text:	section	.text,new
1051  0000               _UART2_IrDAConfig:
1055                     ; 269     assert_param(IS_UART2_IRDAMODE_OK(UART2_IrDAMode));
1057                     ; 271     if (UART2_IrDAMode != UART2_IRDAMODE_NORMAL)
1059  0000 4d            	tnz	a
1060  0001 2705          	jreq	L314
1061                     ; 273         UART2->CR5 |= UART2_CR5_IRLP;
1063  0003 72145248      	bset	21064,#2
1066  0007 81            	ret	
1067  0008               L314:
1068                     ; 277         UART2->CR5 &= ((uint8_t)~UART2_CR5_IRLP);
1070  0008 72155248      	bres	21064,#2
1071                     ; 279 }
1074  000c 81            	ret	
1109                     ; 287 void UART2_IrDACmd(FunctionalState NewState)
1109                     ; 288 {
1110                     .text:	section	.text,new
1111  0000               _UART2_IrDACmd:
1115                     ; 290     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1117                     ; 292     if (NewState != DISABLE)
1119  0000 4d            	tnz	a
1120  0001 2705          	jreq	L534
1121                     ; 295         UART2->CR5 |= UART2_CR5_IREN;
1123  0003 72125248      	bset	21064,#1
1126  0007 81            	ret	
1127  0008               L534:
1128                     ; 300         UART2->CR5 &= ((uint8_t)~UART2_CR5_IREN);
1130  0008 72135248      	bres	21064,#1
1131                     ; 302 }
1134  000c 81            	ret	
1193                     ; 311 void UART2_LINBreakDetectionConfig(UART2_LINBreakDetectionLength_TypeDef UART2_LINBreakDetectionLength)
1193                     ; 312 {
1194                     .text:	section	.text,new
1195  0000               _UART2_LINBreakDetectionConfig:
1199                     ; 314     assert_param(IS_UART2_LINBREAKDETECTIONLENGTH_OK(UART2_LINBreakDetectionLength));
1201                     ; 316     if (UART2_LINBreakDetectionLength != UART2_LINBREAKDETECTIONLENGTH_10BITS)
1203  0000 4d            	tnz	a
1204  0001 2705          	jreq	L764
1205                     ; 318         UART2->CR4 |= UART2_CR4_LBDL;
1207  0003 721a5247      	bset	21063,#5
1210  0007 81            	ret	
1211  0008               L764:
1212                     ; 322         UART2->CR4 &= ((uint8_t)~UART2_CR4_LBDL);
1214  0008 721b5247      	bres	21063,#5
1215                     ; 324 }
1218  000c 81            	ret	
1339                     ; 336 void UART2_LINConfig(UART2_LinMode_TypeDef UART2_Mode, 
1339                     ; 337                      UART2_LinAutosync_TypeDef UART2_Autosync, 
1339                     ; 338                      UART2_LinDivUp_TypeDef UART2_DivUp)
1339                     ; 339 {
1340                     .text:	section	.text,new
1341  0000               _UART2_LINConfig:
1343  0000 89            	pushw	x
1344       00000000      OFST:	set	0
1347                     ; 341     assert_param(IS_UART2_SLAVE_OK(UART2_Mode));
1349                     ; 342     assert_param(IS_UART2_AUTOSYNC_OK(UART2_Autosync));
1351                     ; 343     assert_param(IS_UART2_DIVUP_OK(UART2_DivUp));
1353                     ; 345     if (UART2_Mode != UART2_LIN_MODE_MASTER)
1355  0001 9e            	ld	a,xh
1356  0002 4d            	tnz	a
1357  0003 2706          	jreq	L155
1358                     ; 347         UART2->CR6 |=  UART2_CR6_LSLV;
1360  0005 721a5249      	bset	21065,#5
1362  0009 2004          	jra	L355
1363  000b               L155:
1364                     ; 351         UART2->CR6 &= ((uint8_t)~UART2_CR6_LSLV);
1366  000b 721b5249      	bres	21065,#5
1367  000f               L355:
1368                     ; 354     if (UART2_Autosync != UART2_LIN_AUTOSYNC_DISABLE)
1370  000f 7b02          	ld	a,(OFST+2,sp)
1371  0011 2706          	jreq	L555
1372                     ; 356         UART2->CR6 |=  UART2_CR6_LASE ;
1374  0013 72185249      	bset	21065,#4
1376  0017 2004          	jra	L755
1377  0019               L555:
1378                     ; 360         UART2->CR6 &= ((uint8_t)~ UART2_CR6_LASE );
1380  0019 72195249      	bres	21065,#4
1381  001d               L755:
1382                     ; 363     if (UART2_DivUp != UART2_LIN_DIVUP_LBRR1)
1384  001d 7b05          	ld	a,(OFST+5,sp)
1385  001f 2706          	jreq	L165
1386                     ; 365         UART2->CR6 |=  UART2_CR6_LDUM;
1388  0021 721e5249      	bset	21065,#7
1390  0025 2004          	jra	L365
1391  0027               L165:
1392                     ; 369         UART2->CR6 &= ((uint8_t)~ UART2_CR6_LDUM);
1394  0027 721f5249      	bres	21065,#7
1395  002b               L365:
1396                     ; 371 }
1399  002b 85            	popw	x
1400  002c 81            	ret	
1435                     ; 379 void UART2_LINCmd(FunctionalState NewState)
1435                     ; 380 {
1436                     .text:	section	.text,new
1437  0000               _UART2_LINCmd:
1441                     ; 381     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1443                     ; 383     if (NewState != DISABLE)
1445  0000 4d            	tnz	a
1446  0001 2705          	jreq	L306
1447                     ; 386         UART2->CR3 |= UART2_CR3_LINEN;
1449  0003 721c5246      	bset	21062,#6
1452  0007 81            	ret	
1453  0008               L306:
1454                     ; 391         UART2->CR3 &= ((uint8_t)~UART2_CR3_LINEN);
1456  0008 721d5246      	bres	21062,#6
1457                     ; 393 }
1460  000c 81            	ret	
1495                     ; 400 void UART2_SmartCardCmd(FunctionalState NewState)
1495                     ; 401 {
1496                     .text:	section	.text,new
1497  0000               _UART2_SmartCardCmd:
1501                     ; 403     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1503                     ; 405     if (NewState != DISABLE)
1505  0000 4d            	tnz	a
1506  0001 2705          	jreq	L526
1507                     ; 408         UART2->CR5 |= UART2_CR5_SCEN;
1509  0003 721a5248      	bset	21064,#5
1512  0007 81            	ret	
1513  0008               L526:
1514                     ; 413         UART2->CR5 &= ((uint8_t)(~UART2_CR5_SCEN));
1516  0008 721b5248      	bres	21064,#5
1517                     ; 415 }
1520  000c 81            	ret	
1556                     ; 423 void UART2_SmartCardNACKCmd(FunctionalState NewState)
1556                     ; 424 {
1557                     .text:	section	.text,new
1558  0000               _UART2_SmartCardNACKCmd:
1562                     ; 426     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1564                     ; 428     if (NewState != DISABLE)
1566  0000 4d            	tnz	a
1567  0001 2705          	jreq	L746
1568                     ; 431         UART2->CR5 |= UART2_CR5_NACK;
1570  0003 72185248      	bset	21064,#4
1573  0007 81            	ret	
1574  0008               L746:
1575                     ; 436         UART2->CR5 &= ((uint8_t)~(UART2_CR5_NACK));
1577  0008 72195248      	bres	21064,#4
1578                     ; 438 }
1581  000c 81            	ret	
1638                     ; 446 void UART2_WakeUpConfig(UART2_WakeUp_TypeDef UART2_WakeUp)
1638                     ; 447 {
1639                     .text:	section	.text,new
1640  0000               _UART2_WakeUpConfig:
1644                     ; 448     assert_param(IS_UART2_WAKEUP_OK(UART2_WakeUp));
1646                     ; 450     UART2->CR1 &= ((uint8_t)~UART2_CR1_WAKE);
1648  0000 72175244      	bres	21060,#3
1649                     ; 451     UART2->CR1 |= (uint8_t)UART2_WakeUp;
1651  0004 ca5244        	or	a,21060
1652  0007 c75244        	ld	21060,a
1653                     ; 452 }
1656  000a 81            	ret	
1692                     ; 460 void UART2_ReceiverWakeUpCmd(FunctionalState NewState)
1692                     ; 461 {
1693                     .text:	section	.text,new
1694  0000               _UART2_ReceiverWakeUpCmd:
1698                     ; 462     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1700                     ; 464     if (NewState != DISABLE)
1702  0000 4d            	tnz	a
1703  0001 2705          	jreq	L717
1704                     ; 467         UART2->CR2 |= UART2_CR2_RWU;
1706  0003 72125245      	bset	21061,#1
1709  0007 81            	ret	
1710  0008               L717:
1711                     ; 472         UART2->CR2 &= ((uint8_t)~UART2_CR2_RWU);
1713  0008 72135245      	bres	21061,#1
1714                     ; 474 }
1717  000c 81            	ret	
1740                     ; 481 uint8_t UART2_ReceiveData8(void)
1740                     ; 482 {
1741                     .text:	section	.text,new
1742  0000               _UART2_ReceiveData8:
1746                     ; 483     return ((uint8_t)UART2->DR);
1748  0000 c65241        	ld	a,21057
1751  0003 81            	ret	
1785                     ; 491 uint16_t UART2_ReceiveData9(void)
1785                     ; 492 {
1786                     .text:	section	.text,new
1787  0000               _UART2_ReceiveData9:
1789  0000 89            	pushw	x
1790       00000002      OFST:	set	2
1793                     ; 493   uint16_t temp = 0;
1795                     ; 495   temp = ((uint16_t)(((uint16_t)((uint16_t)UART2->CR1 & (uint16_t)UART2_CR1_R8)) << 1));
1797  0001 c65244        	ld	a,21060
1798  0004 a480          	and	a,#128
1799  0006 5f            	clrw	x
1800  0007 02            	rlwa	x,a
1801  0008 58            	sllw	x
1802  0009 1f01          	ldw	(OFST-1,sp),x
1803                     ; 497   return (uint16_t)((((uint16_t)UART2->DR) | temp) & ((uint16_t)0x01FF));
1805  000b 5f            	clrw	x
1806  000c c65241        	ld	a,21057
1807  000f 97            	ld	xl,a
1808  0010 01            	rrwa	x,a
1809  0011 1a02          	or	a,(OFST+0,sp)
1810  0013 01            	rrwa	x,a
1811  0014 1a01          	or	a,(OFST-1,sp)
1812  0016 a401          	and	a,#1
1813  0018 01            	rrwa	x,a
1816  0019 5b02          	addw	sp,#2
1817  001b 81            	ret	
1851                     ; 505 void UART2_SendData8(uint8_t Data)
1851                     ; 506 {
1852                     .text:	section	.text,new
1853  0000               _UART2_SendData8:
1857                     ; 508     UART2->DR = Data;
1859  0000 c75241        	ld	21057,a
1860                     ; 509 }
1863  0003 81            	ret	
1897                     ; 516 void UART2_SendData9(uint16_t Data)
1897                     ; 517 {
1898                     .text:	section	.text,new
1899  0000               _UART2_SendData9:
1901  0000 89            	pushw	x
1902       00000000      OFST:	set	0
1905                     ; 519     UART2->CR1 &= ((uint8_t)~UART2_CR1_T8);                  
1907  0001 721d5244      	bres	21060,#6
1908                     ; 522     UART2->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & UART2_CR1_T8); 
1910  0005 54            	srlw	x
1911  0006 54            	srlw	x
1912  0007 9f            	ld	a,xl
1913  0008 a440          	and	a,#64
1914  000a ca5244        	or	a,21060
1915  000d c75244        	ld	21060,a
1916                     ; 525     UART2->DR   = (uint8_t)(Data);                    
1918  0010 7b02          	ld	a,(OFST+2,sp)
1919  0012 c75241        	ld	21057,a
1920                     ; 527 }
1923  0015 85            	popw	x
1924  0016 81            	ret	
1947                     ; 534 void UART2_SendBreak(void)
1947                     ; 535 {
1948                     .text:	section	.text,new
1949  0000               _UART2_SendBreak:
1953                     ; 536     UART2->CR2 |= UART2_CR2_SBK;
1955  0000 72105245      	bset	21061,#0
1956                     ; 537 }
1959  0004 81            	ret	
1993                     ; 544 void UART2_SetAddress(uint8_t UART2_Address)
1993                     ; 545 {
1994                     .text:	section	.text,new
1995  0000               _UART2_SetAddress:
1997  0000 88            	push	a
1998       00000000      OFST:	set	0
2001                     ; 547     assert_param(IS_UART2_ADDRESS_OK(UART2_Address));
2003                     ; 550     UART2->CR4 &= ((uint8_t)~UART2_CR4_ADD);
2005  0001 c65247        	ld	a,21063
2006  0004 a4f0          	and	a,#240
2007  0006 c75247        	ld	21063,a
2008                     ; 552     UART2->CR4 |= UART2_Address;
2010  0009 c65247        	ld	a,21063
2011  000c 1a01          	or	a,(OFST+1,sp)
2012  000e c75247        	ld	21063,a
2013                     ; 553 }
2016  0011 84            	pop	a
2017  0012 81            	ret	
2051                     ; 561 void UART2_SetGuardTime(uint8_t UART2_GuardTime)
2051                     ; 562 {
2052                     .text:	section	.text,new
2053  0000               _UART2_SetGuardTime:
2057                     ; 564     UART2->GTR = UART2_GuardTime;
2059  0000 c7524a        	ld	21066,a
2060                     ; 565 }
2063  0003 81            	ret	
2097                     ; 589 void UART2_SetPrescaler(uint8_t UART2_Prescaler)
2097                     ; 590 {
2098                     .text:	section	.text,new
2099  0000               _UART2_SetPrescaler:
2103                     ; 592     UART2->PSCR = UART2_Prescaler;
2105  0000 c7524b        	ld	21067,a
2106                     ; 593 }
2109  0003 81            	ret	
2266                     ; 601 FlagStatus UART2_GetFlagStatus(UART2_Flag_TypeDef UART2_FLAG)
2266                     ; 602 {
2267                     .text:	section	.text,new
2268  0000               _UART2_GetFlagStatus:
2270  0000 89            	pushw	x
2271  0001 88            	push	a
2272       00000001      OFST:	set	1
2275                     ; 603     FlagStatus status = RESET;
2277                     ; 606     assert_param(IS_UART2_FLAG_OK(UART2_FLAG));
2279                     ; 609     if (UART2_FLAG == UART2_FLAG_LBDF)
2281  0002 a30210        	cpw	x,#528
2282  0005 2608          	jrne	L5511
2283                     ; 611         if ((UART2->CR4 & (uint8_t)UART2_FLAG) != (uint8_t)0x00)
2285  0007 9f            	ld	a,xl
2286  0008 c45247        	and	a,21063
2287  000b 2728          	jreq	L3611
2288                     ; 614             status = SET;
2290  000d 2021          	jp	LC008
2291                     ; 619             status = RESET;
2292  000f               L5511:
2293                     ; 622     else if (UART2_FLAG == UART2_FLAG_SBK)
2295  000f 1e02          	ldw	x,(OFST+1,sp)
2296  0011 a30101        	cpw	x,#257
2297  0014 2609          	jrne	L5611
2298                     ; 624         if ((UART2->CR2 & (uint8_t)UART2_FLAG) != (uint8_t)0x00)
2300  0016 c65245        	ld	a,21061
2301  0019 1503          	bcp	a,(OFST+2,sp)
2302  001b 2717          	jreq	L1021
2303                     ; 627             status = SET;
2305  001d 2011          	jp	LC008
2306                     ; 632             status = RESET;
2307  001f               L5611:
2308                     ; 635     else if ((UART2_FLAG == UART2_FLAG_LHDF) || (UART2_FLAG == UART2_FLAG_LSF))
2310  001f a30302        	cpw	x,#770
2311  0022 2705          	jreq	L7711
2313  0024 a30301        	cpw	x,#769
2314  0027 260f          	jrne	L5711
2315  0029               L7711:
2316                     ; 637         if ((UART2->CR6 & (uint8_t)UART2_FLAG) != (uint8_t)0x00)
2318  0029 c65249        	ld	a,21065
2319  002c 1503          	bcp	a,(OFST+2,sp)
2320  002e 2704          	jreq	L1021
2321                     ; 640             status = SET;
2323  0030               LC008:
2327  0030 a601          	ld	a,#1
2330  0032 2001          	jra	L3611
2331  0034               L1021:
2332                     ; 645             status = RESET;
2336  0034 4f            	clr	a
2337  0035               L3611:
2338                     ; 663     return  status;
2342  0035 5b03          	addw	sp,#3
2343  0037 81            	ret	
2344  0038               L5711:
2345                     ; 650         if ((UART2->SR & (uint8_t)UART2_FLAG) != (uint8_t)0x00)
2347  0038 c65240        	ld	a,21056
2348  003b 1503          	bcp	a,(OFST+2,sp)
2349  003d 27f5          	jreq	L1021
2350                     ; 653             status = SET;
2352  003f 20ef          	jp	LC008
2353                     ; 658             status = RESET;
2388                     ; 693 void UART2_ClearFlag(UART2_Flag_TypeDef UART2_FLAG)
2388                     ; 694 {
2389                     .text:	section	.text,new
2390  0000               _UART2_ClearFlag:
2392  0000 89            	pushw	x
2393       00000000      OFST:	set	0
2396                     ; 695     assert_param(IS_UART2_CLEAR_FLAG_OK(UART2_FLAG));
2398                     ; 698     if (UART2_FLAG == UART2_FLAG_RXNE)
2400  0001 a30020        	cpw	x,#32
2401  0004 2606          	jrne	L1321
2402                     ; 700         UART2->SR = (uint8_t)~(UART2_SR_RXNE);
2404  0006 35df5240      	mov	21056,#223
2406  000a 201c          	jra	L3321
2407  000c               L1321:
2408                     ; 703     else if (UART2_FLAG == UART2_FLAG_LBDF)
2410  000c 1e01          	ldw	x,(OFST+1,sp)
2411  000e a30210        	cpw	x,#528
2412  0011 2606          	jrne	L5321
2413                     ; 705         UART2->CR4 &= (uint8_t)(~UART2_CR4_LBDF);
2415  0013 72195247      	bres	21063,#4
2417  0017 200f          	jra	L3321
2418  0019               L5321:
2419                     ; 708     else if (UART2_FLAG == UART2_FLAG_LHDF)
2421  0019 a30302        	cpw	x,#770
2422  001c 2606          	jrne	L1421
2423                     ; 710         UART2->CR6 &= (uint8_t)(~UART2_CR6_LHDF);
2425  001e 72135249      	bres	21065,#1
2427  0022 2004          	jra	L3321
2428  0024               L1421:
2429                     ; 715         UART2->CR6 &= (uint8_t)(~UART2_CR6_LSF);
2431  0024 72115249      	bres	21065,#0
2432  0028               L3321:
2433                     ; 717 }
2436  0028 85            	popw	x
2437  0029 81            	ret	
2519                     ; 732 ITStatus UART2_GetITStatus(UART2_IT_TypeDef UART2_IT)
2519                     ; 733 {
2520                     .text:	section	.text,new
2521  0000               _UART2_GetITStatus:
2523  0000 89            	pushw	x
2524  0001 89            	pushw	x
2525       00000002      OFST:	set	2
2528                     ; 734     ITStatus pendingbitstatus = RESET;
2530                     ; 735     uint8_t itpos = 0;
2532                     ; 736     uint8_t itmask1 = 0;
2534                     ; 737     uint8_t itmask2 = 0;
2536                     ; 738     uint8_t enablestatus = 0;
2538                     ; 741     assert_param(IS_UART2_GET_IT_OK(UART2_IT));
2540                     ; 744     itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART2_IT & (uint8_t)0x0F));
2542  0002 9f            	ld	a,xl
2543  0003 a40f          	and	a,#15
2544  0005 5f            	clrw	x
2545  0006 97            	ld	xl,a
2546  0007 a601          	ld	a,#1
2547  0009 5d            	tnzw	x
2548  000a 2704          	jreq	L67
2549  000c               L001:
2550  000c 48            	sll	a
2551  000d 5a            	decw	x
2552  000e 26fc          	jrne	L001
2553  0010               L67:
2554  0010 6b01          	ld	(OFST-1,sp),a
2555                     ; 746     itmask1 = (uint8_t)((uint8_t)UART2_IT >> (uint8_t)4);
2557  0012 7b04          	ld	a,(OFST+2,sp)
2558  0014 4e            	swap	a
2559  0015 a40f          	and	a,#15
2560  0017 6b02          	ld	(OFST+0,sp),a
2561                     ; 748     itmask2 = (uint8_t)((uint8_t)1 << itmask1);
2563  0019 5f            	clrw	x
2564  001a 97            	ld	xl,a
2565  001b a601          	ld	a,#1
2566  001d 5d            	tnzw	x
2567  001e 2704          	jreq	L201
2568  0020               L401:
2569  0020 48            	sll	a
2570  0021 5a            	decw	x
2571  0022 26fc          	jrne	L401
2572  0024               L201:
2573  0024 6b02          	ld	(OFST+0,sp),a
2574                     ; 751     if (UART2_IT == UART2_IT_PE)
2576  0026 1e03          	ldw	x,(OFST+1,sp)
2577  0028 a30100        	cpw	x,#256
2578  002b 260c          	jrne	L7031
2579                     ; 754         enablestatus = (uint8_t)((uint8_t)UART2->CR1 & itmask2);
2581  002d c65244        	ld	a,21060
2582  0030 1402          	and	a,(OFST+0,sp)
2583  0032 6b02          	ld	(OFST+0,sp),a
2584                     ; 757         if (((UART2->SR & itpos) != (uint8_t)0x00) && enablestatus)
2586  0034 c65240        	ld	a,21056
2588                     ; 760             pendingbitstatus = SET;
2590  0037 2020          	jp	LC011
2591                     ; 765             pendingbitstatus = RESET;
2592  0039               L7031:
2593                     ; 768     else if (UART2_IT == UART2_IT_LBDF)
2595  0039 a30346        	cpw	x,#838
2596  003c 260c          	jrne	L7131
2597                     ; 771         enablestatus = (uint8_t)((uint8_t)UART2->CR4 & itmask2);
2599  003e c65247        	ld	a,21063
2600  0041 1402          	and	a,(OFST+0,sp)
2601  0043 6b02          	ld	(OFST+0,sp),a
2602                     ; 773         if (((UART2->CR4 & itpos) != (uint8_t)0x00) && enablestatus)
2604  0045 c65247        	ld	a,21063
2606                     ; 776             pendingbitstatus = SET;
2608  0048 200f          	jp	LC011
2609                     ; 781             pendingbitstatus = RESET;
2610  004a               L7131:
2611                     ; 784     else if (UART2_IT == UART2_IT_LHDF)
2613  004a a30412        	cpw	x,#1042
2614  004d 2616          	jrne	L7231
2615                     ; 787         enablestatus = (uint8_t)((uint8_t)UART2->CR6 & itmask2);
2617  004f c65249        	ld	a,21065
2618  0052 1402          	and	a,(OFST+0,sp)
2619  0054 6b02          	ld	(OFST+0,sp),a
2620                     ; 789         if (((UART2->CR6 & itpos) != (uint8_t)0x00) && enablestatus)
2622  0056 c65249        	ld	a,21065
2624  0059               LC011:
2625  0059 1501          	bcp	a,(OFST-1,sp)
2626  005b 271a          	jreq	L7331
2627  005d 7b02          	ld	a,(OFST+0,sp)
2628  005f 2716          	jreq	L7331
2629                     ; 792             pendingbitstatus = SET;
2631  0061               LC010:
2635  0061 a601          	ld	a,#1
2637  0063 2013          	jra	L5131
2638                     ; 797             pendingbitstatus = RESET;
2639  0065               L7231:
2640                     ; 803         enablestatus = (uint8_t)((uint8_t)UART2->CR2 & itmask2);
2642  0065 c65245        	ld	a,21061
2643  0068 1402          	and	a,(OFST+0,sp)
2644  006a 6b02          	ld	(OFST+0,sp),a
2645                     ; 805         if (((UART2->SR & itpos) != (uint8_t)0x00) && enablestatus)
2647  006c c65240        	ld	a,21056
2648  006f 1501          	bcp	a,(OFST-1,sp)
2649  0071 2704          	jreq	L7331
2651  0073 7b02          	ld	a,(OFST+0,sp)
2652                     ; 808             pendingbitstatus = SET;
2654  0075 26ea          	jrne	LC010
2655  0077               L7331:
2656                     ; 813             pendingbitstatus = RESET;
2661  0077 4f            	clr	a
2662  0078               L5131:
2663                     ; 817     return  pendingbitstatus;
2667  0078 5b04          	addw	sp,#4
2668  007a 81            	ret	
2704                     ; 846 void UART2_ClearITPendingBit(UART2_IT_TypeDef UART2_IT)
2704                     ; 847 {
2705                     .text:	section	.text,new
2706  0000               _UART2_ClearITPendingBit:
2708  0000 89            	pushw	x
2709       00000000      OFST:	set	0
2712                     ; 848     assert_param(IS_UART2_CLEAR_IT_OK(UART2_IT));
2714                     ; 851     if (UART2_IT == UART2_IT_RXNE)
2716  0001 a30255        	cpw	x,#597
2717  0004 2606          	jrne	L1631
2718                     ; 853         UART2->SR = (uint8_t)~(UART2_SR_RXNE);
2720  0006 35df5240      	mov	21056,#223
2722  000a 2011          	jra	L3631
2723  000c               L1631:
2724                     ; 856     else if (UART2_IT == UART2_IT_LBDF)
2726  000c 1e01          	ldw	x,(OFST+1,sp)
2727  000e a30346        	cpw	x,#838
2728  0011 2606          	jrne	L5631
2729                     ; 858         UART2->CR4 &= (uint8_t)~(UART2_CR4_LBDF);
2731  0013 72195247      	bres	21063,#4
2733  0017 2004          	jra	L3631
2734  0019               L5631:
2735                     ; 863         UART2->CR6 &= (uint8_t)(~UART2_CR6_LHDF);
2737  0019 72135249      	bres	21065,#1
2738  001d               L3631:
2739                     ; 865 }
2742  001d 85            	popw	x
2743  001e 81            	ret	
2756                     	xdef	_UART2_ClearITPendingBit
2757                     	xdef	_UART2_GetITStatus
2758                     	xdef	_UART2_ClearFlag
2759                     	xdef	_UART2_GetFlagStatus
2760                     	xdef	_UART2_SetPrescaler
2761                     	xdef	_UART2_SetGuardTime
2762                     	xdef	_UART2_SetAddress
2763                     	xdef	_UART2_SendBreak
2764                     	xdef	_UART2_SendData9
2765                     	xdef	_UART2_SendData8
2766                     	xdef	_UART2_ReceiveData9
2767                     	xdef	_UART2_ReceiveData8
2768                     	xdef	_UART2_ReceiverWakeUpCmd
2769                     	xdef	_UART2_WakeUpConfig
2770                     	xdef	_UART2_SmartCardNACKCmd
2771                     	xdef	_UART2_SmartCardCmd
2772                     	xdef	_UART2_LINCmd
2773                     	xdef	_UART2_LINConfig
2774                     	xdef	_UART2_LINBreakDetectionConfig
2775                     	xdef	_UART2_IrDACmd
2776                     	xdef	_UART2_IrDAConfig
2777                     	xdef	_UART2_ITConfig
2778                     	xdef	_UART2_Cmd
2779                     	xdef	_UART2_Init
2780                     	xdef	_UART2_DeInit
2781                     	xref	_CLK_GetClockFreq
2782                     	xref.b	c_lreg
2783                     	xref.b	c_x
2802                     	xref	c_lursh
2803                     	xref	c_lsub
2804                     	xref	c_smul
2805                     	xref	c_ludv
2806                     	xref	c_rtol
2807                     	xref	c_llsh
2808                     	xref	c_ltor
2809                     	end
