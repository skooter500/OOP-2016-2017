void setup()
{
  size(500, 500);
  cx = width / 2;
  cy = height / 2;
  smooth();
  
  radars.add(new Radar(100, 100, 50, 0.01f));  
  radars.add(new Radar(300, 100, 100, -0.01f));
  radars.add(new Radar(300, 300, 80, 0.02f));   
}

float speed = 0.01;
int trailLength = 50;  
float theta = 0;
float cx, cy;
float radius = 200;
ArrayList<Radar> radars = new ArrayList<Radar>();

void drawRadar()
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

void draw()
{
  background(0);
  for(Radar r:radars)
  {
    r.update();
    r.render();
  }
}