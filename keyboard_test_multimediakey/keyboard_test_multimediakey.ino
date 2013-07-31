void setup()
{
  Serial.begin(9600);
  Keyboard.begin();
}

void loop()
{
 for(int i=129;i<255;i++)
 {
  Keyboard.write(i)
 Serial.print(i)
delay(200); 
 }
}
