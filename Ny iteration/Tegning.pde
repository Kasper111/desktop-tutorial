  class Tegning {
  PVector location;
  float posX,posY,pposX,pposY;
  float oldPosX,oldPosY;
  Bolde bolde;
  
Tegning() {
  location = new PVector(posX,posY);
  //bolde = new Bolde(50,50,50);
}

public Tegning(float pposX, float pposY, float posX, float posY) {
  this.posX = posX;
  this.posY = posY;
  this.pposX = pposX;
  this.pposY = pposY;
  
}
  

void update() {

  if (mousePressed) {
    tegninger.add(new Tegning(pmouseX, pmouseY, mouseX, mouseY));
    //bolde = new Bolde(mouseX, mouseY, 5); 
  }
}
}
