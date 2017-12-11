void setup() {
  size(800, 800);
  background(255);
  stroke(0);
  fill(0);
  pixelDensity(2); 
}

void draw() {
  background(255);
  float wave = 100 * sin((PI / 2)* sin(frameCount / 30.0) ) + 100;
  strokeWeight(abs(wave));
  noFill();
  ellipse( width/2, height/2, 50, 50); 
}