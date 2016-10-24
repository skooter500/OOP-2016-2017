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
  
  // Adding elements to the ArrayList
  expenses.add(exp);
  expenses.add(exp1);
  
  // Iterating over an ArrayList
  for(int i = 0 ; i < expenses.size() ; i ++)
  {
    Expense e = expenses.get(i);
    println(e);
  }
  for(Expense e:expenses)
  {
    println(e);
  }
}

// An ArrayList is like an array but it can grow and shrink
ArrayList<Expense> expenses = new ArrayList<Expense>();

Expense exp;
Expense exp1;

void draw()
{
}