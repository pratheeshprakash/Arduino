
#include <LiquidCrystal.h>
// initialize the library with the numbers of the interface pins
char a[16]="olg",b[16],temp;// a stores value shown on first line of LCD and b on second line
                      // the format of sending is "<line number data[16]>"
LiquidCrystal lcd(4, 7, 8, 9, 12, 13);

void setup()
{
  Serial.begin(9600);
  lcd.begin(16, 2);
  lcd.print("hello, world!");
}
void loop()
{
  if(Serial.available()>0)
  {
  temp=Serial.read();
  if(temp=='<')
  {
   delay(3); 
   temp=Serial.read();
   if(temp=='1')
   {
   readlineone();
   lcd.setCursor(0, 0);
   lcd.print(a); 
   }
   else if(temp=='2')
   {
   readlinetwo();
   lcd.setCursor(0, 1);
   lcd.print(b);
   }
  }
 }
}

void readlineone()
{
  for(int i=0; i<16;i++)
   { 
    delay(3); 
    a[i]=Serial.read(); 
    if(a[i]=='>')
    {
     while(i<16)
     { 
     a[i]=' ';  
     i++;
     }
     break;
    }
   }
}
void readlinetwo()
{
  for(int i=0; i<16;i++)
   { 
    delay(3); 
    b[i]=Serial.read(); 
    if(b[i]=='>')
    {
     while(i<16)
     { 
     b[i]=' ';  
     i++;
     }
     break;
    }
   }
}
