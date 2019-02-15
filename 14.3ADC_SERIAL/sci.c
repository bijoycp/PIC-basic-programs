
#ifndef _XTAL_FREQ
 //Unless specified elsewhere, 4MHz system frequency is assumed
 #define _XTAL_FREQ 4000000
#endif

#include <htc.h>
#include "sci.h"

void sci_init(unsigned int bd_rt)
{
 TX9=0;
 SYNC=0;
 BRGH=1;
 SPEN=1;// serial port enable
 RX9=0;
 CREN=1;// reception enable bit
 SPBRG=bd_rt;//baud rate selected
 RCIF=0;
 TXEN=1;//transmission enable bit
 TXIF=0;
 TXIE=0;	/* disable tx interrupts */
 RCIE=0;  /* disable rx interrupts */
}

void sci_putch(unsigned char byte)
{
 while(!TXIF)	/* set when register is empty */
 continue;
 TXREG=byte;
}

void sci_puts( const char * aa)
{
 while(*aa) 
 {
  sci_putch(*aa++);
  __delay_ms(15);
 }
}

unsigned char sci_getch(void)
{
 while(!RCIF)	/* set when register is not empty */
 continue;
 if(OERR==1)
 {
  CREN=0;
  CREN=1;
 }
 return RCREG;	/* RXD9 and FERR are gone now */
}

