
#include "User.h"
#include "Srb.h"


extern u8 flgTrig;
extern char cUART[20];			//used to get string via UART interrupt
extern int8_t lenUART;			//used to get string via UART interrupt

extern int32 	ErrSum, ErrOld;
extern int16_t cntOS;
extern int16_t Input, Output, Setpoint;
extern int16_t Kp,Ki,Kd;
extern uint8_t cntFre50Hz;


void RCServo_Pos(unsigned char Pos)
{
    
}


int32 PID_Calc(int32 Inp,int32 Sp) /* DT=0.02 */
{
	 int32 _Err;
	 int32 _ErrDif;
	 int32 _Out, _Out1,_Out2,_Out3;
	 
	
	 
	 _Err = ((Sp - Inp));
	 
	 if (_Err < 0)
	 {
		 ErrSum = 0;
		 ErrOld = 0;
		 return 13;
	 }
		 
     ErrSum += _Err;
	 _ErrDif =  _Err - ErrOld;
	
   /*Compute PID Output*/
   /* --- Output = Kp*e + Ki*Sum(e)*DT + Kp*(e-e_old)/DT ----- */
   // _Out =  Add_S32S32_S32(Add_S32S32_S32(Mul_S32S32_S32(Kp, _Err), 
   //									  (Mul_S32S32_S32(Ki, ErrSum)/DT_INV)),
   //				   Mul_S32S32_S32(Mul_S32S32_S32(Kd,_ErrDif),DT_INV));
	//_Out1 = Mul_S32S32_S32(Kp, _Err);
   _Out1 = Kp*_Err;
   if (_Out1 > (PWM_PERD))
   {
	   _Out1 = (PWM_PERD);
   }
   else if (_Out1 < 0)
   {
	   _Out1 = 0;
   }
   else
   {
	   ;
   }
	//_Out2 = Mul_S32S32_S32(Ki, ErrSum)/DT_INV ;
   _Out2 = Ki*ErrSum/DT_INV;
   if (_Out2 > (PWM_PERD))
   {
	   _Out2 = (PWM_PERD);
   }
   else if (_Out2 < 0)
   {
	   _Out2 = 0;
   }
   else
   {
	   ;
   }
   //_Out3 = Mul_S32S32_S32(Mul_S32S32_S32(Kd,_ErrDif),DT_INV);
   _Out3 = Kd*_ErrDif*DT_INV;
   if (_Out3 > (PWM_PERD))
   {
	   _Out3 = (PWM_PERD);
   }
   else if (_Out3 < 0)
   {
	   _Out3 = 0;
   }
   else
   {
	   ;
   }
	//_Out  =   Add_S32S32_S32(Add_S32S32_S32(_Out1,_Out2),_Out3);
	_Out = _Out1 + _Out2 + _Out3;
   
   if (_Out > (PWM_PERD))
   {
	   _Out = (PWM_PERD);
   }
   else if (_Out < 0)
   {
	   _Out = 0;
   }
   else
   {
	   ;
   }
   
   /*Remember some variables for next time*/
   ErrOld = _Err;
	 
   return _Out;

}

void GetStrUART(char *Data,char *DataUARTbuff, int8_t DataLength)
{
	int8_t i;
	for(i = 0;i<DataLength;i++)
	{
		Data[i]=DataUARTbuff[i];
	}
	Data[i]='\0';
}

void SendStrUART(char *Data)
{
	char i=0;
	while(Data[i]!='\0')
	{
            UART2_SendData8(Data[i]);
            while(!UART2_GetFlagStatus(UART2_FLAG_TC));
            i++;
	}
}

uint16_t GetLM35(uint16_t ADC_result )
{
	uint16_t temp = (uint16_t) ADC_result * 5;  //5V input and 10 bits ADC and factor 100 of LM35
	return temp;
}

void CLK_Config(void)
{
    CLK_HSICmd(ENABLE);
    /* Initialization of the clock */
    /* Clock divider to HSI/1 */
    CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
}

