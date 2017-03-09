Particle []  parts  = new Particle[600];

void setup()
{
  size(600, 600);
  background((int)(Math.random()*255));

  for ( int i=0; i<parts.length-3; i++)
  {
    parts[i] = new NormalParticle();
   
  }
  
  parts[597]= new OddballParticle();
  parts[598]= new OddballParticle();
  parts[599]= new JumboParticle();
}

void draw()
{
  fill(0, 0, 0, 45);
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
   ellipse( (float)myX, (float)myY, size, size);

  }
  public void move(){
   myAngle+= .050;
    myX+= (Math.cos(myAngle))*mySpeed;
    myY+= (Math.sin(myAngle))*mySpeed;
    if (myX > 700 || myX < 0)
    {
      myX-=(Math.cos(myAngle))*mySpeed;
    } 
    if (myY > 6200 || myY < -20)
    {
      myY-=(Math.sin(myAngle))*mySpeed;
    } 
  }
}
class OddballParticle implements Particle 
{
 double myX, myY, myAngle, mySpeed;
  int clrRed, clrGreen, clrBlue;
  OddballParticle()
  {
    myX=Math.random()*600;
    myY=Math.random()*600;
    myAngle= Math.random()*TWO_PI;
    mySpeed= (Math.random()*5)+3;
    clrBlue= (int)(Math.random()*255);
  }

  void move()
  {
    myAngle+= .06;
    myX+= (Math.cos(myAngle))*mySpeed;
    myY+= (Math.sin(myAngle))*mySpeed;
    if (myX > 600 || myX < 0)
    {
      myX-=(Math.cos(myAngle))*mySpeed;
    } 
    if (myY > 600 || myY < 0)
    {
      myY-=(Math.sin(myAngle))*mySpeed;
    } 
  }
  void show()
  {
    fill(250, 250, clrBlue);
    rect((int)myX, (int)myY, 25, 25);
  }

}
class JumboParticle extends NormalParticle{
  JumboParticle(){
  size = 75;
  }
  public void show(){
     fill(clrRed, clrGreen, clrBlue);
   ellipse( (float)myX, (float)myY, size, size);
  }
 
}
