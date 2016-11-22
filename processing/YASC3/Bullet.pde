class Bullet
{
  PVector pos;
  PVector forward;
  float theta;
  float size;
  float speed = 50;
  float timeToLive;
  float alive;
  
  Bullet(float x, float y, float theta, float size, float timeToLive)
  {
    pos = new PVector(x, y);
    forward = new PVector(0, 1);
    this.theta = theta;
    this.size = size;
    this.timeToLive = timeToLive;    
  }
  
  void render()
  {
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(theta);
    line(0, - size / 2, 0, size / 2);
    popMatrix();
  }
  
  void update()
  {
    forward.x = sin(theta);
    forward.y = - cos(theta);
    pos.add(PVector.mult(PVector.mult(forward, speed), timeDelta));
  }
  
}