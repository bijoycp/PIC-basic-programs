#include<pic.h>
#include"lcd.h"
#include"delay.h"
//__CONFIG(XT & WDTDIS & LVPDIS & DEBUGEN);
void main()
{
	lcd_init();
	lcd_goto(1,0);
	lcd_puts("GEC Wayanad");
    lcd_goto(2,0);
	lcd_puts("WELCOME");	
    while(1);  	
}