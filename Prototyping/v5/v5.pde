int sel = -1;
ArrayList<Slider> sliders = new ArrayList<Slider>();

void setup() {
  size(600, 600);
  rectMode(3);
  //float id_, float sx_, float sy_, float w_, float h_, float w2_, float h2_, float v_, float min_, float max_, color start_, color end_, color selector_, color hover_, color pressed_, float round_, float round2_) {
  sliders.add(new Slider(0, 300, 500, 500, 50, 20, 100, 50, 0, 255, color(255, 0, 0), color(0, 0, 255), color(255, 0, 0), color(0, 255, 0), color(0, 0, 255),10,5));
  sliders.add(new Slider(1, 300,300,100,20,10,50,0,0,1,color(255,255,0),color(0,255,255),color(255),color(255),color(255),100,100) );
}
void draw() {
  background(0);
  for (int i = 0; i < sliders.size(); i++) sliders.get(i).display();
  updateSliders();
}
void updateSliders() {
  if (mousePressed) for (int i = 0; i < sliders.size(); i++) {
    Slider temp = sliders.get(i);
    if (sel == i) temp.v = constrain(map(mouseX, temp.sx-temp.w/2, temp.sx + temp.w/2, 0, 100), 0, 100);
    sliders.set(i, temp);
  }
}
void mousePressed() {
  for (int i = 0; i < sliders.size(); i++) {
    Slider temp = sliders.get(i);
    if (touching(map(temp.v, 0, 100, temp.sx-temp.w/2, temp.sx+temp.w/2), temp.sy, temp.w2, temp.h2, mouseX, mouseY)) {
      sel = i;
      temp.v = constrain(map(mouseX, temp.sx-temp.w/2, temp.sx + temp.w/2, 0, 100), 0, 100);
    }
    sliders.set(i, temp);
  }
  if(sel == -1) {
    sliders.add(new Slider(sliders.size(),mouseX,mouseY,random(50,300),random(15,50),random(100,10),random(20,50),random(100),0,100,rndClr(),rndClr(),rndClr(),rndClr(),rndClr(),random(0,15),random(0,5)));
  }
}
void mouseReleased() {
  sel = -1;
}
color rndClr() {
  return(color(random(255),random(255),random(255)));
}

boolean touching(float x_, float y_, float w_, float h_, float px_, float py_) { //working only for rectMode(CENTER)
  return(px_ > x_ - w_/2 && px_ < x_ + w_/2 && py_ > y_ - h_/2 && py_ < y_ + h_/2);
}
class Slider {
  float id, sx, sy, w, h, w2, h2, v, min, max, round, round2;
  color start, end, selector, hover, pressed;
  boolean hoverOver = false;
  Slider(float id_, float sx_, float sy_, float w_, float h_, float w2_, float h2_, float v_, float min_, float max_, color start_, color end_, color selector_, color hover_, color pressed_, float round_, float round2_) {
    id = id_;
    sx = sx_;
    sy = sy_;
    w = w_;
    h = h_;
    h2 = h2_;
    w2 = w2_;
    v = v_;
    min = min_;
    max = max_;
    start = start_;
    end = end_;
    selector = selector_;
    hover = hover_;
    pressed = pressed_;
    round = round_;
    round2 = round2_;
  }
  void display() {
    stroke(255);
    float x_ = map(v, 0, 100, sx-w/2, sx+w/2);
    hoverOver = touching(x_, sy, w2, h2, mouseX, mouseY);
    fill( lerpColor(start, end, v/100));
    rect(sx, sy, w, h,round);
    fill( (((sel == id)? pressed : (((hoverOver)? hover : selector )))));
    rect(x_, sy, w2, h2,round2);
  }
  float getValue() {
    return(map(v, 0, 100, min, max));
  }
}
