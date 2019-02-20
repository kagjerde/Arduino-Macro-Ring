#include <Adafruit_NeoPixel.h>
#ifdef __AVR__
  #include <avr/power.h>
#endif

#define PIN 8  //for LED strip

#define NUM_LEDS 24

#define BRIGHTNESS 255

// Rotary encoder declarations
static int pinA = 2;              // Our first hardware interrupt pin is digital pin 2
static int pinB = 3;              // Our second hardware interrupt pin is digital pin 3
volatile byte aFlag = 0;          // let's us know when we're expecting a rising edge on pinA to signal that the encoder has arrived at a detent
volatile byte bFlag = 0;          // let's us know when we're expecting a rising edge on pinB to signal that the encoder has arrived at a detent (opposite direction to when aFlag is set)
volatile byte encoderPos = 0;     //this variable stores our current value of encoder position. Change to int or uin16_t instead of byte if you want to record a larger range than 0-255
volatile byte oldEncPos = 0;      //stores the last encoder position value so we can compare to the current reading and see if it has changed (so we know when to print to the serial monitor)
volatile byte reading = 0;        //somewhere to store the direct values we read from our interrupt pins before checking to see if we have moved a whole detent
volatile byte myoldEncPos = 0;      //stores the last encoder position v

// Button reading, including debounce without delay function declarations
const byte buttonPin = 13;        // this is the Arduino pin we are connecting the push button to
byte oldButtonState = HIGH;       // assume switch open because of pull-up resistor
const unsigned long debounceTime = 150;  // milliseconds
unsigned long buttonPressTime;    // when the switch last changed state
boolean buttonPressed = 0;        // a flag variable


// Menu and submenu/setting declarations
byte Mode = 0;                    // This is which menu mode we are in at any given time (top level or one of the submenus)
const byte modeMax = 5;           // This is the number of submenus/settings you want
// Menu system variables
int menuitem = 1;
int frame = 1;
int page = 1;
int lastMenuItem = 1;
boolean firstTime = true;
boolean encoderChange = false;
byte R,G,B;
byte mode3value;
long ledArray = 0xffffff;
long result;
byte bitIndex;

Adafruit_NeoPixel strip = Adafruit_NeoPixel(NUM_LEDS, PIN, NEO_GRB + NEO_KHZ800);

byte neopix_gamma[] = {
    0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
    0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  1,  1,  1,  1,
    1,  1,  1,  1,  1,  1,  1,  1,  1,  2,  2,  2,  2,  2,  2,  2,
    2,  3,  3,  3,  3,  3,  3,  3,  4,  4,  4,  4,  4,  5,  5,  5,
    5,  6,  6,  6,  6,  7,  7,  7,  7,  8,  8,  8,  9,  9,  9, 10,
   10, 10, 11, 11, 11, 12, 12, 13, 13, 13, 14, 14, 15, 15, 16, 16,
   17, 17, 18, 18, 19, 19, 20, 20, 21, 21, 22, 22, 23, 24, 24, 25,
   25, 26, 27, 27, 28, 29, 29, 30, 31, 32, 32, 33, 34, 35, 35, 36,
   37, 38, 39, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 50,
   51, 52, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 66, 67, 68,
   69, 70, 72, 73, 74, 75, 77, 78, 79, 81, 82, 83, 85, 86, 87, 89,
   90, 92, 93, 95, 96, 98, 99,101,102,104,105,107,109,110,112,114,
  115,117,119,120,122,124,126,127,129,131,133,135,137,138,140,142,
  144,146,148,150,152,154,156,158,160,162,164,167,169,171,173,175,
  177,180,182,184,186,189,191,193,196,198,200,203,205,208,210,213,
  215,218,220,223,225,228,231,233,236,239,241,244,247,249,252,255 };

int num_array[10][7] = {  { 1,1,1,1,1,1,0 },    // 0 //connected as abcdefg
                          { 0,1,1,0,0,0,0 },    // 1
                          { 1,1,0,1,1,0,1 },    // 2
                          { 1,1,1,1,0,0,1 },    // 3
                          { 0,1,1,0,0,1,1 },    // 4
                          { 1,0,1,1,0,1,1 },    // 5
                          { 1,0,1,1,1,1,1 },    // 6
                          { 1,1,1,0,0,0,0 },    // 7
                          { 1,1,1,1,1,1,1 },    // 8
                          { 1,1,1,0,0,1,1 }};   // 9

