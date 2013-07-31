// First Example in a series of posts illustrating reading an RC Receiver with
// micro controller interrupts.
//
// Subsequent posts will provide enhancements required for real world operation
// in high speed applications with multiple inputs.
//
// http://rcarduino.blogspot.com/ 
//
// Posts in the series will be titled - How To Read an RC Receiver With A Microcontroller

// See also http://rcarduino.blogspot.co.uk/2012/04/how-to-read-multiple-rc-channels-draft.html  
#include <EEPROM.h>

int temp;
unsigned long first_song_length  = 50000;
unsigned long second_song_length = 110000;
unsigned long third_song_length  = 60000;
int button_press_delay=200;
int button_press_length=50;
int p=0;

#define THROTTLE_SIGNAL_IN 0 // INTERRUPT 0 = DIGITAL PIN 2 - use the interrupt number in attachInterrupt
#define THROTTLE_SIGNAL_IN_PIN 2 // INTERRUPT 0 = DIGITAL PIN 2 - use the PIN number in digitalRead

#define NEUTRAL_THROTTLE 1500 // this is the duration in microseconds of neutral throttle on an electric RC Car

volatile int nThrottleIn = NEUTRAL_THROTTLE; // volatile, we set this in the Interrupt and read it in loop so it must be declared volatile
volatile unsigned long ulStartPeriod = 0; // set in the interrupt
volatile boolean bNewThrottleSignal = false; // set in the interrupt and read in the loop
volatile int mintrottle=1050;
// we could use nThrottleIn = 0 in loop instead of a separate variable, but using bNewThrottleSignal to indicate we have a new signal 
// is clearer for this first example

void setup()
{
  // tell the Arduino we want the function calcInput to be called whenever INT0 (digital pin 2) changes from HIGH to LOW or LOW to HIGH
  // catching these changes will allow us to calculate how long the input pulse is
  attachInterrupt(THROTTLE_SIGNAL_IN,calcInput,CHANGE);
  
  pinMode(10,OUTPUT);// pause button
  pinMode(11,OUTPUT);//previous button
  pinMode(12,OUTPUT);// next button
  initialise();
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
  p=1;
  Serial.begin(9600); 
}

void loop()
{
 // if a new throttle signal has been measured, lets print the value to serial, if not our code could carry on with some other processing
 if(bNewThrottleSignal)
 {

   Serial.println(nThrottleIn);  

   // set this back to false when we have finished
   // with nThrottleIn, while true, calcInput will not update
   // nThrottleIn
   
   //aaaaaaaaaaaaaaaaa line add aaaaaaaa
   if(nThrottleIn<mintrottle)
   nThrottleIn= mintrottle;
   else if (nThrottleIn>2000)
   nThrottleIn= 2000;
   
   if(nThrottleIn<=1200 && p!=1)
   {
     play_first_once();
     p=1;
   }
   else if(nThrottleIn>=1900 && p!=3)
   {
     play_third_once();
     p=3;
   }
   else if(nThrottleIn>=1300 && nThrottleIn<=1800)
   {
     loop_second(second_song_length);
     p=2;
   }
   bNewThrottleSignal = false;
   
 }

 // other processing ... 
}

void calcInput()
{
  // if the pin is high, its the start of an interrupt
  if(digitalRead(THROTTLE_SIGNAL_IN_PIN) == HIGH)
  { 
    // get the time using micros - when our code gets really busy this will become inaccurate, but for the current application its 
    // easy to understand and works very well
    ulStartPeriod = micros();
  }
  else
  {
    // if the pin is low, its the falling edge of the pulse so now we can calculate the pulse duration by subtracting the 
    // start time ulStartPeriod from the current time returned by micros()
    if(ulStartPeriod && (bNewThrottleSignal == false))
    {
      nThrottleIn = (int)(micros() - ulStartPeriod);
      ulStartPeriod = 0;

      // tell loop we have a new signal on the throttle channel
      // we will not update nThrottleIn until loop sets
      // bNewThrottleSignal back to false
      bNewThrottleSignal = true;
    }
  }
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




