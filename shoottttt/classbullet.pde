//TNKS to Tristian Brismontier

class Laser
{
  float pX;
  float pY;
  float taille;
  boolean tire;
  float speedy;
  boolean unedeux=true;
 
  Laser(float x_, float y_) //bullets for layer 1
  {
    pX=width/2; 
    pY=9*height/10;
    taille = 3;
    tire=false;
    speedy=-4.1; 
  
  }
 
  Laser() //bullets for player 2
  { 
    pX=width/2; 
    pY=9*height/10;
    taille = 3; 
    tire=false; 
    speedy=4.1;

  }
 
  void display()
  {
    
        strokeWeight(taille);
        stroke(255);
        line(pX,pY,pX,pY-5*taille);
      }
    
  
  void move()
  {
    if(tire==true)
    {
      pY=pY - speedy;
      if( pY < 0 || pY > height+5*taille )
      {
        pX=0;
        pY=0;
        tire=false;
      }
    }
  }
 
  void lancement(float x_)
  {
    if(tire==false)
    {
      tire=true;
      pX=x_;
      if(unedeux==true)
      {
         pY=9*height/10;
         unedeux=!unedeux;
      }
      else
      {
        pY=9*height/10-2;
        unedeux=!unedeux;
      }
       
    }
  } 
 
  void lancement(float x_,float y_)
  {
    if(tire==false)
    {
      tire=true;
      pX=x_;
      pY=y_;
       
      
    }
 
  }
}

