#include "WiFiConnector.h"
#include "ValveController.h"
#include "Upload.h"
#include "WaterFlowSensor.h"
#include "Ultrasonic.h"

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

SoftwareSerial espSerial(4, 0);  // (D2 = 4) RX, (D3 = 0) TX pins for ESP8266 (you can use any available pins)

void setup() {
  Serial.begin(115200);
  espSerial.begin(115200);  // Initialize the ESP8266 serial port

  // connect to wifi
  connectToWiFi();

  // initialize water
  initializeWaterSensor();

  // initialize ultrasonic
  initUltrasonicSensor();
}

void loop() {
  // get the valve status
  bool isValveOpen = fetchValveStatus(section);

  // upload
  if (isValveOpen) {
    espSerial.print(1);

    double heightOfWater = measureHeightOfWaterFlown();

    double amount = waterVolume();

    // if amount is greater than 0
    if (amount > 0) {
      // espSerial.print(1);

      amountOfWaterFlown += amount;

      Serial.print("Water Flow: ");
      Serial.print(amountOfWaterFlown);
      Serial.println(" L");

      // upload water values
      uploadToCloud(amountOfWaterFlown, email, section);
      amountOfWaterFlown = 0;
    }

    // if height of water flown is greater than 0
    if (heightOfWater > 0) {
      // espSerial.print(1);

      heightOfWaterFlown += heightOfWater;

      Serial.print("Height of Flow: ");
      Serial.println(heightOfWaterFlown);

      // upload water values
      uploadWaterLevel(heightOfWaterFlown, email);
      heightOfWaterFlown = 0;
    }

    //
  } else {
    // turn off valve
    espSerial.print(0);
  }


  delay(1000);
}
