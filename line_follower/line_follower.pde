void setup()
{
  pinMode(5,OUTPUT);// motors 
  pinMode(6,OUTPUT);
  pinMode(10,OUTPUT);
  pinMode(11,OUTPUT);  
  
  pinMode(2,INPUT);// right sensor
  pinMode(3,INPUT);// left sensor
}

void loop()
{
  if(digitalRead(2)==1 &&  digitalRead(3)==1)
  {
    digitalWrite(5,HIGH);
    digitalWrite(6,LOW);
    digitalWrite(10,HIGH);
    digitalWrite(11,LOW);
  }
  else if(digitalRead(2)==1 &&  digitalRead(3)==0)
  {
    digitalWrite(5,HIGH);
    digitalWrite(6,LOW);
    digitalWrite(10,LOW);
    digitalWrite(11,LOW);
  
  }
  else if(digitalRead(2)==0 &&  digitalRead(3)==1)
  {
    digitalWrite(5,LOW);
    digitalWrite(6,LOW);
    digitalWrite(10,HIGH);
    digitalWrite(11,LOW);
  
  }
  
  
  
}
