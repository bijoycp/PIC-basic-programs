#include<pic.h>
#include"delay.h"

#define switch1 RC3
#define led RD0
int count=0;

void main()
{
	TRISC=0X0f;
	PORTC=0X00;
	TRISD=0X00;
	PORTD=0X00;
	while(1)
	{
		if(switch1==1)
		{
			while(switch1==1);
			//DelayMs(30);
			count++;
		}
		if(count==2)
		{
			count=0;
			led=!led;
		}
		
	}
}

