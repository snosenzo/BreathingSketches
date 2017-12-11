Facet f;

void setup() {
  
  size(800, 800);
  pixelDensity(2);
  background(255);
  f = new Facet(width/2, height/2, 50);
  stroke(0);
  fill(0);
  
}


void draw() {
  background(255);
  
  f.update();
  f.display();
}