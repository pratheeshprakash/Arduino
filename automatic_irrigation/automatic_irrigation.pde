#include <LiquidCrystal.h>

LiquidCrystal lcd(4,7,8,9,12,13);
void setup()
{
  pinMode(6,OUTPUT);
  lcd.begin(16,2);
}

void loop()
{
  lcd.setCursor(0, 1);
  lcd.print(analogRead(A3));
  lcd.print(" ");
  if(analogRead(A3)>500)
  digitalWrite(6,HIGH);
  
  else
  digitalWrite(6,LOW);
  
  delay(1000);
}
