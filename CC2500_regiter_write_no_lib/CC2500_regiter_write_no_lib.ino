#define pinCS  10
#define pinSCK 13
#define pinMOSI 11
#define pinMISO 12
void setup()
{
    Serial.begin(9600);
    pinMode(pinMOSI, OUTPUT);
    pinMode(pinMISO, INPUT);
    pinMode(pinSCK, OUTPUT);
    pinMode(pinCS, OUTPUT);
    initialise();
    Serial.print(sendCommand(0,35));
    Serial.print("  ");
    Serial.print(recCommand(0));
    Serial.print("  ");
}

void loop()
{
}
void initialise(void)
{
	// disable device
	digitalWrite(pinCS, HIGH);
	// setup SPI control register: SPCR = 01010000
	// interrupt disabled, spi enabled, msb 1st, master, clk low when idle,
	// sample on rising edge of clk, system clock rate fastest
	SPCR = (1<<SPE) | (1<<MSTR);
	
	// clear data registers
	byte clr = SPSR;
	clr = SPDR;
	
	//reset
	reset();
	reset();
	
}
unsigned char sendCommand(unsigned char command, unsigned char data)
{
	// enable device
    digitalWrite(pinCS, LOW);

    // wait for device
    while (digitalRead(pinMISO) == HIGH) {};

    // send command byte
    spiTransfer(command);

    // send data byte
    unsigned char result = spiTransfer(data);

    // disable device
    digitalWrite(pinCS, HIGH);

    // return result
    return result;
}
void reset(void)
{
	// enable device
	digitalWrite(pinCS, LOW);
	delayMicroseconds(1);
	
	// disable device and wait at least 40 microseconds
	digitalWrite(pinCS, HIGH);
	delayMicroseconds(41);
	
	// enable device
	digitalWrite(pinCS, LOW);
	
	// wait for device
	while (digitalRead(pinMISO) == HIGH) {
	};
	
	// send reset command (SRES)
	spiTransfer(0x30);
	
	// disable device
	digitalWrite(pinCS, HIGH);
}

unsigned char spiTransfer(unsigned char data)
{
   // start transmission
    SPDR = data;

    // wait for end of transmission
    while (!(SPSR & (1<<SPIF))) {
    };

    // return received byte
    return SPDR;
}
unsigned char recCommand(unsigned char command) //command for getting register values
{
    command = command + 0x80;
    digitalWrite(pinCS, LOW);
    while (digitalRead(pinMISO) == HIGH) {};
    spiTransfer(command);
    unsigned char result=spiTransfer(0);
    digitalWrite(pinCS, HIGH);
    return result;
}
