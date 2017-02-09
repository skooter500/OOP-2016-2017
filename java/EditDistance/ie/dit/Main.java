package ie.dit;

public class Main
{
	public static void main(String[] args)
	{
		Matrix m = new Matrix(4,4);
		m.identity();
		
		Matrix m1 = new Matrix(4,4);
		m1.identity();
		m.add(m1);
		System.out.println(m);
		System.out.println(m1);
		
		Matrix c = Matrix.add(m, m1);
		System.out.println(c);
		
		Vector a = new Vector(0, 10);
		/*Matrix rot = Matrix.rotation((float) Math.PI / 2.0f);
		
		Vector b = rot.transform(a);
		System.out.println(a);
		System.out.println(b);
		
		Matrix trans = Matrix.translation(10, 10);
		b = trans.transform(a);
		System.out.println(a);
		System.out.println(b);
		
		Matrix scale = Matrix.scaling(2, 3);
		b = scale.transform(a);
		System.out.println(a);
		System.out.println(b);
		*/
		
		Matrix rot = Matrix.rotation((float) Math.PI / 2.0f);
		Matrix trans = Matrix.translation(5, 5);
		
		Vector b = rot.transform(a);
		b = trans.transform(b);
		System.out.println(b);
		
		b = trans.transform(a);
		b = rot.transform(b);
		System.out.println(b);
		
		Matrix combined = Matrix.mult(trans, rot);
		
		b = combined.transform(a);
		System.out.println(b);
		
		combined = Matrix.mult(rot, trans);
		b = combined.transform(a);
		System.out.println(b);
		
		
		
	}
}