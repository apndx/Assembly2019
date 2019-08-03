import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
import moonlander.library.*;

Moonlander moonlander;
PFont f;  
Icosahedron ico;
Icosahedron ico2;
Icosahedron smallerIco;
Icosahedron smallerIco2;
Icosahedron bigIco;
float noiseLevel = 0;
float icosahedronRadius = 150.0;
float xRotationSpeed = 2.0;
float xRotationSpeedSilma = 0;
float icosahedronRadius2 = 1500.0;
float xRotationSpeed2 = 2.0;
float noiseLevel2;


PImage silma;
 int silmaOpacity= 80;
 PImage pastilli;
  PImage bgPastilli;
int pastilliOpacity= 150;

void settings() {
  // Set up the drawing area size and renderer (P2D / P3D).
  //size(1920/2, 1080/2, P3D); //this is the measurement ratio used @ Assembly screen
  fullScreen(P3D);

  silma = loadImage("silma.jpg");
  //pastilli = loadImage("pastillit1.jpg");
 
  bgPastilli = loadImage("pastillit.jpg");
  

  bgPastilli.resize(1920, 1080);
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
  
  
  // Create the font
  printArray(PFont.list());
  f = createFont("SourceCodePro-Regular.ttf", 20);
  textFont(f);
  
}


void draw() { 
  moonlander.update(); 

  translate(width/2, height/2);
  scale(height / 1000.0);

  int scene = moonlander.getIntValue("main:scene"); 
  int headlineTextScene = moonlander.getIntValue("main:headlineTextScene"); 
 int endTextScene = moonlander.getIntValue("main:endTextScene"); 

  int silmaScene = moonlander.getIntValue("main:silmaScene"); 
  int silmaOpacity = (int) moonlander.getValue("silma:opacity");
  xRotationSpeedSilma = (float)moonlander.getValue("silma:xRotationSilma"); 
  
  
  int pastilliScene = moonlander.getIntValue("main:pastilliScene"); 
  int pastilliOpacity = (int) moonlander.getValue("pastilli:pastilliOpacity");
  

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
  }
    
    
  if (headlineTextScene==1) {
      drawHeadlineText();
   } 
      
   if (silmaScene == 1) {
     drawSilma(silmaOpacity, xRotationSpeedSilma);    
  }
  
  if(scene == 2){
    drawManyIcosahedrons();
  }
  
  if(scene == 3){
    pushMatrix();
    translate(0,0,-2000);
    drawManyDancingIcosahedrons();
    popMatrix();
      
  }
  
  if (pastilliScene == 1) {
 //  drawPastilli(pastilliOpacity);    
  }
  
    
 if ( endTextScene==1) {
      drawEndText();
      
      
   } 
   if (scene==666) {
      exit();
  }
}

void drawManyDancingIcosahedrons(){
Icosahedron first, second, third, fourth;
  moonlander.update();
  float icoRadius = (float) moonlander.getValue("ico1:radius");
  float icoRadius2 = (float) moonlander.getValue("ico2:radius2");
  float icoRadius3 = (float) moonlander.getValue("ico3:radius3");
  float icoRadius4 = (float) moonlander.getValue("ico4:radius4");
  float icoNoise =  (float) moonlander.getValue("ico1:noise");
  float icoNoise2 =  (float) moonlander.getValue("ico2:noise2");
  float icoNoise3 =  (float) moonlander.getValue("ico3:noise3");
  float icoNoise4 =  (float) moonlander.getValue("ico4:noise4");
  float xRotationSpeed = (float) moonlander.getValue("ico1:xRotation");
  float xRotationSpeed2 = (float) moonlander.getValue("ico2:xRotation2");
  float xRotationSpeed3 = (float) moonlander.getValue("ico3:xRotation3");
  float xRotationSpeed4 = (float) moonlander.getValue("ico4:xRotation4");
  float yRotationSpeed = (float) moonlander.getValue("ico1:yRotation");
  float yRotationSpeed2 = (float) moonlander.getValue("ico2:yRotation2");
  float yRotationSpeed3 = (float) moonlander.getValue("ico3:yRotation3");
  float yRotationSpeed4 = (float) moonlander.getValue("ico4:yRotation4");
  
  first = new Icosahedron(icoRadius, icoNoise);
  second = new Icosahedron(icoRadius2, icoNoise2);
  third = new Icosahedron(icoRadius3, icoNoise3);
  fourth = new Icosahedron(icoRadius4, icoNoise4);
 pushMatrix();
 tint(100,100);
 background(bgPastilli);
 popMatrix();
 
  //1
  pushMatrix();
  rotateX(xRotationSpeed);
  rotateY(yRotationSpeed);
  stroke(255,255,255, 100);
  strokeWeight(1);
  first.create();
  popMatrix();
  
  //2
  pushMatrix();
  translate(-150, -150);
  rotateX(xRotationSpeed2);
  rotateY(yRotationSpeed2);
  stroke(255, 255,255, 100);
  strokeWeight(1);
  second.create();
  popMatrix();
  
  //3
  pushMatrix();
  translate(20, 100);
  rotateX(xRotationSpeed3);
  rotateY(yRotationSpeed3);
  stroke(255,255,255, 100);
  strokeWeight(1);
  third.create();
  popMatrix();
  
  //4
  pushMatrix();
  translate(400, 200);
  rotateX(xRotationSpeed4);
  rotateY(yRotationSpeed4);
  stroke(255,255,255, 100);
  strokeWeight(1);
  fourth.create();
  popMatrix();  
  
}

