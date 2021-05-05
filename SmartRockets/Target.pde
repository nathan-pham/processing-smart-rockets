class Target {
  PVector pos;
  float radius;
  
  Target(float startX, float startY, float _radius) {
    pos = new PVector(startX, startY);
    radius = _radius;
  } 
  
  void render() {
    fill(0);
    ellipse(pos.x, pos.y, radius, radius);
  }
}
