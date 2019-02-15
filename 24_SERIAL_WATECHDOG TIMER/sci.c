
#ifndef _XTAL_FREQ
 //Unless specified elsewhere, 4MHz system frequency is assumed
 #define _XTAL_FREQ 4000000
#endif

#include <htc.h>
#include "sci.h"

void sci_init(unsigned int bd_rt)
{
 TX9=0;   //0 = Selects 8-bit transmission
 SYNC=0;	//0 = Asynchronous mode
 BRGH=1; //High Baud Rate Select bit  1 = High speed
 SPEN=1;	// serial port enable
 RX9=0;  //0 = Selects 8-bit reception
 CREN=1;	// Continuous Receive Enable bit
 SPBRG=bd_rt;	//baud rate selected x=25 for 9600 =xt/(16(x+1))
 RCIF=0;   //USART Receive Interrupt Flag bit -  0 = The USART receive buffer is empty
 TXEN=1;	//transmission enable bit - 1 = Transmit enabled
 TXIF=0;	//USART Transmit Interrupt Flag bit - 0 = The USART transmit buffer is full
 TXIE=0;	/* USART Transmit Interrupt Enable bit - 0 = Disables the USART transmit interrupt*/
 RCIE=0;  /* USART Receive Interrupt Enable bit - 0 = Disables the USART receive interrupt*/
}

void sci_putch(unsigned char byte)
{
 while(!TXIF)	/* set when register is empty */
 continue;
 TXREG=byte;  // USART Transmit Data Register
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
 if(OERR==1)   //Overrun error (can be cleared by clearing bit CREN)
 {
  CREN=0;   //Continuous Receive Enable bit
  CREN=1;
 }
 return RCREG;	/* RXD9 and FERR are gone now */  //USART Receive Data Register
}

