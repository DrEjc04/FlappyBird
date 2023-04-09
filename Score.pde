class Score
{
  int tocke;
  Score()
  {
    tocke=0;
  }
  
  void display()
  {
    fill(0);
    textSize(50);
    text(tocke+"", 20,40);
  }
  
  void resetTocke()
  {
    tocke=0;
  }
  
  int getTocke()
  {
    return tocke;
  }
}
