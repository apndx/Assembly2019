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
PImage silma;

void settings() {
  // Set up the drawing area size and renderer (P2D / P3D).
  size(1920/2, 1080/2, P3D); //this is the measurement ratio used @ Assembly screen
  //fullScreen(P3D);
  silma = loadImage("silma.jpg");
  silma.resize(1920, 1080);
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

  int scene = moonlander.getIntValue("main:scene"); 
  int silmaScene = moonlander.getIntValue("main:silmaScene"); 
  int silmaOpacity = (int) moonlander.getValue("silma:opacity"); 
  icosahedronRadius = (float) moonlander.getIntValue("ico1:radius");
  noiseLevel = (float) moonlander.getValue("ico1:noise");
  xRotationSpeed = (float)moonlander.getValue("ico1:xRotation");
  
  //int updatebackground = moonlander.getIntValue("main:updatebackground");
  //int start = moonlander.getIntValue("main:start");
  //int end = moonlander.getIntValue("main:end");
   

 
  //if (updatebackground != 0) {  
  //  if (updatebackground == 1) {
  //   //  background(0);
  //  } else if (updatebackground == -1) {
  //    background(255);
  //  }
  //}
  
   if (scene==0) { 
      //drawKoosh(kooshX, kooshY, kooshR, kooshG, kooshB, kooshOpacity, kooshRotation, kooshCounter);
      //drawSphereComeHither(kooshX, kooshY, kooshR, kooshG, kooshB, kooshOpacity, sphereDetail);
     
  } 
  if (scene==1) {
      drawIcosahedron();
      
      if (silmaScene == 1) {
         drawSilma(silmaOpacity, xRotationSpeed);
      }
     
    
  }
  
   if (scene==666) {
      exit();
  }
}



void drawIcosahedron() {
  moonlander.update(); 

  
  
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
   pushMatrix();
   translate(width/10, -height/10);
   stroke(255,255,255);
   rotateX(xRotationSpeed);
   ico2.create();
   popMatrix();
   
}

void drawSilma(int opacity, float xRotationSpeed) {
    pushMatrix();
    rotateX(xRotationSpeed);
    image(silma, -width, -height);
    tint(255, opacity); 
    popMatrix();
} 
