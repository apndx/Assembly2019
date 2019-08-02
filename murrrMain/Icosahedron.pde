//helper classes
class Dimension3D{
  float w,h,d;
  Dimension3D(float w, float h, float d){
    this.w=w;
    this.h = h;
    this.d = d;
  }
}

abstract class Shape3D{
  float x,y,z;
  float w,h,d;
  //constructors
  Shape3D(){
  }
  Shape3D(float x, float y, float z){
    this.x = x;
    this.y = y;
    this.z = z;
  }
  Shape3D(PVector p){
    x = p.x;
    y = p.y;
    z = p.z;
  }
  Shape3D(Dimension3D dim){
    w = dim.w;
    h = dim.h;
    d = dim.d;
  }
  Shape3D(float x, float y, float z, float w, float h, float d){
    this.x = x;
    this.y = y;
    this.z = z;
    this.w = w;
    this.h = h;
    this.d = d;
  }

  Shape3D(float x, float y, float z, Dimension3D dim){
    this.x = x;
    this.y = y;
    this.z = z;
    w = dim.w;
    h = dim.h;
    d = dim.d;
  }

  Shape3D(PVector p, Dimension3D dim){
    x = p.x;
    y = p.y;
    z = p.z;
    w = dim.w;
    h = dim.h;
    d = dim.d;
  }
  void setLocation(float x, float y, float z){
    this.x=x;
    this.y=y;
    this.z=z;
  }
  void rotX(float theta){
  }

  void rotY(float theta){
  }

  void rotZ(float theta){
  }
  abstract void init();
  abstract void create();
 
}

class Icosahedron extends Shape3D{

  // icosahedron data
  //location of the topmost point
  PVector topPoint;
  //an array containing the locations of each 5 corner points of the top pentagon
  PVector[] topPent = new PVector[5];
  //location of the bottommost point
  PVector bottomPoint;
  //an array containing the locations of each 5 corners of the bottom pentagon
  PVector[] bottomPent = new PVector[5];
  //angle for drawing the top pentagon
  float angle = 0, radius = 150;
  //distance of triangles
  float triDist;
  //heights of triangles
  float triHt;
  //magic
  float a, b, c;
  float noiseLevel;
  color fillColor1 = color(0,0,0,0);
  color fillColor2 = color(0,0,0,0);
  color strokeColor = color(255,255,255);
 
 
  // constructors
  Icosahedron(float radius, float noiseLevel){
    this.radius = radius;
    this.noiseLevel = noiseLevel;
    init();
  }
  //with one color given (other stays black)
  Icosahedron(float radius, float noiseLevel, color fill1){
    this.radius = radius;
    this.noiseLevel = noiseLevel;
    this.fillColor1 = fill1;
    init();
  }
  //with two colors given
    Icosahedron(float radius, float noiseLevel, color fill1, color fill2){
    this.radius = radius;
    this.noiseLevel = noiseLevel;
    this.fillColor1 = fill1;
    this.fillColor2 = fill2;
    init();
  }


  // calculate geometry
  void init(){
    //math magic
    c = dist(cos(0)*radius, sin(0)*radius, cos(radians(72))*radius,  sin(radians(72))*radius);
    b = radius;
    a = (float)(Math.sqrt(((c*c)-(b*b))));
    noiseDetail(6,0.3);
    triHt = noise(noiseLevel)*(float)(Math.sqrt((c*c)-((c/2)*(c/2))));
 
    //calculate the locations of each 5 corner points of the top pentagon
    for (int i=0; i<topPent.length; i++){
      topPent[i] = new PVector(noise(noiseLevel)*cos(angle)*radius, noise(noiseLevel*2)*sin(angle)*radius, noise(noiseLevel*0.5)*triHt/2.0f);
      angle+=radians(72);
    }
    //calculate the location of the top point
    topPoint = new PVector(0, 0, noise(noiseLevel)*triHt/2.0f+a);
    angle = 72.0f/2.0f;
   
    //calculate the locations of each 5 corner points of the bottom pentagon
    for (int i=0; i<topPent.length; i++){
      bottomPent[i] = new PVector(noise(noiseLevel)*cos(angle)*radius, noise(noiseLevel/3)*sin(angle)*radius, -triHt/2.0f);
      angle+=radians(72);
    }
    //calculate the location of the bottom point
    bottomPoint = new PVector(0, 0, -(triHt/2.0f+a));
  }

