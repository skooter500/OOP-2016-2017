class Line
{
  PVector pos;
  PVector forward;
  float speed;
  color c;
  float theta = 0;
  
  Line()
  {
    respawn();
  }
  
  void respawn()
  {
    pos = new PVector(width + 50, random(0, height));
    c = color(random(200, 255), random(200, 255), random(200, 255));
    speed = random(1, 5);
  }
  
  void update()
  {
    PVector player = new PVector(mouseX, mouseY);
    
    theta = atan2(player.y - pos.y, player.x - pos.x) + HALF_PI;
    forward = new PVector(sin(theta), -cos(theta));    
    forward.normalize();
    pos.add(PVector.mult(forward, speed));
    if (dist(mouseX, mouseY, pos.x, pos.y) < 10)
    {
      respawn();
    }
  }
  
  void render()
  {
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(theta);
    stroke(c);
    line(0, -10, 0, 10);
    popMatrix();
  }
  
}