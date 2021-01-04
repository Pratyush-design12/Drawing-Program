//Global variables
color buttonColour, resetWhite=#FFFFFF;
color black = #000000, white = #FFFFFF, blue = #0D00FF, red = #FF0000;
color circleRed = #FF0303, yellow=#FFDA05;
float ptDiameter, rectWidth, rectHeight;
float pt1X, pt1Y, pt2X, pt2Y, pt3X, pt3Y, pt4X, pt4Y;
float pt5X, pt5Y, pt6X, pt6Y, pt7X, pt7Y, pt8X, pt8Y;
float pt9X, pt9Y, pt10X, pt10Y, pt11X, pt11Y, pt12X, pt12Y;
float pt13X, pt13Y, pt14X, pt14Y,pt15X, pt15Y, pt16X, pt16Y;
float button1X, button1Y, button1Width, button1Height;
float button2X, button2Y, button2Width, button2Height;
float button3X, button3Y, button3Width, button3Height;
float button4X, button4Y, button4Width, button4Height;
float button5X, button5Y, button5Width, button5Height;
float button6X, button6Y, button6Width, button6Height;
float button7X, button7Y, button7Width, button7Height;
float button8X, button8Y, button8Width, button8Height;
float button9X, button9Y, button9Width, button9Height;
float button10X, button10Y, button10Width, button10Height;
float button11X, button11Y, button11Width, button11Height;
float button12X, button12Y, button12Width, button12Height;
float button13X, button13Y, button13Width, button13Height;
float button14X, button14Y, button14Width, button14Height;
float button15X, button15Y, button15Width, button15Height;
float button16X, button16Y, button16Width, button16Height;
float button17X, button17Y, button17Width, button17Height;
float button18X, button18Y, button18Width, button18Height;
PImage pic1, pic2, pic3, pic4, pic5, pic6, pic7, pic8, pic9;
Boolean turnOn1=false, turnOn2=false, turnOn3=false, turnOn4=false, turnOn5=false, turnOn6=false, turnOn7=false, turnOn8=false, turnOn9=false;

// Images Variable (float)

float rectXPic1, rectYPic1, rectWidthPic1, rectHeightPic1, rectXPic2, rectYPic2, rectWidthPic2, rectHeightPic2;
float picImageWidthRatio1, picImageHeightRatio1, picImageWidthRatio2, picImageHeightRatio2;
float picX1, picY1, picWidth1, picHeight1, picX2, picY2, picWidth2, picHeight2;
float rectXPic3, rectYPic3, rectWidthPic3, rectHeightPic3, rectXPic4, rectYPic4, rectWidthPic4, rectHeightPic4;
float picImageWidthRatio3, picImageHeightRatio3, picImageWidthRatio4, picImageHeightRatio4;
float picX3, picY3, picWidth3, picHeight3, picX4, picY4, picWidth4, picHeight4;
float rectXPic5, rectYPic5, rectWidthPic5, rectHeightPic5, rectXPic6, rectYPic6, rectWidthPic6, rectHeightPic6;
float picImageWidthRatio5, picImageHeightRatio5, picImageWidthRatio6, picImageHeightRatio6;
float picX5, picY5, picWidth5, picHeight5, picX6, picY6, picWidth6, picHeight6;
float rectXPic7, rectYPic7, rectWidthPic7, rectHeightPic7, rectXPic8, rectYPic8, rectWidthPic8, rectHeightPic8;
float picImageWidthRatio7, picImageHeightRatio7, picImageWidthRatio8, picImageHeightRatio8;
float picX7, picY7, picWidth7, picHeight7, picX8, picY8, picWidth8, picHeight8;
float rectXPic9, rectYPic9, rectWidthPic9, rectHeightPic9;
float picImageWidthRatio9, picImageHeightRatio9;
float picX9, picY9, picWidth9, picHeight9;

