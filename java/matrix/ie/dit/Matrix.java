package ie.dit;

public class Matrix
{
	private float[][] elements;
	
	private final int rows;
	private final int cols;
	
	public int getRows()
	{
		return rows;
	}
	
	public int getCols()
	{
		return cols;
	}
	
	public void identity()
	{
	}
	
	public String toString()
	{
	}
	
	public Matrix(int rows, int cols)
	{
		this.rows = rows;
		this.cols = cols;
		
		elements = new float[rows][cols];
	}
}