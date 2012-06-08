class Cluster {
	
  ArrayList nodes;
  float diameter;

  // We initialize a Cluster with a number of nodes, a diameter, and centerpoint
  public Cluster(int n, float d, toxi.Vec2D center) {
    // Initialize the ArrayList
    nodes = new ArrayList();

    // Set the diameter
    diameter = d;

    // Create the nodes
    for (int i = 0; i < relacionables.size(); i++) {
      // We can't put them right on top of each other
      nodes.add(new Node(center.add(Vec2D.randomVector())));
    }
	//console.log(nodes.size()+"nodes size");
   
    // Connect all the nodes with a Spring
    for (int i = 0; i < nodes.size(); i++) {
      VerletParticle2D pi = (VerletParticle2D) nodes.get(i).particle;
//	println("pi:: "+pi);
	int j=dameJota(i, nodes.size());
        VerletParticle2D pj = (VerletParticle2D) nodes.get(j).particle;
//	println("pj:: "+pj);
       physics.addSpring(new VerletSpring2D(pi,pj,diameter*5,0.1));
    }
   
  // Show all the nodes
    for (int i = 0; i < nodes.size(); i++) {
      Node n = (Node) nodes.get(i);
      n.display();
    }
  }
	int dameJota(int actual, int limite){
	int prueba=(int)random(nodes.size());
	if(prueba!=actual)return prueba;
	return dameJota(actual, limite);
	}
  void connect(Cluster other) {
    ArrayList otherNodes = other.getNodes();
    for (int i = 0; i < nodes.size(); i++) {
      VerletParticle2D pi = (VerletParticle2D) nodes.get(i).particle;
    println("pi:"+pi+"other.."+otherNodes);
      for (int j = 0; j < otherNodes.size(); j++) {
        VerletParticle2D pj = (VerletParticle2D) otherNodes.get(j).particle;
    println("pi:"+pj);
        // Create the spring
        physics.addSpring(new VerletMinDistanceSpring2D(pi,pj,(diameter+other.diameter)*0.5,0.05));
      }
    }
  }


  void display() {
    // Show all the nodes
    for (int i = 0; i < nodes.size(); i++) {
      Node n = (Node) nodes.get(i);
      n.display();
    }
  }
  
  void showConnections() {
    stroke(0,150);
    for (int i = 0; i < nodes.size(); i++) {
      VerletParticle2D pi = (VerletParticle2D) nodes.get(i).particle;
      for (int j = i+1; j < nodes.size(); j++) {
        VerletParticle2D pj = (VerletParticle2D) nodes.get(j).particle;
        line(pi.x,pi.y,pj.x,pj.y);
      }
    }
  }

  // Draw all the connections between this Cluster and another Cluster
  void showConnections(Cluster other) {
    stroke(0,50);
    ArrayList otherNodes = other.getNodes();
    for (int i = 0; i < nodes.size(); i++) {
      VerletParticle2D pi = (VerletParticle2D) nodes.get(i).particle;
      for (int j = 0; j < otherNodes.size(); j++) {
        VerletParticle2D pj = (VerletParticle2D) otherNodes.get(j).particle;
        line(pi.x,pi.y,pj.x,pj.y);
      }
    }
  }
  

  ArrayList getNodes() {
    return nodes;
  }
}
