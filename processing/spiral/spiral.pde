void setup()
{
  size(500, 500);
  cx = width / 2;
  cy = height / 2;
}

float cx, cy;
float theta = 0;
float r1 = 1;
float r2 = 60;

void draw()
{
  float x = cx + sin(theta) * r1;
  float y = cy - cos(theta) * r1;
  
  noStroke();
  fill(x/2, y/2, x/ 2);
  ellipse(x, y, r2, r2);
  theta += 0.1f;
  r1 ++;
  r2 -=1;
  
  
}