#include<pic.h>
#include"delay.h"

#define led RD0
void led_blink(void);

void main()
{
	TRISD=0x00; //port init
	PORTD=0x00;
  
    while(1)
    {

    	led_blink();

    }
}

void led_blink(void)
{

	led=1;
	DelayMs(55);
	led=0;
	DelayMs(55);

}