int m=35;                                        
void setup()
{
Keyboard.begin();
}

void loop()
{
 
while(1)
 {
   Keyboard.press(KEY_LEFT_ARROW);
  
   Keyboard.release(KEY_LEFT_ARROW);
  
   Keyboard.press(KEY_RIGHT_ARROW);
   
   Keyboard.release(KEY_RIGHT_ARROW);
  
 }


 Keyboard.end();
 while(1);
}

