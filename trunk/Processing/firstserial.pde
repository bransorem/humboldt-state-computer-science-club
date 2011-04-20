import processing.serial.*;

Serial serial_port;
boolean val = false;

void setup(){
  println(Serial.list());
  
  serial_port = new Serial(this, Serial.list()[0], 9600);
}

int value = 0;

void draw() {
  fill(value);
  rect(25, 25, 50, 50);
  
  if (keyPressed){
    serial_port.write(97);
    delay(5);
    serial_port.write(99);
  }
}

void mouseClicked() {
  if(value == 0) {
    value = 255;
    serial_port.write(97);
  } else {
    value = 0;
    serial_port.write(99);
  }
}

