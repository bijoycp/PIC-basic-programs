#include<pic.h>
#include"delay.h"
void main()
{
	TRISB=0X00;
	PORTB=0X00;
	while(1)
	{
		PORTB=0X40;//0	- 0 B 0100 0000
		DelayMs(200);
		PORTB=0XF9;//1	- 0 B 1111 1001
		DelayMs(200);
		PORTB=0XA4;//2  - 0 B 1010 0100
		DelayMs(200);
		PORTB=0XB0;//3  - 0 B 1011 0000
		DelayMs(200);
		PORTB=0X99;//4  - 0 B 1001 1001
		DelayMs(200);
		PORTB=0X92;//5
		DelayMs(200);
		PORTB=0X82;//6
		DelayMs(200);
		PORTB=0XF8;//7
		DelayMs(200);
		PORTB=0X00;//8
		DelayMs(200);
		PORTB=0X90;//9
		DelayMs(200);
			
	}
	
	}