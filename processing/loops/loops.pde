void setup()
{
  size(500, 500);
}

float x = 0.0f; 
float boxWidth = 50.0f;
float speed = 8.0f;

void draw()
{
  background(0);
  rect(x, height / 2, boxWidth, boxWidth);
  x += speed;
  if ((x + boxWidth > width) || ( x < 0))
  {
    speed = - speed;
  }
  stroke(0, 255, 255);
  for(int i = 0; i < width; i += 10)
  {
    line(i, 0, i, height);
  }
  
  int i = 0;
  while(i < height)
  {
    line(0, i, width, i);
    i += 10;
  }

  i = 0;
  noFill();
 
  do 
  {
    
    ellipse(width / 2, height / 2, i, i);
    i += 10;
  }
  while(i < height);
  
  
}