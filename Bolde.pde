class Bolde {

  PVector position;
  PVector velocity;
  float r;
  PVector gravity = new PVector(0, 0.5);
  float damping = 0.8;

  Bolde(float x, float y, float rs) {
    position = new PVector(x, y);
    velocity = new PVector(0.5, 0);
    r = rs;
  }

  void move() {

    velocity.add(gravity);
    position.add(velocity);
  }

  void display() {

    fill(0);
    ellipse(position.x, position.y, r*2, r*2);
  }
  

  void checkBorderCollision() {
    if (position.x > width-r) {
      position.x = width-r;
      velocity.x *= -damping;
    } 
    else if (position.x < r) {
      position.x = r;
      velocity.x *= -damping;
    }
  }

  void checkStregCollision(float posx, float posy, float ppx, float ppy) {

    
    float deltaX = position.x - (posx+ppx)/2;
    float deltaY = position.y - (posy+ppy)/2;

    
    float cosine = cos(atan2((ppy-posy), (ppx-posx)));
    float sine = sin(atan2((ppy-posy), (ppy-posx)));

    
    float stregCollisionVinkelX = cosine * deltaX + sine * deltaY;
    float stregCollisionVinkelY= cosine * deltaY - sine * deltaX;
    float velocityX = cosine * velocity.x + sine * velocity.y;
    float velocityY = cosine * velocity.y - sine * velocity.x;
    
    //println("" + stregCollisionVinkelX);
    println("" + r);
    println("" + position.x,position.y);

    
    if (stregCollisionVinkelY > -r &&
      position.x > posx ||
      position.x < ppx) {
      
      stregCollisionVinkelY *= -r;
      
      velocityY *= -1.0;
      velocityY *= damping;
      println("ageaeg");
    }

    
    deltaX = cosine * stregCollisionVinkelX - sine * stregCollisionVinkelY;
    deltaY = cosine * stregCollisionVinkelY + sine * stregCollisionVinkelX;
    velocity.x = cosine * velocityX - sine * velocityY;
    velocity.y = cosine * velocityY + sine * velocityX;
    stregCollisionVinkelX = cosine * deltaX + sine * deltaY;
    stregCollisionVinkelY= cosine * deltaY - sine * deltaX;
    //position.x = (posx+ppx)/2 + deltaX;
    //position.y = (posy+ppy)/2 + deltaY;
    //println("" + cosine + sine);
  }
}