import processing.sound.*;

  // Quit button variables
  float quitButtonX, quitButtonY, quitButtonWidth, quitButtonHeight;
  
  SoundFile file;
  //put your audio file name here
  String audioName = "sample.mp3";
  String path;
  
  void setup() {
  fullScreen();
  images();
  textSetup();
  population();
  
  //Load a soundfile 
  
    path = sketchPath("Sample.mp3");
    file = new SoundFile(this, path);
    file.play(); 
  }
  
 void draw() {
   
  fill(white);
  rect(pt1X, pt1Y, rectWidth, rectHeight);
  rect(pt2X, pt2Y, rectWidth, rectHeight);
  rect(pt3X, pt3Y, rectWidth, rectHeight);
  //
  rect(pt5X, pt5Y, rectWidth, rectHeight);
  rect(pt6X, pt6Y, rectWidth, rectHeight);
  rect(pt7X, pt7Y, rectWidth, rectHeight);
  //
  rect(pt9X, pt9Y, rectWidth, rectHeight);
  rect(pt10X, pt10Y, rectWidth, rectHeight);
  rect(pt11X, pt11Y, rectWidth, rectHeight);
  //
  fill(blue);
  //
  ellipse(pt1X, pt1Y, ptDiameter, ptDiameter);
  ellipse(pt2X, pt2Y, ptDiameter, ptDiameter);
  ellipse(pt3X, pt3Y, ptDiameter, ptDiameter);
  ellipse(pt5X, pt5Y, ptDiameter, ptDiameter);
  ellipse(pt6X, pt6Y, ptDiameter, ptDiameter);
  ellipse(pt7X, pt7Y, ptDiameter, ptDiameter);
  ellipse(pt9X, pt9Y, ptDiameter, ptDiameter);
  ellipse(pt10X, pt10Y, ptDiameter, ptDiameter);
  ellipse(pt11X, pt11Y, ptDiameter, ptDiameter);
  //
  fill(blue);
  ellipse(pt4X, pt4Y, ptDiameter, ptDiameter);
  ellipse(pt8X, pt8Y, ptDiameter, ptDiameter);
  ellipse(pt12X, pt12Y, ptDiameter, ptDiameter);
  ellipse(pt13X, pt13Y, ptDiameter, ptDiameter);
  ellipse(pt14X, pt14Y, ptDiameter, ptDiameter);
  ellipse(pt15X, pt15Y, ptDiameter, ptDiameter);
  ellipse(pt16X, pt16Y, ptDiameter, ptDiameter);
  fill(white);
  
  // Button #1-9 Draw
  
  fill(black);
  rect(button1X, button1Y, button1Width, button1Height);

  
  fill(black);
  rect(button2X, button2Y, button2Width, button2Height);

  
  fill(black);
  rect(button3X, button3Y, button3Width, button3Height);

  
  fill(black);
  rect(button4X, button4Y, button4Width, button4Height);

  
  fill(black);
  rect(button5X, button5Y, button5Width, button5Height);

  
  fill(black);
  rect(button6X, button6Y, button6Width, button6Height);
 
  
  fill(black);
  rect(button7X, button7Y, button7Width, button7Height);

  
  fill(black);
  rect(button8X, button8Y, button8Width, button8Height);

  
  fill(black);
  rect(button9X, button9Y, button9Width, button9Height);

  //

  // If statements for images -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------->
  
  if (turnOn1 == true && turnOn2 == false && turnOn3 == false && turnOn4 == false && turnOn5 == false && turnOn6 == false && turnOn7 == false && turnOn8 == false && turnOn9 == false) rect(rectXPic1, rectYPic1, rectWidthPic1, rectHeightPic1);
  if (turnOn1 == true && turnOn2 == false && turnOn3 == false && turnOn4 == false && turnOn5 == false && turnOn6 == false && turnOn7 == false && turnOn8 == false && turnOn9 == false) image(pic1, picX1, picY1, picWidth1, picHeight1);
  //
  if (turnOn1 == false && turnOn2 == true && turnOn3 == false && turnOn4 == false && turnOn5 == false && turnOn6 == false && turnOn7 == false && turnOn8 == false && turnOn9 == false) rect(rectXPic2, rectYPic2, rectWidthPic2, rectHeightPic2);
  if (turnOn1 == false && turnOn2 == true && turnOn3 == false && turnOn4 == false && turnOn5 == false && turnOn6 == false && turnOn7 == false && turnOn8 == false && turnOn9 == false) image(pic2, picX2, picY2, picWidth2, picHeight2);
  //
  if (turnOn1 == false && turnOn2 == false && turnOn3 == true && turnOn4 == false && turnOn5 == false && turnOn6 == false && turnOn7 == false && turnOn8 == false && turnOn9 == false) rect(rectXPic3, rectYPic3, rectWidthPic3, rectHeightPic3);
  if (turnOn1 == false && turnOn2 == false && turnOn3 == true && turnOn4 == false && turnOn5 == false && turnOn6 == false && turnOn7 == false && turnOn8 == false && turnOn9 == false) image(pic3, picX3, picY3, picWidth3, picHeight3);
  //
  if (turnOn1 == false && turnOn2 == false && turnOn3 == false && turnOn4 == true && turnOn5 == false && turnOn6 == false && turnOn7 == false && turnOn8 == false && turnOn9 == false) rect(rectXPic4, rectYPic4, rectWidthPic4, rectHeightPic4);
  if (turnOn1 == false && turnOn2 == false && turnOn3 == false && turnOn4 == true && turnOn5 == false && turnOn6 == false && turnOn7 == false && turnOn8 == false && turnOn9 == false) image(pic4, picX4, picY4, picWidth4, picHeight4);
  //
  if (turnOn1 == false && turnOn2 == false && turnOn3 == false && turnOn4 == false && turnOn5 == true && turnOn6 == false && turnOn7 == false && turnOn8 == false && turnOn9 == false) rect(rectXPic5, rectYPic5, rectWidthPic5, rectHeightPic5);
  if (turnOn1 == false && turnOn2 == false && turnOn3 == false && turnOn4 == false && turnOn5 == true && turnOn6 == false && turnOn7 == false && turnOn8 == false && turnOn9 == false) image(pic5, picX5, picY5, picWidth5, picHeight5);
  //
  if (turnOn1 == false && turnOn2 == false && turnOn3 == false && turnOn4 == false && turnOn5 == false && turnOn6 == true && turnOn7 == false && turnOn8 == false && turnOn9 == false) rect(rectXPic6, rectYPic6, rectWidthPic6, rectHeightPic6);
  if (turnOn1 == false && turnOn2 == false && turnOn3 == false && turnOn4 == false && turnOn5 == false && turnOn6 == true && turnOn7 == false && turnOn8 == false && turnOn9 == false) image(pic6, picX6, picY6, picWidth6, picHeight6);
  //
  if (turnOn1 == false && turnOn2 == false && turnOn3 == false && turnOn4 == false && turnOn5 == false && turnOn6 == false && turnOn7 == true && turnOn8 == false && turnOn9 == false) rect(rectXPic7, rectYPic7, rectWidthPic7, rectHeightPic7);
  if (turnOn1 == false && turnOn2 == false && turnOn3 == false && turnOn4 == false && turnOn5 == false && turnOn6 == false && turnOn7 == true && turnOn8 == false && turnOn9 == false) image(pic7, picX7, picY7, picWidth7, picHeight7);
  //
  if (turnOn1 == false && turnOn2 == false && turnOn3 == false && turnOn4 == false && turnOn5 == false && turnOn6 == false && turnOn7 == false && turnOn8 == true && turnOn9 == false) rect(rectXPic8, rectYPic8, rectWidthPic8, rectHeightPic8);
  if (turnOn1 == false && turnOn2 == false && turnOn3 == false && turnOn4 == false && turnOn5 == false && turnOn6 == false && turnOn7 == false && turnOn8 == true && turnOn9 == false) image(pic8, picX8, picY8, picWidth8, picHeight8);
  //
  if (turnOn1 == false && turnOn2 == false && turnOn3 == false && turnOn4 == false && turnOn5 == false && turnOn6 == false && turnOn7 == false && turnOn8 == false && turnOn9 == true) rect(rectXPic9, rectYPic9, rectWidthPic9, rectHeightPic9);
  if (turnOn1 == false && turnOn2 == false && turnOn3 == false && turnOn4 == false && turnOn5 == false && turnOn6 == false && turnOn7 == false && turnOn8 == false && turnOn9 == true) image(pic9, picX9, picY9, picWidth9, picHeight9);
 
 //------------------------------------------------------------------------------------------------------------
   
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
  
  
 }

