class Population {
  Rocket[] rockets = new Rocket[count];
  
  float startX = width / 2;
  float startY = height - 40;
  
  Population() {
    for(int i = 0; i < rockets.length; i++) {
      rockets[i] = new Rocket(startX, startY);
    }
  }

  void core(Wall wall, Target target) {
   for(Rocket rocket : rockets) {
     rocket.boundary(wall, target);
     rocket.update();
     rocket.render();
   }
  }
  
  ArrayList<Rocket> calculateFitness(Target target) {
    float max = 0;
    ArrayList<Rocket> pool = new ArrayList<Rocket>();
    
    for(Rocket rocket : rockets) {
      max += rocket.calculateFitness(target);
    }
    
    for(Rocket rocket : rockets) {
      rocket.normalizeFitness(max);
      for(int i = 0; i < rocket.fitness * 100; i++) {
        pool.add(rocket); 
      }
    }
    
    return pool;
  }
  
  Rocket selectRocket(ArrayList<Rocket> pool) {
    return pool.get(floor(random(0, pool.size())));
  }
  
  void breedRockets(ArrayList<Rocket> pool) {
    Rocket[] rocketCache = new Rocket[count];
    
    for(int i = 0; i < rockets.length; i++) {
      Rocket parentA = selectRocket(pool);
      Rocket parentB = selectRocket(pool);
      
      Rocket child = new Rocket(startX, startY);
      child.dna = parentA.dna.crossover(parentB.dna);
      child.dna.mutate();
      
      rocketCache[i] = child;
    }
    
    rockets = rocketCache;
  }
}
