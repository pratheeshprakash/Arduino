#include <EEPROM.h>
int temp;
unsigned long first_song_length  = 3000;//50000;
unsigned long second_song_length = 3000;//110000;
unsigned long third_song_length  = 3000;//60000;
int button_press_delay=150;
int button_press_length=50;
int p=0;
void setup()
{
  pinMode(10,OUTPUT);// pause button
  pinMode(11,OUTPUT);//previous button
  pinMode(12,OUTPUT);// next button
  
  initialise();
  Serial.begin(9600);
  delay(4000);
  if(EEPROM.read(1)==1)
  {
  repeat(200);
  play_first_once();
  }
 else
 { 
  play_first_once();
 }
}

void loop()
{
  if(p==0)
  {
  play_third_once();
  p=1;
  }
//loop_second(second_song_length);
}



void play_first_once()
{
temp=EEPROM.read(1);

  while(temp>1)
  {
  press_previous();
  temp--;
  EEPROM.write(1,temp);
  delay( button_press_delay);
  }

EEPROM.write(1,1);

//Serial.println("Playing first song");

play_once(first_song_length);
}

void play_third_once()
{
temp=EEPROM.read(1);
  while(temp<3)
  {
  press_next();
  temp++;
  EEPROM.write(1,temp);
  delay( button_press_delay);
  }
  
EEPROM.write(1,3);

//Serial.println("Playing third song");

play_once(third_song_length);
}

void loop_second(unsigned long length)
{
  temp=EEPROM.read(1);
  if(temp==1)
   { 
    press_next();
    EEPROM.write(1,2);
    delay(length); 
   }
  else if(temp==3)  
   { 
    press_previous();
    EEPROM.write(1,2);
    delay(length); 
    }
  else if(temp==2)
  {
   //Serial.println("Playing second song");  
   repeat(length);
  }
}

void play_once(unsigned long length)
{
  delay(length);
  press_play();
}

void repeat(unsigned long dly)
{
 press_previous(); 
 delay(300);
 press_next();
 delay(dly);  
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
 delay(button_press_length);
 digitalWrite(12,HIGH);
 delay( button_press_delay);
}

void press_previous()
{
 digitalWrite(11,LOW);
 delay(button_press_length);
 digitalWrite(11,HIGH);
 delay( button_press_delay);
}

void press_play()
{
 digitalWrite(10,LOW);
 delay(button_press_length);
 digitalWrite(10,HIGH);
 delay( button_press_delay);
}



