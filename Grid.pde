import toxi.physics3d.*;
import toxi.physics3d.behaviors.*;
import toxi.physics3d.constraints.*;
import toxi.geom.*;
class Grid 
{
  float len ;
  int numParticlesY  ; 
  int numParticlesX ;  
  Particle[][] Blanket ;
  ArrayList<Ressort> ressort;
  VerletPhysics3D physics;  
  Vec3D gravity  ; 
  
    
    public Grid() 
    {  
      this.len=5 ;
      this.gravity=new Vec3D(0, 0.7, 0);  
      this.numParticlesY=50;  
      this.numParticlesX=40;
      this.Blanket= new Particle[numParticlesY][numParticlesX];
    
   
    }
    
    void init() 
    {
    physics = new VerletPhysics3D();
    ressort = new ArrayList<Ressort>();
    physics.addBehavior(new GravityBehavior3D(gravity ));
   
    }
   
     void create() 
     {  
       float x = -numParticlesY * len -100;     // Spacing them out along the x-axis
      for (int i = 0; i < numParticlesY; i++)
    
    {
      float y = -numParticlesX * len -100;
      for (int j = 0; j < numParticlesX; j++) 
      {  
        
        Particle p1 = new Particle(x, y, 0);     
        Blanket[i][j] = p1;
        physics.addParticle(p1);  // Add the particle to the physics world
        y += len;
      }
      x+=len;
    }
 for (int i = 0; i < numParticlesY; i++)
    
    {
      for (int j = 0; j < numParticlesX; j++) 
      
      {
        Particle a1 = Blanket[i][j];
        if (i != numParticlesY -1) 
        {
          Particle b1 =Blanket[i+1][j];
          ressort.add(new Ressort(a1, b1, len, 1));
          physics.addSpring(new Ressort(a1, b1, len, 1));
        }
  
  
        if (j != numParticlesX -1) 
        {
          
      
          Particle b2 = Blanket[i][j+1];
          ressort.add(new Ressort(a1, b2, len, 1) );
          physics.addSpring(new Ressort(a1, b2, len, 1) );
          
        }
         
      }  
    }
    
  // A particle can also be locked so that only one end of the spring can move
    Blanket[0][0].lock();   
    Blanket[0][(int)numParticlesX/3].lock();
    Blanket[0][(int)numParticlesX/2].lock();
    Blanket[0][(int)numParticlesX*3/4].lock();
    Blanket[0][(int)numParticlesX-1].lock();       
    }
    void create_noise()  //Nous avons ajouté du bruit pour rendre le rendu plus réaliste .
    {    
    float zoff =0,xoff= 0; 
    for (int i = 0; i < grid.numParticlesY; i++) {        
      float yoff = 0;
      for (int j = 0; j < grid.numParticlesX; j++)
        {
          float windx = map(noise(xoff, yoff, zoff), 0, 1, 0, 3);
          float windz = map(noise(xoff+500, yoff+500, zoff), 0, 1, -2, 2);
          grid.Blanket[i][j].addForce(new Vec3D(windx, 0, windz));
          yoff +=0.1;
        }
        xoff += 0.1;
    }
    zoff += 0.1; 
    } 
}
