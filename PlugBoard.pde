class PlugBoard{
  boolean select;
  int t; // this variable is part of the drawPlugBoard() and the connect() it is used to store the value of the index of plugPair to change.
  float[] plugBoardButtonX = {width*0.26875,width*0.31875,width*0.36875,width*0.41875,width*0.46875,width*0.51875,width*0.56875,width*0.61875,width*0.66875,width*0.26875,width*0.31875,width*0.36875,width*0.41875,width*0.46875,width*0.51875,width*0.56875,width*0.61875,width*0.66875,width*0.26875,width*0.31875,width*0.36875,width*0.41875,width*0.46875,width*0.51875,width*0.56875,width*0.61875};//data for plugBoard keys
  float[] plugBoardButtonY = {height*0.4222,height*0.4222,height*0.4222,height*0.4222,height*0.4222,height*0.4222,height*0.4222,height*0.4222,height*0.4222,height*0.5333,height*0.5333,height*0.5333,height*0.5333,height*0.5333,height*0.5333,height*0.5333,height*0.5333,height*0.5333,height*0.6444,height*0.6444,height*0.6444,height*0.6444,height*0.6444,height*0.6444,height*0.6444,height*0.6444};//data for plugBoard keys
  int[] plugPairColour = {255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255};//holds the colour for each plugPair, this is used to indicate whether letters have been switched
  int[] plugPairConnect = new int[2];//two array spaces, used to hold with plug pairs to swap
  
  PlugBoard(){
  }
  //=============================================================================================================================================================================================================
  int checkLetterSwapped(int checkLetter){
    //function used to see if that letter is switched on the plugboard
    //println(checkLetter);
    return plugPair[checkLetter];
  }
  //=============================================================================================================================================================================================================
  void connect(int firstPairToChange, int secondPairToChange){
    plugPair[firstPairToChange] = plugPairConnect[1];
    plugPair[secondPairToChange] = plugPairConnect[0];
    //println("Pair made");
  }
  //=============================================================================================================================================================================================================
  
  void drawPlugBoard(){
    //draws Plugboard screen
    fill(135);
    rect(width*0.25,height*0.3333,width*0.5,height*0.4444);
    for(int i = 0; i < plugPair.length; i++){
      //draws plugboard buttons
      fill(50);
      rect(plugBoardButtonX[i],plugBoardButtonY[i],width*0.03125,height*0.04444);
      fill(255);
      text(getKeyChar(i),plugBoardButtonX[i] + width*0.00125, plugBoardButtonY[i] + height*0.01667);
      fill(plugPairColour[i],255,plugPairColour[i]);
      text(getKeyChar(plugPair[i]), plugBoardButtonX[i] + width*0.01125, plugBoardButtonY[i] + height*0.03889);
  

      //detects which button the user presses
      if(mouseClicked && mouseX > plugBoardButtonX[i] && mouseX < plugBoardButtonX[i] + width*0.03125 && mouseY > plugBoardButtonY[i] && mouseY < plugBoardButtonY[i]+ height*0.0444){
        //println("Button " + (i+1) + " pressed!");
        if(select == false){
          //if there is not any plugs being switched currently, set the select variable to true to indicate that there is a switch in process
          plugPairConnect[0] = plugPair[i];
          plugPairColour[i] = 50;
          t = i;
          select = true;
          mouseClicked = false;
        }else{
          plugPairColour[i] = 0;
          plugPairColour[t] = 0;
          plugPairConnect[1] = plugPair[i];
          connect(t,i);
          select = false;
          mouseClicked = false;
        }
      }
    }
    //Detection, if the user presses outside of the plugboard screen, it takes them back to the enigma box.
    if(mousePressed && (!(mouseX > width*0.25 && mouseX < width*0.75 && mouseY > height*0.33333 && mouseY < height*0.77777))){
      screen = "enigmaBox";
    }
  }
  //=============================================================================================================================================================================================================
  void drawPlugBoardResetButton(){
    //draws resetPlugBoard button, used to reset the variables and reset the plugboard
    fill(255);
    rect(width*0.6875,height*0.6667,width*0.05,height*0.05556);
    fill(0);
    text("Reset \nPlugBoard",width*0.690625,height*0.6889);
    if(mousePressed && mouseX > width*0.6875 && mouseX < width*0.7375 && mouseY > height*0.6667 && mouseY < height*0.72226){
      for(int i = 0; i < 26; i++){
        plugPair[i] = i;
        plugPairColour[i] = 255; 
      }
      select = false;
    }
  }
  //=============================================================================================================================================================================================================
 
  
  char getKeyChar(int number){
    //method used to get the corresponding key for the keyboard
    number++;
    switch(number){
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
