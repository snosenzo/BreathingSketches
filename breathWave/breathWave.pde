PShape wave;
import controlP5.*;
ControlP5 cp5;
float frameWavelength = 30;
float thetaOffset = PI/2;
void setup() {
  size(800, 800);
  background(0);
  stroke(255);
  noFill();
  pixelDensity(2);
  wave = createShape();
  setupUI();
}

void draw() {
  background(0);
  wave = createShape();
  wave.beginShape();
 for(int i = 0; i <  width; i++) {
   float x = i+1;
    float distFromCenter = dist(x, 0, width/2, 0);
    float waveOffset = map(distFromCenter, 0, width/2, 0, 100);
    float waveY = 100 * sin((thetaOffset) * sin((-frameCount + waveOffset) / frameWavelength)) + 20;
   wave.vertex(x, height/2 + waveY);
   //println(i);
 }
 stroke(255, 200);
 wave.endShape();
 
 shape(wave);
 
}

void setupUI() {
  cp5 = new ControlP5(this);
  cp5.addSlider("frameWavelength")
     .setPosition(50,50)
     .setRange(10,45)
     ;  
  cp5.addSlider("thetaOffset")
     .setPosition(50,65)
     .setRange(0,TWO_PI)
     ;  
  
}