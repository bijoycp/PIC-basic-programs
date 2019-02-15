#include<pic.h>
#include"delay.h"

void interrupt_init(void);
void interrupt abc(void);

void main()
{
	TRISB=0XFF;
	PORTB=0X00;
	TRISD=0X00;
	PORTD=0X00;    
    interrupt_init();
	while(1)
	{
		RD0=1;
		DelayMs(100);
		RD0=0;
		DelayMs(100);
	}
}
	
void interrupt_init(void)
{
	GIE=1;	//Global Interrupt Enable bit : 1-enable
	INTE=1;	//Enables the RB0/INT external interrupt
	INTF=0;	//Disables the RB0/INT external interrupt
}

void interrupt abc(void)
{   
	GIE=0;			//Disables all interrupts
	if(INTF==1)
	{   
		INTF=0;		//Disables the RB0/INT external interrupt  
		RD1=1;
		DelayMs(100);
		RD1=0;	
	}
	GIE=1;		//Global Interrupt Enable bit : 1-enable
}