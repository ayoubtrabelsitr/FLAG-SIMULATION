// classe Ressort qui étend la classe VerletSpring3D
class Ressort extends VerletSpring3D     
{ // Variables pour les extrémités du ressort
  private Particle particleA;
  private Particle particleB;
  public  Ressort(Particle particleA, Particle particleB, float Distance, float forceCoefficient)//Constructeur vec deux particules, une distance et une force de ressort
  {
    super(particleA,particleB, Distance, forceCoefficient); // Constructeur du classe parent VerletSpring3D
    this.particleA = particleA;
    this.particleB = particleB;
  }
   void display()
  {
    stroke(255);
    // Dessiner une ligne reliant les positions des particules a et b du ressort
    line(particleA.x, particleA.y, particleA.z, particleB.x, particleB.y, particleB.z); 
  }   
}
