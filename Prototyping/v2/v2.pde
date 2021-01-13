ColorPicker cp;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//Credits
// Press CTRL+Z to undo, CTRL+SHIFT+Z to redo 
// We need these to know if CTRL/SHIFT are pressed
// Quit button variables

float quitButtonX, quitButtonY, quitButtonWidth, quitButtonHeight;
color buttonColour, resetWhite=#FFFFFF;
color circleRed = #FF0303;


float oldX;
float oldY;

boolean controlDown = false;
boolean shiftDown = false;
PImage UndoI;
PImage RedoI;
float PauseButtonX1, PauseButtonY1, PauseButtonDiameter;
int loopIntNum = 1;

//Global Variables 
AudioPlayer song1;


Minim minim;
Undo undo;
 
void setup() {
  textSetup();
  fullScreen();
  smooth();
  background(#A29F9F);
  frameRate( 100 );
  minim = new Minim(this);
  song1 = minim.loadFile("Sample.mp3");
  song1.play();
  
     // Quit Button Location
  
  quitButtonX = width*18.3/19;
  quitButtonY = height*0.1/300;
  quitButtonWidth = width*1/27;
  quitButtonHeight = height*1/27;
  

  
  
  undo = new Undo(10);
  //UndoI = loadImage("UndoI.png");
 // RedoI = loadImage("RedoI.png");
    cp = new ColorPicker( 10, 10, 225, 225, 255 );
}
void draw() {
  
  //Quit Button (Draw)
  
  if ( mouseX>quitButtonX && mouseX<quitButtonX+quitButtonWidth && mouseY>quitButtonY && mouseY<quitButtonY+quitButtonHeight ) { 
    buttonColour = circleRed;
  } else { 
    buttonColour = resetWhite;
  } 
  fill(buttonColour);
  rect(quitButtonX, quitButtonY, quitButtonWidth, quitButtonHeight);
  textDraw();
  fill(0);
  //


    if(mousePressed){
    stroke(cp.penTool);
  line(mouseX, mouseY, oldX, oldY);
  }
  oldX=pmouseX;
  oldY=pmouseY;

 cp.render();
    
  
     //PImage UndoI = loadImage("UndoI.png");
     //image(UndoI, 2, 2);
     
     //PImage RedoI = loadImage("RedoI.png");
     //image(RedoI, 2, 2);
}
void mouseReleased() {
  // Save each line we draw to our stack of UNDOs
  undo.takeSnapshot();
}
 
void keyPressed() {
  // Remember if CTRL or SHIFT are pressed or not
  if (key == CODED) {
    if (keyCode == CONTROL)
      controlDown = true;
    if (keyCode == SHIFT)
      shiftDown = true;
    return;
  }
  // Check if we pressed CTRL+Z or CTRL+SHIFT+Z
  if (controlDown) {
    if (keyCode == 'Z') {
      if (shiftDown)
        undo.redo();
      else
        undo.undo();
    }
    return;
  }
  // Check if we pressed the S key
  if (key=='s') {
    saveFrame("image####.png");
  }
  
  if ( key == 'p' || key == 'P' ) {
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

   
// ================================================

}// End of func
 
 
void keyReleased() {
  // Remember if CTRL or SHIFT are pressed or not
  if (key == CODED) {
    if (keyCode == CONTROL)
      controlDown = false;
    if (keyCode == SHIFT)
      shiftDown = false;
  }
}
 
 
class Undo {
  // Number of currently available undo and redo snapshots
  int undoSteps=0, redoSteps=0; 
  CircImgCollection images;
 
  Undo(int levels) {
    images = new CircImgCollection(levels);
  }
 
  public void takeSnapshot() {
    undoSteps = min(undoSteps+1, images.amount-1);
    // each time we draw we disable redo
    redoSteps = 0;
    images.next();
    images.capture();
  }
  public void undo() {
    if(undoSteps > 0) {
      undoSteps--;
      redoSteps++;
      images.prev();
      images.show();
    }
  }
  public void redo() {
    if(redoSteps > 0) {
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
    current = (current + 1) % amount;
  }
  void prev() {
    current = (current - 1 + amount) % amount;
  }
  void capture() {
    img[current] = get();
  }
  void show() {
    image(img[current], 0, 0);
  }
}

 //------------------------------------------> Main Color wheel Code
 

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
    for( int i=0; i<cw; i++ ) 
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
    drawRect( cw, 0,   30, h/2, 0xFFFFFF );
    drawRect( cw, h/2, 30, h/2, 0 );
    
    // draw grey scale.
    for( int j=0; j<h; j++ )
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
    for(int i=rx; i<rx+rw; i++) 
    {
      for(int j=ry; j<ry+rh; j++) 
      {
        cpImage.set( i, j, rc );
      }
    }
  }
  
  public void render ()
  {
    image( cpImage, x, y );
    if( mousePressed &&
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
   
  //--------------------------------------------------------------------------->
 void mousePressed() { 
   // Press to Exit
  if ( mouseX>quitButtonX && mouseX<quitButtonX+quitButtonWidth && mouseY>quitButtonY && mouseY<quitButtonY+quitButtonHeight ) exit();
 }
