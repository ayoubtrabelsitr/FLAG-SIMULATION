//A faire 
//Ajouter mouvement avec souris      +++++++++++++++++++++++++++ FAAAAIT 
//Ajouter force d'aire avec boutton du clavier 
//Ajuster taille fenetre 
 /* 
 Référence :  
 https://natureofcode.com/book/chapter-5-physics-libraries/#chapter05_section16 
 https://www.youtube.com/watch?v=JunJzIe0hEo  
 https://www.youtube.com/watch?v=hSU19ICZVk4&list=PLRqwX-V7Uu6aiaU4s30tXvUmwGMlb9UUS&index=4
*/
PImage flag;
Grid grid=new Grid() ;
import peasy.*;
void setup() {
  size(800, 800, P3D);  
  smooth();  
  flag = loadImage("x.jpg");
  grid.init();
  grid.create();  
  PeasyCam cam = new PeasyCam(this, 500); // Créer une nouvelle instance de PeasyCam
  cam.setMinimumDistance(20); // Définir la distance minimale de la caméra par rapport à l'origine
  cam.setMaximumDistance(1000); // Définir la distance maximale de la caméra par rapport à l'origine
}

void draw( ) {
  background(0);
  grid.physics.update();
  grid.create_noise() ;
  noFill();
  strokeWeight(1);
  noStroke();
  textureMode(NORMAL);
 for (int j = 0; j < grid.numParticlesX-1; j++) 
 {
    beginShape(TRIANGLE_STRIP);
    texture(flag);
    for (int i = 0; i < grid.numParticlesY; i++) 
    {
        float u = map(i, 0, grid.numParticlesY-1, 0, 1);
        float v = map(j, 0, grid.numParticlesX-1, 0, 1);
        vertex(grid.Blanket[i][j].x, grid.Blanket[i][j].y,  grid.Blanket[i][j].z, u, v);
        v = map(j+1, 0, grid.numParticlesX, 0, 1);
        vertex (grid.Blanket[i][j+1].x, grid.Blanket[i][j+1].y , grid.Blanket[i][j+1].z, u, v);
    }
    endShape(CLOSE);
  }
}
