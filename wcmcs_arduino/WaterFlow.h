#include <Arduino.h>

ICACHE_RAM_ATTR void increase();

int sensorPin = D2;
volatile long pulse;
unsigned long lastTime;
float volume;

void initializeWaterSensor() {
  pinMode(sensorPin, INPUT);
  attachInterrupt(digitalPinToInterrupt(sensorPin), increase, RISING);
}

//
double waterVolume() {
  volume = 2.663 * pulse / 1000 * 30;
  if (millis() - lastTime > 2000) {
    pulse = 0;
    lastTime = millis();
  }

  if (volume != 0) {
    Serial.print(volume);
    Serial.println(" L/m");
  }

  return volume;
}

ICACHE_RAM_ATTR void increase() {
  pulse++;
}