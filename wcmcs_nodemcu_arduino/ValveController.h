#include <ESP8266WiFi.h>
#include <ESP8266HTTPClient.h>

#include <string>
#include <sstream>

// API endpoint
const String apiEndpoint = "/tap_status";

// Global variables for switch values
int tapStatus = 0;


void getTapStatus(String section) {

// http://192.168.43.63:3500/tap_status?section=house
  String serverUrl = String(apiEndpoint + "?section=" + section);

  if (WiFi.status() == WL_CONNECTED) {
    WiFiClient client;
    HTTPClient http;
    http.begin(client, getServerUrl(serverUrl).c_str());
    int httpCode = http.GET();

    if (httpCode > 0) {
      String payload = http.getString();
      // Serial.println("HTTP Response code: " + String(httpCode));
      Serial.println("Tap Status: " + payload);

      // Parse the response (assuming it's a plain integer)
      tapStatus = payload.toInt();
    } else {
      Serial.println("Error on HTTP request when getting tap status");
    }

    http.end();  // Free resources
  } else {
    Serial.println("WiFi not connected");
  }
}

bool fetchValveStatus(String section) {
  // Periodically update the switch value and control the valve
  getTapStatus(section);

  return tapStatus;
}
