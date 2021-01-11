int startTimeMs;
// The time until the game starts, in milliseconds
// (easy to convert to seconds, sec = ms/1000)
final int startDelayMs = 5000;
boolean atStartup = true;
 
int gameWidth = 1200;
int gameHeight = 600;
 
void setup(){
  size(gameWidth, gameHeight);
  // Current time, in milliseconds
  startTimeMs = millis();
}
 
void draw(){
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
  text("GO!", gameWidth/2, gameHeight/2);
}
 
void startScreen(int remainingTimeMs){
  background(50);
  textSize(100);
  fill(0);
  textAlign(CENTER,CENTER);
  // Show the remaining time, in seconds;
  // show n when there are n or fewer seconds remaining. 
  text(ceil(remainingTimeMs/1000.0), gameWidth/2, gameHeight/2);
}
