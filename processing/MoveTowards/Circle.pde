class Circle
{
  PVector pos;
  PVector forward;
  float speed;
  color c;
  
  Circle()
  {
    respawn();
  }
  
  void respawn()
  {
    pos = new PVector(-50, random(0, height));
    c = color(random(200, 255), random(200, 255), random(200, 255));
    speed = random(1, 5);
  }
  
  void update()
  {
    PVector player = new PVector(mouseX, mouseY);
    forward = PVector.sub(player, pos);
    forward.normalize();
    pos.add(PVector.mult(forward, speed));
    if (dist(mouseX, mouseY, pos.x, pos.y) < 10)
    {
      respawn();
    }
  }
  
  void render()
  {
    noStroke();
    fill(c);
    ellipse(pos.x, pos.y, 20, 20);
  }  
}