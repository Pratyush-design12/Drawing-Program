//Minim Library
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;


//Global Variables  <------------------------------------------------------------->

PVector v1;
int PenPrevX,PenPrevY;

//Spray Button
final int maxIterations = 500000;  // that's how fast spraying happens

// for image saving
int counter=0;

//Line Art
PImage[] imageList = new PImage[10];
int indexImage=0;

//Quit & Undo & Redo & Reset Button Variables
float quitButtonX, quitButtonY, quitButtonWidth, quitButtonHeight;
color buttonColour, resetWhite=#FFFFFF;
color circleRed = #FF0303;
float reset = #FFFFFF;
float ResetX, ResetY, ResetWidth, ResetHeight;
float undoX, undoY, undoWidth, undoHeight;
float redoX, redoY, redoWidth, redoHeight;
boolean controlDown = false;
boolean shiftDown = false;

//Canvas Variables
Boolean draw=true; // 
int thick = 5; //initial thickness
float drawingSurfaceX, drawingSurfaceY, drawingSurfaceWidth, drawingSurfaceHeight; ///ßßß?????

float drawingDiameter;

// Background Song
float PauseButtonX1, PauseButtonY1, PauseButtonDiameter;
int loopIntNum = 1;

String[] namesOfCommands = {

  "Rectangle", 
  "Pencil",
  "Triangle", 
  "Circle", 
  "Spray", 
  "Fill", 
  "Caligraphy", 
  "Save", 

};
CellForCommandButton[] buttons = new CellForCommandButton[namesOfCommands.length];

//Global Variables 

FloodFill1 myFloodFill;
AudioPlayer song1;
Minim minim;
Undo undo;
ColorPicker cp;

int mode = 0; // NONE

