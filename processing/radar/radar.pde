void setup()
{
  size(500, 500);
  cx = width / 2;
  cy = height / 2;
  smooth();
}

float speed = 0.01;
int trailLength = 50;  
float theta = 0;
float cx, cy;
color c = color(0, 255, 0);
float radius = 200;

void draw()
{
  background(0);
  stroke(0, 255, 0);
  noFill();
  ellipse(cx, cy, radius * 2, radius * 2);

  float intensityChange = 255.0f / trailLength;
  for(int i = 0 ; i < trailLength ; i ++)
  {
    float lineTheta = theta - (i * speed);
    stroke(0, 255 - (i * intensityChange), 0);
    float x = cx + sin(lineTheta) * radius;
    float y = cy - cos(lineTheta) * radius;
    line(cx, cy, x, y);
  }
  theta += speed;
}