void Timer1_Init(void)
{
	// Reset ("de-initialise") TIM1.
    TIM1_DeInit();
    // Set TIM1 to:
    // - use an exact prescaler of 1600,16MHz/1600 = 10KHz = 0.1ms
    // - to count up,
    // - to have a period of 10 ms, and
    // - to have a repetition counter of 0.
    TIM1_TimeBaseInit(1600, TIM1_COUNTERMODE_UP, 50, 0);
    // Set TIM1 to generate interrupts every time the counter overflows .
    TIM1_ITConfig(TIM1_IT_UPDATE, ENABLE);
		//TIM1_ITConfig(TIM1_IT_UPDATE, DISABLE);
		// Enable TIM1.
    TIM1_Cmd(ENABLE);
}



void Timer3_Init(void)
{
    // Reset ("de-initialise") TIM3.
    TIM3_DeInit();
    // 	Set TIM3 to use a prescaler of 1 and have a period of 100.
    TIM3_TimeBaseInit(TIM3_PRESCALER_128, 2500);  //125000Hz/2500 = 50Hz
    // Initialise output channel 1 of TIM3, by setting:
    // - PWM1 mode (starts activated, deactivates when capture compare value is hit),
    // - output is enabled,
    // - capture compare value of 0, and
    // - an active signal is low (0V).
    TIM3_OC1Init(TIM3_OCMODE_PWM2,TIM3_OUTPUTSTATE_ENABLE,0,TIM3_OCPOLARITY_LOW );
                                                            
                                                            /**
    * @brief  Enables or disables the TIM3 peripheral Preload Register on CCR2.
    * @param   NewState new state of the Capture Compare Preload register.
    * This parameter can be ENABLE or DISABLE.
    * @retval None
    */
    //void TIM3_OC2PreloadConfig(FunctionalState NewState)
    // Enable TIM3.
    TIM3_Cmd(ENABLE);
}

void ADC_Init(void)
{
	//Deinitializes the ADC1 peripheral registers to their default reset value
        ADC1_DeInit();
        //Initializes the ADC1 peripheral according to the specified parameters
        //		ADC1_ConversionMode: 				Continuous conversion mode
        //		ADC1_Channel: 						4
        //		ADC1_PrescalerSelection: 		Prescaler selection fADC1 = fcpu/4 (16Mhz/4 = 4Mhz)
        //		ADC1_ExtTrigger: 						Conversion from Internal TIM1 TRGO event
        //		ADC1_Align: 								Data alignment right
        //		ADC1_SchmittTriggerChannel: Schmitt trigger disable on AIN4
        //		ADC1_SchmittTriggerState: 	Schmitt trigger disable on AIN4
        ADC1_Init(ADC1_CONVERSIONMODE_CONTINUOUS, ADC1_CHANNEL_4, ADC1_PRESSEL_FCPU_D4, ADC1_EXTTRIG_TIM, DISABLE, ADC1_ALIGN_RIGHT, ADC1_SCHMITTTRIG_CHANNEL4, DISABLE);
        //Enables the ADC1 peripheral
        ADC1_Cmd(ENABLE);
}

