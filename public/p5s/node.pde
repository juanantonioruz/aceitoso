class Node {
	 VerletParticle2D particle;

  public Node(Vec2D pos) {
    particle=new VerletParticle2D(pos);
  }

  // All we're doing really is adding a display() function to a VerletParticle
  public void display() {
    fill(0,150);
    stroke(0);
    ellipse(particle.x,particle.y,16,16);
  }
}
