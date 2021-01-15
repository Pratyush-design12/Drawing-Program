void quitButtonText() {
  String quitButtonText="X";
  PFont quitFont;
  quitFont = createFont ("Arial", 50);
  //
  fill(0);
  textAlign(CENTER, TOP);
  textFont(quitFont, 50);
  //
  text(quitButtonText, quitButtonX, quitButtonY, quitButtonWidth, quitButtonHeight);
  fill(reset);
}//end of quitButInfo



void quitButton() {
  if (mouseX>quitButtonX && mouseX<quitButtonX+quitButtonWidth  && mouseY>quitButtonY && mouseY<quitButtonY+quitButtonHeight) {
    stroke (buttonColour);
    fill (buttonColour);
    rect(quitButtonX, quitButtonY, quitButtonWidth, quitButtonHeight);
    stroke (reset);
    fill(reset);
    quitButtonText();
  } else {
    strokeWeight(4);
    stroke (circleRed);
    fill (circleRed);
    rect(quitButtonX, quitButtonY, quitButtonWidth, quitButtonHeight);
    stroke (reset);
    fill(reset);
    quitButtonText();
  }
}//end of quitButton
