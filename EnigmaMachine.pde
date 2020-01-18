//declarization of objects
Display display;
Cipher letter;
PlugBoard letterToCheck;
Rotors rotors;
Instructions instructions;


int[] rotorPosition = {floor(random(1,27)),floor(random(1,27)),floor(random(1,27))};//right most rotor is index 2, middle rotor is index 1, left most rotor is index 0
boolean keyBeingPressed;//used to indicate whether a key is currently being pressed
boolean mouseClicked;//used to indicate if the mouse has been clicked
int[] plugPair = new int[26];//values for the plugBoard indicating which keys are connectedeach index represents a letter, the value stored in that index is the letter it is connected to
int[] buttonPressed = new int[26];//colours for the keyboard
int[] keyLitUp = new int[26];//colours for the lightup keyboard
String screen = "enigmaBox";//variable indicating what the screen should currently display, three values: plugBoard; enigmaBox; 

//=============================================================================================================================================================================================================
void setup(){
  //initializes keyboard colours and plugs in the plugboard
  for(int i = 0; i < 26; i++){
    buttonPressed[i] = 255;
    keyLitUp[i] = 255;
    plugPair[i] = i;
  }
  //size(1600,900);
  fullScreen();
  //initialization of all objects
  instructions = new Instructions();
  display = new Display();
  rotors = new Rotors(0);
  letter = new Cipher();
  letterToCheck = new PlugBoard();
}
  //=============================================================================================================================================================================================================
void draw(){
  //drawScreen() is a function within class Display, draws the whole screen and enables interactions outside the keyboard
  display.drawScreen();
  
  //keeps mouse clicked at false;
  if(!mousePressed){
    mouseClicked = false;
  }
}
  //=============================================================================================================================================================================================================

void mouseClicked(){
  //sets mouseClicked to true
  mouseClicked = true;
}
//=============================================================================================================================================================================================================

void keyPressed(){
  //if there isn't a key being pressed, continue
  if(!keyBeingPressed){
    //sets keyBeingPressed to true, preventing any other input from coming
    keyBeingPressed = true;
    //ASCII table is used to see if the key that has been pressed is part of the alphabet
    if((key > 64 && key < 91) || (key > 96 && key < 123 )){
      //creates a letterCiphered variable to store the value returned from class Cipher
      int letterCiphered = letter.cipherLetter(key);
      //changes the colour of the key that has been pressed on the keyboard
      buttonPressed[letter.getCharInt(key)] = 145;
      //changes the colour of the new ciphered key to yellow
      keyLitUp[letterCiphered] = 0;
    }
  }
}
  //=============================================================================================================================================================================================================
void keyReleased(){
  //resets key colours
  for(int i = 0; i < 26; i++){
    buttonPressed[i] = 255;
    keyLitUp[i] = 255;
  }
  //sets value of keyBeingPressed to false to indicate that there is no longer a key being pressed
  keyBeingPressed = false;
}
