package ie.dit;

public class MatrixException extends Exception
{
	public String message;
	
	public MatrixException(String message)
	{
		this.message = message;
	}
	
	public String getMessage()
	{
		return message;
	}
	
}