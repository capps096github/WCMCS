#include "WiFiConnector.h"
#include "ValveController.h"
#include "Upload.h"
#include "WaterFlowSensor.h"
// #include "Ultrasonic.h"

#include <SoftwareSerial.h>

// water flown
double amountOfWaterFlown = 0;

// height of water
double heightOfWaterFlown = 0;

// email
// Test: cephas@test.com
// String email = "";

// section
// kitchen
// String section = "";

String email = "cephas@test.com";
String section = "test";


bool hasCapturedValues = false;

void setup() {
  Serial.begin(115200);
  Serial1.begin(115200);  // Initialize the ESP8266 serial port

  // connect to wifi
  connectToWiFi();

  // initialize water
  initializeWaterSensor();

}

void loop() {
  // get the valve status
  int currentTapStatus = fetchValveStatus(section);
  // int currentTapStatus = 1;
  bool isValveOpen = (currentTapStatus == 1);

  // upload
  if (isValveOpen) {
  Serial.println("Tap is now Open: True" );
  Serial1.print(1);

    double amount = waterVolume();

    double heightOfWater = calculateWaterHeight(amount);

    // if amount is greater than 0
    if (amount > 0) {
      amountOfWaterFlown += amount;
      heightOfWaterFlown += heightOfWater;

      Serial.print("Water Flow: ");
      Serial.print(amountOfWaterFlown);
      Serial.println(" L");

      Serial.print("Height of Flow: ");
      Serial.println(heightOfWaterFlown);
      Serial.println("cm");

      // upload water values
      uploadToCloud(amountOfWaterFlown, email, section);

      // upload water values
      updateWaterLevel(heightOfWaterFlown, email);

      amountOfWaterFlown = 0;
      heightOfWaterFlown = 0;

      delay(3000);
    }

    //
  } else {
  // Serial.println("Tap is now Open: false" );
  // turn off valve
  Serial1.print(0);
  }


  delay(1000);
}
