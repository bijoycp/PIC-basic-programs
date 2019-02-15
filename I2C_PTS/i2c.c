#include<htc.h>
#include"i2c.h"
void i2c_init(void)
{

    TRISC3 = 1; //SCL
    TRISC4 = 1; //SDA
    //SSPSTAT = 0X00; //slew rate disabled
    SSPCON = 0X28; //select i2c master mode & serial port enabled
    // SSPCON2 = 0X00;
    SSPADD = 9; //SSP address register SSPADD=(fosc/clk)-1
}
void i2c_start(void)
{
    SEN = 1; //start bit enabled
    while (SEN == 1);
    //    while (SEN);
}

void i2c_stop(void)
{
    PEN = 1; //stop bit enable
    while (PEN == 1);
}

void i2c_restart(void)
{

    RSEN = 1; //start bit enabled
    while (SEN == 1);
    //    while (SEN);
}

void i2c_write(unsigned char data)
{

    SSPBUF = data;
    i2c_Wait();
    //    SSPBUF = data;
    //    while (!SSPIF); //buffer full detect bit
    //    SSPIF = 0;
}

void i2c_address(int address)
{
    unsigned char address_l;
    unsigned char address_h;

    address_h = address >> 8;
    address_l = address & 0xFF;

    SSPBUF = address_h;
    i2c_Wait();
    SSPBUF = address_l;
    i2c_Wait();
}

void i2c_ack_r(void) //ack by master
{
    ACKDT = 0;
    ACKEN = 1;
    while (ACKEN);
    ACKEN = 0;

}

void i2c_ack_t(void)
{
    while (ACKSTAT); // ack by slave
    ACKSTAT = 1;

}

unsigned char i2c_read(void)
{

    char temp;
    RCEN = 1; //receive enable
    i2c_Wait();
    temp = SSPBUF;
    return temp;

}

void i2c_nack(void)
{
    ACKDT = 1;
    ACKEN = 1;
    while (ACKEN);

}

void i2c_Wait(void)
{
    SSPIF = 0;
    while (SSPIF == 0);
}
