class Player
{
  float x, y;
  float theta;
  float size;
  float radius;
  
  PShape shape;
  
  Player(float x, float y, float theta, float size)
  {
    this.x = x;
    this.y = y;
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
    shape(shape, x, y);
    
  }
  
  void update()
  {
    if (checkKey('w'))
    {
      y --;
    }
    if (checkKey('s'))
    {
      y ++;
    }
    if (checkKey('a'))
    {
      x --;
    }
    if (checkKey('d'))
    {
      x ++;
    }
    
  }
  
}