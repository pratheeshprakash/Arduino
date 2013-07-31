/* Program name : VLC media Player remote
   Created on: 3rd August 2012
   Created by: Pratheesh Prakash
   Email : pratheesh@roboinventions.com
   Changes in vlc player
   go to tools and preference 
   and hot keys and in Global put the following values
  
   Previous : F8
   Next     : F10
   Pause/Play:F9
   Volume up: F7   -----> note F12 doesnt seem to work
   Volume Down: F11
   Mute     : F6
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
     { 
       case 0x4FB32CD://Keyboard.press('m');//mute
       //Keyboard.releaseAll();
       Keyboard.write(KEY_F6);
       break;
       
       case 0x4FBD02F://Keyboard.press(' ');//pause
       //Keyboard.releaseAll();
       Keyboard.write(KEY_F9);
       break; 
       
       case 0x4FB30CF://Keyboard.press(KEY_LEFT_CTRL);
       //Keyboard.press(KEY_UP_ARROW); //Volume up
       //delay(100);
       //Keyboard.releaseAll();
       Keyboard.write(KEY_F7);
       break;
       
       case 0x4FBC03F://volume down
       //Keyboard.press(KEY_LEFT_CTRL);
       //Keyboard.press(KEY_DOWN_ARROW); 
       //delay(100);
       //Keyboard.releaseAll();
       Keyboard.write(KEY_F11);
       break;
       
       case 0x4FB00FF://fast forward
       Keyboard.press(KEY_LEFT_CTRL);
       Keyboard.press(KEY_RIGHT_ARROW); 
       delay(100);
       Keyboard.releaseAll();
       break;
       
       case 0x4FB807F://fast rewind
       Keyboard.press(KEY_LEFT_CTRL);
       Keyboard.press(KEY_LEFT_ARROW); 
       delay(100);
       Keyboard.releaseAll();
       break;
       
       case 0x4FB906F://forward
       Keyboard.press(KEY_LEFT_SHIFT);
       Keyboard.press(KEY_RIGHT_ARROW); 
       delay(100);
       Keyboard.releaseAll();
       break;
       
       case 0x4FB10EF://Rewind
       Keyboard.press(KEY_LEFT_SHIFT);
       Keyboard.press(KEY_LEFT_ARROW); 
       delay(100);
       Keyboard.releaseAll();
       break;
       
       
       
       case 0x4FB708F://Keyboard.press('p');//previous
       //Keyboard.releaseAll();
       Keyboard.write(KEY_F8);
       break;
       
       case 0x4FBB04F://Keyboard.press('n');//next
       //Keyboard.releaseAll();
       Keyboard.write(KEY_F10);
       break;
              
       case 0x4FB609F:Keyboard.press('f');//fullscreen
       Keyboard.releaseAll();
       break;
       
      
       
     }
    irrecv.resume(); // Receive the next value
  }
}
