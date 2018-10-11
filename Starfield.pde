double myCos = 0;
double mySin = 0;

Particle []  parts  = new Particle[600];

void setup()
{
  size(600, 600);
  background(0);

  for ( int i=1; i<parts.length-2; i++)
  {
    parts[i] = new NormalParticle();
   
  }
  
  parts[598]= new OddballParticle();
  parts[599]= new OddballParticle();
  parts[0]= new JumboParticle();
}

void draw()
{
  frameRate(10);
  fill(0);
  rect(-1, -1, 601, 601);
  for ( int i=0; i<parts.length; i++)
  {
    parts[i].move();
    parts[i].show();
  }
}
interface Particle
{
  public void show();
  public void move();
  
}
class NormalParticle implements Particle
{
  double myX, myY, myAngle, mySpeed;
  int clrRed, clrGreen, clrBlue, size;
  NormalParticle()
  {
    myX=300;
    myY=300;
    myAngle = Math.random()*TWO_PI;
    mySpeed= Math.random()*10;
    clrRed= (int)(Math.random()*255);
    clrGreen= (int)(Math.random()*255);
    clrBlue= (int)(Math.random()*255);
    size=15;
  }
   public void show(){
   fill(clrRed, clrGreen, clrBlue);
   ellipse( (float)myX,(float)myY, size, size);

  }
  public void move(){
   myAngle+= .050;
   myCos = (Math.cos(myAngle))*mySpeed;
   mySin = (Math.sin(myAngle))*mySpeed;
    myX+= myCos;
    myY+= mySin;
    if (myX > 700 || myX < 0)
    {
      myX-=myCos;
    } 
    if (myY > 600 || myY < -20)
    {
      myY-=mySin;
    } 
  }
}
class OddballParticle implements Particle 
{
 double myX, myY, myAngle, mySpeed;
  int clrRed, clrGreen, clrBlue;
  OddballParticle()
  {
    myX = 0;
    myY = 0;
    myAngle= Math.random()*TWO_PI;
    mySpeed= (Math.random()*5)+3;
  }

  void move()
  {
    myAngle+= .06;
    myX = myX + (int)(Math.random()*(mouseX - myX)/10);
    myY = myY + (int)(Math.random()*(mouseY - myY)/10); 
  }
  void show()
  {
    fill(0, 0, 100);
    rect((int)myX, (int)myY, 25, 25);
  }

}
class JumboParticle extends NormalParticle{
  JumboParticle(){
  size = 105;
  }
  public void show(){
     fill(clrRed, clrGreen, clrBlue);
   ellipse( (float)myX, (float)myY, size, size);
  }
 
}
