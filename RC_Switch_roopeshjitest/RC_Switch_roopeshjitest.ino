// First Example in a series of posts illustrating reading an RC Receiver with
// micro controller interrupts.
//
// Subsequent posts will provide enhancements required for real world operation
// in high speed applications with multiple inputs.
//
// http://rcarduino.blogspot.com/ 
//
// Posts in the series will be titled - How To Read an RC Receiver With A Microcontroller

// See also http://rcarduino.blogspot.co.uk/2012/04/how-to-read-multiple-rc-channels-draft.html  

#define THROTTLE_SIGNAL_IN 0 // INTERRUPT 0 = DIGITAL PIN 2 - use the interrupt number in attachInterrupt
#define THROTTLE_SIGNAL_IN_PIN 2 // INTERRUPT 0 = DIGITAL PIN 2 - use the PIN number in digitalRead

#define NEUTRAL_THROTTLE 1500 // this is the duration in microseconds of neutral throttle on an electric RC Car

volatile int nThrottleIn = NEUTRAL_THROTTLE; // volatile, we set this in the Interrupt and read it in loop so it must be declared volatile
volatile unsigned long ulStartPeriod = 0; // set in the interrupt
volatile boolean bNewThrottleSignal = false; // set in the interrupt and read in the loop
volatile int mintrottle=1050;
// we could use nThrottleIn = 0 in loop instead of a separate variable, but using bNewThrottleSignal to indicate we have a new signal 
// is clearer for this first example

void setup()
{
  // tell the Arduino we want the function calcInput to be called whenever INT0 (digital pin 2) changes from HIGH to LOW or LOW to HIGH
  // catching these changes will allow us to calculate how long the input pulse is
  attachInterrupt(THROTTLE_SIGNAL_IN,calcInput,CHANGE);
  pinMode(13,OUTPUT);
  pinMode(8,OUTPUT);
  pinMode(9,OUTPUT);
  digitalWrite(9,HIGH);
  Serial.begin(9600); 
}

void loop()
{
 // if a new throttle signal has been measured, lets print the value to serial, if not our code could carry on with some other processing
 if(bNewThrottleSignal)
 {

   Serial.println(nThrottleIn);  

   // set this back to false when we have finished
   // with nThrottleIn, while true, calcInput will not update
   // nThrottleIn
   
   //aaaaaaaaaaaaaaaaa line add aaaaaaaa
   if(nThrottleIn<mintrottle)
   nThrottleIn= mintrottle;
   else if (nThrottleIn>2000)
   nThrottleIn= 2000;
   
   analogWrite(9,map(nThrottleIn,mintrottle,2000,0,255));
   bNewThrottleSignal = false;
   
 }

 // other processing ... 
}

void calcInput()
{
  // if the pin is high, its the start of an interrupt
  if(digitalRead(THROTTLE_SIGNAL_IN_PIN) == HIGH)
  { 
    // get the time using micros - when our code gets really busy this will become inaccurate, but for the current application its 
    // easy to understand and works very well
    ulStartPeriod = micros();
  }
  else
  {
    // if the pin is low, its the falling edge of the pulse so now we can calculate the pulse duration by subtracting the 
    // start time ulStartPeriod from the current time returned by micros()
    if(ulStartPeriod && (bNewThrottleSignal == false))
    {
      nThrottleIn = (int)(micros() - ulStartPeriod);
      ulStartPeriod = 0;

      // tell loop we have a new signal on the throttle channel
      // we will not update nThrottleIn until loop sets
      // bNewThrottleSignal back to false
      bNewThrottleSignal = true;
    }
  }
}


