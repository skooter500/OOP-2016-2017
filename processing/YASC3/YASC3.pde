void setup()
{
  size(500, 500);
  Player player0 = new Player(width / 2, height / 2, 0, 50, 'w', 's', 'a', 'd', ' ');  
  Player player1 = new Player(100, 100, 0, 50, 'i', 'k', 'j', 'l', '\'');  
  gameObjects.add(player0);
  gameObjects.add(player1);
  
}

ArrayList<GameObject> gameObjects = new ArrayList<GameObject>();
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
  for (int i = gameObjects.size() -1 ; i >= 0  ; i --)
  {
    GameObject go = gameObjects.get(i); 
    go.update();
    go.render();    
  }
  
}