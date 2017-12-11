import toxi.geom.*;
import toxi.geom.mesh2d.*;

import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;

import toxi.util.*;
import toxi.util.datatypes.*;

import toxi.processing.*;



// ranges for x/y positions of points
FloatRange xpos, ypos;

// helper class for rendering
ToxiclibsSupport gfx;

// empty voronoi mesh container
Voronoi voronoi = new Voronoi();

// optional polygon clipper
PolygonClipper2D clip;
ArrayList<Polygon2D> polys;

VerletPhysics2D physics;
AttractionBehavior2D mouseAttractor;
AttractionBehavior2D breather;

Vec2D mousePos;
ArrayList<VerletParticle2D> centers;

void setup() {
  
  //size (800, 800);
  fullScreen();
  //background(255);
  smooth();
  // focus x position around horizontal center 
  xpos = new BiasedFloatRange(0, width, width/2, 0.3333f);
  // focus y positions around bottom
  ypos = new BiasedFloatRange(0, height, height, .666f);
  
  centers = new ArrayList<VerletParticle2D>();
  clip = new ConvexPolygonClipper(new Circle(height * .45).toPolygon2D(8).translate(new Vec2D(width/2, height/2)));
  gfx = new ToxiclibsSupport(this);
  physics = new VerletPhysics2D();
  physics.setDrag(.5f);
  breather = new AttractionBehavior2D(new Vec2D(width/2, height/2), height, .1);
  //physics.addBehavior(new GravityBehavior2D(new Vec2D(0, .001)));
  physics.addBehavior(breather);
  physics.setWorldBounds(new Rect(0, 0, width, height));
  polys = new ArrayList<Polygon2D>();
  for (int i = 0; i < 150; i++) {
    voronoi.addPoint(new Vec2D(xpos.pickRandom(), ypos.pickRandom()));
  }
  
  for(Polygon2D poly: voronoi.getRegions()) {
      VerletParticle2D center = new VerletParticle2D(poly.getCentroid());
      ArrayList<Vec2D> verts = (ArrayList<Vec2D>) clip.clipPolygon(poly).vertices;
      ArrayList<VerletParticle2D> polyParts = new ArrayList<VerletParticle2D>();
      
      Polygon2D verletPoly = new Polygon2D();
      for(int i = 0; i < verts.size(); i++) {
        VerletParticle2D p1 = new VerletParticle2D(verts.get(i));
        //p1.addBehavior(new AttractionBehavior2D(p1, 300, .5));
        verletPoly.add(p1);
        polyParts.add(p1);
        physics.addParticle(p1);
        //physics.addSpring(new VerletSpring2D(p2, new VerletParticle2D(p2), .5f, 0.5));
      }
      polys.add(verletPoly);
      physics.addParticle(center);
      centers.add(center);
      for(int i = 0; i < polyParts.size(); i++) {
        VerletParticle2D p1 = polyParts.get(i);
        VerletParticle2D p2 = polyParts.get((i+1) % polyParts.size());
        physics.addSpring(new VerletSpring2D(p1, p2, p1.distanceTo(p2), .05));
        physics.addSpring(new VerletSpring2D(p1, center, p1.distanceTo(center), .05));
      }
  }
  noStroke();
  fill(216, 72, 72);
  rect(0, 0, width, height);
}

void draw() {
  noStroke();
  //fill(200, 0, 0, 20);
  //rect(0, 0, width/2, height/2);
  //background(255);
  //stroke(0, 20);
  //noFill();
  //noFill();
  breather.setStrength(.4 * sin((PI / 2)* sin(frameCount / 30.0)));
  physics.update();
  //for(Polygon2D poly: voronoi.getRegions()) {
  //    stroke(0, 20);
  //    gfx.polygon2D(poly);
  //}
  
  for(Polygon2D poly: polys) {
      stroke(140, 0, 0, 150);
      gfx.polygon2D(poly);
  }
  stroke(255, 0, 0);
  beginShape(TRIANGLES);
  for(Triangle2D t : voronoi.getTriangles()) {
    //gfx.triangle(t, false);
  }
  endShape();
}

void mousePressed() {
  mousePos = new Vec2D(mouseX, mouseY);
  // create a new positive attraction force field around the mouse position (radius=250px)
  mouseAttractor = new AttractionBehavior2D(mousePos, 250, -1.5f);
  physics.addBehavior(mouseAttractor);
}

void mouseDragged() {
  // update mouse attraction focal point
  mousePos.set(mouseX, mouseY);
}

void mouseReleased() {
  // remove the mouse attraction when button has been released
  physics.removeBehavior(mouseAttractor);
}