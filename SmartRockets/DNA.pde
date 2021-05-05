class DNA {
  PVector[] genes = new PVector[lifespan];
  float mutationFactor = 0.01;
  float defaultMag = 0.2;
  
  DNA(boolean full) {
    if(!full) {
      for(int i = 0; i < lifespan; i++) {
        genes[i] = PVector.random2D();
        genes[i].setMag(defaultMag);
      }    
    }
  }
  
  DNA crossover(DNA partner) {
    DNA child = new DNA(true);
    
    int middle = floor(random(genes.length));
    
    for(int i = 0; i < genes.length; i++) {
      child.genes[i] = i > middle ? genes[i] : partner.genes[i];
    }
    
    return child;
  }
  
  void mutation() {
    for(int i = 0; i < genes.length; i++) {
      if(random(0, 1) < mutationFactor) {
        genes[i] = PVector.random2D();
        genes[i].setMag(defaultMag);
      }
    }
  }
}
