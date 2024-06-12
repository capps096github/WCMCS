// arduiono


// set pins for the solenoid and Arduino LED
const int ledPin = 13;

// Pin for solenoid valve
const int valvePin = 3;  // Adjust according to your setup

String str;

int strInput = 0;

void setup() {
  Serial.begin(115200);  // Initialize serial communication
  // Serial.begin(9600);  // Initialize serial communication

  // mark the led and solenoid pins as outputs
  pinMode(ledPin, OUTPUT);
  pinMode(valvePin, OUTPUT);
}

void loop() {
  if (Serial.available()) {
    receiveData();
  }
}

// Function to receive serial data and send a response
void receiveData() {
  // loop to capture inputs
  // while (Serial.available() == 0) {}
  // Serial.write(Serial.read());
  //Checking is any data is coming from Esp8266
  if (Serial.available()) {
    // str = Serial.readString();
    strInput = Serial.parseInt();
    Serial.print("Arduino String Input: ");
    Serial.println(strInput);

    // 
    controlValve(strInput);
    Serial.flush();  //Clearing all Serial print
    delay(2000);
  }

  Serial.println("Waiting ...\n");
}
// strInput = 1;
// controlValve(strInput);
// delay(5000);

// strInput = 0;
// controlValve(strInput);
// delay(5000);


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


//
void sample() {
  // Reads the next byte from the serial buffer
  int value = Serial.read();

  if (value != -1) {
    // Process the received value (e.g., convert to integer if needed)
    int receivedInt = value;
    controlValve(receivedInt);
    Serial.print("Received value:");
    Serial.println(receivedInt);
  } else {
    Serial.println("No data available");
  }
}
