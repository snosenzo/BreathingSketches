public class Facet {
  PVector centerLoc;
  float sz;
  float inset;
  int numTriDivisions;
  
  public Facet(float x, float y, float _size) {
    centerLoc = new PVector(x, y);
    sz = _size;
    numTriDivisions = 4;
    inset = 4;
  }
  
  void update() {
    inset =  sz/4 - sz/4 * sin((PI / 2)* sin(frameCount / 30.0));
  }
  
  void display() {
    pushMatrix();
    
    translate(centerLoc.x, centerLoc.y);
    rotate(PI/4);
    for(int i = 0; i < numTriDivisions; i++) {
      fill(0);
      beginShape();
      vertex(sz * cos((i)*(TWO_PI/numTriDivisions)), sz * sin((i)*(TWO_PI/numTriDivisions)));
      vertex(inset * cos((i+.5)*(TWO_PI/numTriDivisions)), inset * sin((i+.5)*(TWO_PI/numTriDivisions)));
      vertex(sz * cos((i+1)*(TWO_PI/numTriDivisions)), sz * sin((i+1)*(TWO_PI/numTriDivisions)));
      endShape(CLOSE);  
    }
    popMatrix();
  }
  
}