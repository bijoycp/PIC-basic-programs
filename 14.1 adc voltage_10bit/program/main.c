#include<pic.h>
#include <stdlib.h>
#include"delay.h"
#include"lcd.h"
#include"my_adc.h"
//void adc_ini(void);
// int adc_read(void);
unsigned int adc_val=0,v=0;
//int i;
char buf [4],buf1 [4];
float k=0;

void main()
{
init_adc();
lcd_init();
//lcd_clear();
lcd_goto(1,0);
lcd_puts("ADC VALUE");
while(1)
{
adc_val=read_adc(0);
itoa(buf,adc_val,10);
lcd_goto(2,0);
lcd_puts(buf);
k=(5*adc_val/1025);
itoa(buf,k,10);
lcd_goto(2,6);
lcd_puts(buf);
lcd_puts("V");
DelayMs(200);
lcd_goto(2,0);
lcd_puts("              ");
}
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