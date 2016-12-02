class Bullet extends GameObject // Gets everything from GameObject
{
  PVector pos;
  PVector forward;
  float theta;
  float size;
  float speed = 200;
  float timeToLive;
  float alive;
  
  Bullet(float x, float y, float theta, float size, float timeToLive)
  {
    pos = new PVector(x, y);
    forward = new PVector(0, 1);
    this.theta = theta;
    this.size = size;
    this.timeToLive = timeToLive;    
    this.alive = 0;
  }
  
  void render()
  {
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(theta);
    line(0, - size / 2, 0, size / 2);
    popMatrix();
  }
  
  void update() // Overrides the method in the base class
  {
    forward.x = sin(theta);
    forward.y = - cos(theta);
    
    pos.add(PVector.mult(PVector.mult(forward, speed), timeDelta));
    if (pos.x > width)
    {
      pos.x = 0;
    }
    if (pos.x < 0)
    {
      pos.x = width;
    }
    if (pos.y > height)
    {
      pos.y = 0;
    }
    if (pos.y < 0)
    {
      pos.y = height;
    }
    alive += timeDelta;
    if (alive > timeToLive)
    {
      gameObjects.remove(this);
    }
    
    for(int i = 0 ; i < gameObjects.size() ; i ++)
    {
      GameObject go = gameObjects.get(i);
      if (go instanceof Player)
      {
        Player p = (Player) go;
        if (dist(go.pos.x, go.pos.y, this.pos.x, this.pos.y) < p.radius)
        {
          p.health --;
          gameObjects.remove(this);
        }
      }
    }
  }  
}