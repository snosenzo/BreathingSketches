import toxi.geom.*;
import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;


int NUM_PARTICLES = 1000;
VerletPhysics2D physics;
AttractionBehavior2D mouseAttractor;
AttractionBehavior2D topAttractor;
AttractionBehavior2D botAttractor;
Vec2D mousePos;
Vec2D topPos, botPos;
void setup() {
  //size( 800, 800);
  fullScreen();
  physics = new VerletPhysics2D();
  physics.setDrag(0.2f);
  //physics.setWorldBounds(new Rect(width/4, 0, width/2, height));
  topPos = new Vec2D(width/2, 20);
  botPos = new Vec2D(width/2, height -20);
  
  topAttractor = new AttractionBehavior2D(topPos, height, .9f, .1); 
  botAttractor = new AttractionBehavior2D(botPos, height, .9f, .1);
  //gravity = new GravityBehavior2D(new Vec2D(0, 0.15f));
  physics.addBehavior(topAttractor);
  physics.addBehavior(botAttractor);
  for(int i = 0; i < NUM_PARTICLES; i++) {
    //addParticle();  
  }
}

void addParticle() {
  VerletParticle2D p = new VerletParticle2D(Vec2D.randomVector().scale(5).addSelf(random(width/2, width/2), random(height/2, height/2)));
  physics.addParticle(p);
  // negative attraction = repulsion
  physics.addBehavior(new AttractionBehavior2D(p, 12, -.8f, 0.01f));
}

void draw() {
  background(216,72, 72);
  //topAttractor.setRadius(.8 * sin((PI / 2)* sin(frameCount / 30.0)));
  //botAttractor.setRadius(-.8 * sin((PI / 2)* sin(frameCount / 30.0)));

  topAttractor.setStrength(.8 * sin((PI / 2)* sin(frameCount / 30.0)));
  botAttractor.setStrength(-.8 * sin((PI / 2)* sin(frameCount / 30.0)));
  noStroke();
  fill(190, 40, 40);
  if (physics.particles.size() < NUM_PARTICLES) {
    addParticle();
  }
  physics.update();
  for ( VerletParticle2D p : physics.particles) {
    ellipse(p.x, p.y, 7, 7);
  }
}

void keyPressed() {
  if(key == 'r') {
    setup();
  }
}