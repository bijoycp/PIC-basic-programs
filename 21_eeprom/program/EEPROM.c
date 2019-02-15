#include<htc.h>
#include"EEPROM.h"

void eeprom_write1(unsigned char adrs,unsigned char data)
{
 EEADR=adrs;      // EEPROM Address Register Low Byte
 EEDATA=data;   // EEPROM Data Register Low Byte
 EEPGD=0;       //Program/Data EEPROM Select bit : 0 = Accesses data memory
 WREN=1;        // EEPROM Write Enable bit
 EECON2=0X55;    //initiate write sequence 
 EECON2=0xAA;    //initiate write sequence
 WR=1;           //initiate write sequence
 WREN=0;          //EEPROM Write Enable bit
 while(WR);        //Write Control bit : 1 = Initiates a write cycle : 0 = Write cycle to the EEPROM is complete
}
unsigned char eeprom_read1(unsigned char adrs)
{
 EEADR=adrs;         // EEPROM Address Register Low Byte
 EEPGD=0;           //Program/Data EEPROM Select bit : 0 = Accesses data memory
 RD=1;              // 1 = Initiates an EEPROM read;
 while(RD);         //RD is cleared in hardware
 return(EEDATA);    // eeprom data    
}