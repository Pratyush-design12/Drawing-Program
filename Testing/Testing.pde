float oldX;
float oldY;
float masterStroke= 1;

ColorPicker cp;

 // Background Audio
import processing.sound.*;
SoundFile file;

void setup() 
{
  size( 500, 500 );
  frameRate( 100 );
 
  cp = new ColorPicker( 10, 10, 400, 400, 255 );
}
 
void draw ()
{
  fullScreen();
  smooth();
  background(255);
  
  // Load a soundfile
    //soundfile = new SoundFile(this, "Sample.mp3");
    
 // These methods return useful infos about the file
 
  //println("SFSampleRate= " + soundfile.sampleRate() + " Hz");
  //println("SFSamples= " + soundfile.frames() + " samples");
  //println("SFDuration= " + soundfile.duration() + " seconds");
    
 // Play the file in a loop
    //soundfile.loop();
    
  cp.render();
}
 
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
  }
}
if(mousePressed) {
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
    }
    if(mousePressed){
      if(mouseX > 450 && mouseX <500){
        if(mouseY >10 && mouseY <40){
          masterStroke= 1; }
        }
      if(mouseX > 450 && mouseX <500){
        if(mouseY >40 && mouseY <70){
          masterStroke= 4; }
      }
      if(mouseX > 450 && mouseX <500){
        if(mouseY > 70 && mouseY <100){
          masterStroke= 7;
      }  
    }
    strokeWeight(masterStroke);
    }
  if(mousePressed){
    if(mouseX > 250 && mouseX <300){
      if (mouseY > 10 && mouseY <60){
        background(255);
      }
    }
  }
  if(mousePressed){
  line(mouseX, mouseY, oldX, oldY);
  }
  }
  oldX=mouseX;
  oldY=mouseY;
 }             
