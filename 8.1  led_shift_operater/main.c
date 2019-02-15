#include<pic.h>
void main()
{
	int i=0;
	TRISD=0x00;
	PORTD=0x00;
	TRISC=0x04;
	PORTC=0x00;
	while(1)
	{
		if(RC3==1)
		{
			while(RC3==1);
			PORTD=1<<i;
			i++;
			if(i>7)
			{
				i=0;
			}
		}
	
	}

}