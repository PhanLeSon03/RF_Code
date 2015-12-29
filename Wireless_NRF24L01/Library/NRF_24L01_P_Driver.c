#include "stm8l15x.h"
#include "NRF_24L01_P_Driver.h"
#include "global_variable.h"
#include "stm8l15x_syscfg.h"

  uint8_t temp=0xFF;
uint8_t XXX=0x0F;
void NRF_GPIO_Init(void)
{
  GPIO_DeInit(NRF24L01P_PIN);
  SYSCFG_REMAPDeInit();////deinit the remap pin to the reset value SPI1 MISO- MOSI- SCK- NSS(PB7- PB6- PB5- PB4)
  GPIO_Init(NRF24L01P_PIN,NRF_CE_PIN,GPIO_Mode_Out_PP_Low_Fast);
  GPIO_Init(NRF24L01P_PIN,NRF_CSN_PIN,GPIO_Mode_Out_PP_High_Fast);
  GPIO_Init(NRF24L01P_PIN,NRF_SCK_PIN,GPIO_Mode_Out_PP_High_Fast);
  GPIO_Init(NRF24L01P_PIN,NRF_MOSI_PIN,GPIO_Mode_Out_PP_Low_Fast);
  GPIO_Init(NRF24L01P_PIN,NRF_MISO_PIN,GPIO_Mode_In_PU_No_IT);
  GPIO_Init(NRF24L01P_PIN,NRF_IRQ_PIN,GPIO_Mode_In_PU_IT);
  GPIO_ExternalPullUpConfig(NRF24L01P_PIN,NRF_MISO_PIN,DISABLE);////disable external pull up for MISO_Pin  
}

void NRF24L01_SPI_INIT(void)
{
  SPI_Cmd(SPI1,DISABLE);
  SPI_DeInit(SPI1);
  SPI_Init(SPI1,SPI_FirstBit_MSB,SPI_BaudRatePrescaler_4,SPI_Mode_Master,
          SPI_CPOL_Low,SPI_CPHA_1Edge,SPI_Direction_2Lines_FullDuplex,SPI_NSS_Soft,0x07);
  SPI_Cmd(SPI1,ENABLE);
  
}

