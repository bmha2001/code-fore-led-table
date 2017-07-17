#include <Adafruit_NeoPixel.h>
#include <SoftwareSerial.h>


SoftwareSerial mySerial(7, 8); // RX, TX  


int MAX_COLOR_NUM = 255;
int NUM_LEDS = 57;
int PIN = 6;
int c = 0;

Adafruit_NeoPixel strip = Adafruit_NeoPixel(60, PIN);


void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  mySerial.begin(9600);
  strip.begin();
  strip.show();
  
}

void basePattern() {
  boolean change = false;
  while(true) {
  for(int y = 0; y < 4; y++) {
    for(int i = 0; i < NUM_LEDS; i++) {
      if(NUM_LEDS % 4 != y) {
        strip.setPixelColor(i, rand() % MAX_COLOR_NUM,
                              rand() % MAX_COLOR_NUM,
                              rand() % MAX_COLOR_NUM);
        delay(25);
      } else {
        strip.setPixelColor(i, 0, 0, 0);
      }
      
      strip.show();
      if(mySerial.available()) {
        c = mySerial.read();
        if(c != 49) {
          change = true;  
        }
        for(int i = 0; i < 3; i++) {
          mySerial.read();
        }
      }
      if(change == true) {
        break;
      }
    }  
    if(change == true) {
      break;
    }
  }
  if(change == true) {
    break;
  }
  }
}



void clear() {
  for(int i = 0; i < NUM_LEDS; i++) {
    strip.setPixelColor(i, 0, 0, 0);
  }
  strip.show();
}



void blink() {
  boolean change = false;
  while(true) {
  for(int y = 0; y < 10; y++) {
    for(int i = 0; i < NUM_LEDS; i++) {
      if (y % 2 == 0) {
        if(i % 2 == 0) {
          strip.setPixelColor(i, rand() % 255, rand() % 255, rand() % 255);
        } else {
          strip.setPixelColor(i, 0, 0, 0);
        }
      } else {  
        if( i % 2 == 1) {
            strip.setPixelColor(i, rand() % 255, rand() % 255, rand() % 255);
       } else {
        strip.setPixelColor(i, 0, 0, 0);
       }
     }
   }
   if(mySerial.available()) {
    c = mySerial.read();
    if(c != 51) {
        change = true;
    }
    for(int i = 0; i < 3; i++) {
     mySerial.read();
    }
   }
   strip.show();
   delay(100);
   if(change) {
    break;
   }
  }
  if(change) {
    break;
  }
  }
  
}

void rainbow() {
 
  boolean change = false;
  char colors [7] = {'r', 'o', 'y', 'g', 'b', 'i', 'v'};
  for(int i = 0; i < NUM_LEDS; i++) {
    Serial.println(i);
    switch(colors[i % 7]) {
      case 'r':
        strip.setPixelColor(i, 255, 0, 0);
        break;
      case 'o':
        strip.setPixelColor(i, 255, 141, 9);
        break;
      case 'y':
        strip.setPixelColor(i, 255, 255, 0);
        break;
      case 'g':
        strip.setPixelColor(i, 0, 255, 0);
        break;
      case 'b':
        strip.setPixelColor(i, 0, 0, 255);
        break;
      case 'i':
        strip.setPixelColor(i, 76, 0, 153);
        break;
      case 'v':
        strip.setPixelColor(i, 127, 0, 255);
        break;
    }
  }
  strip.show();
  while(true) {
    Serial.print("entered");
      if(mySerial.available()) {
        c = mySerial.read();
        Serial.println(c);
        for(int t = 0; t < 6; t++) {
          mySerial.read();
        }
        if(c != 52) {
           break;
        }
      }
   }

}

void circular() {
  for(int i = 0; i < NUM_LEDS; i++) {
    
   
    strip.setPixelColor(i, MAX_COLOR_NUM, 0, 0);
    if(i - 5 >= 0) {
      strip.setPixelColor(i - 5, 0, 0, 0);
    }
    strip.show();
    delay(50);
    
    if(mySerial.available()) {
      c = mySerial.read();
      Serial.print(c);
      for(int e = 0; e < 6; e++) {
        mySerial.read();
      }
    }
    if(c != 50) {
    
      break;
    }
  }
  if(c == 50) {
   for(int y = NUM_LEDS - 6; y < NUM_LEDS; y++) {
     strip.setPixelColor(y, 0, 0, 0);
      delay(50);
      strip.show();
      if(mySerial.available()) {
       c = mySerial.read();
       for(int t = 0; t < 6; t++) {
        mySerial.read();
       }
     }
     if(c != 50) {
       break;
     }
   }
  }
}

void loop() {
  // put your main code here, to run repeatedly:
  //sbasePattern();
 
   
    if(c == 0 || c == 52) {
    if(mySerial.available()) {
      c = mySerial.read();
      Serial.println(c);
      for(int i = 0; i < 6; i++) {
        Serial.println(mySerial.read());
        
      }
    }
    }

    if(c== 49) {
    basePattern();
   
    clear();
    } else if( c == 50) {
       circular();
      
    } else if (c == 51) {
      blink();
      
    } else if( c == 52) {
      rainbow();
      Serial.println("rainbow called");
    }
    
   
  
}
