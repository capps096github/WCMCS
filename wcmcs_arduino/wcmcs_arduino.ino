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

const char *ssid = WIFI_NAME;
const char *password = WIFI_PASS;

// String IP_ADDRESS = "192.168.43.63";
// String serverName = "http://" + IP_ADDRESS + ":3000/water-flow";
// const char* serverName = "http://" + IP_ADDRESS + ":3000/water-flow";
// const char* serverName = "http://192.168.43.63:3000/water-flow";
const char *serverName = "http://192.168.43.63:3000/water-flow";

// the following variables are unsigned longs because the time, measured in
// milliseconds, will quickly become a bigger number than can be stored in an int.
unsigned long lastTimeFlow = 0;

// Timer set to 10 minutes (600000)
// unsigned long timerDelay = 600000;
// Set timer to 5 seconds (5000)
unsigned long timerDelay = 60000;

// water flown
double amountOfWaterFlown = 0;

// * set up wifi
void setUpWifi()
{
  WiFi.begin(ssid, password);
  Serial.println("Connecting");
  while (WiFi.status() != WL_CONNECTED)
  {
    delay(500);
    Serial.print(".");
  }
  Serial.println("");
  Serial.print("Connected to WiFi network with IP Address: ");
  Serial.println(WiFi.localIP());
}

// * upload water via http
void uploadWaterValues()
{
  // Send an HTTP POST request every 10 minutes
  if ((millis() - lastTimeFlow) > timerDelay)
  {
    // Check WiFi connection status
    if (WiFi.status() == WL_CONNECTED)
    {
      WiFiClient client;
      HTTPClient http;

      // Your Domain name with URL path or IP address with path
      http.begin(client, serverName);

      // If you need an HTTP request with a content type: application/json, use the following:
      http.addHeader("Content-Type", "application/json");

      String double_str = String(amountOfWaterFlown);

      String json_string = "{\"value\":";
      json_string += double_str;
      json_string += "}";

      String jsonString = String(json_string);

      int httpResponseCode = http.POST(jsonString);

      httprint(httpResponseCode);

      // Free resources
      http.end();
    }
    else
    {
      Serial.println("WiFi Disconnected");
    }
    lastTimeFlow = millis();
    amountOfWaterFlown = 0;
  }
}

// http printer
void httprint(int httpResponseCode)
{
  // switch case to print response code
  // if -1, then connection error
  // if 200, then connection success
  // if 404, then endpoint not found
  String message;

  switch (httpResponseCode)
  {
  case -1:
    message = "Connection failed";
    break;
  case 200:
    message = "HTTP Success";
    break;
  case 404:
    message = "HTTP Not found";
    break;
  case 500:
    message = "Error uploading water flow data";
    break;
  default:
    message = "HTTP Error";
    break;
  }

  // print error code and message
  Serial.print("HTTP Response code: ");
  Serial.println(httpResponseCode);
}

void setup()
{
  // start communication
  Serial.begin(9600);

  // set up wifi
  setUpWifi();

  // initialize water
  initializeWaterSensor();
}

void loop()
{
  double amount = waterVolume();

  // if amount is greater than 0
  if (amount > 0)
  {
    amountOfWaterFlown += amount;

    Serial.print("Water Flow: ");
    Serial.print(amountOfWaterFlown);
    Serial.println(" L");

    // upload water values
    uploadWaterValues();
  }
}
