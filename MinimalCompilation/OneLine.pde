class OneLine {
  
  int wght = 3;
  void OneLine() {
    this.setup();
  }
  
  void setup() {
    
    stroke(0);
    fill(0);
  }
  
  
  void draw() {
    //println("linedraw");
    stroke(255);

    pushMatrix();
    strokeWeight(5);
    translate(width/2, height/2);
    float wave = 100.0 * sin((thetaOffset) * sin(frameCount / frameWavelength));
    line( 0, -100 + wave, 0,100 - wave);
    popMatrix();
  }
}