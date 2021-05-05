class DNA {
  PVector[] genes = new PVector[lifespan];
  float defaultMag = 0.2;
  
  DNA(boolean full) {
    if(!full) {
      for(int i = 0; i < lifespan; i++) {
        genes[i] = PVector.random2D();
        genes[i].setMag(defaultMag);
      }    
    }
  }
  
  
}
