#include <string>
#include <sstream>

#include <Arduino.h>
#include <ESP8266HTTPClient.h>
#include <ESP8266WiFi.h>

// * utility files
#include "WaterFlow.h"
#include "Credentials.h"
#include "HttpErrors.h"
#include "Upload.h"
#include "WifiConnector.h"


// water flown
double amountOfWaterFlown = 0;

// email
// Test: cephas@test.com
String email = "";

// section
// kitchen
String section = "";

bool hasCapturedValues = false;




void setup() {
  // start communication
  Serial.begin(9600);

  // * set up
  // set up wifi
  setUpWifi();

  // initialize water
  initializeWaterSensor();

  //* get user details
  // capture user email and section
  Serial.println("Enter your Email Adress to Continue e.g test@wcmcs.com ");
}

void loop() {

  if (!hasCapturedValues) {
    // loop to capture inputs
    while (Serial.available() == 0) {}
    email = Serial.readStringUntil('\n');  // Read until newline character (Enter Key)
    // String inputEmail = Serial.readStringUntil('\n');  // Read until newline character (Enter Key)
    // email = inputEmail;
    // Process the received string
    Serial.print("Logged In With Email: ");
    Serial.println(email);

    // loop to capture inputs
    Serial.println("\n\nIn which Section do you want water to flow? e.g kitchen");

    while (Serial.available() == 0) {}
    section = Serial.readStringUntil('\n');  // Read until newline character
    // section
    Serial.print("Collecting Water For: ");
    Serial.println(section);
    Serial.println("");

    // set has captured to true
    hasCapturedValues = true;
  }

  // test
    uploadWaterValues(20.3, email, section);


  double amount = waterVolume();

  // if amount is greater than 0
  if (amount > 0) {
    amountOfWaterFlown += amount;

    Serial.print("Water Flow: ");
    Serial.print(amountOfWaterFlown);
    Serial.println(" L");

    // upload water values
    uploadWaterValues(amountOfWaterFlown, email, section);
    amountOfWaterFlown = 0;
  }

  // wait for 5 seconds
  delay(5000);
}
