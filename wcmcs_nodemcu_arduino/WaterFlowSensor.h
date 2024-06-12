#include "WaterFlowCompute.h"

ICACHE_RAM_ATTR void increase();

#define SENSOR_PIN D2
// #define SENSOR_PIN D7

// int sensorPin = SENSOR_PIN;
// int sensorPin = 2;
// 
volatile long pulse;
unsigned long lastTime;
float volume;

void initializeWaterSensor() {
  // pinMode(sensorPin, INPUT);
  // attachInterrupt(digitalPinToInterrupt(sensorPin), increase, RISING);
  pinMode(SENSOR_PIN, INPUT);
  attachInterrupt(digitalPinToInterrupt(SENSOR_PIN), increase, RISING);
}

//
// double waterVolume() {
//   volume = 2.663 * pulse / 1000 * 30;
//   if (millis() - lastTime > 1000) {
//     pulse = 0;
//     lastTime = millis();
//   }

//   if (volume != 0) {
//     Serial.print(volume);
//     Serial.println(" L/m");
//   }

//   return volume;
// }

ICACHE_RAM_ATTR void increase() {
  pulse++;
}

double calculateWaterHeight(double volume) {
  Serial.println("Height ..." );

  // Assume the base area of the tank is in square meters (m²)
  double baseArea = 1.0; // Replace with the actual base area of the tank in m²

  // Volume is in liters (L), so convert it to cubic meters (m³)
  double volumeInCubicMeters = volume / 1000.0;

  // Calculate the height in meters
  double height = volumeInCubicMeters / baseArea;


  Serial.print("Height = " );
  // Serial.println(height);

  return height;
}

//
double waterVolume() {
  Serial.println("Getting volume ..." );

  static double pulse = 0;
  static unsigned long lastTime = 0;
  double volume = 2.663 * pulse / 1000 * 30;

  if (millis() - lastTime > 1000) {
    pulse = 0;
    lastTime = millis();
  }

  if (volume != 0) {
    Serial.print(volume);
    Serial.println(" L/cm");
  }

  Serial.print("Volume = " );
  // Serial.println(volume);

  // return volume;
  return computeWaterFlow();
  // return 20;
}
