import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
import moonlander.library.*;

Moonlander moonlander;
PFont font; 


void settings() {
  // Set up the drawing area size and renderer (P2D / P3D).
  // size(1980/2, 1080/2, P2D);
  //fullScreen(P2D);
  fullScreen(P3D);
}

void setup() {
  // noCursor();
  frameRate(60);
  // font = createFont("the_font_we_use.ttf", 64);  
  moonlander = Moonlander.initWithSoundtrack(this, "hajame-murrr1.2-82-BPM.mp3", 82, 2);
  background(255, 255, 255);
  smooth();
  noStroke();
  moonlander.start();
}


void draw() { 
  moonlander.update(); 

  translate(width/2, height/2);
  scale(height / 1000.0);

  int scene = moonlander.getIntValue("scene"); 
  int updatebackground = moonlander.getIntValue("updatebackground");
  int start = moonlander.getIntValue("start");
  int end = moonlander.getIntValue("end");
  
  
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
  
  //sphere
  int sphereDetail = (int) moonlander.getValue("sphereDetail");  //default=30  
  
  
  
  if (updatebackground != 0) {
    
    if (updatebackground == 1) {
      background(0);
    } else if (updatebackground == -1) {
      background(255);
    }
  }
  
   if (scene==0) { 
      drawKoosh(kooshX, kooshY, kooshR, kooshG, kooshB, kooshOpacity, kooshRotation, kooshCounter);
      drawSphereComeHither(kooshX, kooshY, kooshR, kooshG, kooshB, kooshOpacity, sphereDetail);
  }
   if (scene==666) {
      exit();
  }
}

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

void drawSphereComeHither(float x, float y, int kooshR, int kooshG, int kooshB, int kooshOpacity, int sphereDetail) {
  stroke(255, 50);
  translate(50, 50, 0);
  rotateX(y * 0.05);
  rotateY(x * 0.05);
  //fill(frameCount * 2 % 100, frameCount * 7 % 100,
  //    frameCount * 9 % 100, frameCount * 3 % 100);
  //fill(kooshR, kooshG, kooshB, kooshOpacity);
  fill(kooshR * 2 % 100, kooshG * 7 % 100, kooshB * 9 % 100, kooshOpacity * 3 % 100);
  //sphereDetail((int)(random(100))/ 4);
  sphereDetail(sphereDetail/ 4);
  sphere(x); 
}
