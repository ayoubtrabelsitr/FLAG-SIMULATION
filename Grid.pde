import toxi.physics3d.*;
import toxi.physics3d.behaviors.*;
import toxi.physics3d.constraints.*;
import toxi.geom.*;
class Grid //Cette classe représente une grille qui contient une série de particules reliées par des ressorts pour former un maillage déformable.
{
  ArrayList<Ressort> ressort;//liste des ressorts
  VerletPhysics3D physics;  //instance du VerletPhysics3D utilisée pour simuler les interactions entre les particules.
  Vec3D gravity; //vecteur de gravité appliqué sur le système.
  float len ;
  int nParX, nParY; //nombre de particules sur les axes X et Y.
  Particle[][] Paricles ; //tableau pour les particules du maillage
    public Grid() 
    {  
      this.len=5 ;
      this.gravity=new Vec3D(0, 0.7, 0);  
      this.nParY=50;  
      this.nParX=40;
      this.Paricles= new Particle[nParY][nParX];
    }
    void init()
    {
    physics = new VerletPhysics3D();
    ressort = new ArrayList<Ressort>();
    physics.addBehavior(new GravityBehavior3D(gravity ));
    }
    void createParticles() { //créer les particules et les ajoute à la grille pour former le maillage.
    float x = -nParY * len - 100;
    for (int i = 0; i < nParY; i++) {
        float y = -nParX * len - 100;
        for (int j = 0; j < nParX; j++) {
            Particle p1 = new Particle(x, y, 0);
            Paricles[i][j] = p1;
            physics.addParticle(p1);
            y += len;
        }
        x += len;
    }
  }
  void createSprings() {//Créer les ressorts entre les particules voisines pour formrer la structure du maillage déformable.
      for (int i = 0; i < nParY; i++) {
          for (int j = 0; j < nParX; j++) {
              Particle a1 = Paricles[i][j];
              if (i != nParY - 1) {
                  Particle b1 = Paricles[i + 1][j];
                  ressort.add(new Ressort(a1, b1, len, 1));
                  physics.addSpring(new Ressort(a1, b1, len, 1));
              }
              if (j != nParX - 1) {
                  Particle b2 = Paricles[i][j + 1];
                  ressort.add(new Ressort(a1, b2, len, 1));
                  physics.addSpring(new Ressort(a1, b2, len, 1));
              }
          }
      }
  }
  void lockParticles() { //fixer les premières particules en position.
      Paricles[0][0].lock();
      Paricles[0][(int) nParX / 3].lock();
      Paricles[0][(int) nParX / 2].lock();
      Paricles[0][(int) nParX * 3 / 4].lock();
      Paricles[0][(int) nParX - 1].lock();
  }
  void create() {
      createParticles();
      createSprings();
      lockParticles();
  }
  void create_noise(float startXOff, float startYOff, float startZOff) { //ajouter une force de vent aléatoire à chaque particule du maillage
    float xoff = startXOff;
    float yoff, zoff;
    zoff = startZOff;
    for (int i = 0; i < grid.nParY; i++) {
        yoff = startYOff;
        for (int j = 0; j < grid.nParX; j++) {
            float windx = map(noise(xoff, yoff, zoff), 0, 1, 0, 3);
            float windz = map(noise(xoff + 500, yoff + 500, zoff), 0, 1, -2, 2);
            grid.Paricles[i][j].addForce(new Vec3D(windx, 0, windz));
            yoff += 0.1;
        }
        xoff += 0.1;
    }
    zoff += 0.1;
}
  void applyWindForce() { //appliquer la force du vent aux particules uniquement si la touche 'F' ou 'f' est enfoncée.
  float zoff = 0, xoff = 0;
  for (int i = 0; i < nParY; i++) {
    float yoff = 0;
    for (int j = 0; j < nParX; j++) {
      float windx = map(noise(xoff, yoff, zoff), 0, 1, 0, 3);
      float windz = map(noise(xoff + 500, yoff + 500, zoff), 0, 1, -2, 2);
      Vec3D windForce = new Vec3D(windx, 0, windz);
      if (keyFPressed) {
        Paricles[i][j].addForce(windForce);
      }
      yoff += 0.2;
    }
    xoff += 0.2;
    }
  zoff += 0.2;
  }
}
