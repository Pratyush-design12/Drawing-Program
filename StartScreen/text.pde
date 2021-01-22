String buttonText = "Start!";
PFont font;

void textSetup() {
font = createFont ("Arial", 55);
}

void textDraw() {

  textAlign (CENTER, CENTER); 
  //textFont(font, 20);
  text(buttonText,Startx,Starty,Startw, Starth);
  fill(255);
  
}
