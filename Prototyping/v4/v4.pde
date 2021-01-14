float startX=-1, startY=-1;

// constants 
final int lineMode   = 0;
final int circleMode = 1;
final int rectMode   = 2;
final int brushMode  = 3;
int mode = brushMode; // current 

String[] description={
  "line mode", 
  "ellipse mode", 
  "rect mode", 
  "points mode"
}; 

//----------------------------------------------------------------------------------------------------

void setup() {
  size(900, 500);
  background(255);
} // func 

void draw() {

  showText();

  if (mode==lineMode) {
    if (startX>=0) {
      stroke(random(pmouseX), random(pmouseY), abs(pmouseX-pmouseY));
      line(startX, startY, pmouseX, pmouseY);
    }
  } else if (mode==circleMode) {
    if (startX>=0) {
      noFill();
      stroke(random(pmouseX), random(pmouseY), abs(pmouseX-pmouseY));
      ellipse (startX, startY, mouseX-startX, mouseY-startY);
    }
  } else if (mode==rectMode) {
    if (startX>=0) {
      noFill();
      stroke(random(pmouseX), random(pmouseY), abs(pmouseX-pmouseY));
      rect (startX, startY, mouseX-startX, mouseY-startY);
    }
  } else if  (mode==brushMode) {
    if (startX>=0) {
      noFill();
      for (int i=0; i<11; i++) {
        float r=random(18);
        float angle = random(TWO_PI); 
        float x1=(r*cos(angle)) + mouseX;
        float y1=(r*sin(angle)) + mouseY;
        stroke(255, 0, 0); 
        point(x1, y1);
      }
    }
  } else {
    println("Error on mode : 176");  
    exit();
  }
} // func draw() 

// -----------------------------------------------------------------

void showText() {
  noStroke(); 
  fill(111);
  rect(0, 0, width, 20);

  fill(255);
  text("Modes: e (ellipses), r (rectangles), l (lines), b (points). Current mode is "
    +description[mode]
    +". Mouse to draw. c to clear. q to quit.", 
    14, 14);
}

void keyPressed(){
  if (keyPressed) {
    if (key == 'c') {
      background(255);
    } else if (key==ESC) {
      key=0;
      startX=-1;
    }
    // ---------------------- modes 
    else if (key=='e') {
      mode = circleMode;
      println ("mode = circle Mode");
      startX=-1;
    } else if (key=='l') {
      mode = lineMode;
      println ("mode = line Mode");
      startX=-1;
    } else if (key=='r') {
      mode = rectMode;
      println ("mode = rect Mode");
      startX=-1;
    } else if (key=='b') {
      mode = brushMode;
      println ("mode = brush Mode");
      startX=-1;
    }

    // ---------------------------- quit 
    else if (key=='q') {
      exit(); // quit
    }
  } //
} // func 

void mousePressed() {
  startX=mouseX;
  startY=mouseY;
}

void mouseReleased() {
  startX=-1;
  startY=-1;
}
//
