void setup()
{
  size(500, 500);
}

float[] data = {-6, 8, 2, 9, 12};

void draw()
{
  float barWidth = width / data.length;
  for(int i = 0 ; i < data.length ; i ++)
  {
    float x = map(i, 0, data.length, 0, width);
    float h = map(data[i], 0, 10, 0, -height);
    rect(x, height, barWidth, h);
  }
  
  for(int i = 0 ; i < data.length ; i ++)
  {
    float x = map(data[i], -10, 20, 0, width);
    ellipse(x, height / 2, 20, 20);
  }
}