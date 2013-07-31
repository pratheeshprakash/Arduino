void setup()
{
  pinMode(5,OUTPUT);
  pinMode(10,OUTPUT);
  pinMode(13,OUTPUT);
}

void loop()
{
 digitalWrite(13,!digitalRead(5));// put this bellow the next line to see changes in the program
 digitalWrite(5,!digitalRead(5));
 delay(500);
}
