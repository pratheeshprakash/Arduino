void setup()

{
  for(int i =0 ;i<=15;i++)
    {
      pinMode(i+2,OUTPUT);
    }
}

void loop()
{
  for(int i=0;i<8;i++)
  {
    digitalWrite(i+2,HIGH);
     for(int j=0;j<8;j++)
      {
        digitalWrite(j+10,HIGH);
      }
     delay(1);
    digitalWrite(i+2,LOW);
  }
  
}
