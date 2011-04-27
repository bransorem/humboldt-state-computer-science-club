/* ******************************** 
Author:  Brannen Sorem
Date:    04-26-11

Read in values from Arduino (via serial)
to change the background shade
******************************** */

import processing.serial.*;

Serial ser;

void setup(){
  size(300, 200);
  ser = new Serial(this, Serial.list()[0], 9600);
}

void draw(){
  while (ser.available() > 0){
    int val = ser.read();
    background(val);
  }
}
