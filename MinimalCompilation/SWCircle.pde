class SWCircle {
  
  SWCircle() {}
  void draw() {
    stroke(255);
    float wave = 100 * sin((PI / 2)* sin(frameCount / 30.0) ) + 100;
    strokeWeight(abs(wave));
    noFill();
    ellipse( width/2, height/2, 50, 50); 
  }
}