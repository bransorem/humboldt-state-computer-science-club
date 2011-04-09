
int clock = 10;
int latch = 9;
int data = 8;



void setup(){
  pinMode(data, OUTPUT);
  pinMode(latch, OUTPUT);
  pinMode(clock, OUTPUT);
}

void loop(){
  
  for(int x=0; x < 5; x++){
    bounce();
  }
  for(int x=0; x < 5; x++){
    bounceReverse();
  }
  for(int x=0; x < 5; x++){
    split();
  }
  counter();
}

void shift(int val){
  digitalWrite(latch, LOW);
  shiftOut(data, clock, MSBFIRST, val);
  digitalWrite(latch, HIGH);
}

void bounce(){
  for (int i=0; i < 8; i++){
    shift(1 << i);
    delay(40);
  }
  
  for (int i=6; i > 1; i--){
    shift(1 << i);
    delay(40);
  }
}

void counter(){
  for (int i=0; i < 16; i++){
    // binary counter
    shift(i);
    delay(200);
  }
}

void split(){
  int a = 8;
  int b = 16;
  
  for (int i = 0; i < 4; i++){
    shift( (b << i) | (a >> i) );
    delay(100);
  }
  for (int i = 3; i > 1; i--){
    shift( (b >> i) | (a << i) );
    delay(100);
  }
}


void bounceReverse(){
  for (int i=0; i < 8; i++){
    shift( 255 - (1 << i) );
    delay(40);
  }
  for (int i=6; i > 0; i--){
    shift( 255 - (1 << i) );
    delay(40);
  }
}

