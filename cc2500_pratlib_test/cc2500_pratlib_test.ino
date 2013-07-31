#include <CC2500.h>

CC2500 RF;
void setup()
{
  Serial.begin(9600);
  RF.initialise();
  Serial.println("Starting");
}

void loop()
{
  unsigned char dataRX[14];//keep the receiving array 1 bigger than length of data
  if(RF.receiveData(dataRX,10))
  {
  Serial.write(dataRX,10);  
  Serial.println();
  }
}
