//simple POV display with 7 leds and 1 tilt sensor
//by phil (www.telalab.org)
//7x5 ascii font from TVout Lib
byte charbook[672] = {
  //32 Space
  0b00000000,
  0b00000000,
  0b00000000,
  0b00000000,
  0b00000000,
  0b00000000,
  0b00000000,
  //33 Exclamation !
  0b01000000,
  0b01000000,
  0b01000000,
  0b01000000,
  0b01000000,
  0b00000000,
  0b01000000,
  //34 Quotes "
  0b01010000,
  0b01010000,
  0b01010000,
  0b00000000,
  0b00000000,
  0b00000000,
  0b00000000,
  //35 Number #
  0b00000000,
  0b00000000,
  0b01010000,
  0b11111000,
  0b01010000,
  0b11111000,
  0b01010000,
  //36 Dollars $
  0b00100000,
  0b01110000,
  0b10100000,
  0b01110000,
  0b00101000,
  0b01110000,
  0b00100000,
  //37 Percent %
  0b01000000,
  0b10101000,
  0b01010000,
  0b00100000,
  0b01010000,
  0b10101000,
  0b00010000,
  //38 Ampersand &
  0b00100000,
  0b01010000,
  0b10100000,
  0b01000000,
  0b10101000,
  0b10010000,
  0b01101000,
  //39 Single Quote '
  0b01000000,
  0b01000000,
  0b01000000,
  0b00000000,
  0b00000000,
  0b00000000,
  0b00000000,
  //40 Left Parenthesis (
  0b00010000,
  0b00100000,
  0b01000000,	
  0b01000000,
  0b01000000,
  0b00100000,
  0b00010000,
  //41 Right Parenthesis )
  0b01000000,
  0b00100000,
  0b00010000,
  0b00010000,
  0b00010000,
  0b00100000,
  0b01000000,
  //42 Star *
  0b00010000,
  0b00111000,
  0b00010000,
  0b00000000,
  0b00000000,
  0b00000000,
  0b00000000,
  //43 Plus +
  0b00000000,
  0b00100000,
  0b00100000,
  0b11111000,
  0b00100000,
  0b00100000,
  0b00000000,
  //44 Comma ,
  0b00000000,
  0b00000000,
  0b00000000,
  0b00000000,
  0b00000000,
  0b00010000,
  0b00010000,
  //45 Minus -
  0b00000000,
  0b00000000,
  0b00000000,
  0b00000000,
  0b11111000,
  0b00000000,
  0b00000000,
  //46 Period .
  0b00000000,
  0b00000000,
  0b00000000,
  0b00000000,
  0b00000000,
  0b00000000,
  0b00010000,
  // 47 Backslash /
  0b00000000,
  0b00001000,
  0b00010000,
  0b00100000,
  0b01000000,
  0b10000000,
  0b00000000,
  // 48 Zero
  0b01110000,
  0b10001000,
  0b10101000,
  0b10101000,
  0b10001000,
  0b01110000,
  0b00000000,
  //49 One
  0b00100000,
  0b01100000,
  0b00100000,
  0b00100000,
  0b00100000,
  0b01110000,
  0b00000000,  
  //50 two
  0b01110000,
  0b10001000,
  0b00010000,
  0b00100000,
  0b01000000,
  0b11111000,
  0b00000000,
  //51 Three
  0b11111000,
  0b00010000,
  0b00100000,
  0b00010000,
  0b10001000,
  0b01110000,
  0b00000000,
  //52 Four
  0b10010000,
  0b10010000,
  0b10010000,
  0b11111000,
  0b00010000,
  0b00010000,
  0b00000000,
  //53 Five
  0b11111000,
  0b10000000,
  0b11110000,
  0b00001000,
  0b10001000,
  0b01110000,
  0b00000000,
  //54 Six
  0b01110000,
  0b10000000,
  0b11110000,
  0b10001000,
  0b10001000,
  0b01110000,
  0b00000000,
  //55 Seven
  0b11111000,
  0b00001000,
  0b00010000,
  0b00100000,
  0b01000000,
  0b10000000,
  0b00000000,
  //56 Eight
  0b01110000,
  0b10001000,
  0b01110000,
  0b10001000,
  0b10001000,
  0b01110000,
  0b00000000,
  //57 Nine
  0b01110000,
  0b10001000,
  0b10001000,
  0b01111000,
  0b00001000,
  0b01110000,
  0b00000000,
  //58 :
  0b00000000,
  0b00000000,
  0b00100000,
  0b00000000,
  0b00000000,
  0b00000000,
  0b00100000,
  //59 ;
  0b00000000,
  0b00000000,
  0b00100000,
  0b00000000,
  0b00100000,
  0b00100000,
  0b01000000,
  //60 <
  0b00000000,
  0b00011000,
  0b01100000,
  0b10000000,
  0b01100000,
  0b00011000,
  0b00000000,
  //61 =
  0b00000000,
  0b00000000,
  0b01111000,
  0b00000000,
  0b01111000,
  0b00000000,
  0b00000000,
  //62 >
  0b00000000,
  0b11000000,
  0b00110000,
  0b00001000,
  0b00110000,
  0b11000000,
  0b00000000,
  //63 ?
  0b01100000,
  0b10010000,
  0b00100000,
  0b00100000,
  0b00000000,
  0b00100000,
  0b00000000,
  //64 @
  0b01110000,
  0b10001000,
  0b10011000,
  0b10101000,
  0b10010000,
  0b10001000,
  0b01110000,
  //65 A
  0b00100000,
  0b01010000,
  0b10001000,
  0b11111000,
  0b10001000,
  0b10001000,
  0b00000000,
  //B
  0b11110000,
  0b10001000,
  0b1111000,
  0b10001000,
  0b10001000,
  0b11110000,
  0b00000000,
  //C
  0b01110000,
  0b10001000,
  0b10000000,
  0b10000000,
  0b10001000,
  0b01110000,
  0b00000000,
  //D
  0b11110000,
  0b10001000,
  0b10001000,
  0b10001000,
  0b10001000,
  0b11110000,
  0b00000000,
  //E
  0b11111000,
  0b10000000,
  0b11111000,
  0b10000000,
  0b10000000,
  0b11111000,
  0b00000000,
  //F
  0b11111000,
  0b10000000,
  0b11110000,
  0b10000000,
  0b10000000,
  0b10000000,
  0b00000000,
  //G
  0b01110000,
  0b10001000,
  0b10000000,
  0b10011000,
  0b10001000,
  0b01110000,
  0b00000000,
  //H
  0b10001000,
  0b10001000,
  0b11111000,
  0b10001000,
  0b10001000,
  0b10001000,
  0b00000000,
  //I
  0b01110000,
  0b00100000,
  0b00100000,
  0b00100000,
  0b00100000,
  0b01110000,
  0b00000000,
  //J
  0b00111000,
  0b00010000,
  0b00010000,
  0b00010000,
  0b10010000,
  0b01100000,
  0b00000000,
  //K
  0b10001000,
  0b10010000,
  0b11100000,
  0b10100000,
  0b10010000,
  0b10001000,
  0b00000000,
  //L
  0b10000000,
  0b10000000,
  0b10000000,
  0b10000000,
  0b10000000,
  0b11111000,
  0b00000000,
  //M
  0b10001000,
  0b11011000,
  0b10101000,
  0b10101000,
  0b10001000,
  0b10001000,
  0b00000000,
  //N
  0b10001000,
  0b10001000,
  0b11001000,
  0b10101000,
  0b10011000,
  0b10001000,
  0b00000000,
  //O
  0b01110000,
  0b10001000,
  0b10001000,
  0b10001000,
  0b10001000,
  0b01110000,
  0b00000000,
  //P
  0b11110000,
  0b10001000,
  0b11110000,
  0b10000000,
  0b10000000,
  0b10000000,
  0b00000000,
  //Q
  0b01110000,
  0b10001000,
  0b10001000,
  0b10101000,
  0b10010000,
  0b01101000,
  0b00000000,
  //R
  0b11110000,
  0b10001000,
  0b11110000,
  0b10100000,
  0b10010000,
  0b10001000,
  0b00000000,
  //S
  0b01111000,
  0b10000000,
  0b01110000,
  0b00001000,
  0b00001000,
  0b11110000,
  0b00000000,
  //T
  0b11111000,
  0b00100000,
  0b00100000,
  0b00100000,
  0b00100000,
  0b00100000,
  0b00000000,
  //U
  0b10001000,
  0b10001000,
  0b10001000,
  0b10001000,
  0b10001000,
  0b01110000,
  0b00000000,
  //V
  0b10001000,
  0b10001000,
  0b10001000,
  0b10001000,
  0b01010000,
  0b00100000,
  0b00000000,
  //W
  0b10001000,
  0b10001000,
  0b10101000,
  0b10101000,
  0b10101000,
  0b01010000,
  0b00000000,
  //X
  0b10001000,
  0b01010000,
  0b00100000,
  0b01010000,
  0b10001000,
  0b10001000,
  0b00000000,
  //Y
  0b10001000,
  0b10001000,
  0b01010000,
  0b00100000,
  0b00100000,
  0b00100000,
  0b00000000,
  //Z
  0b11111000,
  0b00001000,
  0b00010000,
  0b00100000,
  0b01000000,
  0b11111000,
  0b00000000,
  //91 [
  0b11100000,
  0b10000000,
  0b10000000,
  0b10000000,
  0b10000000,
  0b11100000,
  0b00000000,
  //92 (backslash)
  0b00000000,
  0b10000000,
  0b01000000,
  0b00100000,
  0b00010000,
  0b00001000,
  0b00000000,
  //93 ]
  0b00111000,
  0b00001000,
  0b00001000,
  0b00001000,
  0b00001000,
  0b00111000,
  0b00000000,
  //94 ^
  0b00100000,
  0b01010000,
  0b00000000,
  0b00000000,
  0b00000000,
  0b00000000,
  0b00000000,
  //95 _
  0b00000000,
  0b00000000,
  0b00000000,
  0b00000000,
  0b00000000,
  0b00000000,
  0b11111000,
  //96 `
  0b10000000,
  0b01000000,
  0b00000000,
  0b00000000,
  0b00000000,
  0b00000000,
  0b00000000,
  //97 a
  0b00000000,
  0b01100000,
  0b00010000,
  0b01110000,
  0b10010000,
  0b01100000,
  0b00000000,
  //98 b
  0b10000000,
  0b10000000,
  0b11100000,
  0b10010000,
  0b10010000,
  0b11100000,
  0b00000000,
  //99 c
  0b00000000,
  0b00000000,
  0b01110000,
  0b10000000,
  0b10000000,
  0b01110000,
  0b00000000,
  // 100 d
  0b00010000,
  0b00010000,
  0b01110000,
  0b10010000,
  0b10010000,
  0b01110000,
  0b00000000,
  //101 e
  0b00000000,
  0b01100000,
  0b10010000,
  0b11110000,
  0b10000000,
  0b01110000,
  0b00000000,
  //102 f
  0b00110000,
  0b01000000,
  0b11100000,
  0b01000000,
  0b01000000,
  0b01000000,
  0b00000000,
  //103 g
  0b00000000,
  0b01100000,
  0b10010000,
  0b01110000,
  0b00010000,
  0b00010000,
  0b01100000,
  //104 h
  0b10000000,
  0b10000000,
  0b11100000,
  0b10010000,
  0b10010000,
  0b10010000,
  0b00000000,
  //105 i
  0b00100000,
  0b00000000,
  0b00100000,
  0b00100000,
  0b00100000,
  0b01110000,
  0b00000000,
  //106 j
  0b00010000,
  0b00000000,
  0b00110000,
  0b00010000,
  0b00010000,
  0b00010000,
  0b01100000,
  //107 k
  0b10000000,
  0b10010000,
  0b10100000,
  0b11000000,
  0b10100000,
  0b10010000,
  0b00000000,
  //108 l
  0b01100000,
  0b00100000,
  0b00100000,
  0b00100000,
  0b00100000,
  0b01110000,
  0b00000000,
  //109 m
  0b00000000,
  0b00000000,
  0b01010000,
  0b10101000,
  0b10101000,
  0b10101000,
  0b00000000,
  //110 n
  0b00000000,
  0b00000000,
  0b11110000,
  0b10001000,
  0b10001000,
  0b10001000,
  0b00000000,
  //111 o
  0b00000000,
  0b00000000,
  0b01100000,
  0b10010000,
  0b10010000,
  0b01100000,
  0b00000000,
  //112 p
  0b00000000,
  0b00000000,
  0b01100000,
  0b10010000,
  0b11110000,
  0b10000000,
  0b10000000,
  //113 q
  0b00000000,
  0b00000000,
  0b01100000,
  0b10010000,
  0b11110000,
  0b00010000,
  0b00010000,
  //114 r
  0b00000000,
  0b00000000,
  0b10110000,
  0b01001000,
  0b01000000,
  0b01000000,
  0b00000000,
  //115 s
  0b00000000,
  0b00110000,
  0b01000000,
  0b00100000,
  0b00010000,
  0b01100000,
  0b00000000,
  //116 t
  0b01000000,
  0b01000000,
  0b11100000,
  0b01000000,
  0b01000000,
  0b01000000,
  0b00000000,
  // 117u
  0b00000000,
  0b00000000,
  0b10010000,
  0b10010000,
  0b10010000,
  0b01100000,
  0b00000000,
  //118 v
  0b00000000,
  0b00000000,
  0b10001000,
  0b10001000,
  0b01010000,
  0b00100000,
  0b00000000,
  //119 w
  0b00000000,
  0b00000000,
  0b00000000,
  0b10101000,
  0b10101000,
  0b01010000,
  0b00000000,
  //120 x
  0b00000000,
  0b10001000,
  0b01010000,
  0b00100000,
  0b01010000,
  0b10001000,
  0b00000000,
  //121 y
  0b00000000,
  0b00000000,
  0b10010000,
  0b10010000,
  0b01100000,
  0b01000000,
  0b10000000,
  //122 z
  0b00000000,
  0b00000000,
  0b11110000,
  0b00100000,
  0b01000000,
  0b11110000,
  0b00000000,
  //123 {
  0b00100000,
  0b01000000,
  0b01000000,
  0b10000000,
  0b01000000,
  0b01000000,
  0b00100000,
  //124 |
  0b00100000,
  0b00100000,
  0b00100000,
  0b00100000,
  0b00100000,
  0b00100000,
  0b00100000,
  //125 }
  0b00100000,
  0b00010000,
  0b00010000,
  0b00001000,
  0b00010000,	
  0b00010000,
  0b00100000,
  //126 ~
  0b00000000,
  0b00000000,
  0b01000000,
  0b10101000,
  0b00010000,
  0b00000000,
  0b00000000,
  //127 DEL
  0b00000000,
  0b00000000,
  0b00000000,
  0b00000000,
  0b00000000,
  0b00000000,
  0b00000000

};



