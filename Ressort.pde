class Ressort extends VerletSpring3D     


{
  public  Ressort(Particle a, Particle b, float distance, float strength){
    super(a,b, distance, strength);
  }
  
  void display(){
    stroke(255);
    line(a.x, a.y, a.z, b.x, b.y, b.z);
  }   
  
  
}
