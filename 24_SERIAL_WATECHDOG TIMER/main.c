#include<pic.h>
#include "lcd.h"
#include "sci.h"
#include "delay.h"
 
void main()
{
    sci_init(25);
	sci_puts("serial");
	lcd_init();
	lcd_clear();
	lcd_puts("serial data");
	
	int c=0;
 	
	while(1)
	{
    	sci_putch(c+'0');    
    	asm("setwdt");      //set watchdog timer
		char x=sci_getch();
		asm("clrwdt");      //clear watchdog timer
		sci_putch(x);				
		lcd_goto(2,0);
		lcd_putch(x);
		lcd_putch(c+'0');
		c++;
		if(c==9)
		c=0;	
	}
}