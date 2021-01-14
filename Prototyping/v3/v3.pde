int mode=-1;

// for image saving
int counter=0;  

// colors 
color f1 = color(0);
color f2 = color(255);
int cols=2;
int rows=10;
CellForColor[][] palette = new CellForColor[cols][rows];
color[] rectCol = new color[20];

// command buttons !!!!!!!!!!!!!!
String[] namesOfCommands = {
  "Save", 
  "Pipette", 
  "straight line", 
  "rectangle", 
  "spray paint", 
  "ellipse"
};
CellForCommandButton[] buttons = new CellForCommandButton[namesOfCommands.length];

// --------------------------------------------------------------------------------

void setup() {
  size(500, 500);
  smooth();
  background(255);

  // command buttons !!!!!!!!!!!!!!
  for (int j=0; j<buttons.length; j++) {
    // j is y here 
    buttons[j] = new CellForCommandButton(width-120, j*45+5, 
      100, 40, 
      namesOfCommands[j] );
  }//for 

  //------

  // colors 
  for (int i=0; i<cols; i++) {
    for (int j=0; j<rows; j++) {
      palette[i][j] = new CellForColor(i*20, j*20, 20, 20, 2*j + i);
    }
  }

  rectCol[0] = color(0); //black
  rectCol[1] = color(255); //white
  rectCol[2] = color(46, 11, 11); //brown
  rectCol[3] = color(120, 10, 10); // dark red
  rectCol[4] = color(255, 0, 0); //red
  rectCol[5] = color(250, 71, 74); // light red
  rectCol[6] = color(245, 59, 255); //pinkish
  rectCol[7] = color(232, 0, 245); // pink
  rectCol[8] = color(129, 3, 137); //purple
  rectCol[9] = color(55, 55, 250); //light blue
  rectCol[10] = color(0, 0, 255); //blue
  rectCol[11] = color(0, 0, 150); //dark blue
  rectCol[12] = color(95, 247, 101); //light green
  rectCol[13] = color(0, 247, 10); //lime green
  rectCol[14] = color(0, 103, 4); //dark green
  rectCol[15] = color(58, 103, 0); //yellow green
  rectCol[16] = color(255, 255, 0); //yellow
  rectCol[17] = color(255, 100, 0); //orange
  rectCol[18] = color(155); // gray
  rectCol[19] = color(55); //grayer
}

void draw() {
  // command buttons !!!!!!!!!!!!!!
  for (CellForCommandButton currentButton : buttons) {
    currentButton.display();
  }

  // colors 
  for (int i=0; i<cols; i++) {
    for (int j=0; j<rows; j++) {
      palette[i][j].display();
      palette[i][j].checkMouseOver();
    }
  }


  fill(255);
  noStroke(); 
  rect(0, height-30, 
    width, 40); 
  fill(255, 0, 0); 
  text("Mode is "+mode, 
    50, height-19);
}

// -----------------------------------------------------------------------------

void mousePressed() {
  // colors 
  for (int i=0; i<cols; i++) {
    for (int j=0; j<rows; j++) {
      if (  palette[i][j].checkMouseOver() ) 
        return;
    }
  }

  // 
  // command buttons !!!!!!!!!!!!!!
  // Check mouseX/mouseY against button position/size
  String foundCMD="NONE"; 
  for (CellForCommandButton currentButton : buttons) {
    foundCMD = currentButton.checkMouseOver();  
    if (!foundCMD.equals("NONE") ) {
      break;
    }//if
  }//for

  // if found a command 
  if  (!foundCMD.equals("NONE") ) {
    println(foundCMD); 
    // eval cmd 
    switch(foundCMD) {
    case "Save":
      //// Save image here 
      String fileName = "savedImage-" + nf(counter, 3) + ".png";
      println("saving "+fileName); 
      save(fileName);
      counter++;
      break;

    case "Pipette":
      mode=0; 
      break;

    case "straight line":
      mode=1; 
      break;

      //case "line":
      //  mode=2; 
      //  break;

    case "rectangle":
      mode=2; 
      break;

    case "spray paint":
      mode=3; 
      break;

    case "ellipse":
      mode=4; 
      break;

    case "NONE":
      //ignore
      mode=-1; 
      break; 

    default: 
      println("Erro 19");
      break;
    }//switch
    //
  }//if
}//func 

void mouseDragged() {
  if (mouseButton == LEFT) {
    noFill();
    stroke(f1);
    strokeWeight(20);
    strokeJoin(ROUND);
    line(mouseX, mouseY, pmouseX, pmouseY);
  }
  if (mouseButton == RIGHT) {
    noFill();
    stroke(f2);
    strokeWeight(20);
    strokeJoin(ROUND);
    line(mouseX, mouseY, pmouseX, pmouseY);
  }
}

// ==============================================================================

class CellForCommandButton {

  // for the Command Buttons !!!!!!!!!

  float x, y, 
    w, h;
  String textCommandButton=""; 

  CellForCommandButton (float tempX, float tempY, 
    float tempW, float tempH, 
    String tempText1) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    textCommandButton = tempText1;
  }

  void display() {
    // rect 
    stroke(0);
    strokeWeight(1);
    fill(111); 
    rect(x, y, w, h);

    //text 
    fill(255);
    textAlign(CENTER, CENTER); 
    text(textCommandButton, 
      x+w/2, y+h/2);
  }

  String checkMouseOver() {
    if (mouseX > x &&
      mouseX < x+w && 
      mouseY > y && 
      mouseY < y+h) {
      return textCommandButton;
    }//if
    return "NONE";
  }//method
  //
}//class
//
// ==============================================================================

class CellForColor {

  // for the colors !!!!!!!!!

  float x, y, 
    w, h;
  int c;

  CellForColor (float tempX, float tempY, 
    float tempW, float tempH, 
    int tempC) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    c = tempC;
  }

  void display() {
    stroke(0);
    strokeWeight(3);
    fill(rectCol[c]);
    rect(x, y, w, h);
  }

  boolean checkMouseOver() {
    if (mouseX > x &&
      mouseX < x+w && 
      mouseY > y && 
      mouseY < y+h) {
      if (mouseButton == LEFT) 
        f1 = (get(mouseX, mouseY));
      else  
      if (mouseButton == RIGHT)  f2 = (get(mouseX, mouseY));
      return true;
    }//if
    return false;
  }//method
  //
}//class
//