int delinterchar = 800 ;//delay between 2 char
int delinterpoint = 400; //delay between 2 points of a char
#define led1 5
#define led2 6
#define led3 7
#define led4 8
#define led5 9
#define led6 10
#define led7 11
#define sensorPin 2
#define policex 5
int boucle = 0;
#define repet 10 //number of repetition before changing message
char texte[]  = "H      "; // data to write on startup
char texte2[] = "M    "; // data to write after "repet" writing of the first message
unsigned long lasttimeloop;
unsigned long timeloop;



int a = 0;
int leds[7] = {
  led1,led2,led3,led4,led5,led6,led7};

void setup()   
{                
  Serial.begin(9600);

  pinMode(led1, OUTPUT);     
  pinMode(led2, OUTPUT);     
  pinMode(led3, OUTPUT);     
  pinMode(led4, OUTPUT);     
  pinMode(led5, OUTPUT);     
  pinMode(led6, OUTPUT);     
  pinMode(led7, OUTPUT);  
  
  lasttimeloop = micros();

}



void alloff()
{
  digitalWrite(leds[0], HIGH);
  digitalWrite(leds[1], HIGH);
  digitalWrite(leds[2], HIGH);
  digitalWrite(leds[3], HIGH);
  digitalWrite(leds[4], HIGH);
  digitalWrite(leds[5], HIGH);
  digitalWrite(leds[6], HIGH);

}
void disp()
{
  
    timeloop = micros() - lasttimeloop;
    lasttimeloop = micros();
    if (timeloop>5000000) timeloop = 1000000;
    
    
//    Serial.print("timeloop");
//    Serial.println(timeloop);
   //delay(50);
    
    
    
    if (boucle< (repet + 1))
    {
    delinterchar = timeloop/(sizeof(texte)*policex*policex);
    delinterpoint = delinterchar/2;

      for (a=0;a<sizeof(texte);a++)
      {
        displayChar(texte[a]);
        alloff();
        delayMicroseconds(delinterchar);
      }
    }

    if (boucle>repet)
    {
    delinterchar = timeloop/(sizeof(texte2)*policex*policex);
    delinterpoint = delinterchar/2;


      for (a=0;a<sizeof(texte2);a++)
      {
        displayChar(texte2[a]);
        alloff();
        delayMicroseconds(delinterchar);
      }
    }
    boucle++;
    if (boucle> ((repet*2)+1)) boucle = 0;
  
}

void loop()                     
{

  
  
}


void displayChar(char c)
{
  c = c - 32;
  for (int i = 7;i>2;i--)
  {
    for (int j = 0;j<7;j++) 
    {
      if (bitRead(charbook[(7*c+j)],i) == 1)  digitalWrite(leds[j], HIGH);
      else digitalWrite(leds[j], LOW);
    }
    delayMicroseconds(delinterpoint);
  }
}

void displayCharR(char c)
{
  c = c - 32;
  for (int i = 3;i<8;i++)
  {
    for (int j = 0;j<7;j++) 
    {
      if (bitRead(charbook[(7*c+j)],i) == 1)  digitalWrite(leds[j], HIGH);
      else digitalWrite(leds[j],LOW );
    }
  }
}




