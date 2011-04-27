/* ******************************** 
Author:  Brannen Sorem
Date:    04-26-11

- LED pin 3 (PWM)
- Pressure sensor analog pin 2
- Use 560 resistor for LED
- Used 10K resistor for pressure sensor

Uses pressure sensor to control
brightness of LED.  Serial output
to Processing for controlling
background shade.
******************************** */

const int led = 3;
const int touch = 2;

void setup(){
  Serial.begin(9600);
  pinMode(led, OUTPUT);
}

void loop(){
  int value = analogRead(touch) / 4;
  map(value, 192, 255, 0, 255);
  analogWrite(led, value);
  Serial.write(value);
}
