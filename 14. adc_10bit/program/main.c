#include<pic.h>
#include <stdlib.h>
#include"delay.h"
#include"lcd.h"
#include"my_adc.h"

unsigned int adc_val=0;

char buf [4];

void main()
{
init_adc();
lcd_init();
lcd_goto(1,0);
lcd_puts("ADC VALUE");
while(1)
{
adc_val=read_adc(0);
itoa(buf,adc_val,10);
lcd_goto(2,0);
lcd_puts(buf);
DelayMs(200);
lcd_goto(2,0);
lcd_puts("              ");
}
}

