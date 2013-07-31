#include <EEPROM.h>
void setup()
{
  pinMode(10,OUTPUT);// pause button
  pinMode(11,OUTPUT);//previous button
  pinMode(12,OUTPUT);// next button
  initialise();
 
}

void loop()
{
 press_next();
 delay(1000);
}


void initialise()
{
 EEPROM.write(1,1);
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

void play_once(double long length)
{
  delay(length);
  press_play();
}
void repeat(double long dly)
{
 press_previous(); 
 delay(400);
 press_next();
 delay(dly);  
}


