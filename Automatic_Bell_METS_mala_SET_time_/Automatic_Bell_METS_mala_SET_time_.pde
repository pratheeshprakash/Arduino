// Automatic bell
// Created by Pratheesh Prakash
// Email: pratheesh@roboinventions.com

// The library files will be included with this program
// Copy and paste the files in Arduino/libraries

// if RTC works fine it will print 
// "Starting"
// "Sunday 07.03.2011 -- 12:00:00" 


#include <DS1307.h>



DS1307 rtc(18, 19);// DS1307 is connected to  pin18(SDA) and pin19(SCL)


void init_rtc()
{
  rtc.halt(false);// Set the clock to run-mode

} 

void set_time_date()
{
    //The following lines can be commented out to use the values already stored in the DS1307
 rtc.setDOW(TUESDAY);        // Set Day-of-Week to SUNDAY
 rtc.setTime(15, 39, 0);     // Set the time to 2:27:00 (24hr format)
 rtc.setDate(30, 7, 2013);   // Set the date to 21st July 2013
}
void print_time()
{
  Serial.print(rtc.getDOWStr());
  Serial.print(" ");// Send Day-of-Week

  Serial.print(rtc.getDateStr());
  Serial.print(" -- ");// Send date

  Serial.println(rtc.getTimeStr()); // Send time
}

int check_time( char time_hour, char time_min)
{
  Time t=rtc.getTime(); 
if(t.hour == time_hour && t.min == time_min)
return 1;

else
return 0;
 
}

void setup()
{
 init_rtc(); set_time_date();// comment off once the time and date are set 
                   // and reprogram the arduino
 
 Serial.begin(9600);
 Serial.println("Starting");

}

void loop()
{
  print_time();
  delay(1000);
}


