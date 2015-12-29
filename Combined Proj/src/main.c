/* PD2 PWM with Timer 3--> TIM3_OCMODE_PWM2*/

/* PD7 input */

#include "User.h"

//#define DEBUG 1
#define TEMP 1
//#define LOCKDOOR

extern u8 flgTrig;
extern char cUART[20];			//used to get string via UART interrupt
extern int8_t lenUART;			//used to get string via UART interrupt

const char Num[10]={0x80,0xF9,0x44,0x60,0x29,0x22,0x02,0xF8,0x00,0x20};
int32 	ErrSum, ErrOld;
int16_t cntOS, vRef, vDuty;
unt16_t vADC,tmpOld;
int16_t Input, Output, Setpoint;
int16_t Kp=50,Ki=1,Kd=0;
uint8_t cntFre50Hz;
u16 cntDuty=100, cntDutyOld;
char cntMode,cntModeOld;
bool flgTongle, bTmpUpOld, bTmpDownOld,flgSelLED;
bool flgDoorDem,flgDoorDemOld;
bool stMode;

int16_t main(void) 
{

    bool bTmpUp, bTmpDown;
    
    //int16_t _vPWMDutyCycle;
    uint16_t	_tmp,_tmp1,_tmp2,_tmp3;
    
    //char chBufADC[50];
    char chBufTEMP[50];
    
    CLK_Config();			 //	Initialization of the clock 
    GPIO_Initial();	         // PD3 is used for read Onewire_Temp alredy
              	             //PD 7: ZERO detection
	                         //PD 4: LED
                            // PA5 : TEMP_UP
                        	//PA6: TEMP_DOWN
							//PB6 :LED SEG 1
							//PB3 :LED SEG 2	
                         	//PORT E :LED CODE

	GPIO_Init(GPIOD, GPIO_PIN_4, GPIO_MODE_OUT_PP_HIGH_SLOW);
	GPIO_Init(GPIOD, GPIO_PIN_2, GPIO_MODE_OUT_PP_HIGH_SLOW);
	GPIO_Init(GPIOD, GPIO_PIN_3, GPIO_MODE_OUT_PP_HIGH_SLOW);


    PWMOut_Init();              // PD2: PEM out

    Timer1_Init();		//	0.05Khz, Interrupt 10ms
                                //      Timebase
    Timer2_Init();		//	For Delay function @ Onewire.h 16Mhz, period = 160

    //Timer3_Init();		//	PD2 output PWM 16Mz, duty cyle 0>>100

#ifdef DEBUG
    UART_Init();			//	9600
#endif
    ADC_Init();				//	4Mz
                                        //      PB4, AIN4 configuration
    OneWire_Init();              // PD3 is using

    //Start ADC1 conversion
    ADC1_StartConversion();
    
    // UART Receive Interrupt
    //UART2_ITConfig(UART2_IT_RXNE, ENABLE);
		
    // Enable interrupts 
    enableInterrupts();
	
    flgTongle = true;

#ifdef TEMP	
   GPIO_WriteLow(GPIOD, GPIO_PIN_2);
   GPIO_WriteLow(GPIOD, GPIO_PIN_3);
   GPIO_WriteLow(GPIOB, GPIO_PIN_6);
   GPIO_WriteLow(GPIOB, GPIO_PIN_3);
#endif
   _tmp = OneWire_GetTemp();
   Delay_us(10000);
   _tmp1 = OneWire_GetTemp();
   Delay_us(10000);
   _tmp2 = OneWire_GetTemp();
   Delay_us(10000);
   _tmp3 = OneWire_GetTemp();
   vADC = (_tmp + _tmp1 +_tmp2 +_tmp3)>>2;

   vRef = 640;
   while(1)
   {
       if (flgTrig==1)
       {
			/* 20ms call once*/
			cntOS++;
			
			 /* PA5: TEMP_UP */
			 bTmpUp = (bool)GPIO_ReadInputPin(GPIOA, GPIO_PIN_5);
			 /* PA6: TEMP_DOWN */
			 bTmpDown = (bool)GPIO_ReadInputPin(GPIOA, GPIO_PIN_6);
			
			 if ((bTmpUp==false)&&(bTmpDown==false))
			 {
			    if (cntModeOld<255) cntMode++;
			 }
			 else
			 {
				 cntMode = 0;
			 }
			 
			 if ((cntMode>=5)&&(cntModeOld<5))
			 {
				 stMode^=0x01;
				 GPIO_WriteLow(GPIOB, GPIO_PIN_3); // Turn-off LED7_1
				 GPIO_WriteLow(GPIOB, GPIO_PIN_6); // Turn-off LED7_2
			 }
			 else
			 {
				 if ((bTmpUp==false)&&(bTmpUpOld==true))
				 {
					if (vRef<80*16)
					vRef+=16; 
				 }
				 
				 if ((bTmpDown==false)&&(bTmpDownOld==true))
				 {
					if (vRef>30*16)
					vRef-=16; 
				 }
				 
				/*LED 7 segment setting*/
				if ((flgSelLED)==true)
				{
					flgSelLED=false;
					GPIO_WriteLow(GPIOB, GPIO_PIN_3);
					GPIO_WriteHigh(GPIOB, GPIO_PIN_6);
					GPIO_Write(CODEPORT,Num[(stMode?((vADC>>4)%10):((vRef>>4)%10))]);
				}
				else
				{ 
					flgSelLED=true;
					GPIO_WriteLow(GPIOB, GPIO_PIN_6);
					GPIO_WriteHigh(GPIOB, GPIO_PIN_3);
					GPIO_Write(CODEPORT,Num[(stMode?((vADC>>4)/10):((vRef>>4)/10))]);
				}
					 
			 }
			 
             cntModeOld = cntMode;
		
			 /* 5s call once */
			 if (cntOS==300)  //100
			 {       
				if ((flgTongle)==true)
				{
					flgTongle=false;
					GPIO_WriteHigh(GPIOD, GPIO_PIN_4);
				}
				else
				{ 
					 flgTongle=true;
					 GPIO_WriteLow(GPIOD, GPIO_PIN_4);
				}
				//GPIO_WriteReverse(GPIOB, GPIO_PIN_2);
				/* PID */
				_tmp = OneWire_GetTemp();
				/* Validate the temperature  sensor value */
				if (( _tmp>=(tmpOld-ADC_DELTA))&&(_tmp <= (tmpOld+ADC_DELTA)))
				{
					vADC = _tmp;
					
					/*12 bit */
					/* Resolution 1/16 = 0.0625 */
					/* 50 grad C = 60 * 16 = 960 */
				
					if ((vADC >= (vRef-8))&&(vADC <= (vRef+8)))
					{
						//Kp = 0;
					}
					else
					{
						//Kp = 20;
					}
					vDuty = (PID_Calc(vADC,vRef));
					//Delay_us(10);
					PWM_SetDuty_Freq(TIM3_PRESCALER_2,vDuty);
				}
                tmpOld = _tmp;				
	
						
#ifdef DEBUG
					 
				if(_tmp!= 0)
				{
				  sprintf(chBufTEMP,"Temp -vDuty: %d (%d.%d) - %d\r\n",_tmp,_tmp>>4,(uint16_t) (((uint8_t)(_tmp&0x0f))*625),vDuty);
				  SendStrUART(chBufTEMP);
				}
				else	//FAIL to get temperature from ds18b20: LED is OFF and 'x' is sent via UART
				{
				  //PWM_SetDuty_Freq(TIM3_PRESCALER_8,100);
				  UART2_SendData8('x');
				  while(!UART2_GetFlagStatus(UART2_FLAG_TC));
				}
#endif	
				cntOS = 0;
			  }
			 
	  bTmpUpOld = bTmpUp;
	  bTmpDownOld = bTmpDown;
	  flgTrig=0;
	}//flgTrig
	
   }//while 1
}

INTERRUPT_HANDLER(TLI_IRQHandler, 0)
{
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
	TIM3_SetCounter(0);
    TIM3_Cmd(DISABLE);

	TIM3_Cmd(ENABLE);
}


void delay(void)
{
  int i,j;
  for (i=0;i<1270;i++)
    for(j=0;j<10;j++)
    {
      j++;
      //led_scan();
    }
}
