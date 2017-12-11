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
  float top = (5.0 * sin((PI / 2)* sin(frameCount / 30.0))+0.4);
  beginShape();
  vertex(-30 + top* 2 * noise(frameCount/60.0 + 39), 0);
  vertex(0, 15 + top * 2 * noise(frameCount/60.0 - 234));
  vertex(30 - top * 2 * noise(frameCount/60.0 + 208), 0);
  vertex(0, -15 + top * 2 * noise(frameCount/60.0 - 2379));
  endShape(CLOSE); 
  popMatrix();
}