/* Program name : VLC media Player remote
   Created on: 3rd August 2012
   Created by: Pratheesh Prakash
   Email : pratheesh@roboinventions.com
     
   Presentation Start using power button: F5
   Page up using forward button
   Page down using reverse button
*/   
#include <IRremote.h>

int RECV_PIN = 8;

IRrecv irrecv(RECV_PIN);

decode_results results;

void setup()
{
  //Serial.begin(9600);
  irrecv.enableIRIn(); // Start the receiver
    Keyboard.begin();
}

void loop() {
  if (irrecv.decode(&results))
  {
    switch(results.value)
     { case 0xFFA25D:
       Keyboard.write(KEY_F5);// Press F5 presentation start and end
       break;

       case 0xFFA857:
       Keyboard.write(KEY_PAGE_UP);// page up
       break;
       
       case 0xFFE01F:
       Keyboard.write(KEY_PAGE_DOWN);// page down
       Keyboard.releaseAll();
       break;    
     }
    irrecv.resume(); // Receive the next value
  }
}