void UART_Init(void)
{
	//Deinitializes the UART peripheral
        UART2_DeInit();
        //Initializes the UART2 
        //		BaudRate: 		9600.
        //		WordLength : 	8 bits Data
        //		StopBits: 		1 bit
        //		Parity: 			No
        //		SyncMode: 		Sync mode Disable, SLK pin Disable 
        //		Mode: 				Transmit Enable and Receive Enable
        UART2_Init((u32)9600, UART2_WORDLENGTH_8D,UART2_STOPBITS_1, UART2_PARITY_NO, UART2_SYNCMODE_CLOCK_DISABLE  ,UART2_MODE_TXRX_ENABLE);
        //Enable the UART2 peripheral
        UART2_Cmd(ENABLE);
}
void GPIO_Initial(void)
{
		//Deinit GPIO D
		//GPIO_DeInit(GPIOD);
	    //LED CODE PORT
	    GPIO_Init(CODEPORT,GPIO_PIN_ALL,GPIO_MODE_OUT_PP_LOW_FAST);
        //PB6: LED SEG 1
		//PB3: LED SEG 2
		GPIO_Init(GPIOB,GPIO_PIN_6, GPIO_MODE_OUT_PP_HIGH_SLOW);
		GPIO_Init(GPIOB,GPIO_PIN_3, GPIO_MODE_OUT_PP_HIGH_SLOW);
		
		//GPIO_Init(GPIOD, GPIO_PIN_0, GPIO_MODE_OUT_PP_HIGH_SLOW);

		//GPIO_DeInit(GPIOB);
		//DO @PD4: LED
		GPIO_Init(GPIOD,GPIO_PIN_4, GPIO_MODE_OUT_PP_HIGH_SLOW);
		

		
		/* Button cofiguration */
		/* PA5 : Temp Up   */
		/* PA6:  Temp Down */
		//GPIO_Init(BUTTON,UP_BUTTON,GPIO_MODE_IN_PU_IT);
        //GPIO_Init(BUTTON,DOWN_BUTTON,GPIO_MODE_IN_PU_IT);
		GPIO_Init(GPIOA, GPIO_PIN_5, GPIO_MODE_IN_PU_NO_IT);
		GPIO_Init(GPIOA, GPIO_PIN_6, GPIO_MODE_IN_PU_NO_IT);

		EXTI_DeInit();
		GPIO_Init(GPIOD,GPIO_PIN_7,GPIO_MODE_IN_PU_IT);
		
		//GPIO_Init(GPIOE, GPIO_PIN_8, GPIO_MODE_IN_PU_NO_IT);
}

void RCServo_Init(void)
{
 		//Deinit GPIO B
		//GPIO_DeInit(GPIOB);
		//DI @PD2
		GPIO_Init(GPIOD, GPIO_PIN_2, GPIO_MODE_IN_PU_NO_IT);
		//GPIO_Init(GPIOB, GPIO_PIN_5, GPIO_MODE_OUT_PP_HIGH_SLOW);     
  
}

void PWMOut_Init(void)
{
	/* TIM 3 is used for PWM */
	// Reset ("de-initialise") TIM3.
    TIM3_DeInit();
    // 	Set TIM3 to use a prescaler of 1 and have a period of 100.
    TIM3_TimeBaseInit(TIM3_PRESCALER_2, PWM_PERD);  //8.000.000/PERD = 10000Hz
    // Initialise output channel 1 of TIM3, by setting:
    // - PWM1 mode (starts activated, deactivates when capture compare value is hit),
    // - output is enabled,
    // - capture compare value of 0, and
    // - an active signal is low (0V).
    TIM3_OC1Init(TIM3_OCMODE_PWM2,TIM3_OUTPUTSTATE_ENABLE,0,TIM3_OCPOLARITY_LOW );
                                                            
                                                            /**
    * @brief  Enables or disables the TIM3 peripheral Preload Register on CCR2.
    * @param   NewState new state of the Capture Compare Preload register.
    * This parameter can be ENABLE or DISABLE.
    * @retval None
    */
    //void TIM3_OC2PreloadConfig(FunctionalState NewState)
    // Enable TIM3.
    TIM3_Cmd(DISABLE);
	
	GPIO_Init(GPIOD, GPIO_PIN_2, GPIO_MODE_IN_PU_NO_IT);
}

void PWM_SetDuty_Freq(TIM3_Prescaler_TypeDef PWM_Freq, int16 PWM_DutyCyle)
{
	if(TIM3_GetPrescaler() != PWM_Freq)
	{
		TIM3_PrescalerConfig(PWM_Freq, TIM3_PSCRELOADMODE_IMMEDIATE);
	}
	TIM3_SetCompare1(PWM_DutyCyle);
}

int str2int(char *str)
{
    int ret = 0;
    char *c;

    for (c = str; (*c != '\0') && isdigit(*c); ++c)
        ret = ret*10 + *c - '0';

    return ret;
}
