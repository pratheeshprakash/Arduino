int incomingByte = 0;   // for incoming serial data

void setup() {
        Serial.begin(9600);     // opens serial port, sets data rate to 9600 bps
        pinMode(13,OUTPUT);
}

void loop() {

        // send data only when you receive data:
        if (Serial.available() > 0) {
                // read the incoming byte:
                incomingByte = Serial.read();
                if(incomingByte=='A')
                 {
                   digitalWrite(13,HIGH);
                 }
                else
                {
                  digitalWrite(13,LOW);
                }
                // say what you got:
                
        }
}
