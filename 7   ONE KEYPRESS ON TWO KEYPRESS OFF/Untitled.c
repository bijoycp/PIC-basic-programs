#include<pic.h>
#include"delay.h"
void main()
{
	pic_ini();
	}
void pic_ini()
{
	TRISB0=1;
	PORTB0=0;
}