#include "stm8l15x_spi.h"
#include "stm8l15x_gpio.h"
#include "stm8l15x_clk.h"
#include "NRF_24L01_P_Driver.h"
#include "System_Init.h"
#include "global_variable.h"
uint8_t rx_data_buffer[32];
void main( void )
{
  Clk_Init();
  NRF_GPIO_Init();
  /////////read and set PWR_UP = 1 for standby mode 1/////////
  NRF24L01_SPI_INIT();
  NRF_Power_Up();
//  GPIO_SetBits(NRF24L01P_PIN,NRF_CE_PIN);
//  GPIO_ResetBits(NRF24L01P_PIN,NRF_CSN_PIN);//////chip select enable/////
//  NRF24L01_SPI_RW_Status_Reg(R_REGISTER_CMD,CONFIG_REG,1,rx_data_buffer);/////read status register
  GPIO_SetBits(NRF24L01P_PIN,NRF_CSN_PIN);//////deselect chip select pin///////
  SPI_Cmd(SPI1,DISABLE);
  
  while(1)
  {
  }
	  
	 
}
