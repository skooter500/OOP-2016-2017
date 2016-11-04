void setup()
{
  size(500, 500);  
}

float timeDelta = 0;
float timeAccumulator = 0;

int last = 0;

void draw()
{
  background(0);
  int now = millis();
  timeDelta = (now - last) / 1000.0f;  
  last = now;
  
  timeAccumulator += timeDelta;
  
  println(timeDelta);
  println(timeAccumulator);
  
  if (timeAccumulator >= 2 && timeAccumulator < 3)
  {
    background(255, 0, 0);
  }
  if (timeAccumulator >= 7 && timeAccumulator < 8)
  {
    background(0, 0, 255);
  }
  if (timeAccumulator >= 10)
  {
    timeAccumulator = 0;
  }   
}