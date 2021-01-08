
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;


Minim minim;
float drawingSurfaceX, drawingSurfaceY, drawingSurfaceWidth, drawingSurfaceHeight;
float drawingDiameter;
color buttonColour, resetWhite=#FFFFFF;
color circleRed = #FF0303;
float oldX;
float oldY;
color redC= color(255, 0, 0);
color greenC= color(0, 255, 0);
color blueC= color(0, 0, 255);
color yellow= color(247, 240, 0);
color orange= color(247, 112, 0);
color violet= color(110, 0, 220);
color blueGreen= color(0, 247, 146);
color yellowGreen= color(157, 250, 0);
color pink= color(255, 28, 97);
color yellowOrange= color(255, 159, 3);
color white= color(255);
color black= color(0);
float masterStroke= 1;
//AudioPlayer[] song = new AudioPlayer[numberOfSongs];
//AudioMetaData[] songMetaData = new AudioMetaData[numberOfSongs];
float PauseButtonX1, PauseButtonY1, PauseButtonDiameter;

//Global Variables 
AudioPlayer song1;

void setup()
{
  fullScreen();
  smooth();
  background(#A29F9F);

  minim = new Minim(this);
  song1 = minim.loadFile("Sample.mp3");
  song1.play();
  
  quitButtonSetup();


  
  //Load a soundfile 
  
 
      
  drawingSurfaceX = width*1/11;
  drawingSurfaceY = height*0.08;
  drawingSurfaceWidth = width*8/9;
  drawingSurfaceHeight = height*9/10;
  fill(white);
  
   rect(drawingSurfaceX, drawingSurfaceY, drawingSurfaceWidth, drawingSurfaceHeight);
  
}


void draw(){
  
  
  
  strokeWeight(1);
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
  rect(10, 135, 25, 25);
  fill(black);
  rect(35, 135, 25, 25);
  line(450, 30, 500, 30);
  strokeWeight(4);
  line(450, 50, 500, 50);
  strokeWeight(8);
  line(450, 80, 500, 80);
  strokeWeight(1);
  fill(255);
  rect(250, 10, 50, 50);
  
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
        rect(drawingSurfaceX, drawingSurfaceY, drawingSurfaceWidth, drawingSurfaceHeight);
      }
    }
  }
  if(mousePressed){
  line(mouseX, mouseY, oldX, oldY);
  }
  }
  oldX=pmouseX;
  oldY=pmouseY;
  
  quitButtonDraw();
  
 }              
  
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
}

 
     
// ================================================
  void mouseClicked() { 
  
  quitButtonMouseClicked();
  }
