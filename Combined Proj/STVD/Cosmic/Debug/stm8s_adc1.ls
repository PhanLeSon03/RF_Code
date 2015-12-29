   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
   4                     ; Optimizer V4.3.6 - 29 Nov 2011
  48                     ; 48 void ADC1_DeInit(void)
  48                     ; 49 {
  50                     .text:	section	.text,new
  51  0000               _ADC1_DeInit:
  55                     ; 50     ADC1->CSR  = ADC1_CSR_RESET_VALUE;
  57  0000 725f5400      	clr	21504
  58                     ; 51     ADC1->CR1  = ADC1_CR1_RESET_VALUE;
  60  0004 725f5401      	clr	21505
  61                     ; 52     ADC1->CR2  = ADC1_CR2_RESET_VALUE;
  63  0008 725f5402      	clr	21506
  64                     ; 53     ADC1->CR3  = ADC1_CR3_RESET_VALUE;
  66  000c 725f5403      	clr	21507
  67                     ; 54     ADC1->TDRH = ADC1_TDRH_RESET_VALUE;
  69  0010 725f5406      	clr	21510
  70                     ; 55     ADC1->TDRL = ADC1_TDRL_RESET_VALUE;
  72  0014 725f5407      	clr	21511
  73                     ; 56     ADC1->HTRH = ADC1_HTRH_RESET_VALUE;
  75  0018 35ff5408      	mov	21512,#255
  76                     ; 57     ADC1->HTRL = ADC1_HTRL_RESET_VALUE;
  78  001c 35035409      	mov	21513,#3
  79                     ; 58     ADC1->LTRH = ADC1_LTRH_RESET_VALUE;
  81  0020 725f540a      	clr	21514
  82                     ; 59     ADC1->LTRL = ADC1_LTRL_RESET_VALUE;
  84  0024 725f540b      	clr	21515
  85                     ; 60     ADC1->AWCRH = ADC1_AWCRH_RESET_VALUE;
  87  0028 725f540e      	clr	21518
  88                     ; 61     ADC1->AWCRL = ADC1_AWCRL_RESET_VALUE;
  90  002c 725f540f      	clr	21519
  91                     ; 62 }
  94  0030 81            	ret	
 545                     ; 85 void ADC1_Init(ADC1_ConvMode_TypeDef ADC1_ConversionMode, ADC1_Channel_TypeDef ADC1_Channel, ADC1_PresSel_TypeDef ADC1_PrescalerSelection, ADC1_ExtTrig_TypeDef ADC1_ExtTrigger, FunctionalState ADC1_ExtTriggerState, ADC1_Align_TypeDef ADC1_Align, ADC1_SchmittTrigg_TypeDef ADC1_SchmittTriggerChannel, FunctionalState ADC1_SchmittTriggerState)
 545                     ; 86 {
 546                     .text:	section	.text,new
 547  0000               _ADC1_Init:
 549  0000 89            	pushw	x
 550       00000000      OFST:	set	0
 553                     ; 89     assert_param(IS_ADC1_CONVERSIONMODE_OK(ADC1_ConversionMode));
 555                     ; 90     assert_param(IS_ADC1_CHANNEL_OK(ADC1_Channel));
 557                     ; 91     assert_param(IS_ADC1_PRESSEL_OK(ADC1_PrescalerSelection));
 559                     ; 92     assert_param(IS_ADC1_EXTTRIG_OK(ADC1_ExtTrigger));
 561                     ; 93     assert_param(IS_FUNCTIONALSTATE_OK(((ADC1_ExtTriggerState))));
 563                     ; 94     assert_param(IS_ADC1_ALIGN_OK(ADC1_Align));
 565                     ; 95     assert_param(IS_ADC1_SCHMITTTRIG_OK(ADC1_SchmittTriggerChannel));
 567                     ; 96     assert_param(IS_FUNCTIONALSTATE_OK(ADC1_SchmittTriggerState));
 569                     ; 101     ADC1_ConversionConfig(ADC1_ConversionMode, ADC1_Channel, ADC1_Align);
 571  0001 7b08          	ld	a,(OFST+8,sp)
 572  0003 88            	push	a
 573  0004 7b02          	ld	a,(OFST+2,sp)
 574  0006 95            	ld	xh,a
 575  0007 cd0000        	call	_ADC1_ConversionConfig
 577  000a 84            	pop	a
 578                     ; 103     ADC1_PrescalerConfig(ADC1_PrescalerSelection);
 580  000b 7b05          	ld	a,(OFST+5,sp)
 581  000d cd0000        	call	_ADC1_PrescalerConfig
 583                     ; 108     ADC1_ExternalTriggerConfig(ADC1_ExtTrigger, ADC1_ExtTriggerState);
 585  0010 7b07          	ld	a,(OFST+7,sp)
 586  0012 97            	ld	xl,a
 587  0013 7b06          	ld	a,(OFST+6,sp)
 588  0015 95            	ld	xh,a
 589  0016 cd0000        	call	_ADC1_ExternalTriggerConfig
 591                     ; 113     ADC1_SchmittTriggerConfig(ADC1_SchmittTriggerChannel, ADC1_SchmittTriggerState);
 593  0019 7b0a          	ld	a,(OFST+10,sp)
 594  001b 97            	ld	xl,a
 595  001c 7b09          	ld	a,(OFST+9,sp)
 596  001e 95            	ld	xh,a
 597  001f cd0000        	call	_ADC1_SchmittTriggerConfig
 599                     ; 116     ADC1->CR1 |= ADC1_CR1_ADON;
 601  0022 72105401      	bset	21505,#0
 602                     ; 118 }
 605  0026 85            	popw	x
 606  0027 81            	ret	
 641                     ; 126 void ADC1_Cmd(FunctionalState NewState)
 641                     ; 127 {
 642                     .text:	section	.text,new
 643  0000               _ADC1_Cmd:
 647                     ; 130     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 649                     ; 132     if (NewState != DISABLE)
 651  0000 4d            	tnz	a
 652  0001 2705          	jreq	L362
 653                     ; 134         ADC1->CR1 |= ADC1_CR1_ADON;
 655  0003 72105401      	bset	21505,#0
 658  0007 81            	ret	
 659  0008               L362:
 660                     ; 138         ADC1->CR1 &= (uint8_t)(~ADC1_CR1_ADON);
 662  0008 72115401      	bres	21505,#0
 663                     ; 141 }
 666  000c 81            	ret	
 701                     ; 148 void ADC1_ScanModeCmd(FunctionalState NewState)
 701                     ; 149 {
 702                     .text:	section	.text,new
 703  0000               _ADC1_ScanModeCmd:
 707                     ; 152     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 709                     ; 154     if (NewState != DISABLE)
 711  0000 4d            	tnz	a
 712  0001 2705          	jreq	L503
 713                     ; 156         ADC1->CR2 |= ADC1_CR2_SCAN;
 715  0003 72125402      	bset	21506,#1
 718  0007 81            	ret	
 719  0008               L503:
 720                     ; 160         ADC1->CR2 &= (uint8_t)(~ADC1_CR2_SCAN);
 722  0008 72135402      	bres	21506,#1
 723                     ; 163 }
 726  000c 81            	ret	
 761                     ; 170 void ADC1_DataBufferCmd(FunctionalState NewState)
 761                     ; 171 {
 762                     .text:	section	.text,new
 763  0000               _ADC1_DataBufferCmd:
 767                     ; 174     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 769                     ; 176     if (NewState != DISABLE)
 771  0000 4d            	tnz	a
 772  0001 2705          	jreq	L723
 773                     ; 178         ADC1->CR3 |= ADC1_CR3_DBUF;
 775  0003 721e5403      	bset	21507,#7
 778  0007 81            	ret	
 779  0008               L723:
 780                     ; 182         ADC1->CR3 &= (uint8_t)(~ADC1_CR3_DBUF);
 782  0008 721f5403      	bres	21507,#7
 783                     ; 185 }
 786  000c 81            	ret	
 942                     ; 196 void ADC1_ITConfig(ADC1_IT_TypeDef ADC1_IT, FunctionalState NewState)
 942                     ; 197 {
 943                     .text:	section	.text,new
 944  0000               _ADC1_ITConfig:
 946  0000 89            	pushw	x
 947       00000000      OFST:	set	0
 950                     ; 200     assert_param(IS_ADC1_IT_OK(ADC1_IT));
 952                     ; 201     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 954                     ; 203     if (NewState != DISABLE)
 956  0001 7b05          	ld	a,(OFST+5,sp)
 957  0003 2706          	jreq	L714
 958                     ; 206         ADC1->CSR |= (uint8_t)ADC1_IT;
 960  0005 9f            	ld	a,xl
 961  0006 ca5400        	or	a,21504
 963  0009 2006          	jra	L124
 964  000b               L714:
 965                     ; 211         ADC1->CSR &= (uint8_t)((uint16_t)~(uint16_t)ADC1_IT);
 967  000b 7b02          	ld	a,(OFST+2,sp)
 968  000d 43            	cpl	a
 969  000e c45400        	and	a,21504
 970  0011               L124:
 971  0011 c75400        	ld	21504,a
 972                     ; 214 }
 975  0014 85            	popw	x
 976  0015 81            	ret	
