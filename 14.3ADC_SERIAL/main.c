#include<pic.h>
#include"delay.h"
#include"sci.h"
#include"lcd.h"
#include"adc.h"

unsigned int ADC_value = 0;
unsigned int digit1, digit2, digit3, digit4;

void main()
{
	int adcv;
	//lcd_init();
	sci_init(25);
	adc_init();
	//lcd_goto(1,0);
	//lcd_puts("adc");
	//sci_puts("adc");
	sci_puts("adc_started");
	while(1)
	{		
		ADC_value=read_adc(0);
		
		digit1 = (unsigned int)(ADC_value/1000);									 // Calculate digit1 of ADC_value
		digit2 = (unsigned int)((ADC_value - digit1*1000)/100);						 // Calculate digit2 of ADC_value
		digit3 = (unsigned int)((ADC_value - (digit1*1000+digit2*100))/10);			 // Calculate digit3 of ADC_value
		digit4 = (unsigned int)(ADC_value - (digit1*1000+digit2*100+digit3*10));	 // Calculate digit4 of ADC_value
		sci_puts("adc:");		
		sci_putch(digit1+0x30);		// Display digit1 of ADC_value on LCD
		sci_putch(digit2+0x30);		// Display digit2 of ADC_value on LCD
		sci_putch(digit3+0x30);		// Display digit3 of ADC_value on LCD
		sci_putch(digit4+0x30);		// Display digit4 of ADC_value on LCD
		//sci_puts("\n");
		delay(1);
	}
	sci_puts("adc_ended");
}
