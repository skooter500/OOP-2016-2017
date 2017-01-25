package ie.dit;

public class Animal
{
	// private means only can be accessed inside the class
	private int numLegs;
	private String name;
	
	public Animal(int numLegs, String name)
	{
		this.numLegs = numLegs;
		this.name = name;		
	}
	
	public Animal()
	{
		this(0, "");
	}
	
	// Accessors
	// Give access to private fields
	public String getName()
	{
		return name;
	}
	
	public void setName(String name)
	{
		this.name = name;
	}
	
	public int getNumLegs()
	{
		return numLegs;
	}
	
	public void setNumLegs(int numLegs)
	{
		this.numLegs = numLegs;
	}
	
	public void speak()
	{
		System.out.println("I cant speak!");
	}
}