// Lots of ways to draw a Radar

void setup()
{
  size(500, 500);
  
  // Calculate the cener point of the screen
  cx = width / 2;
  cy = height / 2;
  smooth();  
  
  // Add Radar objects to an arraylist so we can draw them later
  radars.add(new Radar(100, 100, 50, 0.01f));  
  radars.add(new Radar(300, 100, 100, -0.01f));
  radars.add(new Radar(300, 300, 80, 0.02f));   
  radars.add(new Radar(400, 200, 50, 0.07f));   
  
  // This is used by method 3 (drawRadar3) 
  // The PGraphics object is used to draw onto and then we can draw the PGraphics object onto the screen
  pg = createGraphics(width, height);
  
  background(0);
}

float speed = 0.01; // How fast we want the radar to spin
int trailLength = 50;  
float theta = 0;
float cx, cy;
float radius = 200;

ArrayList<Radar> radars = new ArrayList<Radar>();

PGraphics pg;

// This is my first attempt that uses a loop to draw the radar
// This would be better if I used an arc rather than drew lines!
void drawRadar1()
{
  stroke(0, 255, 0);
  noFill();
  // Draw the outside of the radar
  ellipse(cx, cy, radius * 2, radius * 2);

  float intensityChange = 255.0f / trailLength; // Make the line colour fade to 0 for each successive line we draw
  for(int i = 0 ; i < trailLength ; i ++) // Draw trailLength lines
  {
    float lineTheta = theta - (i * speed);
    stroke(0, 255 - (i * intensityChange), 0);
    float x = cx + sin(lineTheta) * radius;
    float y = cy - cos(lineTheta) * radius;
    line(cx, cy, x, y);
    
    // An arc might be an even better solution
  }
  theta += speed;
}

// Draw the radar using recursion
void drawRadar2(float theta, float intensity)
{
  stroke(0, intensity, 0);
  float x = cx + sin(theta) * radius;
  float y = cy - cos(theta) * radius;  
  line(cx, cy, x, y);
  if (intensity <= 0)
  {    
    // Use this to disambiguate the parameter theta from the global variable
    this.theta += speed;
    return;
  }
  else
  {
    float intensityChange = 255.0f / trailLength;
    drawRadar2(theta - speed, intensity - intensityChange);
  }
}

// Draw the radar lines and use transparancy to fade out the old lines
void drawRadar3()
{
  pg.beginDraw();
  pg.background(0, 0, 0, 10);
  pg.stroke(0, 255, 0);
  pg.noFill();
  pg.ellipse(cx, cy, radius * 2, radius * 2);
  pg.stroke(0, 255, 0);
  float x = cx + sin(theta) * radius;
  float y = cy - cos(theta) * radius;
  pg.line(cx, cy, x, y);
  theta += speed;
  pg.endDraw();
  image(pg, 0, 0);
}

void draw()
{
  //
  
  /*  
  // Use Method 1
  background(0);
  drawRadar1();
  */
  
  // Use Method 2
  
  /*
  background(0);
  noFill();
  stroke(0, 255, 0);
  ellipse(cx, cy, radius * 2, radius * 2);
  drawRadar2(theta, 255);
 */
  
  // Use Method 3
  // Make sure not to clear the background because we need to leave the old radar lines on the screen
  //drawRadar3();
  
  // The best way! Use a Radar class
  // Store the radar's in an arraylist
  // Iterate through the Radar objects and call update and render
  for(Radar r:radars)
  {
    r.update();
    r.render();
  }
  
}