void drawManyIcosahedrons(){
  color smallIcoFill1 = color(120,120,120);
  color smallIcoFill2 = color(255, 255,255);
  
  moonlander.update();
   float smallIcoradius = (float) moonlander.getValue("ico1:radius");
   float bigIcoradius = (float) moonlander.getValue("ico2:radius2");
   float smallIcoNoise = (float) moonlander.getValue("ico1:noise");
   float bigIcoNoise = (float) moonlander.getIntValue("ico2:noise2");

   int whichColor = moonlander.getIntValue("ico1:color1");
   xRotationSpeed = (float) moonlander.getValue("ico1:xRotation");
   xRotationSpeed2 = (float) moonlander.getValue("ico2:xRotation2");
   smallerIco = new Icosahedron(smallIcoradius, smallIcoNoise);
   smallerIco2 = new Icosahedron(smallIcoradius + 100, smallIcoNoise);
   bigIco = new Icosahedron(bigIcoradius, bigIcoNoise);
   
  
  
  background(0);
  lights();  
  pushMatrix();
  rotateX(xRotationSpeed);
  stroke(255,255,255,50);
  strokeWeight(5);
  smallerIco.create();
  stroke(255,120,255,25);
  strokeWeight(5);
  smallerIco2.create(); 
  popMatrix();
  
  pushMatrix();
  rotateX(xRotationSpeed2);
  stroke(255,255,255);
  strokeWeight(1);
  bigIco.create();
  popMatrix();
  
  
}


void drawIcosahedron() {
  moonlander.update(); 

  icosahedronRadius = (float) moonlander.getIntValue("ico1:radius");
  noiseLevel = (float) moonlander.getValue("ico1:noise");
  xRotationSpeed = (float)moonlander.getValue("ico1:xRotation");
  color smallIcoFill2 = color(255, 255,255);
  //create two icosahedrons with radius and noiseLevel
  ico = new Icosahedron(icosahedronRadius, noiseLevel, smallIcoFill2, smallIcoFill2);
  //set background and initialize lights
  background(0);
  lights();
  
   //draw icosahedron____________________________________________________________________________
   pushMatrix();
   stroke(255,255,255);
   translate( width/10, height/10);
   rotateX(xRotationSpeed);
   ico.create();
   popMatrix(); 
}

//HEADLINE_________________________________________________________________________________
void drawHeadlineText() { 
  //text
  pushMatrix();
  translate( 0, -450);
  textAlign(RIGHT);
  drawType  (width * -0.3);//kuinka kaukana reunasta
  popMatrix();  
}
 void drawType(float x) {
  line(x, 0, x, 25);  
  line(x, 220, x, 2000); //?1000
  
  fill(255);
  textSize(50); 
  text("Murrr", x, 95);
  fill(150);
  textSize(30); 
  text("Asssembly", x, 145);
  
  textSize(30); 
  fill(150);
  text("2019", x, 180);
}

//END TEXT_________________________________________________________________________________
void drawEndText() { 
  //text
  pushMatrix();
  translate( -200, -450);
  textAlign(LEFT);
  drawTypeEnd  (width * -0.3);//kuinka kaukana reunasta
  popMatrix();  
}

 void drawTypeEnd(float x) {
  line(x, 0, x, 25);  
  line(x, 230, x, 2000); //?1000
  
  textSize(50); 
  fill(200);
  text("Team vaDOD: ", x, 75);
    fill(150);
  textSize(30); 
  text("AVRH, apndx, hajame & vsvala ", x, 120);
  
  fill(100);
  textSize(20); 
  text("Music credits: hajame", x, 180);
  
  fill(100);
  textSize(20); 
  text("Painting credits: apndx", x, 220);
 

}

 
 
//SILMA_______________________________________________________________________________________
void drawSilma(int opacity, float xRotationSpeedSilma) {
    pushMatrix();
    translate(0, height/4);
    rotateX(xRotationSpeedSilma);  
    image(silma, -width, -height, width*2, height*2);
    tint(255, opacity); 
    popMatrix();
} 

//PASTILLI_______________________________________________________________________________________
//void drawPastilli(int pastilliOpacity) {
//    pushMatrix();
//    //translate(0, height/4); 
//    image(pastilli, -width, -height, width*2, height*2);
//    tint(100, pastilliOpacity); 
//    popMatrix();
//} 
