//Space Invaders. Mischa vs Zanzie 
PVector shipDim = new PVector(21, 99);
int shipSpeed = 6;
int ship2Speed = 6;

float ship1x;
float ship2x;
float ship1y;
float ship2y;



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
  background(1);

  //draw ships, rects for now, to be replaced with shooting ship
  
   triangle(20, ship1y-15, 20,ship1y+15 , 40, ship1y);
  //rect(20, ship1y, shipDim.x, shipDim.y );
  triangle(width-20,ship2y -15, width-20,ship2y+15 , width -40, ship2y);
  //rect(width-20, ship2y, shipDim.x, shipDim.y);
 
 
 //upper boarder 
  if (ship1y <= 0){
  shipSpeed = 0;
  ship1y = 1;
  } else {
    shipSpeed = 6;
}

if (ship2y <= 0){
  ship2Speed = 0;
  ship2y = 1;
  } else {
    ship2Speed = 6;
}

//upper boarder

  if (ship1y >= height){
  shipSpeed = 0;
  ship1y = height-1;
  } else {
    shipSpeed = 6;
}

if (ship2y >= height){
  ship2Speed = 0;
  ship2y = height-1;
  } else {
    ship2Speed = 6;
}



}
void shipMovement() {
  if (s1up) ship1y -= shipSpeed;
  if (s1down) ship1y += shipSpeed;
  if (s2up) ship2y -= ship2Speed;
  if (s2down) ship2y += ship2Speed;
 
}

void keyPressed () {
  //left ship
  if (key == 'a') {
    s1up = true;
    s1down = false;
  }
  if (key == 'z') {
    s1up = false;
    s1down = true;
  }

  //right ship
  if (key == 'k') {
    s2up = true;
    s2down = false;
  }
  if (key =='m') {
    s2up = false;
    s2down = true;
  }
}

void keyReleased() {
  if (key == 'a') {
    s1up = false;
  }
  if (key == 'z') {
    s1down = false;
  }
  if (key == 'k') {
    s2up = false;
  }
  if (key =='m') {
    s2down = false;
  }
}



