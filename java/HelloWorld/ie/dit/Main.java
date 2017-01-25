package ie.dit;


public class Main
{
	// This method applies to the class
	// Rather than an instance
	// Like a C function
	// Rather than a method
	public static void main(String[] args)
	{
		// println
		System.out.println("Hello world");
		
		Animal a = new Animal(4, "Misty");
		
		a.speak();
	}
}