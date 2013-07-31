#include <EEPROM.h>

void ledtog(int pos)
 {
   byte temp;
   if(pos<=8)
   {
   temp=EEPROM.read(0);
   bitWrite(temp,(pos-1),!(bitRead(temp,(pos-1))));
   EEPROM.write(0,temp);
   LEDsetup();
   }
   else if(pos>8 && pos<=16)
   {
   temp=EEPROM.read(1);
   bitWrite(temp,(pos-9),!(bitRead(temp,(pos-9))));
   EEPROM.write(1,temp);
   LEDsetup();
   }
  
   return;       
 }
void LEDsetup()
 { byte temp,temp1;
   temp=EEPROM.read(0);
   temp1=EEPROM.read(1);
   digitalWrite(9,bitRead(temp,0));
   digitalWrite(10,bitRead(temp,1));
   digitalWrite(11,bitRead(temp,2));
   digitalWrite(12,bitRead(temp1,1));
 }
void setup(){
 byte temp; 
 pinMode(9, OUTPUT);
 pinMode(10, OUTPUT);
 pinMode(11, OUTPUT);
 pinMode(12, OUTPUT);
 //_____________________________//
 pinMode(7, INPUT);
 pinMode(6, INPUT);
 pinMode(5, INPUT);
 pinMode(4, INPUT);
 //_____________________________//
 digitalWrite(7,HIGH); // pullup register on
 digitalWrite(6,HIGH);
 digitalWrite(5,HIGH);
 digitalWrite(4,HIGH);
    //_____________________________//
 temp=EEPROM.read(0);  
 LEDsetup();
}

void loop() {
   if (digitalRead(7)==LOW)
     {
       ledtog(1);
     }   
   else if (digitalRead(6)==LOW)
     {
       ledtog(2);
     }   
   else if (digitalRead(5)==LOW)
     {
       ledtog(3);
     }
   else if (digitalRead(4)==LOW)
     {
      ledtog(10);
     }     
     
 delay(200);
}
