char temp;
void setup()
{
  pinMode(13,OUTPUT);
  Serial.begin(9600);
  
}

void loop()
{
  if(Serial.available()>0)
  {
    temp=Serial.read();
    if(temp=='a' || temp=='A')
    {
      digitalWrite(13,!digitalRead(13));
    }
  }
}
  
