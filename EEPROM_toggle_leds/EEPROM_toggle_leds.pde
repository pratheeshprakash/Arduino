#include <EEPROM.h>
int var=0;
void updateLED(int a)
{
  digitalWrite(11,bitRead(a,0));
  digitalWrite(12,bitRead(a,1));
  digitalWrite(13,bitRead(a,2));
}
void setup()
{
  pinMode(11,OUTPUT);
  pinMode(12,OUTPUT);
  pinMode(13,OUTPUT);
  pinMode(7,INPUT);
  pinMode(8,INPUT);
  pinMode(9,INPUT);
  digitalWrite(7,HIGH);
  digitalWrite(8,HIGH);
  digitalWrite(9,HIGH);
  var=EEPROM.read(0);
}

void loop()
{int temp;
 if(digitalRead(7)==0)
 {
    temp=bitRead(var,0);
    bitWrite(var,0,!temp);
    delay(200);
 }
 if(digitalRead(8)==0)
 {
    temp=bitRead(var,1);
    bitWrite(var,1,!temp);
    delay(200);
 }
 if(digitalRead(9)==0)
 {
    temp=bitRead(var,2);
    bitWrite(var,2,!temp);
    delay(200);
 }
EEPROM.write(0,var);
updateLED(var);
}
