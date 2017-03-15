package ie.dit;

public class Main
{
	public static void main(String[] args)
	{
		String sa = "BigLez";
		String sb = "Sassy";
		System.out.println("Edit distance between: " + sa + " and: " + sb + " is " + EditDistance.EditDistance(sa, sb));

		sa = "Games Fleadh";
		sb = "Imagine Cup";
		System.out.println("Edit distance between: " + sa + " and: " + sb + " is " + EditDistance.EditDistance(sa, sb));

		Matrix a = new Matrix(4,4);
		Matrix b = new Matrix(4,1);
		
		Dictionary d = new Dictionary("words.txt");
		System.out.println(d);
		
					
		
		
		
		try
		{
			Matrix c = Matrix.mult(a, b);
			System.out.println(c);
		}
		catch(MatrixException e)
		{
			//System.out.println(e);
			e.printStackTrace();
			
		}
		catch(NullPointerException e)
		{
			e.printStackTrace();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			System.out.println("Happens anyway!");
		}
		
		String word = "breead";
		String match = d.findClosest("bread");
		if (match.equals(word))
		{
			System.out.println("Correct!");
		}
		else
		{
			System.out.println("Did you mean: " + match);
		}
	}
}