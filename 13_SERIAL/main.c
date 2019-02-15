#include<pic.h>
#include "lcd.h"
#include "sci.h"
#include "delay.h"
void main()
{
	sci_init(25);
	lcd_init();
	lcd_clear();
	lcd_puts("serial data");
	sci_puts("serial");	
	while(1)
	{
		char x=sci_getch();
		sci_putch(x);		
		lcd_goto(2,0);
		lcd_putch(x);	
	}
}