package ie.dit;

public class Main
{
	public static void main(String[] args)
	{
		// Create a matrix
		Matrix m = new Matrix(10, 10);
		m.identity();
		System.out.println(m);
		
		Matrix mm = new Matrix(10, 10);
		mm.identity();
		// toString gets called implicitly
		System.out.println(Matrix.add(m, mm));
	}
}