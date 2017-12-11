void setup() {
  size(800, 800);
  pixelDensity(2);
  background(255);
  stroke(0);
  fill(0); 
}

void draw() {
  background(255);
  pushMatrix();
  translate(width/2, height/2);
  float top = 5.0 * sin((PI / 2)* sin(frameCount / 30.0))+0.4;
  ellipse(20, 0, 15 + top, 15 + top);
  ellipse(-20, 0, 15 + top, 15 + top);
  popMatrix();
}