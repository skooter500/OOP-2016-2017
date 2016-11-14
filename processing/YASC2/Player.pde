class Player
{
  PVector pos;
  PVector forward;
  float theta;
  float size;
  float radius;
  
  PShape shape;
  
  Player(float x, float y, float theta, float size)
  {
    pos = new PVector(x, y);
    forward = new PVector(0, -1);
    this.theta = theta;
    this.size = size;
    radius = size / 2;
    
    create();
    
  }
  
  void create()
  {
    shape = createShape();
    shape.beginShape();
    shape.stroke(255);
    shape.noFill();
    shape.strokeWeight(10);
    shape.vertex(-radius, radius);
    shape.vertex(0, - radius);
    shape.vertex(radius, radius);
    shape.vertex(0, 0);
    shape.endShape(CLOSE);
  }
  
  void render()
  {
    pushMatrix(); // Stores the current transform
    translate(pos.x, pos.y);
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
  
  void update()
  {
    forward.x = sin(theta);
    forward.y  = -cos(theta);
    if (checkKey('w'))
    {
      pos.add(forward);
    }
    if (checkKey('s'))
    {
      pos.sub(forward);
    }
    if (checkKey('a'))
    {
      theta -= 0.1f;
    }
    if (checkKey('d'))
    {
      theta += 0.1f;
    }
    
  }
  
}