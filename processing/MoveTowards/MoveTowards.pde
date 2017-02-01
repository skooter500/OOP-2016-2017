void setup()
{
  size(500, 500);
  
  for (int i = 0 ; i < circles.length ; i ++)
  {
    circles[i] = new Circle();
    lines[i] = new Line();
  }
  
}

Circle[] circles = new Circle[10];
Line[] lines = new Line[10];

void draw()
{
  background(0);
  for(int i = 0 ; i < circles.length ; i ++)
  {
    circles[i].update();
    circles[i].render();
    lines[i].update();
    lines[i].render();
  }
}