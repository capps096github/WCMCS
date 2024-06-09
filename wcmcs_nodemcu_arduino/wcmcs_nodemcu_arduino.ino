#include "Upload.h"

void setup() {

  // connect to wifi
  connectToWiFi();
}

void loop() {
  double amountOfWaterFlown = 20.346;
  String email = "cephas@test.com";
  String section = "house";

  // upload water values
  uploadToCloud(amountOfWaterFlown, email, section);

  delay(60000);
}