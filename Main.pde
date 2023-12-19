//Référence :  
// https://natureofcode.com/book/chapter-5-physics-libraries/#chapter05_section16 
 //https://www.youtube.com/watch?v=JunJzIe0hEo  
 //https://www.youtube.com/watch?v=hSU19ICZVk4&list=PLRqwX-V7Uu6aiaU4s30tXvUmwGMlb9UUS&index=4
//*/
PImage drap;
Grid grid=new Grid() ;
import peasy.*;
boolean keyFPressed = false; 
void setup() {
  fullScreen(P3D);
  smooth();  
  drap = loadImage("x.jpg");
  grid.init();
  grid.create();  
  PeasyCam cam = new PeasyCam(this, 500); 
  cam.setMinimumDistance(20); 
  cam.setMaximumDistance(1000);
}

void draw( ) {
  background(0);
  grid.physics.update();
  grid.create_noise() ;
  grid.applyWindForce();
  noFill();
  strokeWeight(1);
  noStroke();
  textureMode(NORMAL);
 for (int j = 0; j < grid.numParticlesX-1; j++) 
 {
    beginShape(TRIANGLE_STRIP);
    texture(drap);
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
void keyPressed() {
  if (key == 'f' || key == 'F') {
    keyFPressed = true;
  }
}
void keyReleased() {
  if (key == 'f' || key == 'F') {
    keyFPressed = false;
  }
}
