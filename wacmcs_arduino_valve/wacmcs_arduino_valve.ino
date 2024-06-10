// arduiono


// set pins for the solenoid and Arduino LED
const int ledPin = 13;

// Pin for solenoid valve
const int valvePin = 3;  // Adjust according to your setup

String str;

int strInput = 0;

void setup() {
  Serial.begin(115200);  // Initialize serial communication

  // mark the led and solenoid pins as outputs
  pinMode(ledPin, OUTPUT);
  pinMode(valvePin, OUTPUT);
}

//
void loop() {
  receiveData();
}

// Function to receive serial data and send a response
void receiveData() {
  // loop to capture inputs
  // while (Serial.available() == 0) {}

  //Checking is any data is coming from Esp8266
  if (Serial.available()) {
    // str = Serial.readString();
    strInput = Serial.parseInt();
    Serial.print("Arduino String Input: ");
    Serial.println(strInput);
    // controlValve(str.toInt());
    controlValve(strInput);

    Serial.flush();  //Clearing all Serial print
  }

  Serial.println("Waiting ...\n");
}


//
void controlValve(int tapStatus) {
  if (tapStatus == 1) {
    // Open the valve
    digitalWrite(valvePin, HIGH);
    // light up the led
    digitalWrite(ledPin, HIGH);

    Serial.print("VALVE OPENED: value = ");
    Serial.println(String(tapStatus));
  } else {
    // Close the valve
    digitalWrite(valvePin, LOW);
    // turn off the LED
    digitalWrite(ledPin, LOW);

    Serial.print("VALVE CLOSED: value = ");
    Serial.println(String(tapStatus));
  }
}
