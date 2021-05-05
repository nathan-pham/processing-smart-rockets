int lifespan = 1000;
int index = 0;

Rocket[] rockets = new Rocket[100];
Wall[] walls = new Wall[2];


void setup() {
  size(500, 500);
  background(255);
  
  for(int i = 0; i < rockets.length; i++) {
    rockets[i] = new Rocket(width / 2, height - 40);
  }

}

void draw() {
  background(255);
  
  index += 1;
  
  if(index >= lifespan) {
    index = 0;
  }
  
  for(Rocket rocket : rockets) {
    rocket.boundary();
    rocket.update();
    rocket.render();
  }
}