void NRF24L01_SPI_RW_Status_Reg(uint8_t comand_cmd, uint8_t reg_address, uint8_t byte,uint8_t *data)
{
  uint8_t i;
  uint8_t data_temp,dummy=0x00;

  
  
  if (byte>4)
    byte=4;
  
  if(comand_cmd==R_REGISTER_CMD)
  {
    comand_cmd=comand_cmd|reg_address;
    while(SPI_GetFlagStatus(SPI1,SPI_FLAG_TXE)==RESET)////TXE is set when Tx buffer is empty
      ;
    //sop1hc if(SPI_GetFlagStatus(SPI1,SPI_FLAG_TXE)==!RESET)
    //{
      SPI_SendData(SPI1,comand_cmd);
      //sop1hc: SPI_ClearFlag(SPI1,SPI_FLAG_TXE);
    //}
	  
     /* sop1hc: wait for RX Buffer full */
     while(SPI_GetFlagStatus(SPI1,SPI_FLAG_RXNE)==RESET)
     {
         ;   
     }
	 temp=SPI_ReceiveData(SPI1);
     
	 //sop1hc: SPI_ClearFlag(SPI1,SPI_FLAG_RXNE);
    for (i=0;i<byte;i++)
    {
      while(SPI_GetFlagStatus(SPI1,SPI_FLAG_TXE)==RESET)
        ;
      //if(SPI_GetFlagStatus(SPI1,SPI_FLAG_TXE)==!RESET)
      {
        SPI_SendData(SPI1,dummy);
        //SPI_ClearFlag(SPI1,SPI_FLAG_TXE);
      }
      *data=0;
	  
      /* sop1hc: wait for RX Buffer full */ 
      while(SPI_GetFlagStatus(SPI1,SPI_FLAG_RXNE)==RESET)
      {
		  ;
	  }
      *data=SPI_ReceiveData(SPI1);////check read flag/////
      //SPI_ClearFlag(SPI1,SPI_FLAG_RXNE);
       data++;
    }
  }
  
  if(comand_cmd==W_REGISTER_CMD)
  {
    
    comand_cmd=comand_cmd|reg_address;
    while(SPI_GetFlagStatus(SPI1,SPI_FLAG_TXE)==RESET)////TXE is set when Tx buffer is empty
    {
		;
	}
    //sop1hc while(SPI_GetFlagStatus(SPI1,SPI_FLAG_TXE)==!RESET)
    SPI_SendData(SPI1,comand_cmd);
	
    //sop1hc: SPI_ClearFlag(SPI1,SPI_FLAG_TXE);
    
	/* sop1hc: wait for RX Buffer full */
     while(SPI_GetFlagStatus(SPI1,SPI_FLAG_RXNE)==RESET)
     {
		 ;
     }
	 
	 /* sop1hc: copy data from SPI buffer */

     temp=SPI_ReceiveData(SPI1);
     //sop1hc: SPI_ClearFlag(SPI1,SPI_FLAG_RXNE);

    for (i=0;i<byte;i++)
    {
      data_temp=*data;
	  
	  /* Wait for Transmit completed */
      while(SPI_GetFlagStatus(SPI1,SPI_FLAG_TXE)==RESET)
	  {
        ;
	  }
	  
      //sop1hc: while(SPI_GetFlagStatus(SPI1,SPI_FLAG_TXE)==!RESET)
      SPI_SendData(SPI1,data_temp);
	  
      //sop1hc: SPI_ClearFlag(SPI1,SPI_FLAG_TXE);
	  
	  /* sop1hc: wait for RX Buffer full */
      while(SPI_GetFlagStatus(SPI1,SPI_FLAG_RXNE)==RESET)
      {
          ;
      }
	  
	   
        temp=SPI_ReceiveData(SPI1);
		
		//sop1hc: SPI_ClearFlag(SPI1,SPI_FLAG_RXNE);
      data++;
    }
  }
}

void NRF24L01_Read_Payload_CMD(uint8_t cmd, uint8_t byte, uint8_t *data)
{
  uint8_t i,dummy=0x00;
  if (byte>31)  byte=31;//////read 32 bytes only/////////
  while(SPI_GetFlagStatus(SPI1,SPI_FLAG_TXE)==RESET)
     ;
  SPI_SendData(SPI1,cmd);
  SPI_ClearFlag(SPI1,SPI_FLAG_TXE);
   while(SPI_GetFlagStatus(SPI1,SPI_FLAG_RXNE)==!RESET)
   {
        uint8_t temp=0;
        temp=SPI_ReceiveData(SPI1);
   }
   SPI_ClearFlag(SPI1,SPI_FLAG_RXNE);
  for(i=0;i<byte;i++)
  {
    while(SPI_GetFlagStatus(SPI1,SPI_FLAG_TXE)==RESET)
     ;
    while(SPI_GetFlagStatus(SPI1,SPI_FLAG_TXE)==!RESET)
      SPI_SendData(SPI1,dummy);
    SPI_ClearFlag(SPI1,SPI_FLAG_TXE);
    while(SPI_GetFlagStatus(SPI1,SPI_FLAG_RXNE)==!RESET)
      *data=SPI_ReceiveData(SPI1);
    SPI_ClearFlag(SPI1,SPI_FLAG_RXNE);
    data++;
  }
}

