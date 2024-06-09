// * Wifi Credentials
const char *ssid = wifiName;
const char *password = wifiPass;

// * set up wifi
void setUpWifi()
{
  WiFi.begin(ssid, password);
  Serial.println("Connecting");
  while (WiFi.status() != WL_CONNECTED)
  {
    delay(500);
    Serial.println("Connect to "+ String(ssid) + "WiFi");
  }
  Serial.println("");
  Serial.print("Connected to WiFi network with IP Address: ");
  Serial.println(WiFi.localIP());
  Serial.println("");
}