void setup() {
  
    
  imageList[i] = loadImage("img00 ("+i+").JPG" ) ;
  imageList[i].resize(80, 0);
  
  population();
  textSetup();
  fullScreen();
  background(#A59696);
  frameRate ( 100 );
  //noFill();

  // command buttons !!!!!!!!!!!!!!
  for (int j=0; j<buttons.length; j++) {
    // j is y here 
    buttons[j] = new CellForCommandButton(270+ j*110, 44, 
      100, 40, 
      namesOfCommands[j] );
  }//for 

  // Sound File

  minim = new Minim(this);
  song1 = minim.loadFile("Sample.mp3");
  song1.play();

  //COLOR WHEEL SIZE
  cp = new ColorPicker( 10, 10, 225, 225, 255 );
  //UNDO
  undo = new Undo(10);

  //Canvas
  rect(drawingSurfaceX, drawingSurfaceY, drawingSurfaceWidth, drawingSurfaceHeight);

  //ClearCanvas
 
}
// DRAW < ================================================ >

  void draw() {
    
    menu();
    
    fill(0); 
  text("Click mouse to show an Image", 
    13, 14);
    
if ( draw == true &&
    mousePressed && 
    mouseX>drawingSurfaceX  &&
    mouseX<drawingSurfaceX+drawingSurfaceWidth  &&
    mouseY>drawingSurfaceY &&
    mouseY<drawingSurfaceY+drawingSurfaceHeight) {

      
    switch (mode) {
    case 0:
      println("here");
      strokeWeight(thick);
      stroke(cp.penTool);
      line(mouseX, mouseY, pmouseX, pmouseY);
      break; 

    case 1:
      stroke(0);
      strokeWeight(1);
      fill(255);
      rect(mouseX, mouseY, 100, 100);
      break;

    case 2:
      stroke(0); 
      fill(255);
      strokeWeight(1);
      triangle(mouseX, mouseY, 
        mouseX+100, mouseY-100, 
        mouseX+200, mouseY+200);
      break;

    case 3:
      stroke(0); 
      fill(255);
      strokeWeight(1);
      ellipse(mouseX, mouseY, 
        100, 100);
      break;

    case 4:
      if (mousePressed) {
      loadPixels();
      myFloodFill = new FloodFill1();
      myFloodFill.DoFill(mouseX, mouseY, color(cp.penTool));
      updatePixels(); }
      break;

    case 5:
      stroke(cp.penTool); 
      for (int i= 0; i < random(39); i++) {
        point (mouseX+random(-23, 23), 
          mouseY+random(-23, 23));
      }
      break;
      
      case 6:
      
      v1=new PVector();
    if(mousePressed){
       // brush(pmouseX,pmouseY,mouseX,mouseY);
        strokeWeight(thick);
        stroke(cp.penTool);
        smooth();
      for(int i=0;i<60;i++){
      line(pmouseX+5,pmouseY-5,mouseX-5,mouseY+5);
      line(pmouseX+4,pmouseY-4,mouseX-4,mouseY+4);
      line(pmouseX+3,pmouseY-3,mouseX-3,mouseY+3);
      line(pmouseX+2,pmouseY-2,mouseX-2,mouseY+2);
      line(pmouseX+1,pmouseY-1,mouseX-1,mouseY+1);
      line(pmouseX,pmouseY,mouseX,mouseY);
      line(pmouseX-1,pmouseY+1,mouseX+1,mouseY-1);
      line(pmouseX-2,pmouseY+2,mouseX+2,mouseY-2);
      line(pmouseX-3,pmouseY+3,mouseX+3,mouseY-3);
      line(pmouseX+4,pmouseY-4,mouseX-4,mouseY+4);
      line(pmouseX+5,pmouseY-5,mouseX-5,mouseY+5);
      //brush(pmouseX,pmouseY,PenPrevX,PenPrevY);
      }
    }
    }//switch
  }//if

      strokeWeight(1);
  if ( mouseX>quitButtonX && mouseX<quitButtonX+quitButtonWidth && mouseY>quitButtonY && mouseY<quitButtonY+quitButtonHeight ) { 
    buttonColour = circleRed;
  } else { 
    buttonColour = resetWhite;
  } 
  fill(buttonColour);
  rect(quitButtonX, quitButtonY, quitButtonWidth, quitButtonHeight);
  textDraw();
  fill(0);

  cp.render();

  // command buttons !!!!!!!!!!!!!!
  for (CellForCommandButton currentButton : buttons) {
    currentButton.display();
  }
}

 void menu(){ //interface for the Left
//color & thick display
  stroke(cp.penTool);
  strokeWeight(thick);
  line(90,450,90,650); 
//buttons
  stroke(10);
  strokeWeight(3.7); 
  fill(255);
  rect(25, 355, 60, 60);//plus button
  rect(95, 355, 60, 60);//minus button
  rect(25, 800, 135, 60);//reset button
  rect(25, 700, 135, 60); //eraser button
//text on the button
  fill(0);
  text("Line Art",87,730); 
  text("RESET",87,833); 
  noStroke(); 
  rect(50,360,10,50);//symbol increase thickness
  rect(30,380,50,10);//symbol increase thickness
  rect(100,380,50,10);//symbol decrease thickness
 }

// Mouse Pressed  < ================================================ >


void mousePressed() {
  
       if (indexImage<imageList.length-1)
    image( imageList[indexImage], mouseX, mouseY);
  indexImage++;
  println(indexImage);

  
 if ( mouseX>drawingSurfaceX  &&
    mouseX<drawingSurfaceX+drawingSurfaceWidth  &&
    mouseY>drawingSurfaceY && 
    mouseY<drawingSurfaceY+drawingSurfaceHeight) {
    println("drawing surface");
    //if (draw == false) {
    draw = true;
    //} else {
    //  draw = false;
    }
    if (mousePressed && pmouseX>25 && pmouseX<85 && pmouseY>355 && pmouseY<415){
    thick = constrain(thick+1,5,60); //increase the thickness when click the "plus" button
    }else if (mousePressed && pmouseX>95 && pmouseX<155 && pmouseY>355 && pmouseY<415){
    thick = constrain(thick-1,5,60);//decrease the thickness when click the "minus" button
    }
    //Line Art
    
    
  // Press to Exit
  if ( mouseX>quitButtonX &&
    mouseX<quitButtonX+quitButtonWidth &&
    mouseY>quitButtonY &&
    mouseY<quitButtonY+quitButtonHeight )
    exit();

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

    case "Pencil":
      mode = 0;
      break;

    case "Rectangle":
      mode = 1; 
      break; 

    case "Triangle":
      mode = 2; 
      break; 

    case "Circle":
      mode = 3; 
      break; 

    case "Fill":
      mode=4; 
      break; 

    case "Spray":
      // 
      mode = 5; 
      break; 

    case "caligraphy":
    //
    mode = 6;
      break; 
      //
    }//switch
  }

  if (mousePressed && pmouseX>25 && pmouseX<160 && pmouseY>800 && pmouseY<860){
    fill(255);
    rect(drawingSurfaceX, drawingSurfaceY, drawingSurfaceWidth, drawingSurfaceHeight); }

}
// Mouse Released  < ================================================ >
void mouseReleased() {
  // Save each line we draw to our stack of UNDOs
  undo.takeSnap();
}

//  KeyPressed  < ================================================ >

