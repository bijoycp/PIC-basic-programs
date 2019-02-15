#include<htc.h>
#include"MatrixKeypad.h"
#include"delay.h"

unsigned char read_keypad(void)
{
 KPD_ROW1=0;
 if(KPD_COLUMN1==0) {KPD_ROW1=1; return '7';}
 else if(KPD_COLUMN2==0) {KPD_ROW1=1; return '8';}
 else if(KPD_COLUMN3==0) {KPD_ROW1=1; return '9';}
 else if(KPD_COLUMN4==0) {KPD_ROW1=1; return 'A';}
 KPD_ROW1=1;

 KPD_ROW2=0;
 if(KPD_COLUMN1==0) {KPD_ROW2=1; return '4';}
 else if(KPD_COLUMN2==0) {KPD_ROW2=1; return '5';}
 else if(KPD_COLUMN3==0) {KPD_ROW2=1; return '6';}
 else if(KPD_COLUMN4==0) {KPD_ROW2=1; return 'B';}
 KPD_ROW2=1;

 KPD_ROW3=0;
 if(KPD_COLUMN1==0) {KPD_ROW3=1; return '1';}
 else if(KPD_COLUMN2==0) {KPD_ROW3=1; return '2';}
 else if(KPD_COLUMN3==0) {KPD_ROW3=1; return '3';}
 else if(KPD_COLUMN4==0) {KPD_ROW3=1; return 'C';}
 KPD_ROW3=1;

 KPD_ROW4=0;
 if(KPD_COLUMN1==0) {KPD_ROW4=1; return '.';}
 else if(KPD_COLUMN2==0) {KPD_ROW4=1; return '0';}
 else if(KPD_COLUMN3==0) {KPD_ROW4=1; return '#';}
 else if(KPD_COLUMN4==0) {KPD_ROW4=1; return 'D';}
 KPD_ROW4=1;

 return 0;
}