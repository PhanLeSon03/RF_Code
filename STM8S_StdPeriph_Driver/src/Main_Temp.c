#if 0
     //GPIO_WriteReverse(GPIOD, GPIO_PIN_0);
            if (flgDongle)
            {
                cntDuty+=cntQuan;
            }
            else
            {
               cntDuty-=cntQuan;  
            }
            
            if(cntDuty>=330)
            {
                flgDongle=false;  
            }
            else if (cntDuty<=60)
            {
                flgDongle = true;
            }
            else
            {
                ; 
            }
#endif



//     		UART2_SendData8('0');
//		while(!UART2_GetFlagStatus(UART2_FLAG_TC));  

//_RCPos = (unsigned char)str2int(chBufUART);
         //_RCPos = cUART[0];
         /* RC Servo Update: Pin PB5 */
         //RCServo_Pos(_RCPos);   
        //if(cntOS%2 ==0)
        //{
            /* Duty Cycle ON*/
            //GPIO_WriteHigh(GPIOB, GPIO_PIN_5);
          	        //set Frequency =2Mhz
		//PWM_SetDuty_Freq(TIM3_PRESCALER_128,0);
        //}
        //else/* 20ms raster */
        //{
            /* Duty Cycle OFF*/
            //GPIO_WriteLow(GPIOB, GPIO_PIN_5);
          	        //set Frequency =2Mhz
		//PWM_SetDuty_Freq(TIM3_PRESCALER_128,2500);
        //}  

//Get String from UART
            /*
            GetStrUART(chBufUART,cUART,lenUART);
            lenUART = 0;
            SendStrUART(chBufUART);
            */
            
            //Test UART
            /*
            if(UART2_GetFlagStatus(UART2_FLAG_RXNE))
            {
                    if(UART2_ReceiveData8()=='m')
                    {
                            //send via UART
                            sprintf(chBufADC,"Temp: %d\r\n",GetLM35(ADC1_GetConversionValue()));
                            SendStrUART(chBufADC);
                            
                            TIM3_SetCompare2(50);
                    }
                    else if(UART2_ReceiveData8()=='h')
                    {
                            TIM3_SetCompare2(99);
                    }
                    else if(UART2_ReceiveData8()=='l')
                    {
                            TIM3_SetCompare2(10);
                    }
                    else
                    {
                            TIM3_SetCompare2(0);
                    }
            }
            */