  // draws icosahedron
  void create(){
    //for each corner point of the top pentagon
    for (int i=0; i<topPent.length; i++){
      // icosahedron top
      beginShape();
       //4 first triangles
      if (i<topPent.length-1){
        noFill();
        vertex(x+topPent[i].x, y+topPent[i].y, z+topPent[i].z);
        vertex(x+topPoint.x, y+topPoint.y, z+topPoint.z);
        vertex(x+topPent[i+1].x, y+topPent[i+1].y, z+topPent[i+1].z);
      }
      //the last triangle
      else {
        vertex(x+topPent[i].x, y+topPent[i].y, z+topPent[i].z);
        vertex(x+topPoint.x, y+topPoint.y, z+topPoint.z);
        vertex(x+topPent[0].x, y+topPent[0].y, z+topPent[0].z);
      }
      endShape(CLOSE);

      // icosahedron bottom
      beginShape();
      if (i<bottomPent.length-1){
        curveVertex(x+bottomPent[i].x, y+bottomPent[i].y, z+bottomPent[i].z);
        vertex(x+bottomPoint.x, y+bottomPoint.y, z+bottomPoint.z);
        vertex(x+bottomPent[i+1].x, y+bottomPent[i+1].y, z+bottomPent[i+1].z);
      }
      else {
        vertex(x+bottomPent[i].x, y+bottomPent[i].y, z+bottomPent[i].z);
        vertex(x+bottomPoint.x, y+bottomPoint.y, z+bottomPoint.z);
        vertex(x+bottomPent[0].x, y+bottomPent[0].y, z+bottomPent[0].z);
      }
      endShape(CLOSE);
    }

    // icosahedron body
    for (int i=0; i<topPent.length; i++){
      if (i<topPent.length-2){
        beginShape();
        vertex(x+topPent[i].x, y+topPent[i].y, z+topPent[i].z);
        vertex(x+bottomPent[i+1].x, y+bottomPent[i+1].y, z+bottomPent[i+1].z);
        vertex(x+bottomPent[i+2].x, y+bottomPent[i+2].y, z+bottomPent[i+2].z);
        endShape(CLOSE);

        beginShape();
        noFill();
        vertex(x+bottomPent[i+2].x, y+bottomPent[i+2].y, z+bottomPent[i+2].z);
        vertex(x+topPent[i].x, y+topPent[i].y, z+topPent[i].z);
        vertex(x+topPent[i+1].x, y+topPent[i+1].y, z+topPent[i+1].z);
        endShape(CLOSE);
      }
      else if (i==topPent.length-2){
        beginShape();
        vertex(x+topPent[i].x, y+topPent[i].y, z+topPent[i].z);
        vertex(x+bottomPent[i+1].x, y+bottomPent[i+1].y, z+bottomPent[i+1].z);
        vertex(x+bottomPent[0].x, y+bottomPent[0].y, z+bottomPent[0].z);
        endShape(CLOSE);

        beginShape();
        vertex(x+bottomPent[0].x, y+bottomPent[0].y, z+bottomPent[0].z);
        vertex(x+topPent[i].x, y+topPent[i].y, z+topPent[i].z);
        vertex(x+topPent[i+1].x, y+topPent[i+1].y, z+topPent[i+1].z);
        endShape(CLOSE);
      }
      else if (i==topPent.length-1){
        beginShape();
        vertex(x+topPent[i].x, y+topPent[i].y, z+topPent[i].z);
        vertex(x+bottomPent[0].x, y+bottomPent[0].y, z+bottomPent[0].z);
        vertex(x+bottomPent[1].x, y+bottomPent[1].y, z+bottomPent[1].z);
        endShape(CLOSE);

        beginShape();
        noFill();
        vertex(x+bottomPent[1].x, y+bottomPent[1].y, z+bottomPent[1].z);
        vertex(x+topPent[i].x, y+topPent[i].y, z+topPent[i].z);
        vertex(x+topPent[0].x, y+topPent[0].y, z+topPent[0].z);
       
        endShape(CLOSE);
      }
    }
  }

  // overrided methods fom Shape3D
  void rotZ(float theta){
    float tx=0, ty=0, tz=0;
    // top point
    tx = cos(theta)*topPoint.x+sin(theta)*topPoint.y;
    ty = sin(theta)*topPoint.x-cos(theta)*topPoint.y;
    topPoint.x = tx;
    topPoint.y = ty;

    // bottom point
    tx = cos(theta)*bottomPoint.x+sin(theta)*bottomPoint.y;
    ty = sin(theta)*bottomPoint.x-cos(theta)*bottomPoint.y;
    bottomPoint.x = tx;
    bottomPoint.y = ty;

    // top and bottom pentagons
    for (int i=0; i<topPent.length; i++){
      tx = cos(theta)*topPent[i].x+sin(theta)*topPent[i].y;
      ty = sin(theta)*topPent[i].x-cos(theta)*topPent[i].y;
      topPent[i].x = tx;
      topPent[i].y = ty;

      tx = cos(theta)*bottomPent[i].x+sin(theta)*bottomPent[i].y;
      ty = sin(theta)*bottomPent[i].x-cos(theta)*bottomPent[i].y;
      bottomPent[i].x = tx;
      bottomPent[i].y = ty;
    }
  }


}
