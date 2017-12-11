class CircleTranslation {
  
  CircleTranslation() {}
  void draw() {
    noStroke();
    fill(255);
    float wave = 100 * sin((PI / 2)* sin(frameCount / 30.0));
    float size = map(wave, -100, 100, 50, 10);
    ellipse( width/2, height/2 + wave, size, size); 
  }
    
}