void setup() {
  Serial.begin(9600);     // DEBUGGING: opens serial port, sets data rate to 9600 bps

  
  //Display init
  pinMode(4,OUTPUT);
  pinMode(5,OUTPUT);
  pinMode(6,OUTPUT);
  pinMode(7,OUTPUT);
  pinMode(9,OUTPUT);
  pinMode(10,OUTPUT);
  pinMode(11,OUTPUT);
  
  Num_Write(0);
  
  //Rotary encoder section of setup
  pinMode(pinA, INPUT_PULLUP); // set pinA as an input, pulled HIGH to the logic voltage (5V or 3.3V for most cases)
  pinMode(pinB, INPUT_PULLUP); // set pinB as an input, pulled HIGH to the logic voltage (5V or 3.3V for most cases)
  attachInterrupt(0,PinA,RISING); // set an interrupt on PinA, looking for a rising edge signal and executing the "PinA" Interrupt Service Routine (below)
  attachInterrupt(1,PinB,RISING); // set an interrupt on PinB, looking for a rising edge signal and executing the "PinB" Interrupt Service Routine (below)
  // button section of setup
  pinMode (buttonPin, INPUT); // setup the button pin
  
  // This is for Trinket 5V 16MHz, you can remove these three lines if you are not using a Trinket
  #if defined (__AVR_ATtiny85__)
    if (F_CPU == 16000000) clock_prescale_set(clock_div_1);
  #endif
  // End of trinket special code
  strip.setBrightness(BRIGHTNESS);
  strip.begin();
  strip.show(); // Initialize all pixels to 'off'
}

void loop() {
  rotaryMenu();
  Num_Write(Mode);
  strip.show();
}



void rotaryMenu() { //This handles the bulk of the menu functions without needing to install/include/compile a menu library
      //DEBUGGING: Rotary encoder update display if turned
      if(oldEncPos != encoderPos) { // DEBUGGING
        //Serial.println(encoderPos);// DEBUGGING. Sometimes the serial monitor may show a value just outside modeMax due to this function. The menu shouldn't be affected.
        encoderChange = true;
        oldEncPos = encoderPos;// DEBUGGING
      }// DEBUGGING
      // Button reading with non-delay() debounce - thank you Nick Gammon!
      byte buttonState = digitalRead (buttonPin); 
      if (buttonState != oldButtonState){
        if (millis () - buttonPressTime >= debounceTime){ // debounce
          buttonPressTime = millis ();  // when we closed the switch 
          oldButtonState =  buttonState;  // remember for next time 
          if (buttonState == LOW){
            //Serial.println ("Button closed"); // DEBUGGING: print that button has been closed
            buttonPressed = 1;
          }
          else {
            //Serial.println ("Button opened"); // DEBUGGING: print that button has been opened
            buttonPressed = 0;  
          }  
        }  // end if debounce time up
      } // end of state change

  //Main menu section
    if (Mode == 0 && buttonPressed) { 
        Mode++; // set the Mode to the current value of input if button has been pressed
        firstTime = true;
        buttonPressed = 0; // reset the button status so one press results in one action
    }
  
    if (Mode == 1 && buttonPressed) {
      Mode++; // set the Mode to the current value of input if button has been pressed
      firstTime = true;
      buttonPressed = 0; // reset the button status so one press results in one action
    }
    if (Mode == 2 && buttonPressed) {
      Mode++; // set the Mode to the current value of input if button has been pressed
      firstTime = true;
      buttonPressed = 0; // reset the button status so one press results in one action
    }
    if (Mode == 3 && buttonPressed){
      Mode++; // set the Mode to the current value of input if button has been pressed
      firstTime = true;
      buttonPressed = 0; // reset the button status so one press results in one action
    }
    if (Mode == 4 && buttonPressed){
      Mode++; // set the Mode to the current value of input if button has been pressed
      firstTime = true;
      buttonPressed = 0; // reset the button status so one press results in one action
    }
    if (Mode == 5 && buttonPressed){
      Mode = 0; // set the Mode to the current value of input if button has been pressed
      firstTime = true;
      buttonPressed = 0; // reset the button status so one press results in one action
    }

    
  if (Mode == 0) {
    if(firstTime == true) {
      firstTime = false;
      encoderPos=51;
      result=ledArray;
      ledArray = 0xffffff;
      R=255;G=255;B=255;
    }
    else {
      int level;
      level = encoderPos*5;
      if(level>255) level=255;
      if(level<5) level=1;
      strip.setBrightness(level);
    }
  }
  if (Mode == 1) {
     if(firstTime == true) {
      //Serial.println("Mode1");
      firstTime = false;
      encoderPos=0;
    }
    else {
      if (encoderChange==true) {
        if(encoderPos>250) encoderPos=0;
        else if(encoderPos>7) encoderPos=7;
            switch (encoderPos) {
              case 0: R=255;G=255;B=255;
              break;
              case 1: R=250;G=250;B=210;
              break;
              case 2: R=255;G=255;B=224;
              break;
              case 3: R=0;G=0;B=255;
              break;
              case 4: R=255;G=0;B=0;
              break;
              case 5: R=0;G=255;B=0;
              break;
              case 6: R=0;G=0;B=255;
              break;
              case 7: R=random(255);G=random(255);B=random(255);
              break;
            }

        encoderChange=false;
      }
    }
  }
  if (Mode == 2) {  
     if(firstTime == true) {
      //Serial.println("Mode2"); 
      firstTime = false;
      encoderPos=0;
      myoldEncPos=0;
      bitIndex=0;
      //result=ledArray;
      
      //Serial.println(ledArray,BIN);//DEBUGGING
      //Serial.println(encoderPos);//DEBUGGING
    }
    else {
          //Serial.println(bitIndex);//DEBUGGING
          
          //Serial.println("over");//DEBUGGING
          if((encoderPos>myoldEncPos)&&!(encoderPos>250)) {
            bitClear(ledArray,bitIndex); 
            bitIndex++;
            if(bitIndex>(NUM_LEDS)) bitIndex=NUM_LEDS-1;
            encoderPos=bitIndex;
            myoldEncPos=encoderPos;
            //Serial.println(ledArray,BIN);//DEBUGGING
          }
          if((encoderPos<myoldEncPos)||(encoderPos>250)) {
            bitSet(ledArray,bitIndex); 
            bitIndex--;
            if(bitIndex>250) bitIndex=0;
            encoderPos=bitIndex;
            myoldEncPos=encoderPos;
            //Serial.println(ledArray,BIN);//DEBUGGING
          }
       }
  }
  if (Mode == 3) {
    if(firstTime == true) {

      firstTime = false;
      bitIndex=0;
      encoderPos=0;
      myoldEncPos=0;
    }
    else {
            boolean set;
            if((encoderPos>myoldEncPos)&&!(encoderPos>250)) {
            if(bitRead(ledArray,0)==1) set=true;
            else set=false; 
            ledArray=ledArray>>1;
            if(set) bitSet(ledArray,23);
            else bitClear(ledArray,23);
            bitIndex++;
            if(bitIndex>(NUM_LEDS)) bitIndex=NUM_LEDS-1;
            encoderPos=bitIndex;
            myoldEncPos=encoderPos;
            //Serial.println(ledArray,BIN);//DEBUGGING
            } 
            if((encoderPos<myoldEncPos)||(encoderPos>250)) {
            if(bitRead(ledArray,23)==1)set=true;
            else set=false;
            ledArray=ledArray<<1;  
            if (set) bitSet(ledArray,0);
            else bitClear(ledArray,0);
            bitIndex--;
            if(bitIndex>250) bitIndex=0;
            encoderPos=bitIndex;
            myoldEncPos=encoderPos;
            //Serial.println(ledArray,BIN);//DEBUGGING
            }
    }
    
  }
  if (Mode == 4) {
    ledArray=0b100000000000100000000000;
             //100000000011111111111111

  }
  if (Mode == 5) {
    ledArray=0b100000100000100000100000;
  }
  for(int j = 0; j < 256 ; j++){
        for(uint16_t i=0; i<strip.numPixels(); i++) {
        if(bitRead(ledArray,i)==1){
          strip.setPixelColor(i, strip.Color(R,G,B,neopix_gamma[j] ) );
        }
        else {
          strip.setPixelColor(i, strip.Color(0,0,0,neopix_gamma[j] ) );
        }
        //result=ledArray>>1;
        }
      }
} 

