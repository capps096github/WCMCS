#include "WiFiConnector.h"
#include "ValveController.h"
#include "Upload.h"
#include "WaterFlowSensor.h"

// water flown
double amountOfWaterFlown = 0;

// email
// Test: cephas@test.com
// String email = "";

// section
// kitchen
// String section = "";

  String email = "cephas@test.com";
  String section = "house";


bool hasCapturedValues = false;


void setup() {
  Serial.begin(115200);

  // connect to wifi
  connectToWiFi();

  // initialize valve
  initValve();

  // initialize water
  initializeWaterSensor();

  //* get user details
  // capture user email and section
  Serial.println("Enter your Email Adress to Continue e.g test@wcmcs.com ");
}

void loop() {
  
    // get the valve status
    bool isValveOpen = fetchValveStatus(section);

    // upload
    if (isValveOpen) {

      // double amount = waterVolume();
      double amount = 21.4;

      // if amount is greater than 0
      if (amount > 0) {
        amountOfWaterFlown += amount;

        Serial.print("Water Flow: ");
        Serial.print(amountOfWaterFlown);
        Serial.println(" L");

        // upload water values
        uploadToCloud(amountOfWaterFlown, email, section);
        amountOfWaterFlown = 0;
    }

    // wait for a minute before uploading other values
    // delay(60000);
    delay(30000);
  }
}
