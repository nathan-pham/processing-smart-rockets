int lifespan = 1000;
int index = 0;

Rocket[] rockets = new Rocket[100];
Target target;
Wall wall;

void setup() {
  size(500, 500);
  background(255);
  
  for(int i = 0; i < rockets.length; i++) {
    rockets[i] = new Rocket(width / 2, height - 40);
  }
  
  int wallWidth = 150;
  int wallHeight = 10;
  
  wall = new Wall((width / 2) - (wallWidth / 2), (height / 2) - wallHeight - 20, wallWidth, wallHeight);
  target = new Target(width / 2, 40, 8);
}

void draw() {
  background(255);
  
  index += 1;
  
  if(index >= lifespan) {
    index = 0;
  }
  
  for(Rocket rocket : rockets) {
    rocket.boundary(wall, target);
    rocket.update();
    rocket.render();
  }
  
  target.render();
  wall.render();
}
