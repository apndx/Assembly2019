import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
import moonlander.library.*;

Moonlander moonlander;
PFont font; 
Icosahedron ico;
Icosahedron ico2;
float noiseLevel;
float icosahedronRadius = 150.0;
float xRotationSpeed = 2.0;


void settings() {
  // Set up the drawing area size and renderer (P2D / P3D).
  size(1920/2, 1080/2, P3D); //this is the measurement ratio used @ Assembly screen
  //fullScreen(P3D);
}

void setup() {
  // noCursor();
  frameRate(60);
  // font = createFont("the_font_we_use.ttf", 64);  
  moonlander = Moonlander.initWithSoundtrack(this, "hajame-murrr1.2-82-BPM.mp3", 82, 2);
  background(255, 255, 255);
  smooth();
  noStroke();
  noiseLevel=0.0;
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
      //drawKoosh(kooshX, kooshY, kooshR, kooshG, kooshB, kooshOpacity, kooshRotation, kooshCounter);
      drawSphereComeHither(kooshX, kooshY, kooshR, kooshG, kooshB, kooshOpacity, sphereDetail);
  } 
  if (scene==1) {
      drawIcosahedron();
    
  }
  
   if (scene==666) {
      exit();
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

void drawIcosahedron() {
  moonlander.update(); 
  //icosahedronRadius = moonlander.getIntValue("radius");
  //noiseLevel = moonlander.getValue("noise");
  xRotationSpeed = (float)moonlander.getValue("xRotation");
  
  
  //create two icosahedrons with radius and noiseLevel
  ico = new Icosahedron(icosahedronRadius, noiseLevel);
  ico2 = new Icosahedron(icosahedronRadius, noiseLevel);
  //set background and initialize lights
  background(0);
  lights();
  //set origo to center of screen
  //translate(width/2, height/2);
  
  //increase noiselevel each draw
  noiseLevel =  noiseLevel + 0.01;
  
   //draw icosahedron
  
   stroke(255,255,255);
   rotateX(xRotationSpeed);
   ico2.create();
   
}
