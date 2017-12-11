class GeoSmile {
  GeoSmile() {
  }
  void draw() {
    noStroke();
    fill(255);
    pushMatrix();
   
    translate(width/2, height/2);
     scale(3);
    float top = 5.0 * sin((PI / 2)* sin(frameCount / 30.0));
    beginShape();
    vertex(-30, 0);
    vertex(0, 15 + top/2.0);
    vertex(30, 0);
    vertex(0, 8 - top);
    endShape(CLOSE); 
    popMatrix();
  } 
}