
/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __STM8_ONEWIRE_H
#define __STM8_ONEWIRE_H

/* Includes ------------------------------------------------------------------*/
// Delay on timer 2, delay in block 10us

/* Contains the description of all STM8 hardware registers */
#include "stm8s.h"
#include <stdio.h>

#define 	Onewire_GPIOx       GPIOA		//Data wire in PD3
#define 	Onewire_GPIO_PIN    GPIO_PIN_4		//Data wire in PD3

/* OneWire commands */
#define ONEWIRE_CMD_RSCRATCHPAD			0xBE
#define ONEWIRE_CMD_WSCRATCHPAD			0x4E
#define ONEWIRE_CMD_CPYSCRATCHPAD		0x48
#define ONEWIRE_CMD_RECEEPROM				0xB8
#define ONEWIRE_CMD_RPWRSUPPLY			0xB4
#define ONEWIRE_CMD_SEARCHROM				0xF0
#define ONEWIRE_CMD_READROM					0x33
#define ONEWIRE_CMD_MATCHROM				0x55
#define ONEWIRE_CMD_SKIPROM					0xCC
#define ONEWIRE_CMD_CONVERTT				0x44

void Timer2_Init(void);
void Delay_us(uint16_t microsecond);
void Delay_1us(void);
void OneWire_Init(void);
void Onewire_SetHIGH(void);
void Onewire_SetLOW(void);
void Onewire_SetINPUT(void);
BitStatus Onewire_GetPIN(void);
uint8_t OneWire_Reset(void);
uint8_t OneWire_ReadBit(void);
uint8_t OneWire_ReadByte(void);
void OneWire_WriteBit(uint8_t bit);
void OneWire_WriteByte(uint8_t byte);
uint16_t OneWire_GetTemp(void);


#endif
