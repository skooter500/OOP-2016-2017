void setup()
{
  size(500, 500);
  halfW = width / 2;
  halfH = height / 2;
}

int halfW, halfH;
 
void draw()
{
  
  background(0, 255, 0);
  noStroke();
  fill(255, 0, 0);
  if (mouseX < halfW && mouseY < halfH)
  {
    rect(0, 0, halfW, halfH);
  }
  else if (mouseX >= halfW && mouseY < halfH)
  {
    rect(halfW, 0, halfW, halfH);
  }
  else if (mouseX < halfW && mouseY >= halfH) 
  {
    rect(0, halfW, halfW, halfH);
  }
  else if (mouseX > halfW && mouseY >= halfH)
  {
    rect(halfW, halfW, halfW, halfH);
  }
  
}