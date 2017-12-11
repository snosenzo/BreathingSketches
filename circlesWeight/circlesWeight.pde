int numCircles = 150;
ArrayList<PVector> circleLocations;
int circleRadius = 50;
int maxStroke = 20;
void setup() { 
  //size(800, 800);
  fullScreen();
  background(255);
  stroke(0);
  fill(0);
  circleLocations = new ArrayList<PVector>();
  
  for( int i = 0; i < numCircles; i++) {
    PVector p1 = new PVector(random(0, width), random(0, height));
    boolean validLocation = true;
    for(int j = 0; j < circleLocations.size(); j++) {
      PVector p2 = circleLocations.get(j);
      if(abs(PVector.sub(p1, p2).mag()) < circleRadius + maxStroke*2) {
        validLocation = false;
        i--;
        break;
      }
    }
    if(validLocation) circleLocations.add(p1);
  }
  //pixelDensity(2);
  
}

void draw() {
  background(255);
  
   noFill();
  //strokeCap(PROJECT);
  //line(width/2, height/4, width/2, 3*height/4);
  for(int i = 0; i < numCircles; i++) {
    PVector loc = circleLocations.get(i);
    float distFromCenter = dist(loc.x, 0, width/2, 0);
    float waveOffset = map(distFromCenter, 0, width/2, 0, 100);
    float wave = maxStroke * sin((PI / 2)* sin((-frameCount + waveOffset) / 30.0)) + maxStroke;
    strokeWeight(abs(wave));
    ellipse(loc.x, loc.y, circleRadius, circleRadius);
  }
}