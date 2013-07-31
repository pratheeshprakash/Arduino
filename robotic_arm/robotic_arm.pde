int x,y;
void setup()
{
  pinMode(2,OUTPUT); //
  pinMode(3,OUTPUT); // Base motor anticlockwise 2 high 3 low
  pinMode(8,OUTPUT);//
  pinMode(9,OUTPUT);//
  pinMode(10,OUTPUT);//
  pinMode(11,OUTPUT);//
  pinMode(12,OUTPUT);//
  pinMode(13,OUTPUT);//
  pinMode(A5,INPUT);// switch for gripper
  digitalWrite(A5,HIGH);
  pinMode(A4,INPUT);// switch for gripper
  digitalWrite(A4,HIGH);

}

void loop()
{
  x=analogRead(A0);
  y=analogRead(A2);
  if(digitalRead(A5)==LOW)
  {
  digitalWrite(12,HIGH);
  digitalWrite(13,LOW);
  }
  else if(digitalRead(A4)==LOW)
  {
  digitalWrite(12,LOW);
  digitalWrite(13,HIGH);
  }
  else
  {
  digitalWrite(12,LOW);
  digitalWrite(13,LOW);
  }
  
  if(x>900)
  {
  digitalWrite(2,HIGH);
  digitalWrite(3,LOW);
  delay(5);
  digitalWrite(2,LOW);
  digitalWrite(3,LOW);
  delay(5);
  }
  else if(x<100)
  {
  digitalWrite(2,LOW);
  digitalWrite(3,HIGH);
  delay(5);
  digitalWrite(2,LOW);
  digitalWrite(3,LOW);
  delay(5);
  }
  else 
  {
  digitalWrite(2,LOW);
  digitalWrite(3,LOW);
  }
  
  if(y>900)
  {
  digitalWrite(8,HIGH);
  digitalWrite(9,LOW);
  delay(5);
  digitalWrite(8,LOW);
  digitalWrite(9,LOW);
  delay(5);
  }
  else if(y<100)
  {
  digitalWrite(8,LOW);
  digitalWrite(9,HIGH);
   delay(5);
  digitalWrite(8,LOW);
  digitalWrite(9,LOW);
  delay(5);
  }
  else 
  {
  digitalWrite(8,LOW);
  digitalWrite(9,LOW);
  }
}
  

