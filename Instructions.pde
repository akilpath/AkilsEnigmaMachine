class Instructions{

  Instructions(){
  }
  //All the uncommented code is the work for instructions built into the program, will be added soon
  void drawInstructions(){
    //draws the url for the instructions document
    fill(255);
    rect(width*0.3,height*0.3,width*0.5,height*0.1);
    fill(0);
    text("Instructions can be found here: \nhttps://docs.google.com/document/d/1cLPUatdBDXRovAFpSf2h0eN3X7B3fAk_6EUmVYMyCoU/edit?usp=sharing",width*0.31,height*0.35);
    /*whatIsItParagraph();
    howDoesItWorkParagraph();*/
    drawBackButton();
  }
  /*
  void howDoesItWorkParagraph(){
    fill(255);
    rect(width*0.04,height*0.3,width*0.37,height*0.4);
    fill(0);
    textSize(50);
    text("How does it Work?",width*0.05,height*0.35);
    textSize(15);
    
  }
  
  void howToCipherAMessage(){
    //fill(255);
    //rect(width*0.04,height*0.3,
    
    
  }
  
  void whatIsItParagraph(){
    fill(255);
    rect(width*0.04,height*0.05,width*0.37,height*0.22);
    fill(0);
    textSize(50);
    text("What Is It", width*0.05, height*0.1);
    textSize(15);
    text("The Enigma Machine is a type of cipher machines that was used by Nazi Germany during\nWorld War II. It was a very popular machine for encrypting messages because the\nencryption changed with every key press, and there are billions of different configurations\nfor the settings (158,962,555,217,826,360,000). It was a very important machine for the\nGermans to transmit secret messages…. until the Allies deciphered it.",width*0.05, height*0.15);
  }
  */
  void drawBackButton(){
    fill(255);
    rect(width*0.05, height*0.9,width*0.03125,height*0.03333);
    fill(0);
    text("Back",width*0.055,height*0.92);
    
    if(mousePressed && mouseX > width*0.05 && mouseX < width*0.05 + width*0.03125 && mouseY > height*0.9 && mouseY < height*0.9 + height*0.03333){
      screen = "enigmaBox";
    }
  
  }
  
}
