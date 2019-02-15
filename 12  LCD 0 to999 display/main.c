#include<htc.h>
#include "delay.h"
#include "lcd.h"
//__CONFIG(XT & WDTDIS & LVPDIS & DEBUGEN);

int count=0;
char disp1,disp10,disp100;

void main()
{
RD0=1;
 lcd_init();
 while(1)
 {
//lcd_goto(1,0);
//lcd_puts("fuck u all");DelayMs(255);
  disp100=count/100;
  disp10=(count/10)%10;
  disp1=count%10;
  lcd_goto(1,0);
  lcd_putch(disp100+'0');
  lcd_putch(disp10+'0');
  lcd_putch(disp1+'0');
  count++;
  DelayMs(255);
  if(count>999) count=0;
 }
}