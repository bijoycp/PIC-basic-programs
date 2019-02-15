#include<pic.h>
#include"delay.h"

void main()
{   
    TRISD=0x00;//port init
    PORTD=0x00;
    while(1)
    {
		 PORTD=0XFF;
		delay(1);
		 PORTD=0x00;
		delay(1);
	}
	}