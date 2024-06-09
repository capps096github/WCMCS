#include <ESP8266WiFi.h>
#include <ESP8266HTTPClient.h>

// the following variables are unsigned longs because the time, measured in
// milliseconds, will quickly become a bigger number than can be stored in an int.
unsigned long lastTimeFlow = 0;

// Set timer to 60 seconds (60000)
// this will be the upload time
unsigned long timerDelay = 5000;

// * Server Information
// const char *serverEndpoint = "https://waterapi-i6mmg3netq-uc.a.run.app/upload_test"; // Replace with your actual endpoint
// const char *serverEndpoint = "http://192.168.43.89:4000/test"; // Replace with your actual endpoint
// const char *serverEndpoint = "http://192.168.43.63:4000/water"; // Replace with your actual endpoint
const char *serverEndpoint = "http://192.168.43.63:4000/water"; // Replace with your actual endpoint

// * upload water via http
void uploadWaterValues(double amountOfWaterFlown, String email, String section) {

  // Send an HTTP POST request every timerDelay period
  if ((millis() - lastTimeFlow) > timerDelay) {
    // Check WiFi connection status
    if (WiFi.status() == WL_CONNECTED) {
      WiFiClient client;
      HTTPClient http;

      // Your Domain name with URL path or IP address with path
      http.begin(client, serverEndpoint);

      // print endpoint
      Serial.print("End Point: ");
      Serial.println(serverEndpoint);

      // If you need an HTTP request with a content type: application/json, use the following:
      http.addHeader("Content-Type", "application/json");

      // Construct the JSON string
      String jsonString = "{\"value\":";
      jsonString += "\"234\"";
      // jsonString += String(amountOfWaterFlown);
      // jsonString += ",\"email\":\"";
      // jsonString += email;
      // jsonString += "\",\"section\":\"";
      // jsonString += section;
      // jsonString += "\"}";
      jsonString += "}";

      Serial.println(jsonString);

      // Send the request
      int httpResponseCode = http.POST(jsonString);

      // Print HTTP response code
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
