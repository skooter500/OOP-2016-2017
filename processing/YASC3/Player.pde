class Player extends GameObject
{
  PVector velocity;
  PVector accel;
  float theta;
  
  float radius;
  float mass = 1;
  PShape shape;
  char up, down, left, right, fire;
  int health;
  
  
  // Make different keys control the ship!
  
  
  Player(float x, float y, float theta, float size, char up, char down, char left, char right, char fire)
  {
    println("In the player parameterised constructor");
    pos = new PVector(x, y);
    forward = new PVector(0, -1);
    accel = new PVector(0,0);
    velocity = new PVector(0,0);
    force = new PVector(0, 0);
    this.theta = theta;
    this.size = size;
    radius = size / 2;
    
    this.left = left;
    this.right = right;
    this.up = up;
    this.down = down;
    this.fire = fire;
    this.health = 10;
    create();
    
  }
  
  void create()
  {
    shape = createShape();
    shape.beginShape();
    shape.stroke(255);
    shape.noFill();
    shape.strokeWeight(2);
    shape.vertex(-radius, radius);
    shape.vertex(0, - radius);
    shape.vertex(radius, radius);
    shape.vertex(0, 0);
    shape.endShape(CLOSE);
  }
  
  void render() // Overrides the method in the base class
  {
    pushMatrix(); // Stores the current transform
    translate(pos.x, pos.y);
    text("Health: " + health, -20, -50);
    
    rotate(theta);    
    // Use lines
    /*
    line(x - radius, y + radius, x, y - radius);
    line(x, y - radius, x + radius, y + radius);
    line(x + radius, y + radius, x, y);
    line(x, y, x - radius, y + radius);
    */
    // Use beginShape
    /*
    beginShape();
    vertex(x - radius, y + radius);
    vertex(x, y - radius);
    vertex(x + radius, y + radius);
    vertex(x, y);
    vertex(x - radius, y + radius);    
    endShape();
    */
    // Use a PShape();
    shape(shape, 0, 0);
    popMatrix(); // Restore the transform
  }
  
  PVector force;
  float power = 100;
  
  float fireRate = 2;
  float toPass = 1.0 / fireRate;
  float elapsed = toPass;
  
  void update()
  {
      
    forward.x = sin(theta);
    forward.y  = -cos(theta);
    if (checkKey(up))
    {
      force.add(PVector.mult(forward, power));      
    }
    if (checkKey(down))
    {
      force.add(PVector.mult(forward, -power));      
    }
    if (checkKey(left))  
    {
      theta -= 0.1f;
    }
    if (checkKey(right))
    {
      theta += 0.1f;
    }
    
    if (checkKey(fire) && elapsed > toPass)
    {
      PVector bp = PVector.add(pos, PVector.mult(forward, 40));
      Bullet b = new Bullet(bp.x, bp.y, theta, 20, 5);
      gameObjects.add(b);
      elapsed = 0;
    }
    
    accel = PVector.div(force, mass);
    velocity.add(PVector.mult(accel, timeDelta));
    pos.add(PVector.mult(velocity, timeDelta));
    force.x = force.y = 0;
    velocity.mult(0.99f);
    elapsed += timeDelta;
  }
  
}