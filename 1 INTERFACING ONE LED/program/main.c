#include<pic.h> 	//pic hedder file 
 
void delay(int n);	//Function Declarations 

void main()
{
    TRISD=0x00; 	//PORTD initialize as output 0-output 1-input
    PORTD=0x00;		//clear the PORTD register 
    while(1)		//infinite while loop
    {
		RD0=1;		//set RD0 as 1 to on the led
		delay(1);	//call function delay for 1 		
		RD0=0;		//clear RD0 as 0 to off the led
		delay(1);	//call function delay for 1 

	}
}

void delay(int n)					//definition of delay function
{
	for(int i=0;i<n;i++)			//for loop for n times here n=1
		for(int j=0;j<100;j++)		//for loop for 100 times
		{
			
		}
}