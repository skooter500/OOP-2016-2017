class Radar
{
  // Fields
  float speed = 0.01;
  int trailLength = 50;  
  float theta = 0;
  float cx, cy;
  float radius = 200;

  // Constructor
  Radar(float x, float y, float radius, float speed)
  {
    this.speed = speed;
    cx = x;
    cy = y;
    this.radius = radius;
    this.speed = speed;
  }
  
  void update()
  {
    theta += speed;
  }
    
  // This might work better if we used an arc instead of a line!
  void render()
  {
    stroke(0, 255, 0);
    noFill();
    ellipse(cx, cy, radius * 2, radius * 2);
  
    float intensityChange = 255.0f / trailLength;
    for(int i = 0 ; i < trailLength ; i ++)
    {
      float lineTheta = theta - (i * speed);
      stroke(0, 255 - (i * intensityChange), 0);
      
      float x = cx + sin(lineTheta) * radius - 1;
      float y = cy - cos(lineTheta) * radius - 1;
      line(cx, cy, x, y);
      
    }
  }
}