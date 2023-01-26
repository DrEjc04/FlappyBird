class Gumb
{
int x;
int y;
int sirina;
int visina;
Gumb(int x0, int y0, int sirina0, int visina0)
{
  x=x0;
  y=y0;
  sirina=sirina0;
  visina=visina0;
}



void display(String text)
{
  textSize(50);
  rectMode(CENTER);
  textAlign(CENTER);
  if(naGumbu())
  {
    if(naGumbu()&&text=="IGRAJ")
      fill(#F5500F, 100);
    else
      fill(#F5500F);
  }
  
  else
  {
    if(text=="IGRAJ")
      fill(#F5500F,0);
    else
      fill(#CEC8C8);
  }
  
  rect(x, y, sirina, visina);
  fill(0);
  text(text, x, y+14);
}

boolean klik()
{
  if(naGumbu() && mousePressed)
    return true;
  return false;
}

boolean naGumbu()  
{
  if (mouseX>x-sirina/2 && mouseX<x+sirina/2)//ja tu bi loh nrdu en if stawk samu sparam s procesorsko mocjo
  {
    if(mouseY>y-visina/2 && mouseY<y+visina/2)
      return true;
  }
return false;
  
}
}
