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
  fullScreen(P2D);
}

void setup() {
  // noCursor();
  // frameRate(60);
  // font = createFont("the_font_we_use.ttf", 64);  
  // moonlander = Moonlander.initWithSoundtrack(this, "the_music_harri_made.mp3", beats_per_min, 2);
  // background(255, 255, 255);
  // moonlander.start();
}

void draw() {
  moonlander.update(); 

  translate(width/2, height/2);
  scale(height / 1000.0);

  int scene = moonlander.getIntValue("scene"); 
  int updatebackground = moonlander.getIntValue("updatebackground");
  int start = moonlander.getIntValue("start");
  int end = moonlander.getIntValue("end");
  
  if (updatebackground != 0) {
    
    if (updatebackground == 1) {
      background(0);
    } else if (updatebackground == -1) {
      background(255);
    }
  }
  
   if (scene==0) {  //start/end
      drawSomething();
  }
   if (scene==666) {
      exit();
  }
}

void drawSomething() {   
}
