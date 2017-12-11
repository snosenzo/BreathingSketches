int numLines = 15;
float theta = 0;
void setup() { 
  //size(800, 800);
  fullScreen();
  background(255);
  stroke(0);
  fill(0);
  //pixelDensity(2);
  
}

void draw() {
  background(255);
  strokeCap(PROJECT);
  //line(width/2, height/4, width/2, 3*height/4);
  //int frame = (int) (30 * sin(theta));
  for(int i = 0; i < numLines; i++) {
    float x = (i+1) * ((float) width/(numLines+1));
    float distFromCenter = dist(x, 0, width/2, 0);
    float waveOffset = map(distFromCenter, 0, width/2, 0, 100);
    float wave = 20 * sin((PI / 2)* sin((-frameCount + waveOffset) / 40.0)) + 20;
     strokeWeight(abs(wave));
    
    line(x, height/4, x, 3*height/4);
  }
  
  theta+= PI/60.0;
}

void keyPressed(){
  if(key =='s') {
    saveFrame("lineweights" + random(2) + ".png");
  }
}