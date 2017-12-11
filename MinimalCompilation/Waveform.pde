
class Waveform {
  PShape wave;
  
  Waveform() {
    this.setup();
  }
  
  void setup() {
    noFill();
    wave = createShape();
  
  }
  
  void draw() {
    //background(0);
    wave = createShape();
    wave.beginShape();
    noFill();
   for(int i = 0; i <  width; i++) {
     float x = i+1;
      float distFromCenter = dist(x, 0, width/2, 0);
      float waveOffset = map(distFromCenter, 0, width/2, 0, 100);
      float amp = map(distFromCenter, 0, width/2, 200, 1);
      float waveY =  amp * sin((thetaOffset) * sin((-frameCount + waveOffset) / frameWavelength)) + 20;
     wave.vertex(x, height/2 + waveY);
     //println(i);
   }
   wave.stroke(255, 200);
   //stroke(255, 200);
   wave.endShape();
   
   shape(wave);
   
  }
  
}