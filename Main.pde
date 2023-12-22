
int currentIndex = 0; // Indice de l'image actuelle
PImage[] drap = new PImage[5]; // Tableau pour stocker plusieurs images
Grid grid=new Grid() ;
boolean keyPressedFlag = false;
import peasy.*;
boolean keyFPressed = false; 
void setup() {
  fullScreen(P3D);
  smooth();  
  //Chargement des images dans un tableau drap 
  drap[0] = loadImage("FRANCE.jpg");
  drap[1] = loadImage("CANADA.jpg");
  drap[2] = loadImage("RWANDA.jpg");
  drap[3] = loadImage("TUNISIE.jpg");
  drap[4] = loadImage("MAROC.jpg");
  grid.init();
  grid.create();  
  PeasyCam cam = new PeasyCam(this, 500); //PeasyCam pour la visualisation 3D
  cam.setMinimumDistance(20); 
  cam.setMaximumDistance(1000);
}
void draw( ) { //faire la mise à jour du maillage et  et  éoliennes sur le maillage, puis .
  background(0);
  grid.physics.update(); 
  grid.create_noise(0.0,0.0,0.0); //génèrer du bruit
  grid.applyWindForce(); //appliquer des forces
  noFill();
  strokeWeight(1);
  noStroke();
  textureMode(NORMAL);
 for (int j = 0; j < grid.nParX - 1; j++) {
    beginShape(TRIANGLE_STRIP);
    texture(drap[currentIndex]); //afficher la texture de l'image x , vous pouvez changer l'image en appuyant sur c ou C 
    for (int i = 0; i < grid.nParY; i++) {
        float u = map(i, 0, grid.nParY - 1, 0, 1);
        float v = map(j, 0, grid.nParX - 1, 0, 1);
        int nextJ = j + 1; // stocker la prochaine valeur de j+1
        if (nextJ >= grid.nParX) {
            nextJ = grid.nParX - 1;
        }
        v = map(nextJ, 0, grid.nParX - 1, 0, 1);
        vertex(grid.Paricles[i][j].x, grid.Paricles[i][j].y, grid.Paricles[i][j].z, u, v);
        vertex(grid.Paricles[i][nextJ].x, grid.Paricles[i][nextJ].y, grid.Paricles[i][nextJ].z, u, v);
    }
    endShape(CLOSE);
}
}
void keyPressed() {
  // Appliquer des forces en appuyant sur f ou F
  if (key == 'f' || key == 'F') {
    keyFPressed = true;
  }
  if (key == 'c' || key == 'C') {
    // Changer la texture lors l'appui sur la touche 'c' ou 'C'
    currentIndex = (currentIndex + 1) % drap.length;
    keyPressedFlag = true;
  }
}
void keyReleased() {
  if (key == 'f' || key == 'F') {
    keyFPressed = false;
  }
   if (key == 'c' || key == 'C') {
    keyPressedFlag = false;
  }
}
