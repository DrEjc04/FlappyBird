class Pravokotnik
{
  
  int y;
  int lokacijaX=500;
  int visina_s;
  int visina_z;
  int gap=100;
  int sirina=100;
  int tezavnost=1;
  
  void update()
  {
    lokacijaX=lokacijaX-tezavnost;
  }
  
  void display()
  {
    fill(#5DE56B);
    rectMode(CORNERS);
    imageMode(CORNERS);
    //zgornji
    //rect(lokacijaX,y,lokacijaX+sirina, 0);
    image(pillarDown, lokacijaX,y,lokacijaX+sirina, y-385);
    
    //spodnji
    //rect(lokacijaX, 500, lokacijaX+sirina, y+gap);
    image(pillarUp, lokacijaX, y+gap+385, lokacijaX+sirina, y+gap);
  }
  
  void genNew(int zamik)
  {
    y=(int)random(120,380);
    lokacijaX=500+zamik;
    visina_s=500-y;
    visina_z=y;
  }
  
  boolean outOfBounds()
  {
    if(lokacijaX+sirina<0)
      return true;
      
    return false;
  }
  
  void ponastaviPravokotnik(int zamik)
  {
    lokacijaX=500+zamik;
  }
  
  void tezavnost(int st)
  {
    tezavnost=st;
  }
}
