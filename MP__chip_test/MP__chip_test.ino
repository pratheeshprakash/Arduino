#include <EEPROM.h>
int temp;
void setup()
{
  pinMode(10,OUTPUT);// pause button
  pinMode(11,OUTPUT);//previous button
  pinMode(12,OUTPUT);// next button
  initialise();
  Serial.begin(9600);
  delay(3000);
  repeat(2);
  play_first_once();
}

void loop()
{
  
}


void initialise()
{
 
 digitalWrite(10,HIGH);
 digitalWrite(11,HIGH);
 digitalWrite(12,HIGH);
}

void press_next()
{
 digitalWrite(12,LOW);
 delay(20);
 digitalWrite(12,HIGH);
}

void press_previous()
{
 digitalWrite(11,LOW);
 delay(20);
 digitalWrite(11,HIGH);
}

void press_play()
{
 digitalWrite(10,LOW);
 delay(20);
 digitalWrite(10,HIGH);
}

void play_first_once()
{
temp=EEPROM.read(1);

  while(temp>1)
  {
  press_previous();
  temp--;
  EEPROM.write(1,temp);
  delay(180);
  }

EEPROM.write(1,1);
play_once(3000);
}

void play_third_once()
{
temp=EEPROM.read(1);
  while(temp<3)
  {
  press_next();
  temp++;
  EEPROM.write(1,temp);
  delay(180);
  }
  
EEPROM.write(1,3);
play_once(90000);
}

void loop_second(unsigned int length)
{
  temp=EEPROM.read(1);
  if(temp!=2)
   { 
    while(temp<2)
    {
    press_next();
    temp++;
    EEPROM.write(1,temp);
    delay(180);
    }
    EEPROM.write(1,2);
   delay(length); 
   } 
 repeat(length);
}
void play_once(unsigned long length)
{
  delay(length);
  press_play();
}
void repeat(unsigned long dly)
{
 press_previous(); 
 delay(180);
 press_next();
 delay(dly);  
}


