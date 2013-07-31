#include <Servo.h>
Servo panservo,tiltservo;  // create servo object to control a servo 
int pan=0,tilt=0;
int panpos=90,tiltpos=90;
int marginpan=15, margintilt=15;
void setup()
{
  panservo.attach(3);  // attaches the servo on pin 9 to the servo object 
  tiltservo.attach(2);
  Serial.begin(9600);
}

void loop()
{
  pan=analogRead(A0)-analogRead(A2);
  tilt=analogRead(A1)-analogRead(A3);
  Serial.print(pan);
  Serial.print("  ");
  Serial.println(tilt);
  
  if(pan<=-marginpan)
  {
   panpos--;
   if (panpos<=0)
       panpos=0;
  }
  else if(pan>=marginpan)
  {
   panpos++;
   if(panpos>=180)
      panpos=180;
  }
  

  
 
 if(tilt<=-margintilt)
  {
   tiltpos++;
   if(tiltpos>=115)
   tiltpos=115;
  }
  else if(tilt>=margintilt)
  {
   tiltpos--;
   if (tiltpos<=30)
   tiltpos=30;
  }
  
   panservo.write(panpos);
   tiltservo.write(tiltpos);
 
  delay(10);
}