void NRF24L01_Write_TX_PAYLOAD_CMD(uint8_t cmd, uint8_t byte, uint8_t *data)
{
  uint8_t i;
  uint8_t data_temp;
  if (byte>31)  byte=31;  //////write 32 bytes only
  while(SPI_GetFlagStatus(SPI1,SPI_FLAG_TXE)==RESET)
     ;
  while(SPI_GetFlagStatus(SPI1,SPI_FLAG_TXE)==!RESET)
    SPI_SendData(SPI1,cmd);
  SPI_ClearFlag(SPI1,SPI_FLAG_TXE);
  while(SPI_GetFlagStatus(SPI1,SPI_FLAG_RXNE)==!RESET)
   {
        uint8_t temp=0;
        temp=SPI_ReceiveData(SPI1);
   }
   SPI_ClearFlag(SPI1,SPI_FLAG_RXNE);
  for(i=0;i<byte;i++)
  {
    data_temp=*data;
    while(SPI_GetFlagStatus(SPI1,SPI_FLAG_TXE)==RESET)
     ;
    while(SPI_GetFlagStatus(SPI1,SPI_FLAG_TXE)==!RESET)
      SPI_SendData(SPI1,data_temp);
    SPI_ClearFlag(SPI1,SPI_FLAG_TXE);
    while(SPI_GetFlagStatus(SPI1,SPI_FLAG_RXNE)==!RESET)
      {
        uint8_t temp=0;
        temp=SPI_ReceiveData(SPI1);
      }
    SPI_ClearFlag(SPI1,SPI_FLAG_RXNE);
    data++;
  }
}

void NRF24L01_FLUSH_CMD(uint8_t cmd)
{
    while(SPI_GetFlagStatus(SPI1,SPI_FLAG_TXE)==RESET)
     ;
     while(SPI_GetFlagStatus(SPI1,SPI_FLAG_TXE)==!RESET)    
      SPI_SendData(SPI1,cmd);
     SPI_ClearFlag(SPI1,SPI_FLAG_TXE);
     while(SPI_GetFlagStatus(SPI1,SPI_FLAG_RXNE)==!RESET)
      {
        uint8_t temp=0;
        temp=SPI_ReceiveData(SPI1);
      }
    SPI_ClearFlag(SPI1,SPI_FLAG_RXNE);
}

void NRF24L01_REUSE_TX_PL_CMD(uint8_t cmd)
{
    while(SPI_GetFlagStatus(SPI1,SPI_FLAG_TXE)==RESET)
     ;
    while(SPI_GetFlagStatus(SPI1,SPI_FLAG_TXE)==!RESET)
      SPI_SendData(SPI1,cmd);
    SPI_ClearFlag(SPI1,SPI_FLAG_TXE);
     while(SPI_GetFlagStatus(SPI1,SPI_FLAG_RXNE)==!RESET)
      {
        uint8_t temp=0;
        temp=SPI_ReceiveData(SPI1);
      }
    SPI_ClearFlag(SPI1,SPI_FLAG_RXNE);
}

void NRF24L01_R_RX_PL_WID_CMD(uint8_t cmd, uint8_t *data)
{
   while(SPI_GetFlagStatus(SPI1,SPI_FLAG_TXE)==RESET)
     ;
   SPI_ClearFlag(SPI1,SPI_FLAG_TXE);
   SPI_SendData(SPI1,cmd);
   while(SPI_GetFlagStatus(SPI1,SPI_FLAG_RXNE)==!RESET)////check read flag/////
    *data=SPI_ReceiveData(SPI1);
   SPI_ClearFlag(SPI1,SPI_FLAG_RXNE);
}

void NRF24L01_W_ACK_PAYLOAD(uint8_t cmd, uint8_t PPP, uint8_t byte, uint8_t *data)
{
  uint8_t i=0, dummy=0x00;
  if (byte >31) byte =31;
  if (PPP>5) PPP=5;
  cmd=cmd|PPP;
  while(SPI_GetFlagStatus(SPI1,SPI_FLAG_TXE)==RESET)
     ;
  while(SPI_GetFlagStatus(SPI1,SPI_FLAG_TXE)==!RESET)
    SPI_SendData(SPI1,cmd);
  SPI_ClearFlag(SPI1,SPI_FLAG_TXE);
  while(SPI_GetFlagStatus(SPI1,SPI_FLAG_RXNE)==!RESET)
      {
        uint8_t temp=0;
        temp=SPI_ReceiveData(SPI1);
      }
  SPI_ClearFlag(SPI1,SPI_FLAG_RXNE);

  for(i=0;i<byte;i++)
  {
    while(SPI_GetFlagStatus(SPI1,SPI_FLAG_TXE)==RESET)
     ;
    while(SPI_GetFlagStatus(SPI1,SPI_FLAG_TXE)==!RESET)
     SPI_SendData(SPI1,dummy);
    SPI_ClearFlag(SPI1,SPI_FLAG_TXE);
    while(SPI_GetFlagStatus(SPI1,SPI_FLAG_RXNE)==!RESET)////check read flag/////
      *data=SPI_ReceiveData(SPI1);
    SPI_ClearFlag(SPI1,SPI_FLAG_RXNE);
    data++;
  }
}

