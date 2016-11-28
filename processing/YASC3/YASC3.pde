void setup()
{
  size(500, 500);
  player = new Player(width / 2, height / 2, 0, 50);  
}

Player player;
ArrayList<Bullet> bullets = new ArrayList<Bullet>();
boolean[] keys = new boolean[1000];

float timeDelta = 1.0f / 60.0f;

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
  
  for (int i = bullets.size() -1 ; i >= 0  ; i --)
  {
    Bullet b = bullets.get(i); 
    b.update();
    b.render();    
  }
  
}