// this functions writes values to the sev seg pins  
void Num_Write(int number) 
{
  int pin= 4;
  for (int j=0; j < 7; j++) {
   digitalWrite(pin, num_array[number][j]);
   pin++;
   if(pin==8) {pin++;}
  }
}


//-------------------------------------------------------------------------------------Rotary Encoder-----------------------------------------------------
//Rotary encoder interrupt service routine for one encoder pin
void PinA(){
  cli(); //stop interrupts happening before we read pin values
  reading = PIND & 0xC; // read all eight pin values then strip away all but pinA and pinB's values
  if(reading == B00001100 && aFlag) { //check that we have both pins at detent (HIGH) and that we are expecting detent on this pin's rising edge
    encoderPos --; //decrement the encoder's position count
    bFlag = 0; //reset flags for the next turn
    aFlag = 0; //reset flags for the next turn
  }
  else if (reading == B00000100) bFlag = 1; //signal that we're expecting pinB to signal the transition to detent from free rotation
  sei(); //restart interrupts
}

//Rotary encoder interrupt service routine for the other encoder pin
void PinB(){
  cli(); //stop interrupts happening before we read pin values
  reading = PIND & 0xC; //read all eight pin values then strip away all but pinA and pinB's values
  if (reading == B00001100 && bFlag) { //check that we have both pins at detent (HIGH) and that we are expecting detent on this pin's rising edge
    encoderPos ++; //increment the encoder's position count
    bFlag = 0; //reset flags for the next turn
    aFlag = 0; //reset flags for the next turn
  }
  else if (reading == B00001000) aFlag = 1; //signal that we're expecting pinA to signal the transition to detent from free rotation
  sei(); //restart interrupts
}