void NRF24L01_W_TX_PAYLOAD_NO_ACK_CMD(uint8_t cmd, uint8_t byte, uint8_t *data)
{
  uint8_t i=0, dummy=0x00;
  if (byte >31) byte =31;
  while(SPI_GetFlagStatus(SPI1,SPI_FLAG_TXE)==RESET)
     ;
  while(SPI_GetFlagStatus(SPI1,SPI_FLAG_TXE)==!RESET)
    SPI_SendData(SPI1,cmd);
  SPI_ClearFlag(SPI1,SPI_FLAG_TXE);
  while(SPI_GetFlagStatus(SPI1,SPI_FLAG_RXNE)==!RESET)
      {
        uint8_t temp=0;
        temp=SPI_ReceiveData(SPI1);
      }
   SPI_ClearFlag(SPI1,SPI_FLAG_RXNE);
  for(i=0;i<byte;i++)
  {
    while(SPI_GetFlagStatus(SPI1,SPI_FLAG_TXE)==RESET)
     ;
     while(SPI_GetFlagStatus(SPI1,SPI_FLAG_TXE)==!RESET)
      SPI_SendData(SPI1,dummy);
     SPI_ClearFlag(SPI1,SPI_FLAG_TXE);
     while(SPI_GetFlagStatus(SPI1,SPI_FLAG_RXNE)==!RESET)////check read flag/////
      *data=SPI_ReceiveData(SPI1);
    SPI_ClearFlag(SPI1,SPI_FLAG_RXNE);
    data++;
  }
}

void NRF24L01_NOP(uint8_t cmd)
{
  while(SPI_GetFlagStatus(SPI1,SPI_FLAG_TXE)==!RESET)
     ;
  while(SPI_GetFlagStatus(SPI1,SPI_FLAG_TXE)==!RESET)
    SPI_SendData(SPI1,cmd);
  SPI_ClearFlag(SPI1,SPI_FLAG_TXE);
   while(SPI_GetFlagStatus(SPI1,SPI_FLAG_RXNE)==!RESET)
   {
        uint8_t temp=0;
        temp=SPI_ReceiveData(SPI1);
   }
  SPI_ClearFlag(SPI1,SPI_FLAG_RXNE);
}
void NRF_Power_Up(void)
{
	  GPIO_SetBits(NRF24L01P_PIN,NRF_CE_PIN);/////set CE pin to low level////
	  
	  CONFIG_REG_Typedef config;
	  //*((uint8_t *)&config) = 0;
	  config.PWR_UP=1;
	  //config.CRCO=1;
	  GPIO_ResetBits(NRF24L01P_PIN,NRF_CSN_PIN);//////chip select enable/////
	  
	  /* 
	  void NRF24L01_SPI_RW_Status_Reg(uint8_t comand_cmd, uint8_t reg_address, uint8_t byte,uint8_t *data)
	  CONFIG_REG: 0x00 
	  W_REGISTER_CMD:????0x20 
	  byte: 1
	  
	  */
	  NRF24L01_SPI_RW_Status_Reg(W_REGISTER_CMD,CONFIG_REG,1,(uint8_t*)&config);
	  
	  NRF24L01_SPI_RW_Status_Reg(R_REGISTER_CMD,CONFIG_REG,1,(uint8_t*)&XXX);
	  
	  
	  GPIO_SetBits(NRF24L01P_PIN,NRF_CSN_PIN);//////deselect chip select pin///////
}