void ResetButtonInfo() {
  String ResetButtonText="Clear";
  PFont ResetFont;
  ResetFont = createFont ("Arial", 60);
  //
  fill(buttonColour);
  textAlign(CENTER, CENTER);
  textFont(ResetFont, 40);
  //
  text(ResetButtonText, ResetX, ResetY, ResetWidth, ResetHeight);
  fill(reset);
}//end of clearButInfo
