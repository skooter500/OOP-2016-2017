// If you dont write any constructor
// Java makes a default constructor for you
// If you make any constructor that takes parameters
// You no longer get the Java provided default constructor
// IF we dont provide a default constructor and we extend a super class
// The default constructor in the sub clas that Java makes will try and 
// call the default constructor in the super class
// Constructor chaining mean calling one constructor from another
// It can be in the super class or the sub class


class AIShip extends Player
{
  color c;
  
  AIShip(float x, float y, float theta, float size, char up, char down, char left, char right
  , char fire, color c)
  {    
    super(x, y, theta, size, up, down, left, right, fire); // Constructor chaining
    println("In AISHip lots of parameters constructor");
    this.c = c;
  }
  
  AIShip(float x, float y, float size, color c)
  {
    this(x, y, 0, size, ' ', ' ', ' ', ' ', ' ', c); // Constructor chaining in this class
    println("In AISHip 4 param constructor");
  }
  
  void update()
  {
    forward.x = sin(theta);
    forward.y  = -cos(theta);
    pos.add(forward);
    if (pos.y< 10)
    {
      pos.y = 10;
      theta = PI;
    }
    if (pos.y > 400)
    {
      pos.y = 400;
      theta = 0;
    }
  }
  
  void render()
  {
    stroke(c);
    super.render();
  }
}