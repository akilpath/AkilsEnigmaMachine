class Rotors{
  int cipherLetterNum;
  
  //Strings containing each wiring of the rotors, wiring found from https://en.wikipedia.org/wiki/Enigma_rotor_details
  String rotorOneWiring = "JGDQOXUSCAMIFRVTPNEWKBLZYH";
  String rotorTwoWiring = "NTZPSFBOKMWRCJDIVLAEYUXHGQ";
  String rotorThreeWiring = "JVIUBHTCDYAKEQZPOSGXNRMWFL";
  String reflectorWiringString = "QYHOGNECVPUZTFDJAXWMKISRBL";
  /*
                      Q W E R T Z U I O A S D F G H J K P Y X C V B N M L
  Each index of the rotor wiring is based from the old QWERTZ keyboard (ex. Index 0 = Q, Index 25 = L )
  The numbers  in the wiring arrays represent what that letter would cipher into
  For example, in wiringOne, Q(0) turns into P(17), this would work in code by:letter = wiringOne[0];  letter == 17
  
  */
  int[] wiringOne = {17,25,8,23,1,14,16,20,21,15,2,0,19,6,10,9,24,4,18,5,11,22,13,3,12,7};//wiring for first rotor
  int[] wiringTwo = {21,19,10,25,2,0,18,16,11,23,9,17,12,22,8,24,1,7,13,14,5,6,4,15,20,3};//wiring for second rotor
  int[]wiringThree= {8,24,22,10,19,25,23,11,5,15,13,6,14,4,20,18,9,17,12,1,7,3,21,0,2,16};//wiring for third rotor
  int[]wiringUKW  = {9,10,13,19,24,25,16,21,11,0,1,8,23,2,20,17,6,15,22,3,14,7,18,12,4,5};//wiring for the reflector
  
  Rotors(int tempCipherLetter){
    //initializes instance field
    cipherLetterNum = tempCipherLetter;
  }
  //=============================================================================================================================================================================================================
  void increaseRotor(){
    //function that increases the rotors
    // if the rotor position is at 26, sets the value of that rotor to 0 and then increases the value of the next one after it
    if(rotorPosition[2] == 26){
      rotorPosition[2] = 1;
      if(rotorPosition[1] == 26){
        rotorPosition[1] = 1;
        if(rotorPosition[0] == 26){
          rotorPosition[0] = 1;
        }else{
          rotorPosition[0]++;
        }
      }else{
        rotorPosition[1]++;
       }
    }else{
      rotorPosition[2]++;
    }
   }
    //=============================================================================================================================================================================================================
    
    int reflect(int reflectLetterNum){
      //Passes letter into the reflection wiring, which switches it into another letter
      reflectLetterNum = wiringUKW[reflectLetterNum];
      
      //These for loops undo the cipher of the enigma machine by inversing the cipher
      
      for(int i = 0; i < 26; i++){
        //tests if the letter to reflect is equal to the letter of this index
        if(reflectLetterNum == wiringThree[i]){
          //sets the reflected letter to the index of itself, but subtracting the rotorPosition, this shows the original letter unchanged by the rotor
          reflectLetterNum = ((i - rotorPosition[0] + 1) + 26) % 26;
          //ends for loop
          i = 26;
        }
      }
      for(int i = 0; i < 26; i++){
        if(reflectLetterNum == wiringTwo[i]){
          reflectLetterNum = ((i - rotorPosition[1] + 1) + 26) % 26;
          i = 26;
        }
      }
      for(int i = 0; i < 26; i++){
        if(reflectLetterNum == wiringOne[i]){
          reflectLetterNum = ((i - rotorPosition[2] + 1) + 26) % 26;
          i = 26;
        }
      }
      return reflectLetterNum;
    }
     
     //=============================================================================================================================================================================================================
    
    int sendThroughRotors(){
      //This
      
      //increases the rotor
      increaseRotor();
      //sends the letter through the first rotor, then the second rotor, then the third rotor, then calls the reflect function to send the letter backwards through the rotors
      // by adding the rotor position, you allow the wiring of each letter to switch
      cipherLetterNum = wiringOne[(cipherLetterNum + (rotorPosition[2]-1)) % 26];
      cipherLetterNum = wiringTwo[(cipherLetterNum + (rotorPosition[1]-1)) % 26];
      cipherLetterNum = wiringThree[(cipherLetterNum + (rotorPosition[0]-1)) % 26];
      cipherLetterNum = reflect(cipherLetterNum);
      return cipherLetterNum;
    }
   
    //=============================================================================================================================================================================================================
    void drawRotors(boolean interact){
    //Draws the rotors with the setting the rotor is at
    //Draws the triangle to increase/decrease the rotor setting
    float rotorX = width*0.3;
    textSize(20);
    text("Rotors",width*0.30625,height*0.5111);
    textSize(15);
    for(int i = 0; i < rotorPosition.length; i++){
      //three triangles are drawn, each representing a rotorPosition
      if(interact == true){
        fill(255);
      }else {
        fill(255*0.5);
      }
      triangle(rotorX+width*0.00125,height*0.54444,rotorX+width*0.01375,height*0.54444,rotorX+width*0.0075,height*0.5222);
      triangle(rotorX+width*0.00125,height*0.6,rotorX+22,height*0.6,rotorX+12,height*0.6222);
      strokeWeight(5);
      rect(rotorX,height*0.55556,width*0.015625,height*0.0333);
      fill(0);
      text(rotorPosition[i], rotorX+width*0.0025, height*0.5778);
      strokeWeight(1);
      
      //rotor button for  increase or decrease
      if(interact == true){
        if(mouseClicked){
          if(dist(mouseX,mouseY,rotorX+width*0.0075,height*0.5388) < height*0.01222){
            //if the mouse is within the set distance from the center of the triangle and the mouse is pressed, it increases the rotor position
            if(rotorPosition[i] < 26){
              rotorPosition[i] += 1;
              mouseClicked = false;
            }else{
              //prevents the rotorPosition from going above 26
              rotorPosition[i] = 1;
              mouseClicked = false;
            }
          }if(dist(mouseX,mouseY,rotorX+width*0.0075,height*0.6078) < height*0.01222){  
            if(rotorPosition[i] > 1){
              rotorPosition[i] -= 1;
              mouseClicked = false;
            }else{
              //prevents rotorPosition from going below 1
              rotorPosition[i] = 26;
              mouseClicked = false;

            }
          }
        }
      }
      rotorX += width*0.03125;
    }
  }
}
