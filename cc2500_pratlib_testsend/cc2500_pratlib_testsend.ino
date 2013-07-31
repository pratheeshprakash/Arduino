#include <CC2500.h>

CC2500 RF;
void setup()
{
 RF.initialise();
}

void loop()
{
  unsigned char dataTX[14]="Hello Wor";
  RF.sendData(dataTX,10);
  delay(100);
}
