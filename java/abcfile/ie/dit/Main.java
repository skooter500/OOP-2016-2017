package ie.dit;
import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.FileReader;


public class Main
{
		public static void main(String[] args)
		{
			try
			{
				BufferedReader reader = new BufferedReader(new FileReader("hnj1.abc"));
				String current = "";
				while ((current = reader.readLine()) != null) 
				{
					if (current.startsWith("T:"))
					{
						String title = current.substring(2);
						System.out.println(title);
					}
				}
			}
			catch(IOException e)
			{
				e.printStackTrace();
			}
		}
}