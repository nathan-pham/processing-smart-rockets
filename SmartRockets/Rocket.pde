class Rocket {
  PVector pos;
  PVector vel = new PVector(0, 0);
  PVector acc = new PVector(0, 0);

  int rocketWidth = 10;
  int rocketHeight = 20;
  int maxSpeed = 4;

  DNA dna = new DNA(true);

  boolean completed = false;
  boolean dead = false;
  float fitness;

  Rocket(float startX, float startY) {
    pos = new PVector(startX, startY);
  }

  float calculateFitness(Target target) {
    float _dist = abs(dist(pos.x, pos.y, target.pos.x, target.pos.y) - width);

    if (completed) {
      _dist *= 10;
    } else if (dead) {
      _dist /= 10;
    }

    fitness = _dist;
    return fitness;
  }

  void normalizeFitness(float max) {
    fitness /= max;
  }

  void boundary(Wall wall, Target target) {
    if (pos.x > width || pos.x < 0 || pos.y > height || pos.y < 0 || 
      (pos.x > wall.pos.x && pos.x < wall.pos.x + wall.wallWidth && pos.y > wall.pos.y && pos.y < wall.pos.y + wall.wallHeight)) {
      dead = true;
    }

    if (dist(pos.x, pos.y, target.pos.x, target.pos.y) < target.radius) {
      completed = true;
      pos = target.pos;
    }
  }

  void update() {
    if (!dead && !completed) {
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
