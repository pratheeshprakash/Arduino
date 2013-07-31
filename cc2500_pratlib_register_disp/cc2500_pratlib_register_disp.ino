#include <CC2500.h>

CC2500 RF;
void setup()
{
  Serial.begin(9600);
  RF.initialise();
  Serial.println("Starting");
  RF.disp();
}

void loop()
{
 
}
