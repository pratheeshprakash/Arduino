#include <LiquidCrystal.h>
LiquidCrystal lcd(4,7,8,9,12,13);
volatile int temp=0;
void frw(void)
{
  digitalWrite(5,HIGH);
  digitalWrite(6,LOW);
  digitalWrite(10,HIGH);
  digitalWrite(11,LOW);
}

void stp(void)
{
  digitalWrite(5,LOW);
  digitalWrite(6,LOW);
  digitalWrite(10,LOW);
  digitalWrite(11,LOW);
}

void rev(void)
{
  digitalWrite(5,LOW);
  digitalWrite(6,HIGH);
  digitalWrite(10,LOW);
  digitalWrite(11,HIGH);
}

void lft(void)
{
  digitalWrite(5,LOW);
  digitalWrite(6,LOW);
  digitalWrite(10,HIGH);
  digitalWrite(11,LOW);
}

void rit(void)
{
  digitalWrite(5,HIGH);
  digitalWrite(6,LOW);
  digitalWrite(10,LOW);
  digitalWrite(11,LOW);
}



void setup()
{
  lcd.begin(16,2);
  
  pinMode(2,INPUT);
  pinMode(3,INPUT);
  pinMode(14,INPUT);
  pinMode(17,INPUT);
  pinMode(18,INPUT);
  pinMode(19,INPUT);

  
  pinMode(16,OUTPUT);
  
  pinMode(5,OUTPUT);
  pinMode(6,OUTPUT);
  pinMode(10,OUTPUT);
  pinMode(11,OUTPUT);
  
}


void loop()
{
 if(digitalRead(14)==0)
 {
  if(digitalRead(2)==1 && digitalRead(3)==1 && digitalRead(17)==0 && digitalRead(19)==0 && digitalRead(18)==0)
  {
    frw(); 
    lcd.setCursor(0, 0);
    lcd.print("Forward                 ");
  }
  else if((digitalRead(2)==1 && digitalRead(3)==0) || (digitalRead(17)==1 && digitalRead(19)==0 && digitalRead(18)==0))
  {
    rit();
    lcd.setCursor(0, 0);
    lcd.print("Right                  ");
  }
  else if((digitalRead(2)==0 && digitalRead(3)==1) || (digitalRead(17)==0 && digitalRead(19)==0 && digitalRead(18)==1))
  {
    lft();
    lcd.setCursor(0, 0);
    lcd.print("Left                 ");
  }
  else if((digitalRead(2)==0 && digitalRead(3)==0)|| digitalRead(19)==1 ) 
  {
    rev();
    lcd.setCursor(0, 0);
    lcd.print("Reversing and turning ");
    delay(1000);
    if(temp==0)
    {
    rit();
    temp=1;
    }
    else
    {
    lft();
    temp=0 
    }
    delay(300);
    
  }
digitalWrite(16,0);
}
 
 else
{
  stp();
  digitalWrite(16,1);
  lcd.setCursor(0, 0);
  lcd.print("Land Mine Detected");
}

}
