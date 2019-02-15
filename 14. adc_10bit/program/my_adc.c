#include   <pic.h>
#include   "my_adc.h"
#include"delay.h"


void init_adc()
{
   ADCON0 = 0B01000001; //
   ADCON1 = 0B10000000;
   TRISA = 0XFF;
}



unsigned int read_adc(unsigned char channel)
{
   unsigned int adc_value=0;
   CHS2=0;CHS1=0;CHS0=0;
   ADCON0 = ADCON0|(channel << 3);
   DelayMs(50);
   GO = 1;
   while(GO);
   adc_value = ADRESH;
   adc_value = (adc_value << 8) | ADRESL;
   return(adc_value);
   
}


/*
void adc_ini(void)
{
 ADFM=0;  // left justified  six least significant bit of ADRESL  read as 0( A/D FORMAT SELECT BIT)
 ADCS2=0;ADCS1=0;ADCS0=0;//clock conversion  clock fre/2 selected
 PCFG3=0;PCFG2=0;PCFG1=0;PCFG0=0;//vref+ as AN3 VREF- as VSS (ADCON REGISTER)
 CHS2=0;CHS1=0;CHS0=0;// CHANNEL zero selected
 ADON=0; // adc module is shud off 
 ADGO=0;
}
 int adc_read(void)
{
 ADRESH=0X00;

 ADIF=0;// adc conversion flag
 ADON=1;// adc module on
 DelayMs(5);
 GO=1;//conversion starts
 while(GO==0);//waiting for convertion to 1
 
 DelayMs(10);
 return(ADRESH);
}
*/