import toxi.physics3d.*;
import toxi.physics3d.behaviors.*;
import toxi.physics3d.constraints.*;
import toxi.geom.*;
class Grid 
{
  ArrayList<Ressort> ressort;
  VerletPhysics3D physics;  
  Vec3D gravity; 
  float len ;
  int nParX, nParY; 
  Particle[][] Blanket ;
    public Grid() 
    {  
      this.len=5 ;
      this.gravity=new Vec3D(0, 0.7, 0);  
      this.nParY=50;  
      this.nParX=40;
      this.Blanket= new Particle[nParY][nParX];
    }
    void init() 
    {
    physics = new VerletPhysics3D();
    ressort = new ArrayList<Ressort>();
    physics.addBehavior(new GravityBehavior3D(gravity ));
    }
    void createParticles() {
    float x = -nParY * len - 100;
    for (int i = 0; i < nParY; i++) {
        float y = -nParX * len - 100;
        for (int j = 0; j < nParX; j++) {
            Particle p1 = new Particle(x, y, 0);
            Blanket[i][j] = p1;
            physics.addParticle(p1);
            y += len;
        }
        x += len;
    }
  }
  void createSprings() {
      for (int i = 0; i < nParY; i++) {
          for (int j = 0; j < nParX; j++) {
              Particle a1 = Blanket[i][j];
              if (i != nParY - 1) {
                  Particle b1 = Blanket[i + 1][j];
                  ressort.add(new Ressort(a1, b1, len, 1));
                  physics.addSpring(new Ressort(a1, b1, len, 1));
              }
              if (j != nParX - 1) {
                  Particle b2 = Blanket[i][j + 1];
                  ressort.add(new Ressort(a1, b2, len, 1));
                  physics.addSpring(new Ressort(a1, b2, len, 1));
              }
          }
      }
  }
  void lockParticles() {
      Blanket[0][0].lock();
      Blanket[0][(int) nParX / 3].lock();
      Blanket[0][(int) nParX / 2].lock();
      Blanket[0][(int) nParX * 3 / 4].lock();
      Blanket[0][(int) nParX - 1].lock();
  }
  void create() {
      createParticles();
      createSprings();
      lockParticles();
  }
  void create_noise(float startXOff, float startYOff, float startZOff) {
    float xoff = startXOff;
    float yoff, zoff;
    zoff = startZOff;
    for (int i = 0; i < grid.nParY; i++) {
        yoff = startYOff;
        for (int j = 0; j < grid.nParX; j++) {
            float windx = map(noise(xoff, yoff, zoff), 0, 1, 0, 3);
            float windz = map(noise(xoff + 500, yoff + 500, zoff), 0, 1, -2, 2);
            grid.Blanket[i][j].addForce(new Vec3D(windx, 0, windz));
            yoff += 0.1;
        }
        xoff += 0.1;
    }
    zoff += 0.1;
}
  void applyWindForce() {
  float zoff = 0, xoff = 0;
  for (int i = 0; i < nParY; i++) {
    float yoff = 0;
    for (int j = 0; j < nParX; j++) {
      float windx = map(noise(xoff, yoff, zoff), 0, 1, 0, 3);
      float windz = map(noise(xoff + 500, yoff + 500, zoff), 0, 1, -2, 2);
      Vec3D windForce = new Vec3D(windx, 0, windz);
      // Appliquer la force d'air  si la touche 'F' est enfoncée
      if (keyFPressed) {
        Blanket[i][j].addForce(windForce);
      }
      yoff += 0.2;
    }
    xoff += 0.2;
    }
  zoff += 0.2;
  }
}
