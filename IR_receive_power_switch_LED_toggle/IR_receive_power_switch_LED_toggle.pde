#include <IRremote.h>

volatile int state=LOW;
IRrecv irrecv(15); //IR reciever connected to 15th pin
decode_results results;


void setup()
{
   irrecv.enableIRIn(); // Start the receiver
   pinMode(13,OUTPUT);
   Serial.begin(9600);
}

void loop()
{
   if (irrecv.decode(&results)) 
  {
    if(results.value == 33441975)
    {
    state=!state;
    }
    Serial.println(results.value, DEC);
irrecv.resume(); // Receive the next value  
}
  digitalWrite(13,state);
}
 
 
 
 
 
 
