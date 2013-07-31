const int ledPin = 13;


void setup()
{
  pinMode(ledPin, OUTPUT);
  Serial.begin(9600);
  Serial.println("Starting");
}


void loop()
{
  
  if (Serial.available())
  {
   if(Serial.read()=='<')
    {
    //delay(3);//delay for starting next serial.read
    while(Serial.available()==0);// wait for second byte to be typed
    flash(Serial.read() - '0');
    //Serial.println("ACK");
    
    }
    
  }
}


void flash(int n)
{
  for (int i = 0; i < n; i++)
  {
    digitalWrite(ledPin, HIGH);
    delay(100);
    digitalWrite(ledPin, LOW);
    delay(100);
  }
}
