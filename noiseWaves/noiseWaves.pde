
void setup(){
  size(800, 800);
  //pixelDensity(2);
  background(0);
  stroke(255);
  noFill();
  smooth();
}
float spacing = 15;
float res = 1;
float nx = 0, ny = 0, nz = 0;
float maxd = 300;
void draw(){
  background(0);
  fill(255);
  //rect(0, 0, width, height);
  //noStroke();
  stroke(0);
  for(int i = 0;i < height; i+=spacing){
    if(dist(0, height/2, 0, i) < 300 || mousePressed ){
      beginShape();
      for(int j = 0; j < width; j+=res){
        
        float d = dist(width/2, height/2, j , i);
        if( d > maxd) d = maxd;
        
        float amp = map(d, 0, maxd, spacing*1, 0);
        amp *= (1 + sin((PI / 2)* sin(frameCount / 15.0)));
        float x = j;
        float y = i + map(noise(nx+j*res/100, ny+i*res/100, nz), 0, 1, -amp, amp);
        vertex(x, y);
      }
      endShape();
    }
  }
  if(1 + sin((PI / 2)* sin(frameCount / 15.0)) < .01) {
    ny-=.1;
    nz+=.1;
  }
}