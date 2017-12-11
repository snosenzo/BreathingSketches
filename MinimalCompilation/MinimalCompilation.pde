import controlP5.*;
ControlP5 cp5;

OneLine oneline;
Facets facets;
Waveform waveform;
GeoSmile geosmile;
CircleTranslation circletranslation;
TwoCircles twocircles;

float frameWavelength = 30;
float thetaOffset = PI/2;
int currScene = 0;
int nextScene = 0;
float changeSceneTimeTheta = PI/2.0;
float changeSceneTimer = 0;
boolean sceneChanging = false;
color bgColor;

void setup() {
  fullScreen();
  //size(800,800);
  //pixelDensity(2);
  bgColor = color(255, 255, 255);
  setupUI();
  background(255);
  strokeWeight(5);
  stroke(0);
  fill(0);
  startScene(currScene);
  
}

void draw() {
   //background(255);
  if(sceneChanging) {
    fill(127 + changeSceneTimer);
    noStroke();
    rect(0, 0, width, height);
  } else {
       background(0); 
  }
  if(currScene == 0) {
    oneline.draw();
  } else if(currScene == 1){
    facets.draw();
  } else if(currScene == 2) {
    waveform.draw();
  } else if(currScene == 3) {
    geosmile.draw();
  } else if(currScene == 5) {
    circletranslation.draw();
  } else if(currScene == 4) {
    twocircles.draw();
  }
    
  if(currScene != nextScene || sceneChanging) {
    sceneChange();
  }
}

void sceneChange() {
  
  if(changeSceneTimeTheta > TWO_PI) {
    println("transition finished");
    println(currScene + " -> " + nextScene);
    
    sceneChanging = false;
    changeSceneTimeTheta = 0;
  } else if(changeSceneTimeTheta > PI && currScene != nextScene) {
    println("changing scene");
    endScene(currScene);
    currScene = nextScene;
    startScene(currScene);
  } else {
    println("transitioning: " +  changeSceneTimeTheta);
    changeSceneTimeTheta+=.05;
    changeSceneTimer = -127 * cos(changeSceneTimeTheta);
    sceneChanging = true;
  }
}

void endScene(int scene) {
 if(scene == 0) {
    oneline = null;
  } else if(scene == 1){
    facets = null;
  } else if(scene == 2) {
    waveform = null;
  } else if(scene == 3) {
    geosmile = null;
  } else if (scene == 5) {
    circletranslation = null;
  } else if (scene == 4) {
    twocircles = null;
  }
}

void startScene(int scene) {
  if(scene == 0) {
    oneline = new OneLine();
  } else if(scene == 1){
    facets = new Facets();
  } else if(scene == 2) {
    waveform = new Waveform();
  } else if (scene == 3) {
    geosmile = new GeoSmile();
  } else if (scene == 5) {
    circletranslation = new CircleTranslation();
  } else if (scene == 4) {
    twocircles = new TwoCircles();
  }
}
  


void setupUI() {
  cp5 = new ControlP5(this);
  cp5.addSlider("frameWavelength")
     .setPosition(50,50)
     .setRange(10,45)
     ;  
  cp5.addSlider("thetaOffset")
     .setPosition(50,65)
     .setRange(0,TWO_PI)
     ;  
  cp5.addSlider("nextScene")
     .setPosition(50,80)
     .setSize(20,100)
     .setRange(0,7)
     .setNumberOfTickMarks(8)
     ; 
}

void keyPressed() {
  
  if(key == 'n'){
    nextScene = (nextScene + 1) % 6;

  }
  
  
}