#include<pic.h>
#include"delay.h"
void pic_ini(void);

#define switch1 RB0
void main()
{
	TRISC=0x08;
	PORTB=0x00;
	TRISD=0X00;
	PORTD=0x00;
	
	while(1)
	{
		if(switch1==1)
		{
			while(switch1==1);
			PORTD=PORTD<<1;
			if(PORTD==0)
			{
				PORTD=0X01;
			}			
		}
	} 	
}
