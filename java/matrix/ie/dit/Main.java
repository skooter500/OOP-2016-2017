package ie.dit;

public class Main
{
	public static void main(String[] args)
	{
		Matrix a = new Matrix(4, 4);
		a.identity();
		a.setElement(2, 3, 7);
		a.setElement(3, 1, 2);
		a.setElement(3, 0, 4);

		Matrix b = new Matrix(4, 4);
		b.identity();
		b.setElement(2, 3, 1);
		b.setElement(3, 1, 9);
		b.setElement(3, 0, -7);

		Matrix c;
		c = Matrix.mult(a, b); // How to call a static method

		System.out.println(a);
		System.out.println(b);
		System.out.println(c);
	}
}