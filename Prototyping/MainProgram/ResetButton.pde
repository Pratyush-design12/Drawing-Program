void ResetButton() {
  if (mouseX>ResetX && mouseX<ResetX+ResetWidth  && mouseY>ResetY && mouseY<ResetY+ResetHeight) {
    stroke (buttonColour);
    fill (buttonColour);
    rect(ResetX, ResetY, ResetWidth, ResetHeight);
    stroke (reset);
    fill(reset);
    
  } else {
    strokeWeight(4);
    stroke (#DE61E0);
    fill (#DE61E0);
    rect(ResetX, ResetY, ResetWidth, ResetHeight);
    stroke (reset);
    fill(reset);
    ResetButtonText();
  }
}//end of ResetButton


void ResetPressed() {
  if (mouseX>ResetX && mouseX<ResetX+ResetWidth  && mouseY>ResetY && mouseY<ResetY+ResetHeight) {
    LineArt1 = false;
    LineArt2 = false;
    LineArt3 = false;
    LineArt4 = false;
    LineArt5 = false;
    LineArt6 = false;
    LineArt7 = false;
    LineArt8 = false;
    LineArt9 = false;
    LineArt10 = false;
    rect(drawingSurfaceX, drawingSurfaceY, drawingSurfaceWidth, drawingSurfaceHeight);
     penTool = false;
     
    sound[1].play();
    sound[1].rewind();
  }
}
