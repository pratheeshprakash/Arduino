volatile int stp=1;
volatile double long oldtime=0,temp;
int e1=2,e2=3,s0=7,s1=6,s2=5,z=4;
int timedelay[13]={1,3,5,4,3,5,4,3,5,4,3,5,4};
int newtime=10;
void updateledmux1(int ledval)
{
  digitalWrite(s0,bitRead(ledval,0));
  digitalWrite(s1,bitRead(ledval,1));
  digitalWrite(s2,bitRead(ledval,2));
  digitalWrite(z,HIGH);
  digitalWrite(e1,LOW);
  delay(1);
  digitalWrite(e1,HIGH);
}

void updateledmux2(int ledval)
{
  digitalWrite(s0,bitRead(ledval,0));
  digitalWrite(s1,bitRead(ledval,1));
  digitalWrite(s2,bitRead(ledval,2));
  digitalWrite(z,HIGH);
  digitalWrite(e2,LOW);
  delay(1);
  digitalWrite(e2,HIGH);
}


void setup()
{
  pinMode(e1,OUTPUT);// first enable
  pinMode(e2,OUTPUT);// second enable
  pinMode(z,OUTPUT);// Z value of both mux
  pinMode(s0,OUTPUT);// s0 of both
  pinMode(s1,OUTPUT);// s1 of both
  pinMode(s2,OUTPUT);// s2 of both 
  
  pinMode(9,INPUT);// pin connected to Junction 1 sensor
  pinMode(10,INPUT);// pin connected to Junction 2 sensor
  pinMode(11,INPUT);// pin connected to Junction 3 sensor
  pinMode(12,INPUT);// pin connected to Junction 4 sensor
  pinMode(13,INPUT);// pin connected to RF module reciever 
  digitalWrite(e1,HIGH);// enable is active low
  digitalWrite(e2,HIGH);// enable is active low
  oldtime= millis();
  temp=oldtime+(timedelay[stp]*1000);
 Serial.begin(9600);
}

void loop()
{
  if(digitalRead(13)==1)
  {
    stp=1;
  }
 oldtime= millis();
 if(millis()>=temp)
 {
      if(stp==1 && digitalRead(9)==0)
   {
    temp=oldtime+(newtime*1000);
   }
   else if(stp==4 && digitalRead(10)==0)
   {
    temp=oldtime+(newtime*1000);
   }
   else if(stp==7 && digitalRead(11)==0)
   {
    temp=oldtime+(newtime*1000);
   }
   else if(stp==10 && digitalRead(12)==0)
   {
    temp=oldtime+(newtime*1000);
   }
   else
   {
     temp=oldtime+(timedelay[stp]*1000);
   }
   stp++;
   oldtime= millis();
   Serial.println(millis());
   Serial.println(timedelay[stp]*1000);
   if(stp==13)
   stp=1;
 }
 switch(stp)
 {
   case 1: updateledmux1(2);
           updateledmux1(5);
           updateledmux2(2);
           updateledmux2(5);
           break;
   case 2: updateledmux1(0);
           updateledmux1(3);
           updateledmux1(6);
           updateledmux2(2);
           updateledmux2(6);
           break;
   case 3: updateledmux1(0);
           updateledmux1(6);
           updateledmux2(0);
           updateledmux2(6);
           break;
   case 4: updateledmux1(1);
           updateledmux1(6);
           updateledmux2(1);
           updateledmux2(6);
           break;
   case 5: updateledmux1(2);
           updateledmux1(4);
           updateledmux1(7);
           updateledmux2(2);
           updateledmux2(6);
           break;
   case 6: updateledmux1(2);
           updateledmux1(4);
           updateledmux2(2);
           updateledmux2(4);
           break;
   case 7: updateledmux1(2);
           updateledmux1(5);
           updateledmux2(2);
           updateledmux2(5);
           break;
       
   case 8: updateledmux1(2);
           updateledmux1(6);
           updateledmux2(0);
           updateledmux2(3);
           updateledmux2(6);
           break;
   case 9: updateledmux1(0);
           updateledmux1(6);
           updateledmux2(0);
           updateledmux2(6);
           break;
   case 10:updateledmux1(1);
           updateledmux1(6);
           updateledmux2(1);
           updateledmux2(6);
           break;
          
   case 11:updateledmux1(2);
           updateledmux1(6);
           updateledmux2(2);
           updateledmux2(4);
           updateledmux2(7);
           break;
   case 12:updateledmux1(2);
           updateledmux1(4);
           updateledmux2(2);
           updateledmux2(4);
           break;
}
}
