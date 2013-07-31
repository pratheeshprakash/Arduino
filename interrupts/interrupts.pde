int pbIn = 0;                  // Interrupt 0 is on DIGITAL PIN 2!
int ledOut = 5;                // The output LED pin
volatile int state = LOW;      // The input state toggle

void setup()
{                
  // Set up the digital pin 2 to an Interrupt and Pin 4 to an Output
  pinMode(ledOut, OUTPUT);
  pinMode(6, OUTPUT);
  pinMode(7, OUTPUT);

  //Attach the interrupt to the input pin and monitor for ANY Change 
  attachInterrupt(pbIn, stateChange, CHANGE);
}

void loop()                     
{
  //Simulate a long running process or complex task
 digitalWrite(6,HIGH);
 digitalWrite(7,LOW);
 
 delay(1000);
 digitalWrite(6,LOW);
 digitalWrite(7,HIGH);
 
 delay(1000); 
}

void stateChange()
{
  state = !state;
  digitalWrite(ledOut, state);  
}

