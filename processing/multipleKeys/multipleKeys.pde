void setup()
{
  size(500, 500);
}

boolean[] keys = new boolean[1000];

void draw()
{
  // You can prress up and down at the same time!!
  if (checkKey(UP))
  {
    print("UP Pressed!! ");
  }
  if (checkKey(DOWN))
  {
    print("DOWN Pressed!!");
  }
  println();
}

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