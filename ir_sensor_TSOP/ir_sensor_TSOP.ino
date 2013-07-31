int a = 9;
void setup()
{
  
 pinMode(15,INPUT);
 pinMode(11,OUTPUT);
}

void loop()
{
  tone(9,38000);
if(digitalRead(15)==1)
 digitalWrite(11,HIGH);
else
 digitalWrite(11,LOW);
}
