
class Display {
  PlugBoard plugBoard = new PlugBoard();
  //class used for any visuals for the screen
  float keyX;//used for drawing keyboard
  float keyY;

  Display() {
  }
  //=============================================================================================================================================================================================================
  void drawScreen() {
    //draws Enigma Machine
    if (screen == "enigmaBox") {
      //If the screen is the enigma machine, it draws the keyboards, the plugboard button, the instructions button and the rotor positions
      background(205, 145, 25);
      fill(121, 70, 7);
      rect(width*0.25, height*0.22222, width*0.5, height*0.66667);
      drawPlugBoardButton();
      drawInstructionsButton();
      drawKeyboard(true);
      rotors.drawRotors(true);
      drawCipherKeyboard(true);
    } else if (screen == "plugBoard") {
      //if the screen is the plugboard it will draw the keyboard and light up keyboard, but they won't be clickeable, it will draw the plugboard and the button to reset the plugboard
      background(102.5, 72.5, 12.5);
      fill(121*0.5, 70*0.5, 7*0.5);
      rect(width*0.25, height*0.22222, width*0.5, height*0.66667);
      drawKeyboard(false);
      drawCipherKeyboard(false);
      plugBoard.drawPlugBoard();
      plugBoard.drawPlugBoardResetButton();
    } else if (screen == "instructions") {
      //draws the instructions in class Instructions
      background(205, 145, 25);
      instructions.drawInstructions();
    } 
    fill(225);
    text("Version 1.0.0", 0.9*width, 0.9*height);
    text("Created by Akil Pathiranage", 0.9*width-45, 0.9*height+15);
    text("Press 'Esc' to Exit", 0.465*width, 0.97*height);
  }
  //=============================================================================================================================================================================================================
  void drawInstructionsButton() {
    fill(255);
    rect(0.55*width, height*0.55556, width*0.0625, height*0.04444);
    fill(0);
    text("Instructions", width*0.555625, height*0.5833);
    //button detection
    if (mousePressed && width*0.55 < mouseX && mouseX < width*0.55+width*0.0625 && height*0.55556 < mouseY && mouseY < height*0.55556 + height*0.04444) {
      screen = "instructions";
    }
  }

  //=============================================================================================================================================================================================================
  void drawPlugBoardButton() {
    //draws button to access the plugboard from the enigma machine
    fill(255);
    rect(width*0.625, height*0.55556, width*0.0625, height*0.04444);
    fill(0);
    text("Plug Board", width*0.63125, height*0.583);

    //button detection
    if (mousePressed && (width*0.625 < mouseX && mouseX< width*0.625+width*0.0625 && height*0.55556 < mouseY && mouseY < height*0.55556+height*0.04444)) {
      screen = "plugBoard";
    }
  }
  //=============================================================================================================================================================================================================
  void drawKeyboard(boolean interact) {
    //boolean interact is false, the keyboard appear darker
    //function draws keyboard
    keyX = 0.3*width;
    keyY = 0.7222*height;
    //enigmaBox
    //draw keys
    for (int i = 0; i < 26; i++) {
      if (interact == true) {
        fill(buttonPressed[i]);
      } else {
        fill(buttonPressed[i]*0.5);
      }
      ellipse(keyX, keyY, width*0.01875, height*0.03333);
      fill(0);
      textSize(15);
      text(getKeyChar(i), keyX-4, keyY+3);
      if (keyX < width*0.68125 && i < 16) {
        keyX += width*0.05;
      } else if (i <= 16) {
        keyX = width*0.33125;
        keyY += height*0.05556;
      }
      if (i >= 16) {
        keyX = 0.3*width + (width*0.05)*(i-16);
      }
    }
  }
  //=============================================================================================================================================================================================================
  void drawCipherKeyboard(boolean interact) {
    //if boolean inetract is false, the cipherKeyboard appears darker
    //function draws lamp keyboard 

    keyX = 0.3*width;
    keyY = 0.3*height;
    for (int i = 0; i < 26; i++) {
      if (interact == true) {
        fill(255, 255, keyLitUp[i]);
      } else {
        fill(255*0.5, 255*0.5, keyLitUp[i]*0.5);
      }
      ellipse(keyX, keyY, width*0.01875, height*0.03333);
      fill(0);
      textSize(15);
      text(getKeyChar(i), keyX-4, keyY+3);
      if (keyX < width*0.68125 && i < 16) {
        keyX += width*0.05;
      } else if (i <= 16) {
        keyX = width*0.33125;
        keyY += height*0.05556;
      }
      if (i >= 16) {
        keyX = width*0.3 + (width*0.05)*(i-16);
      }
    }
  }
  //=============================================================================================================================================================================================================
  char getKeyChar(int number) {
    //method used to get the corresponding key for the keyboard
    number++;
    switch(number) {
    case 1:
      return 'Q';
    case 2:
      return 'W';
    case 3:
      return 'E';
    case 4:
      return 'R';
    case 5:
      return 'T';
    case 6:
      return 'Z';
    case 7:
      return 'U';
    case 8:
      return 'I';
    case 9:
      return 'O';
    case 10:
      return 'A';
    case 11:
      return 'S';
    case 12:
      return 'D';
    case 13:
      return 'F';
    case 14:
      return 'G';
    case 15:
      return 'H';
    case 16:
      return 'J';
    case 17:
      return 'K';
    case 18:
      return 'P';
    case 19:
      return 'Y';
    case 20:
      return 'X';
    case 21:
      return 'C';
    case 22:
      return 'V';
    case 23:
      return 'B';
    case 24:
      return 'N';
    case 25:
      return 'M';
    case 26:
      return 'L'; 
    default:
      println("Improper value sent into getKeyChar");
      return 'a';
    }
  }
}
