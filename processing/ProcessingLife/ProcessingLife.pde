LifeBoard lifeBoard;

void setup()
{
  size(600, 600);
  
  lifeBoard = new LifeBoard();
  lifeBoard.setup();
  lifeBoard.randomise();
  lifeBoard.paused = true;
  
}

void draw()
{
  background(255, 255, 255);
  
  if (mousePressed)
  {
    PVector cell = lifeBoard.screenToCell(mouseX, mouseY);
    lifeBoard.on((int) cell.x, (int) cell.y);
  }
  
  lifeBoard.update();
  lifeBoard.draw(); 
}


void keyPressed()
{
  
  PVector cell = lifeBoard.screenToCell(mouseX, mouseY);
    
  if (keyCode == ' ')
  {
    lifeBoard.paused = ! lifeBoard.paused;
  }
  
  if (keyCode == '1')
  {
    lifeBoard.makeGosperGun((int) cell.x, (int) cell.y);
  }
  
  if (keyCode == '2')
  {
    lifeBoard.makeLightWeightSpaceShip((int) cell.x, (int) cell.y);
  }
  
  if (keyCode == '3')
  {
    lifeBoard.makeTumbler((int) cell.x, (int) cell.y);
  }
  
  if (keyCode == '4')
  {
    lifeBoard.makeGlider((int) cell.x, (int) cell.y);
  }
  
  if (keyCode == 'R')
  {
      
      lifeBoard.randomise();
  }
  
  if (keyCode == 'C')
  {
      
      lifeBoard.clear();
  }
}
  

  
