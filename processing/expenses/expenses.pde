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
  
  loadData();
  printAll();
}

void printAll()
{
  for(Expense e: expenses)
  {
    println(e);
  }
}

void loadData()
{
  Table t = loadTable("expenses.tsv", "header");
  expenses.clear();
  for (int row = 0 ; row < t.getRowCount() ; row ++)
  {
    Expense e = new Expense(t.getString(row, 0)
      , t.getString(row, 2)
      , t.getString(row, 1)
      , t.getFloat(row, 3)
      , t.getFloat(row, 4)
      );      
      expenses.add(e);
      PartyExpense pe = null;
      
      if (peh.containsKey(e.party))
      {
        pe = peh.get(e.party);  
      }
      else
      {
        pe = new PartyExpense(e.party, 0);
        peh.put(e.party, pe);;
      }
      
      for(int i = 0 ; i < partyExpenses.size() ; i ++)
      {
        if (partyExpenses.get(i).name.equals(e.party))
        {
          pe = partyExpenses.get(i);
          break;
        }
      }
      if (pe == null)
      {
        pe = new PartyExpense(e.party, 0);
        partyExpenses.add(pe);
      }
      pe.total += e.claimed;
  }
  
  for (TableRow r: t.rows())
  {
    Expense e = new Expense(r.getString(0)
      , r.getString(2)
      , r.getString(1)
      , r.getFloat(3)
      , r.getFloat(4)
      );    
  }  
  expenses.clear();
  
  for(TableRow r: t.rows())
  {
    Expense e = new Expense(r.getString("Name")
      , r.getString("Constituency")
      , r.getString("Party")
      , r.getFloat("Returned")
      , r.getFloat("Claimed")
      );    
  } 
}

// An ArrayList is like an array but it can grow and shrink
ArrayList<Expense> expenses = new ArrayList<Expense>();
ArrayList<PartyExpense> partyExpenses = new ArrayList<PartyExpense>();

HashMap<String, PartyExpense> peh = new HashMap<String, PartyExpense>();

Expense exp;
Expense exp1;

void draw()
{
}