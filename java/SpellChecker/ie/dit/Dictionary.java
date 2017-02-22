package ie.dit;
import java.util.*;
import java.io.*;

public class Dictionary
{
	public String fileName;
	ArrayList<String> words = new ArrayList<String>();
	
	public Dictionary(String fileName)
	{
		this.fileName = fileName;
		loadFile();
	}
	
	public String findClosest(String toFind)
	{
		int closestEd = Integer.MAX_VALUE;
		String closestWord = "";
		
		for(String word:words)
		{
			int ed = (int) EditDistance.EditDistance(toFind, word);
			if (ed == 0)
			{
				return toFind;
			}
			if (ed < closestEd)
			{
				closestEd = ed;
				closestWord = word;
			}
		}
		return closestWord;
		
	}
	
	public void loadFile()
	{
		try
		{
			BufferedReader br = new BufferedReader(new FileReader(fileName));
			String line = "";
			while((line = br.readLine()) != null)
			{
				words.add(line);
			}
		}
		catch(FileNotFoundException e)
		{
			System.out.println("File not found: " + e);
			e.printStackTrace();
		}
		catch(IOException e)
		{
			System.out.println("Could not read from file: " + e);
			e.printStackTrace();
		}
	}
	
	public String toString()
	{
		StringBuffer sb = new StringBuffer();
		
		for(String word:words)
		{
			sb.append(word + "\n");
		}
		
		return "" + sb;
	}
}