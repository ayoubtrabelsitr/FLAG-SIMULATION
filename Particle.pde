class Particle extends    

VerletParticle3D 

{
  
  public Particle(float x, float y, float z){
    super(x, y, z);
  }

  void display(){
    pushMatrix();
    fill(0);
    noStroke();
    translate(x, y, z);
    ellipse(0, 0, 2, 2);
    popMatrix();
  }
}
