  char *dataRX="ABCD";
void setup()
{
  Serial.begin(9600);

  Serial.print("data=");
  Serial.println(dataRX,sizeof(dataRX));
}

void loop()
{
  
}
