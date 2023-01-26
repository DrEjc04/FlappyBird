class Zoga
{
  PVector hitrost;
  PVector lokacija;
  PVector gravitacija;
  PVector skok;
  
  Zoga()
  {
  hitrost=new PVector(0,-2.5);
  lokacija=new PVector(100, 250);
  gravitacija=new PVector(0,0.25);
  
  }
  
  void ponastaviZogo(float hy, int lx, int ly)
  {
    hitrost.y=hy;
    lokacija.x=lx;
    lokacija.y=ly;
  }
  
  void update()
  {
    hitrost.add(gravitacija);
    lokacija.add(hitrost);
  }
  
  void jump()
  {
    hitrost.y=-5;
  }
  
  void display()
  {
    fill(#E5E55D);
    //ellipse(lokacija.x, lokacija.y, 30,20);
    imageMode(CENTER);
    image(bird, lokacija.x, lokacija.y, 30, 20);
  }
  
  boolean outOfBounds()
  {
    if(lokacija.y>500 || lokacija.y<0)
      return true;
      
    return false;
  }
}
