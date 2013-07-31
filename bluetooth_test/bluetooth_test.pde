void setup()
{
  Serial.begin(9600);
}

void loop()
{
 for(int a=65; a<123;a++)
 {
 Serial.write(a);
 Serial.println(" ");
 delay(500);
 } 
}
