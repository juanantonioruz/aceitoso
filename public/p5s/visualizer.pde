import toxi.geom.*;
import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;

VerletPhysics2D physics;
boolean showPhysics = true;
boolean showParticles = true;

var VerletParticle2D= toxi.physics2d.VerletParticle2D, 
VerletSpring2D=toxi.physics2d.VerletSpring2D,
VerletMinDistanceSpring2D=toxi.physics2d.VerletMinDistanceSpring2D,
VerletPhysics2D=toxi.physics2d.VerletPhysics2D,
Rect=toxi.Rect,
Vec2D=toxi.Vec2D;

Salida t=new Salida();
void setup() {
  background(240);
  size(700,382);
  smooth();
  //textSize(99);
    physics = new VerletPhysics2D();
  physics.setDrag(0.05);
  physics.setWorldBounds(new Rect(10,10,width-20,height-20));
  
  loadXML();
    newGraph();
}
int contador=0;
ArrayList relacionables=new ArrayList();
void loadXML(){
	String xmlFile="resources/relacionables.xml";
		ArrayList equipos=new ArrayList();
		XMLElement xmlO = new XMLElement(this, xmlFile);
		int numSites = xmlO.getChildCount();
		XMLElement[] kids = xmlO.getChildren();
		//console.log("numero de elementos en " + kids.length);
			for (XMLElement el : kids) {
		//console.log(el);
			if(el.getChild("heir")!=null){
			var titulo_xml=el.getChild("heir").getChild("titulo");
			if(titulo_xml != null){
			contador++;
				String nombre = titulo_xml.getContent();
				int id = int(el.getChild("id").getContent());		
		//console.log("eee"+nombre);
		relacionables.add(el);
		}
		}
			}
		//console.log("relacionables con nombre::: "+contador);

}

 ArrayList clusters;
// Spawn a new random graph
void newGraph() {

  // Clear physics
  physics.clear();

  // Create new ArrayList (clears old one)
  clusters = new ArrayList();

  // Create 8 random clusters
  for (int i = 0; i < 1; i++) {
    toxi.Vec2D center = new toxi.Vec2D(width/2,height/2);
    clusters.add(new Cluster((int) random(3,8),random(20,100),center));
  }

  //	All clusters connect to all clusters	
  for (int i = 0; i < clusters.size(); i++) {
    for (int j = i+1; j < clusters.size(); j++) {
      Cluster ci = (Cluster) clusters.get(i);
      Cluster cj = (Cluster) clusters.get(j);
    //  ci.connect(cj);
    }
  }
 physics.addBehavior(new toxi.physics2d.GravityBehavior(new toxi.Vec2D(0, 10)));
}
 
 
 
void draw() {
  background(255);

  physics.update();
  
//  t.info("furula!");
 // Display all points
  if (showParticles) {
    for (int i = 0; i < clusters.size(); i++) {
      Cluster c = (Cluster) clusters.get(i);
      c.display();
    }
  }
   if (showPhysics && false) {
    for (int i = 0; i < clusters.size(); i++) {
      // Cluster internal connections
      Cluster ci = (Cluster) clusters.get(i);
      ci.showConnections();

      // Cluster connections to other clusters
      for (int j = i+1; j < clusters.size(); j++) {
        Cluster cj = (Cluster) clusters.get(j);
        ci.showConnections(cj);
      }
    }
  }
}
void keyPressed() {
  if (key == 'c') {
    showPhysics = !showPhysics;
    if (!showPhysics) showParticles = true;
  } 
  else if (key == 'p') {
    showParticles = !showParticles;
    if (!showParticles) showPhysics = true;
  } 
  else if (key == 'n') {
    newGraph();
  }
}
