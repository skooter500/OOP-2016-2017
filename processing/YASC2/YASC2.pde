void setup()
{
  size(500, 500);
  player = new Player(width / 2, height / 2, 0, 50);
  player1 = new Player(50, 50, 0, 50);
}

Player player;
Player player1;
boolean[] keys = new boolean[1000];

void keyPressed()
{ 
  keys[keyCode] = true;
}
 
void keyReleased()
{
  keys[keyCode] = false; 
}

boolean checkKey(int k)
{
  if (keys.length >= k) 
  {
    return keys[k] || keys[Character.toUpperCase(k)];  
  }
  return false;
}

void draw()
{
  background(0);
  stroke(255);
  player.update();
  player.render();
  
  player1.update();
  player1.render();
}