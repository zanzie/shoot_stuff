//Space Invaders. Mischa vs Zanzie 
PVector shipDim = new PVector(21, 99);
int shipSpeed = 20;

int ship1x;
int ship2x;
int ship1y;
int ship2y;

boolean s1up, s2up, s1down, s2down;



void setup() {
  size(753, 753); //Just because Zanzie wants so
  background (1);

  ship1x = 15;
  ship2x = width-15; 
  ship1y = height/2;
  ship2y = height/2;

  rectMode(CENTER);
}

void draw() {
  shipMovement();

  //draw ships, rects for now, to be replaced with shooting ship
  rect(20, ship1y, shipDim.x, shipDim.y );
  rect(width-20, ship2y, shipDim.x, shipDim.y);
}

void shipMovement() {
  if (s1up) ship1y -= shipSpeed;
  if (s1down) ship1y += shipSpeed;
  if (s2up) ship2y -= shipSpeed;
  if (s2down) ship2y += shipSpeed;
}

