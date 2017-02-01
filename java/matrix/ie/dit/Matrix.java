package ie.dit;

public class Matrix
{
	// private means the field can only be accesed by methods in the same class
	private float[][] elements;
	
	private final int rows;
	private final int cols;
	
	// Read only accessors
	public int getRows()
	{
		return rows;
	}
	
	// public methods can be called by methods outside the package
	public int getCols()
	{
		return cols;
	}
	
	// static means the method is on the class not the instance
	// Kind of like a c function
	// This method implements a = b + c on matrices
	// Add 2 matrices, return a new matrix
	public static Matrix add(Matrix a, Matrix b)
	{
		Matrix c = new Matrix(a.rows, a.cols);
		
		for (int row = 0 ; row < a.rows ; row ++)
		{
			for (int col = 0 ; col < a.cols; col ++)
			{
				c.setElement(row, col, a.getElement(row, col) 
					+ b.getElement(row, col));
			}
		}
		return c;
	}
	
	public void add(Matrix b)
	{
		for (int row = 0 ; row < rows ; row ++)
		{
			for (int col = 0 ; col < cols ; col ++)
			{				
				setElement(row, col, getElement(row, col) 
						+ b.getElement(row, col));
			}
		}
	}	
	
	// Set up the matrix as the identity matrix
	public void identity()
	{
		for (int row = 0 ; row < rows ; row ++)
		{
			for (int col = 0 ; col < cols; col ++)
			{
				if (row == col)
				{
					setElement(row, col, 1);
				}
				else
				{
					setElement(row, col, 0);				
				}									
			}
		}
	}
	
	// get and set the appropriate element in the 2d elements array
	public float getElement(int row, int col)
	{
		return elements[row][col];
	}
	
	public void setElement(int row, int col, float value)
	{
		elements[row][col] = value;
	}
	
	// Convert the matrix to a string
	public String toString()
	{
		String s = "";
		for(int row = 0 ; row < rows ; row ++)
		{
			for (int col = 0 ; col < cols ; col ++)
			{
				s += getElement(row, col) + "\t";
			}
			s += "\n";
		}
		return s;
	}
	
	// Construct the Matrix
	public Matrix(int rows, int cols)
	{
		this.rows = rows;
		this.cols = cols;
		
		elements = new float[rows][cols];
	}
}