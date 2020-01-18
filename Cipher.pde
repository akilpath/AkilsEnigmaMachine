class Cipher{
  int letterCiphered;
  Cipher(){
  }
  
  //=============================================================================================================================================================================================================
  int cipherLetter(char cipherLetter){
    //changes the character value of cipherLetter into a number
    int cipherLetterNum = getCharInt(cipherLetter);
    //sends that number through the plugboard
    cipherLetterNum = letterToCheck.checkLetterSwapped(cipherLetterNum);
    //initializes rotors object
    rotors = new Rotors(cipherLetterNum);
    //sets cipherLetterNum  equal to whatever number is returned from the rotors
    cipherLetterNum = rotors.sendThroughRotors();
    //sends cipherletterNum through the plugboard
    letterCiphered = letterToCheck.checkLetterSwapped(cipherLetterNum);
    return letterCiphered;
  }
  
  //=============================================================================================================================================================================================================
  int getCharInt(char character){
    //a switch case used to get the number of a letter in the alphabet
    character = Character.toUpperCase(character);
    switch(character){
      case 'Q':
        return 0;
      case 'W':
        return 1;
      case 'E':
        return 2;
      case 'R':
        return 3;
      case 'T':
        return 4;
      case 'Z':
        return 5;
      case 'U':
        return 6;
      case 'I':
        return 7;
      case 'O':
        return 8;
      case 'A':
        return 9;
      case 'S':
        return 10;
      case 'D':
        return 11;
      case 'F':
        return 12;
      case 'G':
        return 13;
      case 'H':
        return 14;
      case 'J':
        return 15;
      case 'K':
        return 16;
      case 'P':
        return 17;
      case 'Y':
        return 18;
      case 'X':
        return 19;
      case 'C':
        return 20;
      case 'V':
        return 21;
      case 'B':
        return 22;
      case 'N':
        return 23;
      case 'M':
        return 24;
      case 'L':
        return 25;
      default:
        println("Wrong value sent into getCharInt of Cipher");
        return -1;
    }
  }
}
