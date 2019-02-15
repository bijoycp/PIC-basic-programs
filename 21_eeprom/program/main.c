#include<pic.h>
#include"delay.h"
#include"lcd.h"
#include"EEPROM.h"

#define switch1 RC3
#define switch2 RC4

unsigned char k=0;
void main()
{
TRISB=0X00;
PORTB=0X00;
TRISC=0X18;
PORTC=0X00;
lcd_init();
lcd_goto(1,0);
lcd_puts("EEPROM TEST");
while(1)
{
    lcd_goto(1,0);
    lcd_puts("EEPROM TEST");
    if(switch1==1)
    {
        while(switch1!=1);
    	eeprom_write(1,'C');
    	lcd_goto(2,1);
        lcd_puts("C WRITED");
        lcd_clear();        
    }
    if(switch2==1)
    {
        
        while(switch2!=1);
		lcd_clear();
        k=eeprom_read(1);    
    	lcd_goto(2,0);
        lcd_puts("                ");
    	lcd_goto(2,4);
        lcd_putch(k);
        lcd_goto(1,0);
        lcd_puts("EEPROM VALUE");
            
    }

}

}
