void setup()
{
  size(500, 500);
}

float x = 0;
float xSpeed = 1;
float w = 50;
void draw()
{
  background(0);
  rect(x, 200, w, w);
  x += xSpeed;
  if (x + w > width || x < 0)
  {
    xSpeed = - xSpeed;
  }
}