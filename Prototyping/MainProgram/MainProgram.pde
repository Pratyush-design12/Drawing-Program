//Credits : //<>//


//ControlP5 GUI LIBRARY
import controlP5.*;

//Minim Library
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//Global Variables  <------------------------------------------------------------->

// for image saving
int counter=0;
//Quit buttton variables
float quitButtonX, quitButtonY, quitButtonWidth, quitButtonHeight;
color buttonColour, resetWhite=#FFFFFF;
color circleRed = #FF0303;
float reset = #FFFFFF;
//Undo & Redo
float undoX, undoY, undoWidth, undoHeight;
float redoX, redoY, redoWidth, redoHeight;
boolean controlDown = false;
boolean shiftDown = false;
// Background Song
float PauseButtonX1, PauseButtonY1, PauseButtonDiameter;
int loopIntNum = 1;

//Global Variables 
AudioPlayer song1;
Minim minim;
Undo undo;
ColorPicker cp;


void setup() {
  
  population();
  //textSetup();
  fullScreen();
  background(#A29F9F);
  frameRate ( 100 );
  
  // Sound File
 
  minim = new Minim(this);
  song1 = minim.loadFile("Sample.mp3");
  song1.play();
  
  // COLOR WHEEL SIZE
  cp = new ColorPicker( 10, 10, 225, 225, 255 );
  
}
// DRAW < ================================================ >

void draw() {

  cp.render();

}
// Mouse Pressed  < ================================================ >

void mousePressed() {

  
}
//  KeyPressed  < ================================================ >

void keyPressed() {
  
  //Music control Buttons
  
  if ( key == ' ' )    println("[space]");{ // Press Space to PAUSE & PLAY
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


 
