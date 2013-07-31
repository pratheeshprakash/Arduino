volatile double long countl=0, countr=0, temp=0;
void setup()
{
  pinMode(5,OUTPUT);
  pinMode(6,OUTPUT);
  pinMode(10,OUTPUT);
  pinMode(11,OUTPUT);
  
  pinMode(16,INPUT);
  pinMode(17,INPUT);
  
  Serial.begin(9600); 
 attachInterrupt(0, leftcount, FALLING); 
 attachInterrupt(1, rightcount, FALLING); 
}

void loop()
{
  if(digitalRead(16)==0 && digitalRead(17)==0)
  {
    forward();
  }
  
  else if(digitalRead(16)==0 && digitalRead(17)==1)
  {
    right();
  }
  
  else if(digitalRead(16)==1 && digitalRead(17)==0)
  {
    left();
  }
  
  else if(digitalRead(16)==1 && digitalRead(17)==1)
  {
    rev(countr,2);
    turn90left(countr);
  }
  
  else
  {
    forward();
  }
 
}

void turn90left(int a)
{
  
 digitalWrite(5,HIGH);
  digitalWrite(6,LOW);
  digitalWrite(10,LOW);
  digitalWrite(11,HIGH);
  delay(500);
}

void forward()
{ digitalWrite(5,HIGH);
  digitalWrite(6,LOW);
  digitalWrite(10,HIGH);
  digitalWrite(11,LOW);  
}

void right()
{ digitalWrite(5,HIGH);
  digitalWrite(6,LOW);
  digitalWrite(10,LOW);
  digitalWrite(11,LOW);  
}

void left()
{ digitalWrite(5,LOW);
  digitalWrite(6,LOW);
  digitalWrite(10,HIGH);
  digitalWrite(11,LOW);  
}

void reverse()
{
  digitalWrite(5,LOW);
  digitalWrite(6,HIGH);
  digitalWrite(10,LOW);
  digitalWrite(11,HIGH);  
}
void rev(int a,int distance)
{
   
  reverse();
  delay(700);
}

void stopmotor()
{
  digitalWrite(5,LOW);
  digitalWrite(6,LOW);
  digitalWrite(10,LOW);
  digitalWrite(11,LOW);
 
}
void leftcount()
{
  countl++;
}
void rightcount()
{
  countr++;
}