void keyPressed() {

  /*if ( key == 'a' || key == 'A' ) {
    // shuffle 
    img=shuffle( img );
  }*/

  //Music control Buttons

  if ( key == ' ' ) { // ??????
    // Press Space to PAUSE & PLAY
    println("[space]");
    if ( song1.isPlaying() ) {
      song1.pause();
    } else if ( song1.position() == song1.length() ) {
      song1.rewind();   
      song1.play();
    } else {
      song1.play();
      //Play
    }
  }
  //
  if ( key == 's' || key == 'S' ) {
    if ( song1.isPlaying() ) {
      song1.pause();
      song1.rewind();
    } else if ( song1.position() == song1.length() ) {
      song1.rewind();
    } else {
      song1.rewind();
    }
  }

  if ( key == 'f' || key == 'f' ) song1.skip(1000);
  if ( key == 'r' || key == 'R' ) song1.skip(-1000);
  if ( key == 'l' || key == 'L' ) song1.loop(loopIntNum);

  //UNDO AND REDO
  if (key == CODED) {
    if (keyCode == CONTROL) 
      controlDown = true;
    if (keyCode == SHIFT)
      shiftDown = true;
    return;
  } 
  // redo(control shift Z) or an undo(control Z)
  if (controlDown) {
    if (keyCode == 'Z') {
      if (shiftDown)
        undo.redo();
      else
        undo.undo();
    }
    return;
  }
  if (key=='s') {
    saveFrame("image####.png");
  }
}//end of keyPressed


// KeyReleased Code  < ================================================ >

void keyreleased() {

  if (key == CODED) {
    if (keyCode == CONTROL) 
      controlDown = false;
    if (keyCode == SHIFT)
      shiftDown = false;
  }
}//end of keyReleased 


// MAIN COLOR WHEEL CODE < ================================================ >

public class ColorPicker 
{
  int x, y, w, h, c;
  PImage cpImage;
  color penTool;

  public ColorPicker ( int x, int y, int w, int h, int c )
  {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.c = c;
    this.penTool = c;

    cpImage = new PImage( w, h );

    init();
  }

  private void init ()
  {
    // draw color.
    int cw = w - 60;
    for ( int i=0; i<cw; i++ ) 
    {
      float nColorPercent = i / (float)cw;
      float rad = (-360 * nColorPercent) * (PI / 180);
      int nR = (int)(cos(rad) * 127 + 128) << 16;
      int nG = (int)(cos(rad + 2 * PI / 3) * 127 + 128) << 8;
      int nB = (int)(Math.cos(rad + 4 * PI / 3) * 127 + 128);
      int nColor = nR | nG | nB;

      setGradient( i, 0, 1, h/2, 0xFFFFFF, nColor );
      setGradient( i, (h/2), 1, h/2, nColor, 0x000000 );
    }

    // draw black/white.
    drawRect( cw, 0, 30, h/2, 0xFFFFFF );
    drawRect( cw, h/2, 30, h/2, 0 );

    // draw grey scale.
    for ( int j=0; j<h; j++ )
    {
      int g = 255 - (int)(j/(float)(h-1) * 255 );
      drawRect( w-30, j, 30, 1, color( g, g, g ) );
    }
  }

  private void setGradient(int x, int y, float w, float h, int c1, int c2 )
  {
    float deltaR = red(c2) - red(c1);
    float deltaG = green(c2) - green(c1);
    float deltaB = blue(c2) - blue(c1);

    for (int j = y; j<(y+h); j++)
    {
      int c = color( red(c1)+(j-y)*(deltaR/h), green(c1)+(j-y)*(deltaG/h), blue(c1)+(j-y)*(deltaB/h) );
      cpImage.set( x, j, c );
    }
  }

  private void drawRect( int rx, int ry, int rw, int rh, int rc )
  {
    for (int i=rx; i<rx+rw; i++) 
    {
      for (int j=ry; j<ry+rh; j++) 
      {
        cpImage.set( i, j, rc );
      }
    }
  }

  public void render ()
  {
    image( cpImage, x, y );
    if ( mousePressed &&
      mouseX >= x && 
      mouseX < x + w &&
      mouseY >= y &&
      mouseY < y + h )
    {
      c = get( mouseX, mouseY );
    }
    fill( c );
    rect( x, y+h+10, 20, 20 );
    penTool = color(c);
  }
}


// Class for UNDO & REDO <---------------------------------------------------->

class Undo {
  // Number ss taken
  int undoSteps=0, redoSteps=0;  
  CircImgCollection images;
  //
  Undo(int levels) {
    images = new CircImgCollection(levels);
  }

