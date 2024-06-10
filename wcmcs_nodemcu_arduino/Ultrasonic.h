
// ESP8266 LIBRARY
//https://github.com/ekstrand/ESP8266wifi

const int trigPin = D4;
const int echoPin = D5;

long duration;
double heightFlown;

void initUltrasonicSensor() {
  pinMode(trigPin, OUTPUT);  // Sets the trigPin as an Output
  pinMode(echoPin, INPUT);   // Sets the echoPin as an Input
}

double measureHeightOfWaterFlown() {
  // Clears the trigPin
  digitalWrite(trigPin, LOW);
  delayMicroseconds(2);

  // Sets the trigPin on HIGH state for 10 micro seconds
  digitalWrite(trigPin, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPin, LOW);

  // Reads the echoPin, returns the sound wave travel time in microseconds
  duration = pulseIn(echoPin, HIGH);

  // Calculating the distance
  heightFlown = duration * 0.034 / 2;

  // Prints the distance on the Serial Monitor
  Serial.print("Height Flown: ");
  Serial.println(heightFlown);

  return heightFlown;
}