class Wall {
  PVector pos;
  float wallWidth;
  float wallHeight;
  
  Wall(float startX, float startY, float _width, float _height) {
    pos = new PVector(startX, startY);
    
    wallWidth = _width;
    wallHeight = _height;
  }
  
  void render() {
    fill(0);
    rect(pos.x, pos.y, wallWidth, wallHeight);
  }
}
