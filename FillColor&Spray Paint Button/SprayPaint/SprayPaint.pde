final int maxIterations = 50;  // that's how fast spraying happens
//
void setup () {
  size (700, 700);
  stroke(255, 2, 2); // red
} // func
//
void draw () {
  if (mousePressed) {
    brush () ;
  }
} // func
// -------------------------------------------------------
void brush () {
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
