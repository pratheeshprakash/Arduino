#include <IRremote.h>

IRsend irsend;  
IRrecv irrecv(15);
decode_results results;

void setup()
{
  pinMode(9,OUTPUT); 
  Serial.begin(9600);
  digitalWrite(9,LOW);
  irrecv.enableIRIn();
  Serial.print("START");  
}


void loop()
{
  digitalWrite(9,LOW);
  if(irrecv.decode(&results))
   {   
     switch(results.value)
       {
         case 0x1FE48B7 :
          irsend.sendNEC(0x2FD48B7,32);
          Serial.print("pressed");
          irrecv.resume();
     delay(300);
   digitalWrite(9,LOW);
    
         break; 
       }
     
   } 
  
}