1012                     ; 222 void ADC1_PrescalerConfig(ADC1_PresSel_TypeDef ADC1_Prescaler)
1012                     ; 223 {
1013                     .text:	section	.text,new
1014  0000               _ADC1_PrescalerConfig:
1016  0000 88            	push	a
1017       00000000      OFST:	set	0
1020                     ; 226     assert_param(IS_ADC1_PRESSEL_OK(ADC1_Prescaler));
1022                     ; 229     ADC1->CR1 &= (uint8_t)(~ADC1_CR1_SPSEL);
1024  0001 c65401        	ld	a,21505
1025  0004 a48f          	and	a,#143
1026  0006 c75401        	ld	21505,a
1027                     ; 231     ADC1->CR1 |= (uint8_t)(ADC1_Prescaler);
1029  0009 c65401        	ld	a,21505
1030  000c 1a01          	or	a,(OFST+1,sp)
1031  000e c75401        	ld	21505,a
1032                     ; 233 }
1035  0011 84            	pop	a
1036  0012 81            	ret	
1083                     ; 244 void ADC1_SchmittTriggerConfig(ADC1_SchmittTrigg_TypeDef ADC1_SchmittTriggerChannel, FunctionalState NewState)
1083                     ; 245 {
1084                     .text:	section	.text,new
1085  0000               _ADC1_SchmittTriggerConfig:
1087  0000 89            	pushw	x
1088       00000000      OFST:	set	0
1091                     ; 248     assert_param(IS_ADC1_SCHMITTTRIG_OK(ADC1_SchmittTriggerChannel));
1093                     ; 249     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1095                     ; 251     if (ADC1_SchmittTriggerChannel == ADC1_SCHMITTTRIG_ALL)
1097  0001 9e            	ld	a,xh
1098  0002 4c            	inc	a
1099  0003 261d          	jrne	L364
1100                     ; 253         if (NewState != DISABLE)
1102  0005 9f            	ld	a,xl
1103  0006 4d            	tnz	a
1104  0007 270a          	jreq	L564
1105                     ; 255             ADC1->TDRL &= (uint8_t)0x0;
1107  0009 725f5407      	clr	21511
1108                     ; 256             ADC1->TDRH &= (uint8_t)0x0;
1110  000d 725f5406      	clr	21510
1112  0011 2059          	jra	L174
1113  0013               L564:
1114                     ; 260             ADC1->TDRL |= (uint8_t)0xFF;
1116  0013 c65407        	ld	a,21511
1117  0016 aaff          	or	a,#255
1118  0018 c75407        	ld	21511,a
1119                     ; 261             ADC1->TDRH |= (uint8_t)0xFF;
1121  001b c65406        	ld	a,21510
1122  001e aaff          	or	a,#255
1123  0020 2047          	jp	LC001
1124  0022               L364:
1125                     ; 264     else if (ADC1_SchmittTriggerChannel < ADC1_SCHMITTTRIG_CHANNEL8)
1127  0022 7b01          	ld	a,(OFST+1,sp)
1128  0024 a108          	cp	a,#8
1129  0026 0d02          	tnz	(OFST+2,sp)
1130  0028 2420          	jruge	L374
1131                     ; 266         if (NewState != DISABLE)
1133  002a 2711          	jreq	L574
1134                     ; 268             ADC1->TDRL &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << (uint8_t)ADC1_SchmittTriggerChannel));
1136  002c ad40          	call	LC003
1137  002e 2704          	jreq	L43
1138  0030               L63:
1139  0030 48            	sll	a
1140  0031 5a            	decw	x
1141  0032 26fc          	jrne	L63
1142  0034               L43:
1143  0034 43            	cpl	a
1144  0035 c45407        	and	a,21511
1145  0038               LC002:
1146  0038 c75407        	ld	21511,a
1148  003b 202f          	jra	L174
1149  003d               L574:
1150                     ; 272             ADC1->TDRL |= (uint8_t)((uint8_t)0x01 << (uint8_t)ADC1_SchmittTriggerChannel);
1152  003d ad2f          	call	LC003
1153  003f 2704          	jreq	L04
1154  0041               L24:
1155  0041 48            	sll	a
1156  0042 5a            	decw	x
1157  0043 26fc          	jrne	L24
1158  0045               L04:
1159  0045 ca5407        	or	a,21511
1160  0048 20ee          	jp	LC002
1161  004a               L374:
1162                     ; 277         if (NewState != DISABLE)
1164  004a 2710          	jreq	L305
1165                     ; 279             ADC1->TDRH &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << ((uint8_t)ADC1_SchmittTriggerChannel - (uint8_t)8)));
1167  004c a008          	sub	a,#8
1168  004e ad1e          	call	LC003
1169  0050 2704          	jreq	L44
1170  0052               L64:
1171  0052 48            	sll	a
1172  0053 5a            	decw	x
1173  0054 26fc          	jrne	L64
1174  0056               L44:
1175  0056 43            	cpl	a
1176  0057 c45406        	and	a,21510
1178  005a 200d          	jp	LC001
1179  005c               L305:
1180                     ; 283             ADC1->TDRH |= (uint8_t)((uint8_t)0x01 << ((uint8_t)ADC1_SchmittTriggerChannel - (uint8_t)8));
1182  005c a008          	sub	a,#8
1183  005e ad0e          	call	LC003
1184  0060 2704          	jreq	L05
1185  0062               L25:
1186  0062 48            	sll	a
1187  0063 5a            	decw	x
1188  0064 26fc          	jrne	L25
1189  0066               L05:
1190  0066 ca5406        	or	a,21510
1191  0069               LC001:
1192  0069 c75406        	ld	21510,a
1193  006c               L174:
1194                     ; 287 }
1197  006c 85            	popw	x
1198  006d 81            	ret	
1199  006e               LC003:
1200  006e 5f            	clrw	x
1201  006f 97            	ld	xl,a
1202  0070 a601          	ld	a,#1
1203  0072 5d            	tnzw	x
1204  0073 81            	ret	
1261                     ; 300 void ADC1_ConversionConfig(ADC1_ConvMode_TypeDef ADC1_ConversionMode, ADC1_Channel_TypeDef ADC1_Channel, ADC1_Align_TypeDef ADC1_Align)
1261                     ; 301 {
1262                     .text:	section	.text,new
1263  0000               _ADC1_ConversionConfig:
1265       00000000      OFST:	set	0
1268                     ; 304     assert_param(IS_ADC1_CONVERSIONMODE_OK(ADC1_ConversionMode));
1270                     ; 305     assert_param(IS_ADC1_CHANNEL_OK(ADC1_Channel));
1272                     ; 306     assert_param(IS_ADC1_ALIGN_OK(ADC1_Align));
1274                     ; 309     ADC1->CR2 &= (uint8_t)(~ADC1_CR2_ALIGN);
1276  0000 72175402      	bres	21506,#3
1277  0004 89            	pushw	x
1278                     ; 311     ADC1->CR2 |= (uint8_t)(ADC1_Align);
1280  0005 c65402        	ld	a,21506
1281  0008 1a05          	or	a,(OFST+5,sp)
1282  000a c75402        	ld	21506,a
1283                     ; 313     if (ADC1_ConversionMode == ADC1_CONVERSIONMODE_CONTINUOUS)
1285  000d 9e            	ld	a,xh
1286  000e 4a            	dec	a
1287  000f 2606          	jrne	L535
1288                     ; 316         ADC1->CR1 |= ADC1_CR1_CONT;
1290  0011 72125401      	bset	21505,#1
1292  0015 2004          	jra	L735
1293  0017               L535:
1294                     ; 321         ADC1->CR1 &= (uint8_t)(~ADC1_CR1_CONT);
1296  0017 72135401      	bres	21505,#1
1297  001b               L735:
1298                     ; 325     ADC1->CSR &= (uint8_t)(~ADC1_CSR_CH);
1300  001b c65400        	ld	a,21504
1301  001e a4f0          	and	a,#240
1302  0020 c75400        	ld	21504,a
1303                     ; 327     ADC1->CSR |= (uint8_t)(ADC1_Channel);
1305  0023 c65400        	ld	a,21504
1306  0026 1a02          	or	a,(OFST+2,sp)
1307  0028 c75400        	ld	21504,a
1308                     ; 329 }
1311  002b 85            	popw	x
1312  002c 81            	ret	
1358                     ; 342 void ADC1_ExternalTriggerConfig(ADC1_ExtTrig_TypeDef ADC1_ExtTrigger, FunctionalState NewState)
1358                     ; 343 {
1359                     .text:	section	.text,new
1360  0000               _ADC1_ExternalTriggerConfig:
1362  0000 89            	pushw	x
1363       00000000      OFST:	set	0
1366                     ; 346     assert_param(IS_ADC1_EXTTRIG_OK(ADC1_ExtTrigger));
1368                     ; 347     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1370                     ; 350     ADC1->CR2 &= (uint8_t)(~ADC1_CR2_EXTSEL);
1372  0001 c65402        	ld	a,21506
1373  0004 a4cf          	and	a,#207
1374  0006 c75402        	ld	21506,a
1375                     ; 352     if (NewState != DISABLE)
1377  0009 9f            	ld	a,xl
1378  000a 4d            	tnz	a
1379  000b 2706          	jreq	L365
1380                     ; 355         ADC1->CR2 |= (uint8_t)(ADC1_CR2_EXTTRIG);
1382  000d 721c5402      	bset	21506,#6
1384  0011 2004          	jra	L565
1385  0013               L365:
1386                     ; 360         ADC1->CR2 &= (uint8_t)(~ADC1_CR2_EXTTRIG);
1388  0013 721d5402      	bres	21506,#6
1389  0017               L565:
1390                     ; 364     ADC1->CR2 |= (uint8_t)(ADC1_ExtTrigger);
1392  0017 c65402        	ld	a,21506
1393  001a 1a01          	or	a,(OFST+1,sp)
1394  001c c75402        	ld	21506,a
1395                     ; 366 }
1398  001f 85            	popw	x
1399  0020 81            	ret	
1423                     ; 378 void ADC1_StartConversion(void)
1423                     ; 379 {
1424                     .text:	section	.text,new
1425  0000               _ADC1_StartConversion:
1429                     ; 380     ADC1->CR1 |= ADC1_CR1_ADON;
1431  0000 72105401      	bset	21505,#0
1432                     ; 381 }
1435  0004 81            	ret	
1479                     ; 390 uint16_t ADC1_GetConversionValue(void)
1479                     ; 391 {
1480                     .text:	section	.text,new
1481  0000               _ADC1_GetConversionValue:
1483  0000 5205          	subw	sp,#5
1484       00000005      OFST:	set	5
1487                     ; 393     uint16_t temph = 0;
1489                     ; 394     uint8_t templ = 0;
1491                     ; 396     if ((ADC1->CR2 & ADC1_CR2_ALIGN) != 0) /* Right alignment */
1493  0002 720754020e    	btjf	21506,#3,L126
1494                     ; 399         templ = ADC1->DRL;
1496  0007 c65405        	ld	a,21509
1497  000a 6b03          	ld	(OFST-2,sp),a
1498                     ; 401         temph = ADC1->DRH;
1500  000c c65404        	ld	a,21508
1501  000f 97            	ld	xl,a
1502                     ; 403         temph = (uint16_t)(templ | (uint16_t)(temph << (uint8_t)8));
1504  0010 7b03          	ld	a,(OFST-2,sp)
1505  0012 02            	rlwa	x,a
1507  0013 201a          	jra	L326
1508  0015               L126:
1509                     ; 408         temph = ADC1->DRH;
1511  0015 c65404        	ld	a,21508
1512  0018 97            	ld	xl,a
1513                     ; 410         templ = ADC1->DRL;
1515  0019 c65405        	ld	a,21509
1516  001c 6b03          	ld	(OFST-2,sp),a
1517                     ; 412         temph = (uint16_t)((uint16_t)((uint16_t)templ << 6) | (uint16_t)((uint16_t)temph << 8));
1519  001e 4f            	clr	a
1520  001f 02            	rlwa	x,a
1521  0020 1f01          	ldw	(OFST-4,sp),x
1522  0022 7b03          	ld	a,(OFST-2,sp)
1523  0024 97            	ld	xl,a
1524  0025 a640          	ld	a,#64
1525  0027 42            	mul	x,a
1526  0028 01            	rrwa	x,a
1527  0029 1a02          	or	a,(OFST-3,sp)
1528  002b 01            	rrwa	x,a
1529  002c 1a01          	or	a,(OFST-4,sp)
1530  002e 01            	rrwa	x,a
1531  002f               L326:
1532                     ; 415     return ((uint16_t)temph);
1536  002f 5b05          	addw	sp,#5
1537  0031 81            	ret	
1583                     ; 427 void ADC1_AWDChannelConfig(ADC1_Channel_TypeDef Channel, FunctionalState NewState)
1583                     ; 428 {
1584                     .text:	section	.text,new
1585  0000               _ADC1_AWDChannelConfig:
1587  0000 89            	pushw	x
1588       00000000      OFST:	set	0
1591                     ; 430     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1593                     ; 431     assert_param(IS_ADC1_CHANNEL_OK(Channel));
1595                     ; 433     if (Channel < (uint8_t)8)
1597  0001 9e            	ld	a,xh
1598  0002 a108          	cp	a,#8
1599  0004 2425          	jruge	L746
1600                     ; 435         if (NewState != DISABLE)
1602  0006 9f            	ld	a,xl
1603  0007 4d            	tnz	a
1604  0008 270e          	jreq	L156
1605                     ; 437             ADC1->AWCRL |= (uint8_t)((uint8_t)1 << Channel);
1607  000a 9e            	ld	a,xh
1608  000b ad48          	call	LC006
1609  000d 2704          	jreq	L66
1610  000f               L07:
1611  000f 48            	sll	a
1612  0010 5a            	decw	x
1613  0011 26fc          	jrne	L07
1614  0013               L66:
1615  0013 ca540f        	or	a,21519
1617  0016 200e          	jp	LC005
1618  0018               L156:
1619                     ; 441             ADC1->AWCRL &= (uint8_t)~(uint8_t)((uint8_t)1 << Channel);
1621  0018 7b01          	ld	a,(OFST+1,sp)
1622  001a ad39          	call	LC006
1623  001c 2704          	jreq	L27
1624  001e               L47:
1625  001e 48            	sll	a
1626  001f 5a            	decw	x
1627  0020 26fc          	jrne	L47
1628  0022               L27:
1629  0022 43            	cpl	a
1630  0023 c4540f        	and	a,21519
1631  0026               LC005:
1632  0026 c7540f        	ld	21519,a
1633  0029 2028          	jra	L556
1634  002b               L746:
1635                     ; 446         if (NewState != DISABLE)
1637  002b 7b02          	ld	a,(OFST+2,sp)
1638  002d 2711          	jreq	L756
1639                     ; 448             ADC1->AWCRH |= (uint8_t)((uint8_t)1 << (Channel - (uint8_t)8));
1641  002f 7b01          	ld	a,(OFST+1,sp)
1642  0031 a008          	sub	a,#8
1643  0033 ad20          	call	LC006
1644  0035 2704          	jreq	L67
1645  0037               L001:
1646  0037 48            	sll	a
1647  0038 5a            	decw	x
1648  0039 26fc          	jrne	L001
1649  003b               L67:
1650  003b ca540e        	or	a,21518
1652  003e 2010          	jp	LC004
1653  0040               L756:
1654                     ; 452             ADC1->AWCRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (uint8_t)(Channel - (uint8_t)8));
1656  0040 7b01          	ld	a,(OFST+1,sp)
1657  0042 a008          	sub	a,#8
1658  0044 ad0f          	call	LC006
1659  0046 2704          	jreq	L201
1660  0048               L401:
1661  0048 48            	sll	a
1662  0049 5a            	decw	x
1663  004a 26fc          	jrne	L401
1664  004c               L201:
1665  004c 43            	cpl	a
1666  004d c4540e        	and	a,21518
1667  0050               LC004:
1668  0050 c7540e        	ld	21518,a
1669  0053               L556:
1670                     ; 455 }
1673  0053 85            	popw	x
1674  0054 81            	ret	
1675  0055               LC006:
1676  0055 5f            	clrw	x
1677  0056 97            	ld	xl,a
1678  0057 a601          	ld	a,#1
1679  0059 5d            	tnzw	x
1680  005a 81            	ret	
1715                     ; 463 void ADC1_SetHighThreshold(uint16_t Threshold)
1715                     ; 464 {
1716                     .text:	section	.text,new
1717  0000               _ADC1_SetHighThreshold:
1719  0000 89            	pushw	x
1720       00000000      OFST:	set	0
1723                     ; 465     ADC1->HTRH = (uint8_t)(Threshold >> (uint8_t)2);
1725  0001 54            	srlw	x
1726  0002 54            	srlw	x
1727  0003 9f            	ld	a,xl
1728  0004 c75408        	ld	21512,a
1729                     ; 466     ADC1->HTRL = (uint8_t)Threshold;
1731  0007 7b02          	ld	a,(OFST+2,sp)
1732  0009 c75409        	ld	21513,a
1733                     ; 467 }
1736  000c 85            	popw	x
1737  000d 81            	ret	
1772                     ; 475 void ADC1_SetLowThreshold(uint16_t Threshold)
1772                     ; 476 {
1773                     .text:	section	.text,new
1774  0000               _ADC1_SetLowThreshold:
1778                     ; 477     ADC1->LTRL = (uint8_t)Threshold;
1780  0000 9f            	ld	a,xl
1781  0001 c7540b        	ld	21515,a
1782                     ; 478     ADC1->LTRH = (uint8_t)(Threshold >> (uint8_t)2);
1784  0004 54            	srlw	x
1785  0005 54            	srlw	x
1786  0006 9f            	ld	a,xl
1787  0007 c7540a        	ld	21514,a
1788                     ; 479 }
1791  000a 81            	ret	
1844                     ; 488 uint16_t ADC1_GetBufferValue(uint8_t Buffer)
1844                     ; 489 {
1845                     .text:	section	.text,new
1846  0000               _ADC1_GetBufferValue:
1848  0000 88            	push	a
1849  0001 5205          	subw	sp,#5
1850       00000005      OFST:	set	5
1853                     ; 491     uint16_t temph = 0;
1855                     ; 492     uint8_t templ = 0;
1857                     ; 495     assert_param(IS_ADC1_BUFFER_OK(Buffer));
1859                     ; 497     if ((ADC1->CR2 & ADC1_CR2_ALIGN) != 0) /* Right alignment */
1861  0003 7b06          	ld	a,(OFST+1,sp)
1862  0005 48            	sll	a
1863  0006 5f            	clrw	x
1864  0007 97            	ld	xl,a
1865  0008 7207540213    	btjf	21506,#3,L547
1866                     ; 500         templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
1868  000d d653e1        	ld	a,(21473,x)
1869  0010 6b03          	ld	(OFST-2,sp),a
1870                     ; 502         temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
1872  0012 7b06          	ld	a,(OFST+1,sp)
1873  0014 48            	sll	a
1874  0015 5f            	clrw	x
1875  0016 97            	ld	xl,a
1876  0017 d653e0        	ld	a,(21472,x)
1877  001a 97            	ld	xl,a
1878                     ; 504         temph = (uint16_t)(templ | (uint16_t)(temph << (uint8_t)8));
1880  001b 7b03          	ld	a,(OFST-2,sp)
1881  001d 02            	rlwa	x,a
1883  001e 2024          	jra	L747
1884  0020               L547:
1885                     ; 509         temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
1887  0020 d653e0        	ld	a,(21472,x)
1888  0023 5f            	clrw	x
1889  0024 97            	ld	xl,a
1890  0025 1f04          	ldw	(OFST-1,sp),x
1891                     ; 511         templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
1893  0027 7b06          	ld	a,(OFST+1,sp)
1894  0029 48            	sll	a
1895  002a 5f            	clrw	x
1896  002b 97            	ld	xl,a
1897  002c d653e1        	ld	a,(21473,x)
1898  002f 6b03          	ld	(OFST-2,sp),a
1899                     ; 513         temph = (uint16_t)((uint16_t)((uint16_t)templ << 6) | (uint16_t)(temph << 8));
1901  0031 4f            	clr	a
1902  0032 1e04          	ldw	x,(OFST-1,sp)
1903  0034 02            	rlwa	x,a
1904  0035 1f01          	ldw	(OFST-4,sp),x
1905  0037 7b03          	ld	a,(OFST-2,sp)
1906  0039 97            	ld	xl,a
1907  003a a640          	ld	a,#64
1908  003c 42            	mul	x,a
1909  003d 01            	rrwa	x,a
1910  003e 1a02          	or	a,(OFST-3,sp)
1911  0040 01            	rrwa	x,a
1912  0041 1a01          	or	a,(OFST-4,sp)
1913  0043 01            	rrwa	x,a
1914  0044               L747:
1915                     ; 516     return ((uint16_t)temph);
1919  0044 5b06          	addw	sp,#6
1920  0046 81            	ret	
1986                     ; 526 FlagStatus ADC1_GetAWDChannelStatus(ADC1_Channel_TypeDef Channel)
1986                     ; 527 {
1987                     .text:	section	.text,new
1988  0000               _ADC1_GetAWDChannelStatus:
1990  0000 88            	push	a
1991  0001 88            	push	a
1992       00000001      OFST:	set	1
1995                     ; 528     uint8_t status = 0;
1997                     ; 531     assert_param(IS_ADC1_CHANNEL_OK(Channel));
1999                     ; 533     if (Channel < (uint8_t)8)
2001  0002 a108          	cp	a,#8
2002  0004 2410          	jruge	L3001
2003                     ; 535         status = (uint8_t)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << Channel));
2005  0006 5f            	clrw	x
2006  0007 97            	ld	xl,a
2007  0008 a601          	ld	a,#1
2008  000a 5d            	tnzw	x
2009  000b 2704          	jreq	L611
2010  000d               L021:
2011  000d 48            	sll	a
2012  000e 5a            	decw	x
2013  000f 26fc          	jrne	L021
2014  0011               L611:
2015  0011 c4540d        	and	a,21517
2017  0014 2012          	jra	L5001
2018  0016               L3001:
2019                     ; 539         status = (uint8_t)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (Channel - (uint8_t)8)));
2021  0016 7b02          	ld	a,(OFST+1,sp)
2022  0018 a008          	sub	a,#8
2023  001a 5f            	clrw	x
2024  001b 97            	ld	xl,a
2025  001c a601          	ld	a,#1
2026  001e 5d            	tnzw	x
2027  001f 2704          	jreq	L221
2028  0021               L421:
2029  0021 48            	sll	a
2030  0022 5a            	decw	x
2031  0023 26fc          	jrne	L421
2032  0025               L221:
2033  0025 c4540c        	and	a,21516
2034  0028               L5001:
2035                     ; 542     return ((FlagStatus)status);
2039  0028 85            	popw	x
2040  0029 81            	ret	
2198                     ; 551 FlagStatus ADC1_GetFlagStatus(ADC1_Flag_TypeDef Flag)
2198                     ; 552 {
2199                     .text:	section	.text,new
2200  0000               _ADC1_GetFlagStatus:
2202  0000 88            	push	a
2203  0001 88            	push	a
2204       00000001      OFST:	set	1
2207                     ; 553     uint8_t flagstatus = 0;
2209                     ; 554     uint8_t temp = 0;
2211                     ; 557     assert_param(IS_ADC1_FLAG_OK(Flag));
2213                     ; 559     if ((Flag & 0x0F) == 0x01)
2215  0002 a40f          	and	a,#15
2216  0004 4a            	dec	a
2217  0005 2607          	jrne	L5701
2218                     ; 562         flagstatus = (uint8_t)(ADC1->CR3 & ADC1_CR3_OVR);
2220  0007 c65403        	ld	a,21507
2221  000a a440          	and	a,#64
2223  000c 2039          	jra	L7701
2224  000e               L5701:
2225                     ; 564     else if ((Flag & 0xF0) == 0x10)
2227  000e 7b02          	ld	a,(OFST+1,sp)
2228  0010 a4f0          	and	a,#240
2229  0012 a110          	cp	a,#16
2230  0014 262c          	jrne	L1011
2231                     ; 567         temp = (uint8_t)(Flag & (uint8_t)0x0F);
2233  0016 7b02          	ld	a,(OFST+1,sp)
2234  0018 a40f          	and	a,#15
2235  001a 6b01          	ld	(OFST+0,sp),a
2236                     ; 568         if (temp < 8)
2238  001c a108          	cp	a,#8
2239  001e 2410          	jruge	L3011
2240                     ; 570             flagstatus = (uint8_t)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << temp));
2242  0020 5f            	clrw	x
2243  0021 97            	ld	xl,a
2244  0022 a601          	ld	a,#1
2245  0024 5d            	tnzw	x
2246  0025 2704          	jreq	L031
2247  0027               L231:
2248  0027 48            	sll	a
2249  0028 5a            	decw	x
2250  0029 26fc          	jrne	L231
2251  002b               L031:
2252  002b c4540d        	and	a,21517
2254  002e 2017          	jra	L7701
2255  0030               L3011:
2256                     ; 574             flagstatus = (uint8_t)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (temp - 8)));
2258  0030 a008          	sub	a,#8
2259  0032 5f            	clrw	x
2260  0033 97            	ld	xl,a
2261  0034 a601          	ld	a,#1
2262  0036 5d            	tnzw	x
2263  0037 2704          	jreq	L431
2264  0039               L631:
2265  0039 48            	sll	a
2266  003a 5a            	decw	x
2267  003b 26fc          	jrne	L631
2268  003d               L431:
2269  003d c4540c        	and	a,21516
2270  0040 2005          	jra	L7701
2271  0042               L1011:
2272                     ; 579         flagstatus = (uint8_t)(ADC1->CSR & Flag);
2274  0042 c65400        	ld	a,21504
2275  0045 1402          	and	a,(OFST+1,sp)
2276  0047               L7701:
2277                     ; 581     return ((FlagStatus)flagstatus);
2281  0047 85            	popw	x
2282  0048 81            	ret	
2326                     ; 591 void ADC1_ClearFlag(ADC1_Flag_TypeDef Flag)
2326                     ; 592 {
2327                     .text:	section	.text,new
2328  0000               _ADC1_ClearFlag:
2330  0000 88            	push	a
2331  0001 88            	push	a
2332       00000001      OFST:	set	1
2335                     ; 593     uint8_t temp = 0;
2337                     ; 596     assert_param(IS_ADC1_FLAG_OK(Flag));
2339                     ; 598     if ((Flag & 0x0F) == 0x01)
2341  0002 a40f          	and	a,#15
2342  0004 4a            	dec	a
2343  0005 2606          	jrne	L3311
2344                     ; 601         ADC1->CR3 &= (uint8_t)(~ADC1_CR3_OVR);
2346  0007 721d5403      	bres	21507,#6
2348  000b 2045          	jra	L5311
2349  000d               L3311:
2350                     ; 603     else if ((Flag & 0xF0) == 0x10)
2352  000d 7b02          	ld	a,(OFST+1,sp)
2353  000f a4f0          	and	a,#240
2354  0011 a110          	cp	a,#16
2355  0013 2634          	jrne	L7311
2356                     ; 606         temp = (uint8_t)(Flag & (uint8_t)0x0F);
2358  0015 7b02          	ld	a,(OFST+1,sp)
2359  0017 a40f          	and	a,#15
2360  0019 6b01          	ld	(OFST+0,sp),a
2361                     ; 607         if (temp < 8)
2363  001b a108          	cp	a,#8
2364  001d 2414          	jruge	L1411
2365                     ; 609             ADC1->AWSRL &= (uint8_t)~(uint8_t)((uint8_t)1 << temp);
2367  001f 5f            	clrw	x
2368  0020 97            	ld	xl,a
2369  0021 a601          	ld	a,#1
2370  0023 5d            	tnzw	x
2371  0024 2704          	jreq	L241
2372  0026               L441:
2373  0026 48            	sll	a
2374  0027 5a            	decw	x
2375  0028 26fc          	jrne	L441
2376  002a               L241:
2377  002a 43            	cpl	a
2378  002b c4540d        	and	a,21517
2379  002e c7540d        	ld	21517,a
2381  0031 201f          	jra	L5311
2382  0033               L1411:
2383                     ; 613             ADC1->AWSRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (temp - 8));
2385  0033 a008          	sub	a,#8
2386  0035 5f            	clrw	x
2387  0036 97            	ld	xl,a
2388  0037 a601          	ld	a,#1
2389  0039 5d            	tnzw	x
2390  003a 2704          	jreq	L641
2391  003c               L051:
2392  003c 48            	sll	a
2393  003d 5a            	decw	x
2394  003e 26fc          	jrne	L051
2395  0040               L641:
2396  0040 43            	cpl	a
2397  0041 c4540c        	and	a,21516
2398  0044 c7540c        	ld	21516,a
2399  0047 2009          	jra	L5311
2400  0049               L7311:
2401                     ; 618         ADC1->CSR &= (uint8_t) (~Flag);
2403  0049 7b02          	ld	a,(OFST+1,sp)
2404  004b 43            	cpl	a
2405  004c c45400        	and	a,21504
2406  004f c75400        	ld	21504,a
2407  0052               L5311:
2408                     ; 620 }
2411  0052 85            	popw	x
2412  0053 81            	ret	
2467                     ; 640 ITStatus ADC1_GetITStatus(ADC1_IT_TypeDef ITPendingBit)
2467                     ; 641 {
2468                     .text:	section	.text,new
2469  0000               _ADC1_GetITStatus:
2471  0000 89            	pushw	x
2472  0001 88            	push	a
2473       00000001      OFST:	set	1
2476                     ; 642     ITStatus itstatus = RESET;
2478                     ; 643     uint8_t temp = 0;
2480                     ; 646     assert_param(IS_ADC1_ITPENDINGBIT_OK(ITPendingBit));
2482                     ; 648     if (((uint16_t)ITPendingBit & 0xF0) == 0x10)
2484  0002 01            	rrwa	x,a
2485  0003 a4f0          	and	a,#240
2486  0005 5f            	clrw	x
2487  0006 02            	rlwa	x,a
2488  0007 a30010        	cpw	x,#16
2489  000a 262c          	jrne	L5711
2490                     ; 651         temp = (uint8_t)((uint16_t)ITPendingBit & 0x0F);
2492  000c 7b03          	ld	a,(OFST+2,sp)
2493  000e a40f          	and	a,#15
2494  0010 6b01          	ld	(OFST+0,sp),a
2495                     ; 652         if (temp < 8)
2497  0012 a108          	cp	a,#8
2498  0014 2410          	jruge	L7711
2499                     ; 654             itstatus = (ITStatus)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << temp));
2501  0016 5f            	clrw	x
2502  0017 97            	ld	xl,a
2503  0018 a601          	ld	a,#1
2504  001a 5d            	tnzw	x
2505  001b 2704          	jreq	L451
2506  001d               L651:
2507  001d 48            	sll	a
2508  001e 5a            	decw	x
2509  001f 26fc          	jrne	L651
2510  0021               L451:
2511  0021 c4540d        	and	a,21517
2513  0024 2017          	jra	L3021
2514  0026               L7711:
2515                     ; 658             itstatus = (ITStatus)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (temp - 8)));
2517  0026 a008          	sub	a,#8
2518  0028 5f            	clrw	x
2519  0029 97            	ld	xl,a
2520  002a a601          	ld	a,#1
2521  002c 5d            	tnzw	x
2522  002d 2704          	jreq	L061
2523  002f               L261:
2524  002f 48            	sll	a
2525  0030 5a            	decw	x
2526  0031 26fc          	jrne	L261
2527  0033               L061:
2528  0033 c4540c        	and	a,21516
2529  0036 2005          	jra	L3021
2530  0038               L5711:
2531                     ; 663         itstatus = (ITStatus)(ADC1->CSR & (uint8_t)ITPendingBit);
2533  0038 c65400        	ld	a,21504
2534  003b 1403          	and	a,(OFST+2,sp)
2535  003d               L3021:
2536                     ; 665     return ((ITStatus)itstatus);
2540  003d 5b03          	addw	sp,#3
2541  003f 81            	ret	
2586                     ; 687 void ADC1_ClearITPendingBit(ADC1_IT_TypeDef ITPendingBit)
2586                     ; 688 {
2587                     .text:	section	.text,new
2588  0000               _ADC1_ClearITPendingBit:
2590  0000 89            	pushw	x
2591  0001 88            	push	a
2592       00000001      OFST:	set	1
2595                     ; 689     uint8_t temp = 0;
2597                     ; 692     assert_param(IS_ADC1_ITPENDINGBIT_OK(ITPendingBit));
2599                     ; 694     if (((uint16_t)ITPendingBit & 0xF0) == 0x10)
2601  0002 01            	rrwa	x,a
2602  0003 a4f0          	and	a,#240
2603  0005 5f            	clrw	x
2604  0006 02            	rlwa	x,a
2605  0007 a30010        	cpw	x,#16
2606  000a 2634          	jrne	L7221
2607                     ; 697         temp = (uint8_t)((uint16_t)ITPendingBit & 0x0F);
2609  000c 7b03          	ld	a,(OFST+2,sp)
2610  000e a40f          	and	a,#15
2611  0010 6b01          	ld	(OFST+0,sp),a
2612                     ; 698         if (temp < 8)
2614  0012 a108          	cp	a,#8
2615  0014 2414          	jruge	L1321
2616                     ; 700             ADC1->AWSRL &= (uint8_t)~(uint8_t)((uint8_t)1 << temp);
2618  0016 5f            	clrw	x
2619  0017 97            	ld	xl,a
2620  0018 a601          	ld	a,#1
2621  001a 5d            	tnzw	x
2622  001b 2704          	jreq	L661
2623  001d               L071:
2624  001d 48            	sll	a
2625  001e 5a            	decw	x
2626  001f 26fc          	jrne	L071
2627  0021               L661:
2628  0021 43            	cpl	a
2629  0022 c4540d        	and	a,21517
2630  0025 c7540d        	ld	21517,a
2632  0028 201f          	jra	L5321
2633  002a               L1321:
2634                     ; 704             ADC1->AWSRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (temp - 8));
2636  002a a008          	sub	a,#8
2637  002c 5f            	clrw	x
2638  002d 97            	ld	xl,a
2639  002e a601          	ld	a,#1
2640  0030 5d            	tnzw	x
2641  0031 2704          	jreq	L271
2642  0033               L471:
2643  0033 48            	sll	a
2644  0034 5a            	decw	x
2645  0035 26fc          	jrne	L471
2646  0037               L271:
2647  0037 43            	cpl	a
2648  0038 c4540c        	and	a,21516
2649  003b c7540c        	ld	21516,a
2650  003e 2009          	jra	L5321
2651  0040               L7221:
2652                     ; 709         ADC1->CSR &= (uint8_t)((uint16_t)~(uint16_t)ITPendingBit);
2654  0040 7b03          	ld	a,(OFST+2,sp)
2655  0042 43            	cpl	a
2656  0043 c45400        	and	a,21504
2657  0046 c75400        	ld	21504,a
2658  0049               L5321:
2659                     ; 711 }
2662  0049 5b03          	addw	sp,#3
2663  004b 81            	ret	
2676                     	xdef	_ADC1_ClearITPendingBit
2677                     	xdef	_ADC1_GetITStatus
2678                     	xdef	_ADC1_ClearFlag
2679                     	xdef	_ADC1_GetFlagStatus
2680                     	xdef	_ADC1_GetAWDChannelStatus
2681                     	xdef	_ADC1_GetBufferValue
2682                     	xdef	_ADC1_SetLowThreshold
2683                     	xdef	_ADC1_SetHighThreshold
2684                     	xdef	_ADC1_GetConversionValue
2685                     	xdef	_ADC1_StartConversion
2686                     	xdef	_ADC1_AWDChannelConfig
2687                     	xdef	_ADC1_ExternalTriggerConfig
2688                     	xdef	_ADC1_ConversionConfig
2689                     	xdef	_ADC1_SchmittTriggerConfig
2690                     	xdef	_ADC1_PrescalerConfig
2691                     	xdef	_ADC1_ITConfig
2692                     	xdef	_ADC1_DataBufferCmd
2693                     	xdef	_ADC1_ScanModeCmd
2694                     	xdef	_ADC1_Cmd
2695                     	xdef	_ADC1_Init
2696                     	xdef	_ADC1_DeInit
2715                     	end
