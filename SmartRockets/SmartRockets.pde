int lifespan = 400;
int generation = 0;
int count = 100;
int index = 0;

Population population;
Target target;
Wall wall;

void setup() {
  size(500, 500);
  background(255);
  
  int wallWidth = 150;
  int wallHeight = 10;
  
  wall = new Wall((width / 2) - (wallWidth / 2), (height / 2) - wallHeight - 20, wallWidth, wallHeight);
  target = new Target(width / 2, 40, 8);
  population = new Population();
}

void draw() {
  background(255);
  
  index += 1;
  
  if(index >= lifespan) {
    index = 0;
    generation += 1;
    
    ArrayList<Rocket> pool = population.calculateFitness(target);
    population.breedRockets(pool);
  }
  
  population.core(wall, target);
  target.render();
  wall.render();
  
  fill(0);
  textSize(12);
  text(String.format("time: %s", index), 10, 10);
  text(String.format("generation: %s", generation), 10, 22);
}
