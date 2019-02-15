#include<pic.h>
#include"delay.h"

void main()
{
	TRISD=0X00;
	PORTD=0X00;	
	while(1)
   {
		RD0=1;
		DelayMs(255);
		RD0=0;
		RD1=1;
		DelayMs(255);
		RD1=0;
		RD2=1;
		DelayMs(255);
		RD2=0;
		RD3=1;
		DelayMs(255);
		RD3=0;
		RD4=1;
		DelayMs(255);
		RD4=0;
		RD5=1;
		DelayMs(255);
		RD5=0;
		RD6=1;
		DelayMs(255);
		RD6=0;
		RD7=1;
		DelayMs(255);
		RD7=0;
   } 

}

