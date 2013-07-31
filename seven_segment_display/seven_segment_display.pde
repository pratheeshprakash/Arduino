void  dis(char digit)
{
  switch(digit)
  {
    case 0: digitalWrite(2,HIGH);// display 0
            digitalWrite(3,HIGH);
            digitalWrite(4,HIGH);
            digitalWrite(5,HIGH);
            digitalWrite(6,HIGH);
            digitalWrite(7,HIGH);
            digitalWrite(8,LOW);
            break;

    case 2: digitalWrite(2,HIGH);// display 2
            digitalWrite(3,HIGH);
            digitalWrite(4,LOW);
            digitalWrite(5,HIGH);
            digitalWrite(6,HIGH);
            digitalWrite(7,LOW);
            digitalWrite(8,HIGH);
            break;
            
    default:digitalWrite(2,LOW);// display off
            digitalWrite(3,LOW);
            digitalWrite(4,LOW);
            digitalWrite(5,LOW);
            digitalWrite(6,LOW);
            digitalWrite(7,LOW);
            digitalWrite(8,LOW);
            break;
        

  }
}
void setup()
{
  pinMode(2,OUTPUT);
  pinMode(3,OUTPUT);
  pinMode(4,OUTPUT);
  pinMode(5,OUTPUT);
  pinMode(6,OUTPUT);
  pinMode(7,OUTPUT);
  pinMode(8,OUTPUT);
}

void loop()
{
dis(2);
}
















