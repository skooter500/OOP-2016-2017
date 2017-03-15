package ie.dit;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class TuneFinder {
	String driver = "org.sqlite.JDBC";
	String url = "jdbc:sqlite:tunes.sqlite";
	
	void loadTunes()
	{
		Connection c;
		PreparedStatement ps;
		ResultSet rs;
		
		try
		{
			Class.forName(driver);
			c = DriverManager.getConnection(url);
			ps = c.prepareStatement("select * from tuneindex where title like ?");
			ps.setString(1, "%maid%");
			
			rs = ps.executeQuery();
			while(rs.next())
			{
				System.out.println(rs.getString("title"));
			}
			
		}
		catch(ClassNotFoundException e)
		{
			System.out.println("Driver not found");
			e.printStackTrace();
		}
		catch(SQLException e)
		{
			System.out.println("SQL Exception");
			e.printStackTrace();
		}
		
	}

}
