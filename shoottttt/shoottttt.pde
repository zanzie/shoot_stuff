//Space Invaders. Mischa vs Zanzie 


//Laser[] shoott = new Laser[3];
PVector shipDim = new PVector(21, 99);
int shipSpeed = 6;
int ship2Speed = 6;
float ship1x;
float ship2x;
float ship1y;
float ship2y;
//Laser lazer;
boolean Ti;
ArrayList bullets = new ArrayList();



boolean s1up, s2up, s1down, s2down;



void setup() {
  size(753, 753); //Just because Zanzie wants so
  background (1, 1, 1, 90);
Ti=false;
  ship1x = 15;
  ship2x = width-15; 
  ship1y = height/2;
  ship2y = height/2;
//  lazer = new Laser();
  rectMode(CENTER);
}

void draw() {
  shipMovement();
  //background (1,1,1,9);
  fill(254, 254, 254, 75);
  rect(1, 1, height*2, width*2);
  //draw ships, rects for now, to be replaced with shooting ship
  triangle(20, ship1y-15, 20, ship1y+15, 40, ship1y);
  //rect(21, ship1y, shipDim.x, shipDim.y );
  triangle(width-20, ship2y -15, width-20, ship2y+15, width -40, ship2y);
  //rect(width-21, ship2y, shipDim.x, shipDim.y);
  if (ship1y <= 0) {
    shipSpeed = 0;
    ship1y = 1;
  } else {
    shipSpeed = 6;
  }

  if (ship2y <= 0) {
    ship2Speed = 0;
    ship2y = 1;
  } else {
    ship2Speed = 6;
  }

  //upper boarder

  if (ship1y >= height) {
    shipSpeed = 0;
    ship1y = height-1;
  } else {
    shipSpeed = 6;
  }

  if (ship2y >= height) {
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
  if (key == 'x') {
    bullets.add(new Bullet(15, ship1y));
            canShoot = false;
            shootdelay = 0;
  }
 
            bullets.add(new Bullet(x, y));
            canShoot = false;
            shootdelay = 0;
        
  
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


class Bullet {
    int x, y;

    Bullet(int xpos, int ypos) {
        x = xpos + gridsize/2 - 4;
        y = ypos;
    }

    void draw() {
        rect(x, y, pixelsize, pixelsize);
        y -= pixelsize;
    }
}
