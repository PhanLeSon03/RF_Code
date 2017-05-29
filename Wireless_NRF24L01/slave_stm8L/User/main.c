#include "stm8l10x.h"
#include "stm8l10x_gpio.h"
#include "rf24l01.h"
#include "stm8l10x_it.h"

void Init_Clock(void);
void WaitDelay(uint16_t Delay);
uint32_t GetTimeStamp(void);
void Init_TIM4(void);
void TxRF(void);
void RxRF(void);

#define RX_FI  3
#define TX_FI  1
#define TX_MAX 2
#define TX_RX_LEN 0x10
#define ST_TX 0
#define ST_RX 1
#define ST_WAIT 2
#define TX 1
#define RX 0

uint32_t GTimeStamp;
uint16_t cntTimeOut;
//Prepare the buffer to send from the data_to_send struct
uint8_t buffer_to_send[TX_RX_LEN];
uint8_t stRF = ST_RX;
uint8_t flgRFDir;

volatile uint8_t mutex;
__IO uint8_t flg10ms;
__IO uint8_t flg1s;

typedef struct _data_to_send {
  uint32_t add;
  uint32_t sub;
  uint32_t mult;
  uint32_t div;
} data_to_send;
data_to_send to_send;

typedef struct _data_received {
  uint32_t op1;
  uint32_t op2;
} data_received;
data_received received;

/*
RF24L01 connector pinout:
GND    VCC
CE     CSN
SCK    MOSI
MISO   IRQ

Connections:
  PB3 -> CE
  PB4 -> CSN
  PB7 -> MISO
  PB6 -> MOSI
  PB5 -> SCK

*/
#define RX_FI  3
#define TX_FI  1
#define TX_MAX 2

int main( void )
{
  Init_Clock();
  
  /* TIMER4 initialization for generic timebase */
  Init_TIM4();
  
  GPIO_Init(GPIOB,
            GPIO_Pin_2,
            GPIO_Mode_Out_PP_High_Fast);
  
  GPIO_ResetBits(GPIOB,GPIO_Pin_2);
  RF24L01_init();

  
  uint8_t rx_addr[5] = {0x04, 0xAD, 0x45, 0x98, 0x51};
  uint8_t tx_addr[5] = {0x44, 0x88, 0xBA, 0xBE, 0x42};
  //uint8_t tx_addr[5] = {0x34,0xc3,0x10,0x10,0x00};	//Receive address	
  //uint8_t rx_addr[5] ={0xC2,0xC2,0xC2,0xC2,0xC2};
  //uint8_t tx_addr[5] = {0x68,0x86,0x66,0x88,0x28};
  //uint8_t rx_addr[5] = {0x68,0x86,0x66,0x88,0x28};
  
  RF24L01_setup(tx_addr, rx_addr, 0);

  //IRQ
  GPIO_Init(
    GPIOC,
    GPIO_Pin_0,
    GPIO_Mode_In_FL_IT
  );
  
  EXTI_SetPinSensitivity(EXTI_Pin_0,EXTI_Trigger_Falling);
  enableInterrupts();
  

  /* Test LED and Delay */
  //for (uint8_t i=0; i< 10; i++)
  //{
  //    WaitDelay(500);
  //    if (i%2==0)
  //    {
  //        GPIO_ResetBits(GPIOB,GPIO_Pin_2);  
  //    }
  //    else
  //    {
  //        GPIO_SetBits(GPIOB,GPIO_Pin_2);  
  //    }
  //}
  //WaitDelay(100);
  
    uint8_t i = 0;
  for (i=0; i<32; i++)
  {
      buffer_to_send[i] = 0;
  }
  *((data_to_send *) &buffer_to_send) = to_send;
  
  while(1)
  {
      //10ms proc
      if (flg10ms==1)
      {
          flg10ms = 0;

      }

      //1s proc
      if (flg1s ==1)
      {
           flg1s = 0;
           switch (stRF)
           {
               case ST_TX: //sending
                   
                   TxRF();
                   stRF = ST_WAIT;
                   flgRFDir = TX;
                   break;

               case ST_RX: //receive
                   
                   RxRF();
                   flgRFDir = RX;
                   stRF = ST_WAIT;
                   break;
                   
                case ST_WAIT:
                    if (mutex==0)
                    {
                        //time-out can be implemented here
                    }
                    else if ((mutex==TX_FI)||(mutex==TX_MAX))
                    {

                        GPIO_ResetBits(GPIOB,GPIO_Pin_2);
                        stRF = ST_RX;
                        mutex=0;
                    }
                    else if (mutex==RX_FI)
                    {
                        GPIO_SetBits(GPIOB,GPIO_Pin_2);

                        //Get Data
                        uint8_t recv_data[32];
                        RF24L01_read_payload(recv_data, 32);
                        received = *((data_received *) &recv_data);

                        asm("nop"); //Place a breakpoint here to see memory

                        /* Encript data*/      
                        to_send.add  = received.op1 + received.op2;
                        to_send.sub  = received.op1 - received.op2;
                        to_send.mult = received.op1 * received.op2;
                        to_send.div  = received.op1 / received.op2;


                        //change to next state
                        stRF = ST_TX;
                        mutex=0;
                    }
                    else
                    {
                        ;
                    }
                    break;
               default:
                    break;
           }
           
      }
  }
}


//INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5) 
INTERRUPT_HANDLER(EXTI0_IRQHandler, 8)
{
  uint8_t sent_info;
  if (sent_info = RF24L01_was_data_sent()) 
  {
    //Packet was sent or max retries reached
    mutex = sent_info;
    RF24L01_clear_interrupts();
    EXTI_ClearITPendingBit (EXTI_IT_Pin0);
    return;
  }

  if(RF24L01_is_data_available())
  {
    //Packet was received
    mutex = 3;
    RF24L01_clear_interrupts();
    EXTI_ClearITPendingBit (EXTI_IT_Pin0);
    return;
  }
  
  
  RF24L01_clear_interrupts();
  EXTI_ClearITPendingBit (EXTI_IT_Pin0);
}

void Init_Clock(void)
{
   	CLK_PeripheralClockConfig((CLK_Peripheral_TIM4 |CLK_Peripheral_SPI), ENABLE);
	  /* Select fCPU = 16MHz */
    CLK_MasterPrescalerConfig(CLK_MasterPrescaler_HSIDiv1);
    /* For test purpose output Fcpu on MCO pin */
	//CLK_CCOConfig(CLK_Output_ClockMaster);
}

/** Wait a delay
  * @param[in] Delay based on timer Tick
  * @return None
  **/
void WaitDelay(uint16_t Delay)
{

    uint16_t DelayPeriodStart;
    uint16_t TimeStamp;
    uint16_t PeriodStamp;

    sim();
    DelayPeriodStart = (uint16_t)(GetTimeStamp());
    rim();

    while (1)
    {
        sim();
        TimeStamp = (uint16_t)(GetTimeStamp());
        rim();
        PeriodStamp = TimeStamp - DelayPeriodStart;
        if (PeriodStamp >= Delay)
        {
            return;
        }
    }

}

/** Get the Timer time stamp.
  * @param[in] None
  * @return the timer time stamp
  **/
uint32_t GetTimeStamp(void)
{
    return GTimeStamp;
}

/* General Purpose 5ms Time base */
void Init_TIM4(void)
{
    /* TimerTick = 1 ms
       Warning: fcpu must be equal to 16MHz
       fck_cnt = fck_psc/presc = fcpu/128 = 125kHz --> 1 tick every 8 µs
       ==> 1 ms / 8 µs = 125 ticks
     */
    TIM4_TimeBaseInit(TIM4_Prescaler_128, 125);

    TIM4_UpdateRequestConfig(TIM4_UpdateSource_Global);

    TIM4_ITConfig(TIM4_IT_Update, ENABLE);
    TIM4_Cmd(ENABLE);

}

INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 25)
 {
     GTimeStamp++;
     if (GTimeStamp % 10 == 0)
     {
         flg10ms = 1;  
     }

     if (GTimeStamp % 1000 == 0)
     {
         flg1s = 1;
     }
     
     TIM4_ClearFlag(TIM4_FLAG_Update);
 }

void TxRF(void)
{

    mutex = 0;
    RF24L01_set_mode_TX();
    RF24L01_write_payload(buffer_to_send, TX_RX_LEN);
}

void RxRF(void)
{
    mutex = 0;
    RF24L01_set_mode_RX();

}
