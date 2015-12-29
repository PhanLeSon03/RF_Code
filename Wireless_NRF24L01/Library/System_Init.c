#include "stm8l15x_gpio.h"
#include "stm8l15x_clk.h"
#include "stm8l15x_conf.h"

void Clk_Init(void)
{
  CLK_DeInit();
  CLK_HSEConfig(CLK_HSE_ON);
  CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_HSE);
  CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_1);
  CLK_PeripheralClockConfig(CLK_Peripheral_SPI1,ENABLE);
  CLK_HaltConfig(CLK_Halt_FastWakeup,ENABLE);
}

