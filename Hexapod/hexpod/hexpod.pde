#include <avr/pgmspace.h>
unsigned long time;
int robotState=0;
int step=1;
byte calibration[18] PROGMEM=
{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
byte walkSequence[13][18] PROGMEM=
{
  {50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50}, // zero position
  
  {55,53,51,51,53,55,50,50,50,50,50,50,30,30,30,70,70,70}, // two commands make 
  
  {55,53,51,51,53,55,40,50,50,50,50,50,50,30,30,70,70,70}, // front left foot rise 
  {45,55,53,49,51,53,50,50,50,50,50,50,30,30,30,70,70,70}, // front left foot fall 
  
  {45,55,53,49,51,53, 50,40,50,50,50,50, 30,50,30,70,70,70}, // Left mid foot rise
  {47,45,55,47,49,51, 50,50,50,50,50,50, 30,30,30,70,70,70}, // left mid foot fall 
  
  {47,45,55,47,49,51,50,50,40,50,50,50,30,30,50,70,70,70},
  {49,47,45,45,47,49,50,50,50,50,50,50,30,30,30,70,70,70},
    
 
  
  {49,47,45,45,47,49,50,50,50,60,50,50,30,30,30,50,70,70},
  {52,49,47,55,45,47,50,50,50,50,50,50,30,30,30,70,70,70},
  
  {52,49,47,55,45,47,50,50,50,50,60,50,30,30,30,70,50,70},
  {53,51,49,53,55,45,50,50,50,50,50,50,30,30,30,70,70,70},
  
  {53,51,49,53,55,45,50,50,50,50,50,60,30,30,30,70,70,50},
};
byte standUp[18] PROGMEM = 
{50,50,50,50,50,50,55,55,55,45,45,45,30,30,30,70,70,70};
byte crouch[18] PROGMEM = 
{50,50,50,50,50,50,30,30,30,70,70,70,20,20,20,80,80,80};
byte off[18] PROGMEM =
{-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1};
int servo[18];

void startUp(){
  for (int i=0;i<18;i++){
    servo[i]=50+pgm_read_byte_near(&calibration[i]); // safe center position
  }
}
void setup(){
  Serial.begin(19200); // in order to work with ICradio.de 19k2 module
  Serial.println("Starting up...");
  DDRB=0xFF; // use this instead of pinMode
  DDRC=0xFF;
  DDRD=0xFC; // not using 0 and 1 for serial port
  PORTB=0x00;// use this instead of digitalWrite
  PORTC=0x00;
  PORTD&=0x03;

  TCCR1A = 0; // no ocr or pwm
  TCCR1B = 0<<CS22 | 1<<CS21 | 0<<CS20;  // div 8
  TIMSK1 = 1<<TOIE1; // enable timer 1 interrupt 
  TCNT1L = 0xc0; // calculate: 20 milisec = 16.000.000 / 40.000 steps -> 0xFFFF - 40000 = 0x63c0
  TCNT1H = 0x63; // 50 Hz interrupt
  playState(off); // turnoff servo's
  Serial.println("Ready>");
}
void playState(byte sequence[18]){
  for(int i=0; i<18; i++){
    servo[i]=pgm_read_byte_near(&sequence[i])+pgm_read_byte_near(&calibration[i]);
  }
}

void loop(){
  checkCommand();
  if(robotState>0){
    if (millis()>time+200){
      time=millis();
      playState(walkSequence[step]);
      step++;
      if(step>12) step=1;
    }
  }
}
void checkCommand()
{
  char c;
  if(Serial.available()>0){
    c=Serial.read();
    if (c=='w') robotState=1;
    else if (c=='q'){robotState=0; playState(off);}
    else if (c=='c'){robotState=0; playState(crouch);}
    else if (c=='s'){robotState=0; playState(standUp);}
  }
}
ISR(TIMER1_OVF_vect) {
  TCNT1L = 0xc0; // reload timer for 
  TCNT1H = 0x63; // 50 Hz interrupt
  for (int z = 0; z<18; z++){
    if(servo[z]>0 && servo[z]<100) digitalWrite(z+2,HIGH);
  }
  delayMicroseconds(500); // adjust these delays for servo characteristics
  for(int n=0; n<100;n++){ // 100 step resolution
    for (int z=0; z<18; z++){
      if(servo[z]==n) digitalWrite(z+2,LOW);
    }
    delayMicroseconds(5); // adjust this delay for servo characteristics
  }
  PORTB=0x00; // by default everything zero after the max pulse width
  PORTC=0x00; // this should not be necessary
  PORTD&=0x03; 
}
