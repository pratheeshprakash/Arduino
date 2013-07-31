volatile int jnc=0,trig=0;
void setup()
{
  pinMode(5,OUTPUT);
  pinMode(6,OUTPUT);
  pinMode(10,OUTPUT);
  pinMode(11,OUTPUT);
  pinMode(13,OUTPUT);
  pinMode(2,INPUT);
  pinMode(3,INPUT);
  pinMode(16,INPUT);
  pinMode(17,INPUT);
}

void loop()
{
  
  if(digitalRead(2)== 1 && digitalRead(3)==1)
      {
        digitalWrite(5,LOW);
        digitalWrite(6,HIGH);
        digitalWrite(10,LOW);
        digitalWrite(11,HIGH);
      }
  
  else if(digitalRead(2)== 0 && digitalRead(3)==1)
      {
        digitalWrite(5,LOW);
        digitalWrite(6,LOW);
        digitalWrite(10,LOW);
        digitalWrite(11,HIGH);
       }
  
  else if(digitalRead(2)== 1 && digitalRead(3)==0)
      {
        digitalWrite(5,LOW);
        digitalWrite(6,HIGH);
        digitalWrite(10,LOW);
        digitalWrite(11,LOW);
      }
 else if(digitalRead(2)== 0 && digitalRead(3)==0)     
      {
         digitalWrite(5,LOW);
        digitalWrite(6,HIGH);
        digitalWrite(10,LOW);
        digitalWrite(11,HIGH);
      
      }
  if(digitalRead(17)==0 || digitalRead(16)==0 )
    {
     if(trig==0) 
     { 
      jnc++;
      trig=1;
     }
      if(jnc==2)
      {
        digitalWrite(13,HIGH);
        digitalWrite(5,LOW);
        digitalWrite(6,LOW);
        digitalWrite(10,LOW);
        digitalWrite(11,HIGH);
        delay(1000);
        
      }
       else
       {

        digitalWrite(5,LOW);
        digitalWrite(6,HIGH);
        digitalWrite(10,LOW);
        digitalWrite(11,HIGH);
        delay(500);
       }
    }  
  else if(digitalRead(17)==1 && digitalRead(16)==1)
   {
     trig=0;
   }  
    
}

