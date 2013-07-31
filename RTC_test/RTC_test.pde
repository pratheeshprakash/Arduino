// Induino Baord Test Program 
// Created by R V Prakash 
// Email: prakash@simplelabs.co.in 
// Edited by Pratheesh prakash
// Email: pratheesh@roboinventions.com

// The library files will be included with this program
// Copy and paste the files in Arduino/libraries

// if RTC works fine it will print 
// "Starting"
// "Sunday 07.03.2011 -- 12:00:00" 

// Additions in Revision 2 
// 1) added Test for RTC

// Future additions 
// 1) test for LDR also will be intergrated


#include <DS1307.h>



DS1307 rtc(18, 19);// DS1307 is connected to  pin18(SDA) and pin19(SCL)


void init_rtc()
{
  rtc.halt(false);// Set the clock to run-mode
  // The following lines can be commented out to use the values already stored in the DS1307
  rtc.setDOW(THURSDAY);        // Set Day-of-Week to SUNDAY
  rtc.setTime(13, 19, 0);     // Set the time to 12:00:00 (24hr format)
  rtc.setDate(2, 8, 2012);   // Set the date to March 7th, 2011
  
   rtc.setSQWRate(0); 
   rtc.enableSQW(1);
} 

void print_time()
{
  Serial.print(rtc.getDOWStr());
  Serial.print(" ");// Send Day-of-Week

  Serial.print(rtc.getDateStr());
  Serial.print(" -- ");// Send date

  Serial.println(rtc.getTimeStr()); // Send time
}
void setup()
{
 

 init_rtc();// Initialize RTC
 attachInterrupt(1, print_time, RISING);
  Serial.begin(9600);
  Serial.println("Starting");
   
  
}

void loop()
{

}





