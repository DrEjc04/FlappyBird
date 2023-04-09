Zoga zoga=new Zoga();
Pravokotnik[] prav=new Pravokotnik[2];
Score sc=new Score();
Rekord rk=new Rekord();
Gumb1 restart=new Gumb1(250,250,200,80);
Gumb1 menu=new Gumb1(250,150,200,80);
Gumb1 t1=new Gumb1(180, 300, 60,60);
Gumb1 t2=new Gumb1(250, 300, 60,60);
Gumb1 t3=new Gumb1(320, 300, 60,60);
Gumb1 nazaj=new Gumb1(250,400,200,80);
Gumb1 igraj=new Gumb1(250,250,300,150);
PImage bird;
PImage pillarDown;
PImage pillarUp;
PImage logo;
int screen;
boolean spremTez=false;
int tezavnost=1;

void setup()
{
  size(500,500);
  background(0);
  noStroke();
  smooth();
  for(int k=0;k<prav.length;k++)
  {
    prav[k]=new Pravokotnik();
    prav[k].genNew(k*300);
  }
  bird=loadImage("bird2.png");
  pillarDown=loadImage("pillarUp.png");
  pillarUp=loadImage("pillarDown.png");
  logo=loadImage("logo.png");
  screen=3;
  //0 je igrca screen
  //1 je kill screen
  //2 je settings
  //3 je start screen
  ponastavi(); //first time setup
  rk.naloziRekord();
}


void draw()
{
  switch(screen)
  {
    case 0://igrca
    {
      background(#7AEAF7);
      update();
      display();
      sc.display();
      if(keyPressed)
      {  
        if(zoga.hitrost.y>2)
        {
          zoga.jump();
        }
      } 
      logo();
      regenPravokotnik();
      if(!alive())
      {
        rk.zapisiRekord();
        //print("poklicalo metodo");
      }
        
      alive();
    }
    break;
    
    case 1://death screen
    {
      background(#7AEAF7);
      display();
      logo(); //eno lepo interaktivno ozadje
      
      
      restart.display("RESTART");
      menu.display("MENU");
      
      //if(rk.getRekord()>sc.tocke)
      //{//v primeru če je rekord polomljen
      //  rk.setRekord(sc.tocke);
      //  rk.zapisiRekord();
      //}
        
        
      rk.display(); //rekord
      sc.display();
      
      if(restart.klik())
      {
        screen=0;
        ponastavi();
      }
      if(menu.klik())
      {
        screen=2;
      }
    }
    break;
    
    case 2://menu
    {

      background(#7AEAF7);
      display();
      logo(); //eno lepo interaktivno ozadje
      
      
      t1.display("1");
      t2.display("2");
      t3.display("3");
      nazaj.display("NAZAJ");
      textAlign(CENTER);
      text("Težavnost: "+tezavnost,250, 150);
      
      if(nazaj.klik())
        screen=1;
        
      if(t1.klik())
      {
        spremTez=true;
        tezavnost=1;
      }
      if(t2.klik())
      {
        spremTez=true;
        tezavnost=2;
      }  
      if(t3.klik())
      {
        spremTez=true;
        tezavnost=3;
      }
      
      if(spremTez)
      {
        for(int k=0;k<prav.length;k++)
          prav[k].tezavnost(tezavnost);
        spremTez=false;  
      }
      
    }
    break;
    
    case 3://zacetni zaslon
    {
      background(#7AEAF7);
      //animacija v ozadju
      animacija();
      igraj.display("IGRAJ");
      if(igraj.klik())
        screen=0;
    }
    break;
  }
    
  
}


void update()
{
  zoga.update();
  for(int k=0;k<prav.length;k++)
    prav[k].update();
}


void display()
{
  zoga.display();
  for(int k=0;k<prav.length;k++)
    prav[k].display();
  //sc.display();
}

void regenPravokotnik()
{
for(int k=0;k<prav.length;k++)
  {
    if(prav[k].outOfBounds())
    {
       prav[k].genNew(0);
       sc.tocke++;
    }
  }
  
  if(sc.tocke>rk.rekord)
    rk.setRekord(sc.tocke);
}

boolean alive()
{
  if(zoga.outOfBounds())
  {
    screen=1;
    return false;
  }
    
  for(int k=0;k<prav.length;k++)
    {
      //ce je ptic med stebroma po x osi
      if(zoga.lokacija.x>prav[k].lokacijaX && zoga.lokacija.x<prav[k].lokacijaX+100) 
      {
        //ce je ptic med stebroma po y osi
        if(zoga.lokacija.y<prav[k].y || zoga.lokacija.y>prav[k].y+100)
          {//ja tu bi loh nrdu en if stawk samu sparam s procesorsko mocjo
            screen=1;
            return false;
          }
      }
    }
  return true;
}

void logo()
{
  imageMode(CENTER);
  image(logo, width/2, 30, 120,50);
}

void ponastavi()
{
  zoga.ponastaviZogo(-2.5,100,250);
  for(int k=0;k<prav.length;k++)
  {
    prav[k].ponastaviPravokotnik(k*300);
  }
  
  sc.resetTocke();
}

void animacija()
{
  logo();
  zoga.update();
  zoga.display();
  
  if(zoga.lokacija.y>350)
    zoga.jump();
}
