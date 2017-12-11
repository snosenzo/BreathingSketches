int wght = 3;

void setup() {
  
  //size(800, 800);
  fullScreen();
  //pixelDensity(2);
  background(255);
  strokeWeight(5);
  stroke(0);
  fill(0);
}


void draw() {
  background(255);
  pushMatrix();
  strokeWeight(wght);
  translate(width/2, height/2);
  float wave = 100.0 * sin((PI / 2)* sin(frameCount / 30.0));
  line( 0, -100 + wave, 0,100 - wave);
  popMatrix();
}