void population () {
  
  ptDiameter = width* 1 / 28;
  rectWidth = width * 1 / 3;
  rectHeight = height * 1 / 3;
  
  turnOn1=false;
  turnOn2=false;
  
  // Quit Button Location
  
  quitButtonX = width*18.3/19;
  quitButtonY = height*0.1/300;
  quitButtonWidth = width*1/27;
  quitButtonHeight = height*1/27;
 
// <---------------------------------------------------------------------------------------------------------------------------->
  
  pt1X = pt5X = pt9X = pt13X = width*0;
  pt2X = pt6X = pt10X = pt14X = width*1/3;
  pt3X = pt7X = pt11X = pt15X = width*2/3;
  pt4X = pt8X = pt12X = pt16X = width*3/3;
  //
  pt1Y = pt2Y = pt3Y = pt4Y = height*0;
  pt5Y = pt6Y = pt7Y = pt8Y = height*1/3;
  pt9Y = pt10Y = pt11Y = pt12Y = height*2/3;
  pt13Y = pt14Y = pt15Y = pt16Y = height*3/3;
  
  // Button #1-9 Location       <------------------------------------------------------------------------------------------------------------------------------------> 
  
  button1X = width *1/3*1/3;
  button1Y = height *1/3*1/3;
  button1Width = width * 1/9;
  button1Height = height * 1/9;
  //
  button2X = width * 2/3*2/3;
  button2Y = height * 1/3*1/3;
  button2Width = width * 1/9;
  button2Height = height * 1/9;
  //
  button3X = width * 7/9;
  button3Y = height * 1/3*1/3;
  button3Width = width * 1/9;
  button3Height = height * 1/9;
  //
  button4X = width*1/3*1/3;
  button4Y = height*2/3*2/3;
  button4Width = width*1/9;
  button4Height = height*1/9;
  //
  button5X = width*2/3*2/3;
  button5Y = height*2/3*2/3;
  button5Width = width*1/9;
  button5Height = height*1/9;
  //
  button6X = width*7/9;
  button6Y = height*2/3*2/3;
  button6Width = width*1/9;
  button6Height = height*1/9;
  //
  button7X = width*1/3*1/3;
  button7Y = height*7/9;
  button7Width = width*1/9;
  button7Height = height*1/9;
  //
  button8X = width*2/3*2/3;
  button8Y = height*7/9;
  button8Width = width*1/9;
  button8Height = height*1/9;
  //
  button9X = width*7/9;
  button9Y = height*7/9;
  button9Width = width*1/9;
  button9Height = height*1/9;
  
 // Imeages Location
  
  rectXPic1 = width*2/3;
  rectYPic1 = height*2/3;
  rectWidthPic1 = width*1/3; 
  rectHeightPic1 = height*1/3;
  picImageWidthRatio1 = 200/200; 
  picImageHeightRatio1 = 200/200;
  picX1 = rectXPic1;
  picY1 = rectYPic1;
  picWidth1 = rectWidthPic1 * picImageWidthRatio1; 
  picHeight1 = picWidth1 * picImageHeightRatio1; 
  
  //
  
  rectXPic2 = width*3/9;
  rectYPic2 = height*6/9;
  rectWidthPic2 = width*1/3; 
  rectHeightPic2 = height*1/3;
  picImageWidthRatio2 = 400/400; 
  picImageHeightRatio2 = 400/400;
  picX2 = rectXPic2;
  picY2 = rectYPic2;
  picWidth2 = rectWidthPic2 * picImageWidthRatio2; 
  picHeight2 = picWidth2 * picImageHeightRatio2;
  
  //
  
  rectXPic3 = width*0/9;
  rectYPic3 = height*6/9;
  rectWidthPic3 = width*1/3; 
  rectHeightPic3 = height*1/3;
  picImageWidthRatio3 = 200/200; 
  picImageHeightRatio3 = 200/200;
  picX3 = rectXPic3;
  picY3 = rectYPic3;
  picWidth3 = rectWidthPic3 * picImageWidthRatio3; 
  picHeight3 = picWidth3 * picImageHeightRatio3;
 
  //
  
  rectXPic4 = width*2/3;
  rectYPic4 = height*3/9;
  rectWidthPic4 = width*1/3; 
  rectHeightPic4 = height*1/3;
  picImageWidthRatio4 = 200/200; 
  picImageHeightRatio4 = 200/200;
  picX4 = rectXPic4;
  picY4 = rectYPic4;
  picWidth4 = rectWidthPic4 * picImageWidthRatio4; 
  picHeight4 = picWidth4 * picImageHeightRatio4;
  
  //
  
  rectXPic5 = width*3/9;
  rectYPic5 = height*3/9;
  rectWidthPic5 = width*1/3; 
  rectHeightPic5 = height*1/3;
  picImageWidthRatio5 = 200.0/200.0; 
  picImageHeightRatio5 = 200/200.0;
  picX5 = rectXPic5;
  picY5 = rectYPic5;
  picWidth5 = rectWidthPic5 * picImageWidthRatio5; 
  picHeight5 = picWidth5 * picImageHeightRatio5;
  
  //
  
  rectXPic6 = width*0/9;
  rectYPic6 = height*3/9;
  rectWidthPic6 = width*1/3; 
  rectHeightPic6 = height*1/3;
  picImageWidthRatio6 = 350.0/350.0; 
  picImageHeightRatio6 = 350.0/350.0;
  picX6 = rectXPic6;
  picY6 = rectYPic6;
  picWidth6 = rectWidthPic6 * picImageWidthRatio6; 
  picHeight6 = picWidth6 * picImageHeightRatio6;
  
  //
  
  rectXPic7 = width*2/3;
  rectYPic7 = height*0/9;
  rectWidthPic7 = width*1/3; 
  rectHeightPic7 = height*1/3;
  picImageWidthRatio7 = 400.0/400.0; 
  picImageHeightRatio7 = 400.0/400.0;
  picX7 = rectXPic7;
  picY7 = rectYPic7;
  picWidth7 = rectWidthPic7 * picImageWidthRatio7; 
  picHeight7 = picWidth7 * picImageHeightRatio7;
  
  //
  
  rectXPic8 = width*1/3;
  rectYPic8 = height*0/9;
  rectWidthPic8 = width*1/3; 
  rectHeightPic8 = height*1/3;
  picImageWidthRatio8 = 474.0/474.0; 
  picImageHeightRatio8 = 296.0/474.0;
  picX8 = rectXPic8;
  picY8 = rectYPic8;
  picWidth8 = rectWidthPic8 * picImageWidthRatio8; 
  picHeight8 = picWidth8 * picImageHeightRatio8;
  
  //
  
  rectXPic9 = width*0/9;
  rectYPic9 = height*0/9;
  rectWidthPic9 = width*1/3; 
  rectHeightPic9 = height*1/3;
  picImageWidthRatio9 = 474.0/474.0; 
  picImageHeightRatio9 = 474.0/474.0;
  picX9 = rectXPic9;
  picY9 = rectYPic9;
  picWidth9 = rectWidthPic9 * picImageWidthRatio9; 
  picHeight9 = picWidth9 * picImageHeightRatio9;
  
}
