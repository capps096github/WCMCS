#include <ESP8266WiFi.h>
#include <ESP8266HTTPClient.h>
#include <Arduino.h>

#include <string>
#include <sstream>

void uploadToCloud(double amountOfWaterFlown, String email, String section) {
  if (WiFi.status() == WL_CONNECTED) {
    // Create a WiFiClient object
    WiFiClient client;

    // Create an HTTPClient object
    HTTPClient http;

    // Begin the HTTP request with the WiFiClient and server URL
    http.begin(client, getServerUrl("/upload").c_str());

    // Specify the content type
    http.addHeader("Content-Type", "application/json");

    // Construct the JSON string
    String payload = "{\"value\":";
    payload += String(amountOfWaterFlown);
    payload += ",\"email\":\"";
    payload += email;
    payload += "\",\"section\":\"";
    payload += section;
    payload += "\"}";

    // Send HTTP POST request
    int httpResponseCode = http.POST(payload);

    // Check the returning code
    if (httpResponseCode > 0) {
      // Get the response to the request
      String response = http.getString();
      // Print return code
      Serial.println(httpResponseCode);
      // Print request answer
      Serial.println(response);
    } else {
      // Print error message if the POST request failed
      Serial.print("Error on sending POST: ");
      Serial.println(httpResponseCode);
    }

    // Free resources
    http.end();
  } else {
    Serial.println("Error in WiFi connection");
  }

  Serial.println("\n");
}


void updateWaterLevel(double heightOfWater, String email) {
  if (WiFi.status() == WL_CONNECTED) {
    // Create a WiFiClient object
    WiFiClient client;

    // Create an HTTPClient object
    HTTPClient http;

    // Begin the HTTP request with the WiFiClient and server URL
    http.begin(client, getServerUrl("/update_level").c_str());

    // Specify the content type
    http.addHeader("Content-Type", "application/json");

    // Construct the JSON string
    String payload = "{\"height\":";
    payload += String(heightOfWater);
    payload += ",\"email\":\"";
    payload += email;
    payload += "\"}";

    // Send HTTP POST request
    int httpResponseCode = http.POST(payload);

    // Check the returning code
    if (httpResponseCode > 0) {
      // Get the response to the request
      String response = http.getString();
      // Print return code
      Serial.println(httpResponseCode);
      // Print request answer
      Serial.println(response);
    } else {
      // Print error message if the POST request failed
      Serial.print("Error on sending POST: ");
      Serial.println(httpResponseCode);
    }

    // Free resources
    http.end();
  } else {
    Serial.println("Error in WiFi connection");
  }

  Serial.println("\n");
}
