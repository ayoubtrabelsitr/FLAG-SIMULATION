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
  drap = loadImage("FLAG.jpg");
  grid.init();
  grid.create();  
  PeasyCam cam = new PeasyCam(this, 500); 
  cam.setMinimumDistance(20); 
  cam.setMaximumDistance(1000);
}
void draw( ) {
  background(0);
  grid.physics.update();
  grid.create_noise(0.0,0.0,0.0);
  grid.applyWindForce();
  noFill();
  strokeWeight(1);
  noStroke();
  textureMode(NORMAL);
 for (int j = 0; j < grid.nParX - 1; j++) {
    beginShape(TRIANGLE_STRIP);
    texture(drap);
    for (int i = 0; i < grid.nParY; i++) {
        float u = map(i, 0, grid.nParY - 1, 0, 1);
        float v = map(j, 0, grid.nParX - 1, 0, 1);
        int nextJ = j + 1; // Stocker la prochaine valeur de j+1
        if (nextJ >= grid.nParX) {
            nextJ = grid.nParX - 1;
        }
        v = map(nextJ, 0, grid.nParX - 1, 0, 1);
        vertex(grid.Blanket[i][j].x, grid.Blanket[i][j].y, grid.Blanket[i][j].z, u, v);
        vertex(grid.Blanket[i][nextJ].x, grid.Blanket[i][nextJ].y, grid.Blanket[i][nextJ].z, u, v);
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
