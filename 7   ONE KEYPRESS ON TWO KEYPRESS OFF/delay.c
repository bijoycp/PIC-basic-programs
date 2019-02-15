/*
 *	Delay functions
 *	See delay.h for details
 *
 *	Make sure this code is compiled with full optimization!!!
 */

#include	"delay.h"

void
DelayMs(unsigned char cnt)
{
#if	XTAL_FREQ <= 2MHZ
	do {
		DelayUs(996);
	} while(--cnt);
#endif

#if    XTAL_FREQ > 2MHZ	
	unsigned char	i;
	do {
		i = 4;
		do {
			DelayUs(250);
		} while(--i);
	} while(--cnt);
#endif
}

void delay(unsigned int dly)
{
 unsigned int dly1;
 for(dly1=0;dly1<dly;dly1++)
 {
  DelayMs(98);
 }
}