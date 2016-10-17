class Expense
{
  String name;
  String party;
  String constituency;
  float returned;
  float claimed;
  color c;
  
  // Get called when the object gets created from the class
  // Constructors do not have a return type!!
  // Default constructor takes no parameters
  // Should set the fields to default values
  Expense()
  {
    name = "";
    party = "";    
  }
  
  // Paramaterised Constructor
  // Generally its job is to assign 
  // starting values to the fields
  Expense(String name, String con
  , String party, float returned
  , float claimed)
  {
    this.name = name; // this is used to refer to the fields
    this.constituency = con; // it disambiguates the use of the variable names
    this.party = party;
    this.claimed = 0;
    this.returned = 0;
    c = color(random(0, 255), random(0, 255),random(0, 25));
  }  
  
  // Converts the object to a string
  // so it can be printed
  String toString()
  {
    return name + "\t" + party + "\t" + constituency 
    + "\t" + claimed + "\t" + returned;
  }
}