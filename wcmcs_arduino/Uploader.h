// the following variables are unsigned longs because the time, measured in
// milliseconds, will quickly become a bigger number than can be stored in an int.
unsigned long lastTimeFlow = 0;

// Set timer to 60 seconds (60000)
// this will be the upload time
// unsigned long timerDelay = 60000;
unsigned long timerDelay = 5000;

// * Server Information
const char *serverEndpoint = APIEndPoint;

// * upload water via http
void uploadWaterValues(double amountOfWaterFlown, String email, String section) {

  // Send an HTTP POST request every 10 minutes
  if ((millis() - lastTimeFlow) > timerDelay) {
    // Check WiFi connection status
    if (WiFi.status() == WL_CONNECTED) {
      WiFiClient client;
      HTTPClient http;

      // Your Domain name with URL path or IP address with path
      http.begin(client, serverEndpoint);

      // print endpoint
      Serial.print("End Point:");
      Serial.println(serverEndpoint);


      // If you need an HTTP request with a content type: application/json, use the following:
      // http.addHeader("Content-Type", "application/json");

      String double_str = String(amountOfWaterFlown);

      // add value to json string
      String json_string = "{\"value\":";
      json_string += double_str;

      // add email to json string
      json_string += ",\"email\":\"";
      json_string += email;
      json_string += "\"";


      // add email to json string
      json_string += ",\"section\":\"";
      json_string += section;
      json_string += "\"";

      // close json string
      json_string += "}";



      String jsonString = String(json_string);
      Serial.println(jsonString);

      int httpResponseCode = http.POST(jsonString);

      httprint(httpResponseCode);

      // Free resources
      http.end();
    } else {
      Serial.println("WiFi Disconnected");
    }
    lastTimeFlow = millis();
  }
}
