#include <ESP8266WiFi.h>
#include <ESP8266HTTPClient.h>
#include <Arduino.h>

#include <string>
#include <sstream>

// * Credits:
// https://randomnerdtutorials.com/esp8266-nodemcu-http-get-post-arduino/#more-95691

// * Wifi Credentials
/// this has the wifi name
const char* ssid = "X3PH45  Galaxy";
// const char* ssid = "X3PH4S";
//NOTE: When the Wifi Name changes, Ip Address of server url also changes

/// this has the wifi password
const char* password = "xephas096";

// returns the server url for API calls
String getServerUrl() {
  String protocol = "http://";

  // String ipAddress = (ssid == "X3PH4S")? "10.150.33.140" : "192.168.43.63";
  String ipAddress = (ssid == "X3PH4S") ? "10.150.33.140" : "192.168.43.63";

  String port = ":3500";
  // * to upload water
  String endpoint = "/upload";
  // String endpoint = "/hello";

  String localServer = String(protocol + ipAddress + port + endpoint);

  String serverUrl = localServer;

  Serial.println(serverUrl);

  return serverUrl;
}

void connectToWiFi() {
  Serial.begin(115200);
  WiFi.begin(ssid, password);
  Serial.print("Connecting to ");
  Serial.print(ssid);

  // Wait for connection
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }
  Serial.println();
  Serial.println("Connected to WiFi");
}

void uploadToCloud(double amountOfWaterFlown, String email, String section) {
  if (WiFi.status() == WL_CONNECTED) {
    // Create a WiFiClient object
    WiFiClient client;

    // Create an HTTPClient object
    HTTPClient http;

    // Begin the HTTP request with the WiFiClient and server URL
    http.begin(client, getServerUrl().c_str());

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
}
