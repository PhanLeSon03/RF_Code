#include "stm8s_tim1.h"
#include "stm8s_tim2.h"
#include "stm8s_tim3.h"
#include "stm8s_uart2.h"
#include "stm8s_adc1.h"
#include "stm8s_it.h"
#include "stm8_onewire.h"
#include "Srb.h"

#include <stdbool.h>       /* For true/false definition */
#include <string.h>
#include <stdio.h>

#define LOCK    210         /* 2500 is maximum*/
#define UNLOCK  70          /* 70*/
#define SWTRAMPLOCK 2

#define ADCVINON     100
#define ADCVINOFF    80


#define U24_MAX  16777125
#define PWM_PERD 800000  /* 1Khz */
#define DT_INV   100   /* 10ms */

#define ADC_DELTA (16*20) 

#define CODEPORT    GPIOE

void CLK_Config(void);
void Timer1_Init(void);
void Timer2_Init(void);
void Timer3_Init(void);
void GPIO_Initial(void);
void ADC_Init(void);
void UART_Init(void);
void SendStrUART(char *Data);
void GetStrUART(char *Data,char *DataUARTbuff, int8_t DataLength);
char GetCharUART(void);
void PWM_SetDuty_Freq(TIM3_Prescaler_TypeDef PWM_Freq, int16 PWM_DutyCyle);
uint16_t GetLM35(uint16_t ADC_result );
int32 PID_Calc(int32 Inp,int32 Sp);
int str2int(char *str);

void RCServo_Init(void);
void RCServo_Pos(unsigned char Pos);
void PWMOut_Init(void);

#define LOCKPOS                                                                \
          if (cntDuty<LOCK)                                                    \
          {                                                                    \
             cntDuty+= SWTRAMPLOCK;                                            \
          }                                                                    \
                                                                               \
          if (cntDuty>LOCK)                                                    \
          {                                                                    \
             cntDuty= LOCK;                                                    \
          }                                                                    \
	      if (cntDutyOld!=cntDuty)                                             \
		  {                                                                    \
              PWM_SetDuty_Freq(TIM3_PRESCALER_128,cntDuty);                    \
		  }                                                                    \
		  if (cntDuty==LOCK)	{flgFinish = true;}                            \
			  

#define UNLOCKPOS                                       \
          /*Ramping */                                  \
          if (cntDuty>UNLOCK)                           \
          {                                             \
             cntDuty-= SWTRAMPLOCK;                     \
          }                                             \
                                                        \
          if (cntDuty < UNLOCK)                         \
          {                                             \
             cntDuty = UNLOCK;                          \
          }                                             \
  	      if (cntDutyOld!=cntDuty)                                             \
		  {                                                                    \
              PWM_SetDuty_Freq(TIM3_PRESCALER_128,cntDuty);                    \
		  }                                                                    \
          if (cntDuty==UNLOCK)	{flgFinish = true;}                            \
			  
            