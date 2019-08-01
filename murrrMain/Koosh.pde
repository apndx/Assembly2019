
  class Koosh {
  
  //koosh coordinates for line starting point in the middle:
  float kooshX = (float) moonlander.getValue("kooshX");
  float kooshY = (float) moonlander.getValue("kooshY");
  // kooshColors for fill:
  int kooshR = (int) moonlander.getValue("kooshR");  
  int kooshG = (int) moonlander.getValue("kooshG");
  int kooshB = (int) moonlander.getValue("kooshB");
  int kooshOpacity = (int) moonlander.getValue("kooshOpa");
  int kooshRotation = (int) moonlander.getValue("kooshRotation");
  int kooshCounter = (int) moonlander.getValue("kooshCounter");

void drawKoosh(float x, float y, int kooshR, int kooshG, int kooshB, int kooshOpacity, int kooshRotation, int kooshCounter) {
   // if (frameCount % 2 == 0) {
   if (kooshCounter % 2 == 0) {  
   // fill(frameCount * 2 % 100, frameCount * 7 % 100,
   //   frameCount * 9 % 100, frameCount * 3 % 100);
    //fill(kooshR, kooshG, kooshB, kooshOpacity);
    fill(kooshR * 2 % 100, kooshG * 7 % 100, kooshB * 9 % 100, kooshOpacity * 3 % 100);
    pushMatrix();
    translate(100, 100);
    //rotate(radians(frameCount * 2  % 360));
    rotate(radians(kooshRotation * 2  % 360));
    rect(x, y, 800, 5);
    popMatrix();
  }
}

}
