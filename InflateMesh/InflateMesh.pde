
import toxi.geom.*;
import toxi.geom.mesh.subdiv.*;
import toxi.geom.mesh.*;
import toxi.physics3d.*;
import toxi.physics3d.behaviors.*;
import toxi.physics3d.constraints.*;
import toxi.processing.*;

VerletPhysics3D physics;
AttractionBehavior3D inflate;
WETriangleMesh box;

ToxiclibsSupport gfx;

void setup() {
    //size(800,800, P3D);
    fullScreen(P3D);
    gfx = new ToxiclibsSupport(this);
    initPhysics();
}

void draw() {
    physics.update();
    for (Vertex v : box.vertices.values()) {
        v.set(physics.particles.get(v.id));
    }
    box.center(null);
    for (Vertex v : box.vertices.values()) {
        physics.particles.get(v.id).set(v);
    }
    box.computeFaceNormals();
    box.faceOutwards();
    box.computeVertexNormals();
    background(216,72, 72);
    translate(width / 2, height / 2, 0);
    rotateX((height / 2 - mouseY) * 0.01f);
    rotateY((width / 2 - mouseX) * 0.01f);
    //fill(0);
    noFill();
    lights();
    directionalLight(255, 255, 255, -200, 1000, 500);
    specular(255);
    shininess(100);
    gfx.origin(new Vec3D(), 50);
    fill(216,72, 72);
    //noFill();
    noStroke();
    gfx.mesh(box, true, 0);
    physics.removeBehavior(inflate);
  inflate=new AttractionBehavior3D(new Vec3D(), 500, 2 * sin((PI/2)* sin(frameCount / 20.0)) - .3, -0f );
  physics.addBehavior(inflate);
}

void initPhysics() {
    box = new WETriangleMesh();
    // create a simple start mesh
    //box.addMesh(new Cone(new Vec3D(0, 0, 0), new Vec3D(0, 1, 0), 10, 50, 100).toMesh(4));
    box.addMesh((new Sphere(200)).toMesh(75));
    // then subdivide a few times...
    //box.subdivide();
    //box.subdivide();
    //box.subdivide();
    //box.subdivide();
    physics = new VerletPhysics3D();
    physics.setWorldBounds(new AABB(new Vec3D(), 300));
    // turn mesh vertices into physics particles
    for (Vertex v : box.vertices.values()) {
        VerletParticle3D vp = new VerletParticle3D(v);
        if(random(1) < .07) {
          vp.lock();
        }
        physics.addParticle(vp);
    }
    // turn mesh edges into springs
    for (WingedEdge e : box.edges.values()) {
        VerletParticle3D a = physics.particles.get(((WEVertex) e.a).id);
        VerletParticle3D b = physics.particles.get(((WEVertex) e.b).id);
        physics.addSpring(new VerletSpring3D(a, b, a.distanceTo(b), 0.1f));
    }
}

void keyPressed() {
    if (key == 'r') {
        initPhysics();
    }
}

void mousePressed() {
  
}

void mouseReleased() {
  physics.removeBehavior(inflate);
}