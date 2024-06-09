#include "ValveController.h"
#include "WiFiConnector.h"

void setup() {
  // connect to wifi
  connectToWiFi();

  // initialize valve
  initValve();
}

void loop() {
  // get the valve status
  fetchValveStatus();
}

// void loop() {
//   double amountOfWaterFlown = 20.346;
//   String email = "cephas@test.com";
//   String section = "house";

//   // upload water values
//   uploadToCloud(amountOfWaterFlown, email, section);

//   delay(60000);
// }