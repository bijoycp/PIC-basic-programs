/* 
 * File:   main.c
 * Author: VAIO
 *
 * Created on 5 August, 2014, 10:02 AM
 */

#include <stdio.h>
#include <stdlib.h>
#include <pic.h>
#include "lcd.h"
#include "adc.h"
#include "i2c.h"
#define _XTAL_FREQ 20000000
#define WATER_PUMP RB0
#define BUZZER RC0
#define LIGHTS RC5
#define DEVICE_ADDRESS 0XD0

unsigned char rtc_read(unsigned char reg_address);
void pwm1_init();

void main()
{
    int count = 0;
    unsigned int i;
    unsigned int j;
    unsigned char moisture;
    unsigned char light_int;
    unsigned char a, a1, a2, a3, b, b1, b2, b3, c, c1, c2, c3;
    int f1=0,flag2=0;
    PORTD = 0X00;
    TRISA0 = 1;			// MOISTURE
    TRISA1 = 1;			// LDR
    TRISB = 0X00;		// B0 WATER PUMP
    TRISC0 = 0;			// BUZZER
    TRISC5 = 0;			// LIGHTS
    lcd_init();
    adc_init();
    i2c_init();
    pwm1_init();
    BUZZER=1;
    __delay_ms(1000);
    BUZZER=0;
    /*for(count=0;count<55;count+=5)
    {
	    CCPR1L=count;
	    __delay_ms(500);
    }*/
    lcd_goto(1,0);
    while (1)
    {
        i = read_adc(0);
        j = read_adc(1);
        moisture = (char) (i * 0.00488);
        light_int = (char) (j * 0.00488);
        
        //A3 HOUR
        a = rtc_read(0X02);
        a1 = (a >> 4)&0X0f;
        a2 = a & 0X0f;
        a3 = (a1 * 10) + a2;
        lcd_putch(a3 / 10 + 0x30);
        lcd_putch(a3 % 10 + 0x30);
        lcd_putch(':');
        
        //B3 MINUTE
        b = rtc_read(0X01);
        b1 = (b >> 4)&0X0f;
        b2 = b & 0X0f;
        b3 = (b1 * 10) + b2;
        lcd_putch(b3 / 10 + 0x30);
        lcd_putch(b3 % 10 + 0x30);
        lcd_putch(':');
        
        //C3 SECONDS
        c = rtc_read(0x00);
        c1 = (c >> 4)&0X0f;
        c2 = c & 0X0f;
        c3 = (c1 * 10) + c2;
        lcd_putch(c3 / 10 + 0x30);
        lcd_putch(c3 % 10 + 0x30);
        
        // SOIL MOISTURE SENSING
        if(moisture>2&&f1==0)
    	{
	    	WATER_PUMP=1;
	    	f1=1;
    	}
    	else if(moisture<2&&f1==1)
    	{
	    	WATER_PUMP=0;
	    	f1=0;
    	}
    	
    	// BUZZER 
    	if((c3>10)&&(c3<=20))
    	{
	    	BUZZER=1;
    	}  
        else
        {
	        BUZZER=0;
        }
        
        // LIGHT INTENSITY 
        if (light_int < 2)
        {
             LIGHTS = 1;
			 CCPR1L = 15;
        }
		else if(light_int > 2)
		{
			CCPR1L=0;
		}
		if((c3>=30)&&(c3<=35)&&(light_int < 2))
		{
			LIGHTS = 0;
		}  
       __delay_ms(850);
       lcd_clear();
    }
}    
    


unsigned char rtc_read(unsigned char reg_address)
{
    unsigned char data;
    i2c_start();
    i2c_write(DEVICE_ADDRESS);
    i2c_write(reg_address);
    i2c_restart();
    i2c_write(DEVICE_ADDRESS + 1);
    data = i2c_read();
    i2c_nack();
    i2c_stop();
    return data;
}
void pwm1_init()
{
    CCP1CON = 0B00001111;
    PR2 = 0X3F;
    CCPR1L = 0x00;
    TRISC2 = 0;
    T2CON = 0B00000100;
}
 