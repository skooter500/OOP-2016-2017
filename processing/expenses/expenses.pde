void setup()
{
  size(500, 500);
  
  exp = new Expense();
  exp1 = new Expense("Bryan"
  , "Independent", "Dublin central"
  , 0, 0);  
  println(exp1);  
  
  exp.name = "Derek";
  exp1.name = "Bryan";
  
  exp = exp1; // Assigning object references. These are like pointers. exp and exp1 now "point" at the same object
  exp1.name = "Jason";
  
  println(exp.name);
}

Expense exp;
Expense exp1;

void draw()
{
}