int startTimeMs;
// The time until the game starts, in milliseconds
// (easy to convert to seconds, sec = ms/1000)
final int startDelayMs = 10000;
boolean atStartup = true;
float Startx,Starty,Startw, Starth;
int gameWidth = 600;
int gameHeight = 300;


void setup(){
 
  textSetup();
  size(600,300);
  // Current time, in milliseconds
  startTimeMs = millis();
  rect(Startx,Starty,Startw, Starth);
}
 
void draw(){
  

  fill(#FFFFFF);
  rect(Startx,Starty,Startw, Starth);
  textDraw();
  fill(0);
  
  Startx = width*1/3;
  Starty = height*1/3;
  Startw = width*1/3;
  Starth = height*1/3;
  
  // If we're in the startup time window, show a countdown
  if (atStartup) {
    // The current time, in milliseconds
    int curTimeMs = millis();
    // The remaining time in the startup period
    int startupTimeRemainingMs = startDelayMs - (curTimeMs - startTimeMs);
    startScreen(startupTimeRemainingMs);
    atStartup = startupTimeRemainingMs > 0;
    // Short-circuit if we're still in the startup phase.
    return;
  }
  background(240);
  fill(0);
  textAlign(CENTER,CENTER);
  text("Welcome to DrawSpace!", gameWidth/2, gameHeight/2);
}
 
void startScreen(int remainingTimeMs){
  background(50);
  textSize(50);
  fill(0);
  textAlign(CENTER,CENTER);
  // Show the remaining time, in seconds;
  // show n when there are n or fewer seconds remaining. 
  text(ceil(remainingTimeMs/1000.0), gameWidth/2, gameHeight/2);
}

void mousePressed() {
  
    if(atStartup) {
        //if mouse inside button, but not necessary
        atStartup=false; 
        return; // leave 
    }// if

    // WHAT you have in mousePressed() now

}//func 
