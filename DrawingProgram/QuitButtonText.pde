String buttonText = "X";
PFont titleFont;

void textSetup() { 
  titleFont = createFont ("Arial", 55);
}

void textDraw() { 
  fill(black); 
  textAlign (CENTER, CENTER); 
  textFont(titleFont, 20); 
  text(buttonText, quitButtonX, quitButtonY, quitButtonWidth, quitButtonHeight);
  fill(255);
}
