class Rekord
{
  String [] tabelaRekordov;
  int rekord;
  int trenutneTocke;
  
  Rekord()
  {
    tabelaRekordov=new String[1];
    rekord=0;
  }
  
  void display()
  {
    fill(0);
    textMode(CENTER); 
    textSize(50);
    text("Rekord: "+rekord, 250,100);
  }
   
  void naloziRekord()
  {
    try
    {
      tabelaRekordov[0]=loadStrings("rekordi.txt")[loadStrings("rekordi.txt").length-1];
      rekord=Integer.parseInt(tabelaRekordov[0]);
    } 
    catch(Exception x){
      tabelaRekordov[0]="0";
      rekord=0;
    }
    
  }
  
  void setRekord(int r)
  {
    rekord=r;
    tabelaRekordov[0]=r+"";
  }
  
  int getRekord()
  {
    return rekord;
  }
  
  void zapisiRekord()
  {
    saveStrings("rekordi.txt",tabelaRekordov);
    //print("shranilo nov rekord");
  }
}
