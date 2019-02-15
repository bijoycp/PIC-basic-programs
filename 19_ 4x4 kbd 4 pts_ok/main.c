#include<htc.h>
#include "delay.h"
#include "lcd.h"
#include "MatrixKeypad.h"

unsigned char kpd_value;

void main()
{
	TRISB=0B00001111;
	PORTB=0XFF;
	nRBPU=0;	//0 = PORTB pull-ups are enabled by individual port latch values
	lcd_init();
	while(1)
	{
		lcd_goto(1,0);
		lcd_puts("press the key");
		kpd_value=read_keypad();
		if(kpd_value==0)
		{
			kpd_value=' ';
		}
		lcd_goto(2,0);
		lcd_putch(kpd_value);
		DelayMs(100);
		lcd_clear();
	}
}	