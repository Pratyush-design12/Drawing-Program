FloodFill1 myFloodFill ;
ColorPicker cp;
int startTimeMs;

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

final int startDelayMs = 5000;
boolean atStartup = true;

Minim minim;

// Quit button variables
float quitButtonX, quitButtonY, quitButtonWidth, quitButtonHeight;

boolean stroke;
PImage savei;
PImage redoi;
PImage undoi;
String buttonText = "X";
PFont titleFont;
float drawingSurfaceX, drawingSurfaceY, drawingSurfaceWidth, drawingSurfaceHeight;
float drawingDiameter;
color buttonColour, resetWhite=#FFFFFF;
color circleRed = #FF0303;
float oldX;
float oldY;
/*color redC= color(255, 0, 0);
 color greenC= color(0, 255, 0);
 color blueC= color(0, 0, 255);
 color yellow= color(247, 240, 0);
 color orange= color(247, 112, 0);
 color violet= color(110, 0, 220);
 color blueGreen= color(0, 247, 146);
 color yellowGreen= color(157, 250, 0);
 color pink= color(255, 28, 97);
 color yellowOrange= color(255, 159, 3);*/
color white= color(255);
color black= color(0);
float masterStroke= 1;
//AudioPlayer[] song = new AudioPlayer[numberOfSongs];
//AudioMetaData[] songMetaData = new AudioMetaData[numberOfSongs];
float PauseButtonX1, PauseButtonY1, PauseButtonDiameter;
int loopIntNum = 1;

//Global Variables 
AudioPlayer song1;

void setup()
{

  noFill();
  textSetup();
  fullScreen();
  smooth();
  background(#A29F9F);
  frameRate( 100 );
  minim = new Minim(this);
  song1 = minim.loadFile("Sample.mp3");
  song1.play();

  cp = new ColorPicker( 10, 10, 225, 225, 255 );

  drawingSurfaceX = width*1/11;
  drawingSurfaceY = height*0.08;
  drawingSurfaceWidth = width*8/9;
  drawingSurfaceHeight = height*9/10;
  fill(white);

  // Quit Button Location

  quitButtonX = width*18.3/19;
  quitButtonY = height*0.1/300;
  quitButtonWidth = width*1/27;
  quitButtonHeight = height*1/27;

  rect(drawingSurfaceX, drawingSurfaceY, drawingSurfaceWidth, drawingSurfaceHeight);
}

void textSetup() { 
  titleFont = createFont ("Arial", 55);
}

void textDraw() { 
  fill(black); 
  textAlign (CENTER, CENTER); 
  textFont(titleFont, 20); 
  text(buttonText, quitButtonX, quitButtonY, quitButtonWidth, quitButtonHeight);
  fill(255);
}

void draw() {



  loadPixels();
  myFloodFill = new FloodFill1();
  if (mousePressed) {
    myFloodFill.DoFill(mouseX, mouseY, color(255, 0, 0));
    updatePixels();
  }

  //Quit Button (Draw)

  if ( mouseX>quitButtonX && mouseX<quitButtonX+quitButtonWidth && mouseY>quitButtonY && mouseY<quitButtonY+quitButtonHeight ) { 
    buttonColour = circleRed;
  } else { 
    buttonColour = resetWhite;
  } 
  fill(buttonColour);
  rect(quitButtonX, quitButtonY, quitButtonWidth, quitButtonHeight);
  textDraw();
  fill(black);
  //


  cp.render();



  /*strokeWeight(1);
   fill(redC );
   rect(10, 10, 25, 25 );
   fill(blueC );
   rect(35, 10, 25, 25 );
   fill(greenC);
   rect(10, 35, 25, 25);
   fill(yellow);
   rect(35, 35, 25, 25);
   fill(orange);
   rect(10, 60, 25, 25);
   fill(violet);
   rect(35, 60, 25, 25);
   fill(blueGreen);
   rect(10, 85, 25, 25);
   fill(yellowGreen);
   rect(35, 85, 25, 25);
   fill(pink);
   rect(10, 110, 25, 25);
   fill(yellowOrange);
   rect(35, 110, 25, 25);
   fill(white);
   rect(10, 135, 25, 25);*/
  //fill(black);
  // rect(35, 135, 25, 25);
  line(450, 30, 500, 30);
  strokeWeight(4);
  line(450, 50, 500, 50);
  strokeWeight(8);
  line(450, 80, 500, 80);
  strokeWeight(1);
  fill(255);
  rect(250, 10, 50, 50);

  /*if(mousePressed) {
   if(mouseX > 10 && mouseX < 35){
   if(mouseY >10 && mouseY < 35){
   stroke(redC);
   }
   if(mouseY>35 && mouseY < 60){
   stroke(greenC);
   }
   if(mouseY>60 && mouseY<85){
   stroke(orange);
   }
   if(mouseY>85 && mouseY<110){
   stroke(blueGreen);
   }
   if(mouseY>110 && mouseY<135){
   stroke(pink);
   }
   if(mouseY>135 && mouseY<160){
   stroke(white);
   }
   }
   if(mouseX > 35 && mouseX < 60){
   if( mouseY > 10 && mouseY <35){
   stroke(blueC);
   }
   if(mouseY > 35 && mouseY < 50){
   stroke(yellow);
   }
   if(mouseY > 60 && mouseY < 85){
   stroke(violet);
   }
   if(mouseY >85 && mouseY < 110) {
   stroke(yellowGreen);
   }
   if(mouseY > 110 && mouseY <135){
   stroke(yellowOrange);
   }
   if(mouseY >135 && mouseY <160){
   stroke(black);
   }
   }*/
  if (mousePressed) {
    if (mouseX > 450 && mouseX <500) {
      if (mouseY >10 && mouseY <40) {
        masterStroke= 1;
      }
    }
    if (mouseX > 450 && mouseX <500) {
      if (mouseY >40 && mouseY <70) {
        masterStroke= 4;
      }
    }
    if (mouseX > 450 && mouseX <500) {
      if (mouseY > 70 && mouseY <100) {
        masterStroke= 7;
      }
    }
    strokeWeight(1);
  }
  if (mousePressed) {
    if (mouseX > 250 && mouseX <300) {
      if (mouseY > 10 && mouseY <60) {
        rect(drawingSurfaceX, drawingSurfaceY, drawingSurfaceWidth, drawingSurfaceHeight);
      }
    }
  }
  if (mousePressed) {
    line(mouseX, mouseY, oldX, oldY);
  }

oldX=pmouseX;
oldY=pmouseY;

//if ( mouseX>drawingSurfaceX  && mouseX<drawingSurfaceX+drawingSurfaceWidth  && mouseY>drawingSurfaceY && mouseY<drawingSurfaceY+drawingSurfaceHeight) {
//  println("drawing surface");
//  if (stroke == false) {
//    stroke = true;
//  } else {
//    stroke = false;
 // }
//}

}          

//<---------------------------------- Fill BUTTON Code -------------------------------------------->
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

//------------------------------------------> Main Color wheel Code


public class ColorPicker 
{
  int x, y, w, h, c;
  PImage cpImage;

  public ColorPicker ( int x, int y, int w, int h, int c )
  {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.c = c;

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
  }
}


//---------------------------------------------------------------------------> Music Controls BUTTONS (P, S, F, R, L )
void keyPressed() {

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
}



// ================================================
void mouseClicked() {
}
void mousePressed() { 
  // Press to Exit
  if ( mouseX>quitButtonX && mouseX<quitButtonX+quitButtonWidth && mouseY>quitButtonY && mouseY<quitButtonY+quitButtonHeight ) exit();
}
