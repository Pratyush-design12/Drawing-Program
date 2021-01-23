/*void imgSetup(){

  for (int i=0; i<9; i++) {
    img.add ( loadImage("img"+i+".jpg") );
  }
}
      //img=shuffle( img );

void draw_grid() {
  int x0 = 50, y0 = x0, // dist from border 
    w = 310, h = w,      // width and height of a cell / image 
    off = 0;                   // offset between images 
  
  int k=0; 
  // nested for loop makes for columns and rows 
  for (int i = 0; i < 3; i++)
    for (int j = 0; j < 3; j++) {
      // we calculate the position on the fly 
      image(img.get(k), 
        x0+i*(w+off), y0+j*(h+off));
      k++;
    }
}

// shuffle in-place
ArrayList<PImage> shuffle (ArrayList<PImage> arrL1) {
  for (int i=0; i<arrL1.size(); i++) {
    int randomPosition = int(random(arrL1.size()));
    // swap image at position i with image at position randomPosition
    PImage temp = arrL1.get(i);
    arrL1.set(i, arrL1.get(randomPosition));
    arrL1.set(randomPosition, temp);
  }
  return arrL1;
}*/