void mousePressed() {
  // Press to Exit
  if ( mouseX>quitButtonX && mouseX<quitButtonX+quitButtonWidth && mouseY>quitButtonY && mouseY<quitButtonY+quitButtonHeight ) exit();
 
 
if (mouseX>button1X && mouseX<button1X+button1Width && mouseY>button1Y && mouseY<button1Y+button1Height )

   if (turnOn1 == true) {
     
     turnOn1 = false;
     turnOn2 = true;
     turnOn3 = true;
     turnOn4 = true;
     turnOn5 = true;
     turnOn6 = true;
     turnOn7 = true;
     turnOn8 = true;
     turnOn9 = true;
     
   } else {
     
     turnOn1 = true;
     turnOn2 = false;
     turnOn3 = false;
     turnOn4 = false;
     turnOn5 = false;
     turnOn6 = false;
     turnOn7 = false;
     turnOn8 = false;
     turnOn9 = false;
     
     println("Btn 1 activated");
   }


 if (mouseX>button2X && mouseX<button2X+button2Width && mouseY>button2Y && mouseY<button2Y+button2Height )


   if (turnOn2 == true) {
     turnOn1 = true;
     turnOn2 = false;
     turnOn3 = true;
     turnOn4 = true;
     turnOn5 = true;
     turnOn6 = true;
     turnOn7 = true;
     turnOn8 = true;
     turnOn9 = true;

 } else {

     turnOn1 = false;
     turnOn2 = true;
     turnOn3 = false;
     turnOn4 = false;
     turnOn5 = false;
     turnOn6 = false;
     turnOn7 = false;
     turnOn8 = false;
     turnOn9 = false;
     
     println("Btn 2 activated");
     
   }

 if (mouseX>button3X && mouseX<button3X+button3Width && mouseY>button3Y && mouseY<button3Y+button3Height )


   if (turnOn3 == true) {
     turnOn1 = true;
     turnOn2 = true;
     turnOn3 = false;
     turnOn4 = true;
     turnOn5 = true;
     turnOn6 = true;
     turnOn7 = true;
     turnOn8 = true;
     turnOn9 = true;
     
   } else {
     
     turnOn1 = false;
     turnOn2 = false;
     turnOn3 = true;
     turnOn4 = false;
     turnOn5 = false;
     turnOn6 = false;
     turnOn7 = false;
     turnOn8 = false;
     turnOn9 = false;

   println("Btn 3 activated");
   
   }


 if (mouseX>button4X && mouseX<button4X+button4Width && mouseY>button4Y && mouseY<button4Y+button4Height )


   if (turnOn4 == true) {
     turnOn1 = true;
     turnOn2 = true;
     turnOn3 = true;
     turnOn4 = false;
     turnOn5 = true;
     turnOn6 = true;
     turnOn7 = true;
     turnOn8 = true;
     turnOn9 = true;

   } else {

     turnOn1 = false;
     turnOn2 = false;
     turnOn3 = false;
     turnOn4 = true;
     turnOn5 = false;
     turnOn6 = false;
     turnOn7 = false;
     turnOn8 = false;
     turnOn9 = false;
     
    println("Btn 4 activated");

   }


 if (mouseX>button5X && mouseX<button5X+button5Width && mouseY>button5Y && mouseY<button5Y+button5Height )


   if (turnOn5 == true) {


     turnOn1 = true;


     turnOn2 = true;


     turnOn3 = true;


     turnOn4 = true;


     turnOn5 = false;


     turnOn6 = true;


     turnOn7 = true;


     turnOn8 = true;


     turnOn9 = true;


   } else {


     turnOn1 = false;


     turnOn2 = false;


     turnOn3 = false;


     turnOn4 = false;


     turnOn5 = true;


     turnOn6 = false;


     turnOn7 = false;


     turnOn8 = false;


     turnOn9 = false;
     
    println("Btn 5 activated");

   }


 if (mouseX>button6X && mouseX<button6X+button6Width && mouseY>button6Y && mouseY<button6Y+button6Height )


   if (turnOn6 == true) {


     turnOn1 = true;


     turnOn2 = true;


     turnOn3 = true;


     turnOn4 = true;


     turnOn5 = true;


     turnOn6 = false;


     turnOn7 = true;


     turnOn8 = true;


     turnOn9 = true;


   } else {


     turnOn1 = false;


     turnOn2 = false;


     turnOn3 = false;


     turnOn4 = false;


     turnOn5 = false;


     turnOn6 = true;


     turnOn7 = false;


     turnOn8 = false;


     turnOn9 = false;
     
         println("Btn 6 activated");
   }

 if (mouseX>button7X && mouseX<button7X+button7Width && mouseY>button7Y && mouseY<button7Y+button7Height )


   if (turnOn7 == true) {


     turnOn1 = true;


     turnOn2 = true;


     turnOn3 = true;


     turnOn4 = true;


     turnOn5 = true;


     turnOn6 = true;


     turnOn7 = true;


     turnOn8 = false;


     turnOn9 = true;


   } else {


     turnOn1 = false;


     turnOn2 = false;


     turnOn3 = false;


     turnOn4 = false;


     turnOn5 = false;


     turnOn6 = false;


     turnOn7 = true;


     turnOn8 = false;


     turnOn9 = false;
     
         println("Btn 7 activated");

   }


 if (mouseX>button8X && mouseX<button8X+button8Width && mouseY>button8Y && mouseY<button8Y+button8Height )


   if (turnOn8 == true) {


     turnOn1 = true;


     turnOn2 = true;


     turnOn3 = true;


     turnOn4 = true;


     turnOn5 = true;


     turnOn6 = true;


     turnOn7 = true;


     turnOn8 = false;


     turnOn9 = true;


   } else {


     turnOn1 = false;


     turnOn2 = false;


     turnOn3 = false;


     turnOn4 = false;


     turnOn5 = false;


     turnOn6 = false;


     turnOn7 = false;


     turnOn8 = true;


     turnOn9 = false;
     
         println("Btn 8 activated");

   }


 if (mouseX>button9X && mouseX<button9X+button9Width && mouseY>button9Y && mouseY<button9Y+button9Height )


   if (turnOn9 == true) {


     turnOn1 = true;


     turnOn2 = true;


     turnOn3 = true;


     turnOn4 = true;


     turnOn5 = true;


     turnOn6 = true;


     turnOn7 = true;


     turnOn8 = true;


     turnOn9 = false;


   } else {


     turnOn1 = false;


     turnOn2 = false;


     turnOn3 = false;


     turnOn4 = false;


     turnOn5 = false;


     turnOn6 = false;


     turnOn7 = false;


     turnOn8 = false;


     turnOn9 = true;

    println("Btn 9 activated");

   }

}

 
