
int shipSpeed = 6;
int ship2Speed = 6;
float ship1x;
float ship2x;
float ship1y;
float ship2y;
int score;
int ballSize = 20;
boolean fire = false;

boolean s1up, s2up, s1down, s2down;

//Initialise gameOver variable
int gameOver = 0;

//int startGame;
int getRandomX()


// int score;
{
  return int(random(600));
}

int[] ballx = { 
  getRandomX(), getRandomX(), getRandomX(), getRandomX(), getRandomX()
  };
int[] bally = { 
  0, 0, 0, 0, 0
};

void setup()
{


  size (749, 749);
  smooth ();
  ship1x = 15;
  ship2x = width-15; 
  ship1y = height/2;
  ship2y = height/2;
  rectMode(CENTER);
}

void draw()
{

  //Game Style
  shipMovement();
  fill(254, 254, 254, 75);
  rect(1, 1, height*2, width*2);

  triangle(20, ship1y-15, 20, ship1y+15, 40, ship1y);
  triangle(width-20, ship2y -15, width-20, ship2y+15, width -40, ship2y);
  
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


fill(255);
stroke (0);
triangle(mouseX-8, 480, mouseX+8, 480, mouseX, 565);
fill(0);
text(score, 20, 20);
if (fire)
{
  cannon(mouseX);
  fire = false;
}

ballFalling();
gameFinish();
}

//Play the game


void mousePressed()
{
  fire = true;
}

void ballFalling()
{ 
  stroke(39, 154, 240);
  fill (39, 154, 240);

  for (int i=0; i<5; i++)
  {
    ellipse(ballx[i], bally[i]++, ballSize, ballSize);
  }
}

void cannon(int shotX)
{
  boolean strike = false;
  for (int i = 0; i < 5; i++)
  {
    if ((shotX >= (ballx[i]-ballSize/2)) && (shotX <= (ballx[i]+ballSize/2))) {
      strike = true;
      line(mouseX, 565, mouseX, bally[i]);
      ellipse(ballx[i], bally[i], 
      ballSize+25, ballSize+25);
      ballx[i] = getRandomX();
      bally[i] = 0;


      // update score
      score++;
    }
  }

  if (strike == false)
  {
    line(mouseX, 565, mouseX, 0);
  }
}


//GameOver

void gameFinish()
{
  for (int i=0; i< 5; i++)
  {
    if (bally[i]==530)
    {


      fill(color(255, 0, 0));
      fill(255, 0, 0);
      textAlign(CENTER);
      text("GAME OVER", width/2, height/2);
      text("Well done! Your score was : "+ score, width/2, height/2 + 50);

      noLoop();
    }
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