  public void takeSnap() {
    undoSteps = min(undoSteps+1, images.amount-1);
    // each time we draw we disable redo
    redoSteps = 0;
    images.next();
    images.capture();
  }
  public void undo() {
    if (undoSteps > 0) {
      undoSteps--;
      redoSteps++;
      images.prev();
      images.show();
    }
  }
  public void redo() {
    if (redoSteps > 0) {
      undoSteps++;
      redoSteps--;
      images.next();
      images.show();
    }
  }
}


class CircImgCollection {
  int amount, current;
  PImage[] img;
  CircImgCollection(int amountOfImages) {
    amount = amountOfImages;

    // Initialize all images as copies of the current display
    img = new PImage[amount];
    for (int i=0; i<amount; i++) {
      img[i] = createImage(width, height, RGB);
      img[i] = get();
    }
  }
  void next() {
    // ????
    if (amount!=0)
      current = (current + 1) % amount;
  }
  void prev() {
    current = (current - 1 + amount) % amount;
  }
  void capture() {
    // ???
    if (img!=null&&img.length>=1)
      img[current] = get();
  }
  void show() {
    image(img[current], 0, 0);
  }
}

// -------------------------------------------------------
void Spraybrush () {

  int width1=30; // that be the width of your brush
  //
  float radx;   // Radius
  float rady;
  float angle1; // angle
  float x;      // result
  float y;
  //
  for (int i=0; i < maxIterations; i++) {
    radx=random(width1);
    rady=random(width1);
    angle1= random(359);
    //
    x=(radx*cos(radians(angle1)))+mouseX;
    y=(radx*sin(radians(angle1)))+mouseY;
    //
    point(x, y);
  }
} // func

void Calligraphybrush(int x1,int y1,int x2,int y2)
{
  strokeWeight(1);
    line(x1+5,y1-5,x1-5,y1+5);
    line(x2+5,y2-5,x2-5,y2+5);
}

// ----------------------------------------------------------

public class FloodFill1
{
  protected int iw; // Image width
  protected int ih; // Image height
  protected color[] imagePixels;
  protected color backColor; // Color found at given position
  protected color fillColor; // Color to apply
  // Stack is almost deprecated and slow (synchronized).
  // I would use Deque but that's Java 1.6, excluding current (mid-2009) Macs...
  protected ArrayList stack = new ArrayList();
  //
  public FloodFill1()
  {
    iw = width;
    ih = height;
    imagePixels = pixels; // Assume loadPixels have been done before
  }
  //
  public FloodFill1(PImage imageToProcess)
  {
    iw = imageToProcess.width;
    ih = imageToProcess.height;
    imagePixels = imageToProcess.pixels; // Assume loadPixels have been done before if sketch image
  }
  //
  public void DoFill(int startX, int startY, color fc)
  {
    // start filling
    fillColor = fc;
    backColor = imagePixels[startX + startY * iw];
    // don't run if fill color is the same as background one
    if (fillColor == backColor)
      return;
    stack.add(new PVector(startX, startY));
    while (stack.size () > 0)
    {
      PVector p = (PVector) stack.remove(stack.size() - 1);
      // Go left
      FillScanLine((int) p.x, (int) p.y, -1);
      // Go right
      FillScanLine((int) p.x + 1, (int) p.y, 1);
    }
  }
  //
  protected void FillScanLine(int x, int y, int dir)
  {
    // compute current index in pixel buffer array
    int idx = x + y * iw;
    boolean inColorRunAbove = false;
    boolean inColorRunBelow = false;
    // fill until boundary in current scanline...
    // checking neighbouring pixel rows
    while (x >= 0 && x < iw && imagePixels[idx] == backColor)
    {
      imagePixels[idx] = fillColor;
      if (y > 0) // Not on top line
      {
        if (imagePixels[idx - iw] == backColor)
        {
          if (!inColorRunAbove)
          {
            // The above pixel needs to be flooded too, we memorize the fact.
            // Only once per run of pixels of back color (hence the inColorRunAbove test)
            stack.add(new PVector(x, y-1));
            inColorRunAbove = true;
          }
        } else // End of color run (or none)
        {
          inColorRunAbove = false;
        }
      }
      if (y < ih - 1) // Not on bottom line
      {
        if (imagePixels[idx + iw] == backColor)
        {
          if (!inColorRunBelow)
          {
            // Idem with pixel below, remember to process there
            stack.add(new PVector(x, y + 1));
            inColorRunBelow = true;
          }
        } else // End of color run (or none)
        {
          inColorRunBelow = false;
        }
      }
      // Continue in given direction
      x += dir;
      idx += dir;
    } //
  } // func
} // class
// ----------------------------------------------------------
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
// ======================================================
