
#ifndef _XTAL_FREQ
 //Unless specified elsewhere, 4MHz system frequency is assumed
 #define _XTAL_FREQ 20000000
#endif

#include <htc.h>
#include "lcd.h"

bit mode;

void lcd_init(void)
{
 lcd_data_dir=0;
 __delay_ms(100);
 RS=0;
 mode=0;
 E=0;
 //lcd_data=lcd_data&0X0F;
 lcd_data=(lcd_data&0X0F)|0x30;
 LCD_STROBE();
 lcd_data=(lcd_data&0X0F)|0x20;
 LCD_STROBE();
 send(0x28);
 send(0x08);
 send(0x01);
 send(0x06);
 send(0x80);
 send(0x0c);
}
void LCD_STROBE(void)
{
 E=1;
 __delay_ms(2);
 E=0;
}
void send(unsigned char x)
{
 char temp;
 temp=x;
 x=x&0XF0;
 lcd_data=(lcd_data&0X0F)|x;
 if (mode==0)
 RS=0;
 else
 RS=1;
 LCD_STROBE();
 x=temp;
 x=x<<4;
 x=x&0XF0;
 lcd_data=(lcd_data&0X0F)|x;
 if(mode==0)
 RS=0;
 else
 RS=1;
 LCD_STROBE();
}

void lcd_puts(const char * s)
{
	mode = 1;	// write characters
	while(*s)
    send(*s++);
}

void lcd_clear(void)
{
	mode = 0;
	send(0x01);
}
void lcd_putch(char c)
{
	mode = 1;	// write characters
	send( c );
}
void lcd_goto(unsigned char line, unsigned char pos)
{
 switch(line)
 {
  case 1:
  mode=0;
  send(0X80+pos);
  break;

  case 2:
  mode=0;
  send(0XC0+pos);
  break;

  case 3:
  mode=0;
  send(0X94+pos);
  break;

  case 4:
  mode=0;
  send(0XD4+pos);
  break;

  default:
  mode=0;
  send(0XD4+pos);
  break;
 }
}

void curser(unsigned char cur)
{
 mode=0;
 if(cur==1)
 send(0X0F);
 if(cur==0)
 send(0X0C);
}

void display_shift(void)
{
 mode=0;
 send(0B00011100);
}

void curser_shift_left(void)
{
 mode=0;
 send(0B00010000);
}

void curser_shift_right(void)
{
 mode=0;
 send(0B00010100);
}