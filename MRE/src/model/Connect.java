package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Connect 
{
	public Connection conn;
	
	public Connect()
	{
		try
		{
			Class.forName("org.postgresql.Driver");
			conn = DriverManager.getConnection("jdbc:postgresql://localhost/shantanu","shantanu","f9torres");
			if(conn == null)
			{
				System.out.println("Connection failed");
				System.exit(0);
			}
			else
				System.out.println("Connection Successfull");
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	}
	
	public void closeConn() throws SQLException
	{
		conn.close();
	}
}
