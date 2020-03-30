
ArrayList<Tegning> tegninger;
//Tegning[] tegning = new Tegning[50];

Tegning tegne;
Bolde bolde;

void setup () {
  fullScreen();
  tegninger = new ArrayList<Tegning>();
  tegne = new Tegning();
  bolde = new Bolde(30,40,5);
}
  
  
void draw () {
  background(255);
  tegne.update();
  if (keyPressed) {
  bolde.move();
  bolde.display();
  bolde.checkBorderCollision();
  }
  
  for (int i = 0; i < tegninger.size(); i++) {
   Tegning tegning = tegninger.get(i);
   
   bolde.checkStregCollision(tegning.posX, tegning.posY, tegning.pposX, tegning.pposY);
   //beginShape();
   //fill(255);
   line(tegning.pposX, tegning.pposY, tegning.posX, tegning.posY);
   //endShape();
  }
  
  textSize(20);
  fill(0, 102, 153, 51);
  text(frameRate, 20, 40);
  text(tegninger.size(), 25, 60);
  
}
