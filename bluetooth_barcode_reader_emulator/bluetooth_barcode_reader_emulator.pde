int a=0;
void setup()
{
  Serial.begin(9600);
  pinMode(7,INPUT);
  digitalWrite(7,HIGH);
  Serial.println("Starting");
}

void loop()
{
  if(digitalRead(7)==0)
  {
  Serial.println(a);
  delay(500);
  a++;
  }
}
