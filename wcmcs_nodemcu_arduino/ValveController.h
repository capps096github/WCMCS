#include <ESP8266WiFi.h>
#include <ESP8266HTTPClient.h>

#include <string>
#include <sstream>


// API endpoint
const String apiEndpoint = "/tap_status";

// Global variables for switch values
int tapStatus = 0;


// set pins for the solenoid and Arduino LED
const int ledPin = 13;

// Pin for solenoid valve
const int valvePin = 3;  // Adjust according to your setup

void getTapStatus() {
  if (WiFi.status() == WL_CONNECTED) {
    WiFiClient client;
    HTTPClient http;
    http.begin(client, getServerUrl(apiEndpoint).c_str());
    int httpCode = http.GET();

    if (httpCode > 0) {
      String payload = http.getString();
      Serial.println("HTTP Response code: " + String(httpCode));
      Serial.println("Payload: " + payload);

      // Parse the response (assuming it's a plain integer)
      tapStatus = payload.toInt();
    } else {
      Serial.println("Error on HTTP request");
    }

    http.end();  // Free resources
  } else {
    Serial.println("WiFi not connected");
  }
}

void controlValve() {
  if (tapStatus == 1) {
    // Open the valve
    digitalWrite(valvePin, HIGH);
    // light up the led
    digitalWrite(ledPin, HIGH);

    Serial.print("Valve opened: value = ");
    Serial.println(String(tapStatus));
  } else {
    // Close the valve
    digitalWrite(valvePin, LOW);
    // turn off the LED
    digitalWrite(ledPin, LOW);

    Serial.print("Valve closed: value = ");
    Serial.println(String(tapStatus));
  }
}


void initValve() {
  // mark the led and solenoid pins as outputs
  pinMode(ledPin, OUTPUT);
  pinMode(valvePin, OUTPUT);

  // Initial request to set the state
  getTapStatus();
  controlValve();
}

void fetchValveStatus() {
  // Periodically update the switch value and control the valve
  getTapStatus();
  controlValve();
  delay(1000);  // Delay between updates, adjust as needed
}
