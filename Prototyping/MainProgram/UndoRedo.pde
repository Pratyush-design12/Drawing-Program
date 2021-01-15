void undoInfo() {
  String undoText="Undo";
  PFont undoFont;
  undoFont = createFont ("Gabriola", 60);
  //
  fill(buttonColour);
  textAlign(CENTER, CENTER);
  textFont(undoFont, 25);
  //
  text(undoText, undoX, undoY, undoWidth, undoHeight);
  fill(reset);
}//end of UndoTexT



void undoButton() {
  if (mouseX>undoX && mouseX<undoX+undoWidth  && mouseY>undoY && mouseY<undoY+undoHeight) {
    stroke (buttonColour);
    fill (buttonColour);
    rect(undoX, undoY, undoWidth, undoHeight);
    stroke (reset);
    fill(reset);
    undoInfo();
  } else {
    strokeWeight(4);
    stroke (circleRed);
    fill (circleRed);
    rect(undoX, undoY, undoWidth, undoHeight);
    stroke (reset);
    fill(reset);
    undoInfo();
  }
}//end of Undo-button


void redoInfo() {
  String redoText="Redo";
  PFont redoFont;
  redoFont = createFont ("Gabriola", 60);
  //
  fill(buttonColour);
  textAlign(CENTER, CENTER);
  textFont(redoFont, 25);
  //
  text(redoText, redoX, redoY, redoWidth, redoHeight);
  fill(reset);
}//end of RedoText



void redoButton() {
  if (mouseX>redoX && mouseX<redoX+redoWidth  && mouseY>redoY && mouseY<redoY+redoHeight) {
    stroke (buttonColour);
    fill (buttonColour);
    rect(redoX, redoY, redoWidth, redoHeight);
    stroke (reset);
    fill(reset);
    redoInfo();
  } else {
    strokeWeight(4);
    stroke (circleRed);
    fill (circleRed);
    rect(redoX, redoY, redoWidth, redoHeight);
    stroke (reset);
    fill(reset);
    redoInfo();
  }
}//end of Redo-button
