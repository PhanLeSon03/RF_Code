/* Includes ------------------------------------------------------------------*/

#include "stm8_onewire.h"

void Timer2_Init(void)
{
	 // Reset ("de-initialise") TIM2.
    TIM2_DeInit();
    // 	Set TIM2 to use a prescaler of 16 (1Mhz = 1micro sec) and have a period of 999.
    TIM2_TimeBaseInit(TIM2_PRESCALER_1, 160);
}

void Delay_us(uint16_t microsecond)
{
		uint16_t _tDelayus;
		uint16_t _microsecond;
	
		_tDelayus = 160; 	
		_microsecond= microsecond/10;

		CLK->PCKENR1	|= 0x30;
		TIM2->CNTRH = 0;
		TIM2->CNTRL = 138;

    TIM2->ARRH = (uint8_t)(_tDelayus >> 8);
    TIM2->ARRL = (uint8_t)(_tDelayus);
		
		TIM2_ClearFlag(TIM2_FLAG_UPDATE);
		TIM2_Cmd(ENABLE);

		while(_microsecond--)
		{
			while(TIM2_GetFlagStatus(TIM2_FLAG_UPDATE) != SET);
			TIM2_ClearFlag(TIM2_FLAG_UPDATE);
		}

		TIM2_Cmd(DISABLE);
		CLK->PCKENR1	&= (~0x30);
}

void Delay_1us(void)
{
	int8_t _oneus;
	_oneus = 16;		//8
	while(_oneus--)
	{
		nop();				//1 nop() takes 1 clock cycles
	}
}

void OneWire_Init(void) 
{
	//DIO_Init			 	
	GPIO_Init(Onewire_GPIOx, Onewire_GPIO_PIN, GPIO_MODE_OUT_OD_LOW_FAST);
	/* Reset corresponding bit to GPIO_Pin in CR2 register */
        Onewire_GPIOx->CR2 &= (uint8_t)(~(Onewire_GPIO_PIN));
}

void Onewire_SetHIGH(void)
{
	//High level
	Onewire_GPIOx->ODR |= (uint8_t)Onewire_GPIO_PIN;
	// Set Output mode 
	Onewire_GPIOx->DDR |= (uint8_t)Onewire_GPIO_PIN;
}

void Onewire_SetLOW(void)
{
	//Low level
	Onewire_GPIOx->ODR &= (uint8_t)(~(Onewire_GPIO_PIN));
	// Set Output mode 
	Onewire_GPIOx->DDR |= (uint8_t)Onewire_GPIO_PIN;
}

void Onewire_SetINPUT(void)
{
	/* Set Input mode */
	Onewire_GPIOx->DDR &= (uint8_t)(~(Onewire_GPIO_PIN));
}

BitStatus Onewire_GetPIN(void)
{
	return ((BitStatus)(Onewire_GPIOx->IDR & (uint8_t)Onewire_GPIO_PIN));
}

uint8_t OneWire_Reset(void) 
{
	uint8_t _i;
	/* Line low, and wait 480us */
	Onewire_SetLOW();
	Delay_us(480);
	/* Release line and wait for 80us */
	Onewire_SetINPUT();
	Delay_us(60);
	/* Check bit value */
	_i = Onewire_GetPIN();
	/* Delay for 420 us */
	Delay_us(420);
	/* Return value of presence pulse, 0 = OK, 1 = ERROR */
	return _i;
}

uint8_t OneWire_ReadBit(void) 
{
	uint8_t _bit;
	_bit = 0;
	/* Line low */
	Onewire_SetLOW();
	Delay_1us();
	/* Release line */
	Onewire_SetINPUT();
	Delay_us(10);
	/* Read line value */
	if (Onewire_GetPIN()) {
		/* Bit is HIGH */
		_bit = 1;
	}
	/* Wait 45us to complete 60us period */
	Delay_us(30);
	/* Return bit value */
	return _bit;
}

uint8_t OneWire_ReadByte(void) 
{
	uint8_t _i, _byte;
	_i = 8;
	_byte = 0;
	while (_i--) 
	{
		_byte = _byte >> 1;
		_byte |= (OneWire_ReadBit() << 7);
		Delay_us(10);
	}
	return _byte;
}

void OneWire_WriteBit(uint8_t bit) 
{
	/* Set line low */
	Onewire_SetLOW();
	Delay_1us();
	
	/* If we want high bit */
	if ((bool) bit) {
		Onewire_SetINPUT();
		Delay_us(60);
	}
	else
	{
	/* Wait for 59 us and release the line */
	Delay_us(60);
	Onewire_SetINPUT();
	}
}

void OneWire_WriteByte(uint8_t byte) {
	uint8_t _i = 8;
	/* Write 8 bits */	
	while (_i--) 
	{
		// LSB bit is first 
		OneWire_WriteBit(byte & 0x01);
		byte >>= 1;
		Delay_us(10);
	}
}

uint16_t OneWire_GetTemp(void)
{
	//uint16_t _Temp_Dec;
	uint16_t _Temp;
	//int8_t _Temp_Dig;
	uint8_t _TempL;
	uint8_t _TempH;
	if(OneWire_Reset()==0)
	{
								
		OneWire_WriteByte(ONEWIRE_CMD_SKIPROM);
		OneWire_WriteByte(ONEWIRE_CMD_CONVERTT);
		while(!OneWire_ReadBit());
		OneWire_Reset();	
		OneWire_WriteByte(ONEWIRE_CMD_SKIPROM);
		OneWire_WriteByte(ONEWIRE_CMD_RSCRATCHPAD);
		_TempL=OneWire_ReadByte(); 
		_TempH=OneWire_ReadByte();
		OneWire_Reset();	
		//_Temp_Dig  = ((_TempL>>4)|((_TempH & 0x07)<<4)) ;
		//_Temp_Dec  = (_TempL & 0x0f) * 625;
		_Temp = (((uint16_t) ((_TempH & 0x07)<<8))|((uint16_t) _TempL));
		return _Temp;
	}
	else
	{
		return 0;		
	}
}