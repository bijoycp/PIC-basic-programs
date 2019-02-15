#ifndef _XTAL_FREQ
 //Unless specified elsewhere, 4MHz system frequency is assumed
 #define _XTAL_FREQ 20000000
#endif

#include <htc.h>
#include "adc.h"

bit chs1,chs2,chs0;
    
void adc_init(void)
{    
 ADCON0=0B01000000;
 ADCON1=(0B00000000|(LEFTorRIGHT_JUSTIFIED<<7))|ADC_PIN_SELECT;
}	

unsigned int read_adc(unsigned char chnl) 
{
 ADCON0=0B01000000|(chnl<<3);
 ADIF=0;// adc conversion flag
 ADON=1;// adc module on
 __delay_ms(1);
 GO=1;//conversion starts
 while(ADIF==0);//waiting for adif to 1
 GO=0;
 __delay_ms(1);
 return((ADRESH<<8) | ADRESL); //10 Bit, LEFTorRIGHT_JUSTIFIED 1
 //return((ADRESH));   //8 Bit, LEFTorRIGHT_JUSTIFIED 0
}