#include<htc.h>
#include"delay.h"

#define LDR RD0

void main()
{
 TRISB=0;
 PORTB=0;
 TRISD=0XFF;
 while(1)
 {
  if(RD0==0)
  {
   RB0=0;
  } 
  else
  {
   RB0=1;
  }	 
 } 
}	