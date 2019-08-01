  
  class Ball { 
  //sphere
  int sphereDetail = (int) moonlander.getValue("sphereDetail");  //default=30  

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

}
