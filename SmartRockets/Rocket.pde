class Rocket {
  PVector pos;
  PVector vel = new PVector(0, 0);
  PVector acc = new PVector(random(-1, 1), random(-1, 1));
  
  int rocketWidth = 10;
  int rocketHeight = 20;
  int maxSpeed = 4;
  
  DNA dna = new DNA(false);
  
  boolean completed = false;
  boolean dead = false;
  float fitness = 0;
 
  Rocket(float startX, float startY) {
    pos = new PVector(startX, startY);
  }
  
  void setDNA(DNA embed) {
    dna = embed;
  }
  
  void boundary(Wall wall, Target target) {
    if(pos.x > width || pos.x < 0 || pos.y > height || pos.y < 0) {
      dead = true;
    }
    
    if(pos.x > wall.pos.x && pos.x < wall.pos.x + wall.wallWidth && pos.y > wall.pos.y && pos.y < wall.pos.y + wall.wallHeight) {
      dead = true;
    }
    
    if(dist(pos.x, pos.y, target.pos.x, target.pos.y) < target.radius) {
      completed = true;
      pos = target.pos;
    }
  }
  
  void update() {
    if(!dead && !completed) {
      acc.add(dna.genes[index]);
      
      vel.add(acc);
      pos.add(vel);
      acc.mult(0);
      
      vel.limit(maxSpeed);
    }
  }
  
  void render() {
    push();
    fill(0, 100);
    translate(pos.x, pos.y);
    rotate(vel.heading());
    rectMode(CENTER);
    rect(0, 0, rocketHeight, rocketWidth);
    pop();
  }
}
