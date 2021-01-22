//pixels[y*width+x]
PVector v1;
int PenPrevX,PenPrevY;
void setup()
{
  background(255);
  size(400,400);
    frameRate(200);
    strokeWeight(5);

}
void draw()
{  
    //v1=new PVector()
    if(mousePressed){
        //brush(pmouseX,pmouseY,mouseX,mouseY);
        strokeWeight(1);
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
     //PenPrevX = mouseX;
  //PenPrevY = mouseY;
 
}

void mouseDragged(){

    //brush(pmouseX,pmouseY,mouseX,mouseY);
        //line(mouseX+5,mouseY-5,mouseX-5,mouseY+5);
      
  
}

void brush1(int x1,int y1,int x2,int y2)
{
  strokeWeight(1);
    line(x1+5,y1-5,x1-5,y1+5);
    line(x2+5,y2-5,x2-5,y2+5);
}
