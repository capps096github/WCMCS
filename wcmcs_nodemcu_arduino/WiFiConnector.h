#include <ESP8266WiFi.h>
#include <Arduino.h>

#include <string>
#include <sstream>

// * Credits:
// https://randomnerdtutorials.com/esp8266-nodemcu-http-get-post-arduino/#more-95691

// * Wifi Credentials
/// this has the wifi name
// const char* ssid = "X3PH45  Galaxy";
const char* ssid = "X3PH4S";
//NOTE: When the Wifi Name changes, Ip Address of server url also changes

/// this has the wifi password
const char* password = "xephas096x";

// returns the server url for API calls
String getServerUrl(String endpoint) {
 const String protocol = "http://";

  // String ipAddress = (ssid == "X3PH4S")? "10.150.33.140" : "192.168.43.63";
  // String ipAddress = (ssid == "X3PH4S") ? "10.150.32.161" : "192.168.43.63";
  String ipAddress = (ssid == "X3PH4S") ? "10.150.33.170" : "192.168.43.63";

 const String port = ":3500";
  // * to upload water
  // String endpoint = "/upload";
  // String endpoint = "/hello";

  // when you call this in the print function it sends some rare values to the serial, so don't print it
  String localServer = String(protocol + ipAddress + port + endpoint);

  String serverUrl = localServer;

  // Serial.println(serverUrl);

  return serverUrl;
}

void connectToWiFi() {
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
