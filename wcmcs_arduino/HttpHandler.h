#include <ESP8266WiFi.h>
#include <ESP8266HTTPClient.h>
#include <WiFiClient.h>

#include <string>
#include <sstream>

#include <Arduino.h>
#include "WaterFlow.h"

// Your WiFi credentials.
#define WIFI_NAME "X3PH45  Galaxy"
#define WIFI_PASS "xephas096"

const char* ssid = WIFI_NAME;
const char* password = WIFI_PASS;

//Your Domain name with URL path or IP address with path
// 192.168.43.63
// const char* serverName = "http://192.168.43.63:3000/test-upload";
const char* serverName = "http://192.168.43.63:3000/water-flow";
// const char* serverName = "http://localhost:3000/test-upload";
// 192.168.43.89
// the following variables are unsigned longs because the time, measured in
// milliseconds, will quickly become a bigger number than can be stored in an int.
unsigned long lastTimeFlow = 0;
// Timer set to 10 minutes (600000)
//unsigned long timerDelay = 600000;
// Set timer to 5 seconds (5000)
unsigned long timerDelay = 5000;

void setup() {
  Serial.begin(9600);

  WiFi.begin(ssid, password);
  Serial.println("Connecting");
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }
  Serial.println("");
  Serial.print("Connected to WiFi network with IP Address: ");
  Serial.println(WiFi.localIP());

  Serial.println("Timer set to 5 seconds (timerDelay variable), it will take 5 seconds before publishing the first reading.");

  // water sensor
  initializeWaterSensor();
}


void loop() {

  double amount = waterVolume();

  //Send an HTTP POST request every 10 minutes
  if ((millis() - lastTimeFlow) > timerDelay) {
    //Check WiFi connection status
    if (WiFi.status() == WL_CONNECTED) {
      WiFiClient client;
      HTTPClient http;

      // Your Domain name with URL path or IP address with path
      http.begin(client, serverName);

      // If you need an HTTP request with a content type: application/json, use the following:
      http.addHeader("Content-Type", "application/json");

      String double_str = String(amount);

      String json_string = "{\"value\":";
      json_string += double_str;
      json_string += "}";

      String jsonString = String(json_string);

      int httpResponseCode = http.POST(jsonString);
    
      Serial.print("HTTP Response code: ");
      Serial.println(httpResponseCode);

      // Free resources
      http.end();
    } else {
      Serial.println("WiFi Disconnected");
    }
    lastTimeFlow = millis();
  }
}
 