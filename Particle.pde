// La classe Particle extend de la classe VerletParticle3D
class Particle extends VerletParticle3D {
  
  public Particle(float x, float y, float z) {
    super(x, y, z);
  }
  //afficher la particule
  void display() {
    pushMatrix();
    fill(255, 0, 0); 
    noStroke();
    translate(x, y, z);
    ellipse(0, 0, 5, 5); 
    popMatrix();
  }
}
