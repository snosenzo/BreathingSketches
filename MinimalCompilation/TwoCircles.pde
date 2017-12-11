class TwoCircles {
  
  TwoCircles() {
  }
  


  void draw() {
    fill(255);
    noStroke();
    pushMatrix();
    translate(width/2, height/2);
    scale(3);
    float top = 5.0 * sin((PI / 2)* sin(frameCount / 30.0))+0.4;
    ellipse(20, 0, 15 + top, 15 + top);
    ellipse(-20, 0, 15 + top, 15 + top);
    popMatrix();
  }
}