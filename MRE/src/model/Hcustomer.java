package model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import org.postgresql.util.PSQLException;

public class Hcustomer 
{
	public String name,address,location;
	String password;
	int hcid;
	long phn;
	
	public Hcustomer()
	{
		
	}
	
	public Hcustomer(String name,String address,String location,String password,long phn)
	{
		this.name = name;
		this.address = address;
		this.location = location;
		this.password = password;
		this.phn = phn;
	}
	
	public void gethcid() throws SQLException
	{
		int count = 0;
		Connect obj = new Connect();
		Statement stmt = obj.conn.createStatement();
		ResultSet rs = stmt.executeQuery("Select max(hcid) from h_cust");
		rs.next();
		count = rs.getInt(1);
		if(count == 0)
			hcid = 1001;
		else
			hcid = count + 1;
		stmt.close();
		rs.close();
		obj.closeConn();
	}
	
	public boolean setter() throws SQLException
	{
		int r = 0;
		gethcid();
		Connect obj = new Connect();
		PreparedStatement ps = obj.conn.prepareStatement("Insert into h_cust values(?,?,?,?,?,?)");
		ps.setInt(1 , hcid);
		ps.setString(2, name);
		ps.setLong(3, phn);
		ps.setString(4, location);
		ps.setString(5, address);
		ps.setString(6, password);
		try
		{
			r = ps.executeUpdate();
		}
		catch(PSQLException e)
		{
			System.out.println(e);
		}
		ps.close();
		obj.closeConn();
		if(r>0)
			return true;
		else
			return false;
	}
	
	public void getter(int id) throws SQLException
	{
		Connect obj = new Connect();
		Statement stmt = obj.conn.createStatement();
		ResultSet rs = stmt.executeQuery("Select name,phn,location,address,password from h_cust");
		while(rs.next())
		{
			name = rs.getString(1);
			phn = rs.getLong(2);
			location = rs.getString(3);
			address = rs.getString(4);
			password = rs.getString(5);
		}
	}

	public int getLogin(long phn,String password) throws SQLException 
	{
		int r = 0;
		ResultSet rs;
		Connect obj = new Connect();
		PreparedStatement ps = obj.conn.prepareStatement("Select hcid from h_cust where phn=? and password=?");
		ps.setLong(1, phn);
		ps.setString(2, password);
		rs = ps.executeQuery();
		if(rs.next())
			r = rs.getInt(1);
		System.out.println(r);
		ps.close();
		rs.close();
		obj.closeConn();
		return r;
	}
	
	public boolean updatePhn(int id,long phone) throws SQLException
	{
		int r = 0;
		Connect obj = new Connect();
		PreparedStatement ps = obj.conn.prepareStatement("update h_cust set phn = ? where hcid = ?");
		ps.setLong(1 , phone);
		ps.setInt(2, id);
		try
		{
			r = ps.executeUpdate();
		}
		catch(PSQLException e)
		{
			System.out.println(e);
		}
		ps.close();
		obj.closeConn();
		if(r>0)
			return true;
		else
			return false;
	}
	
	public boolean updateAddr(int id,String addr) throws SQLException
	{
		
		int r = 0;
		Connect obj = new Connect();
		PreparedStatement ps = obj.conn.prepareStatement("update h_cust set address = ? where hcid = ?");
		ps.setString(1 , addr);
		ps.setInt(2, id);
		try
		{
			r = ps.executeUpdate();
		}
		catch(PSQLException e)
		{
			System.out.println(e);
		}
		ps.close();
		obj.closeConn();
		if(r>0)
			return true;
		else
			return false;
	}
	
	public boolean updateLoc(int id,String loc) throws SQLException
	{
		
		int r = 0;
		Connect obj = new Connect();
		PreparedStatement ps = obj.conn.prepareStatement("update h_cust set location = ? where hcid = ?");
		ps.setString(1 , loc);
		ps.setInt(2, id);
		try
		{
			r = ps.executeUpdate();
		}
		catch(PSQLException e)
		{
			System.out.println(e);
		}
		ps.close();
		obj.closeConn();
		if(r>0)
			return true;
		else
			return false;
	}
	
	public boolean updatePass(int id,String pass) throws SQLException
	{
		
		int r = 0;
		Connect obj = new Connect();
		PreparedStatement ps = obj.conn.prepareStatement("update h_cust set password = ? where hcid = ?");
		ps.setString(1 , pass);
		ps.setInt(2, id);
		try
		{
			r = ps.executeUpdate();
		}
		catch(PSQLException e)
		{
			System.out.println(e);
		}
		ps.close();
		obj.closeConn();
		if(r>0)
			return true;
		else
			return false;
	}
	
	public int getpkey(long phone) throws SQLException
	{
		int r = 0;
		Connect obj = new Connect();
		PreparedStatement ps = obj.conn.prepareStatement("Select hcid from h_cust where phn = ?");
		ps.setLong(1, phone);
		ResultSet rs = ps.executeQuery();
		rs.close();
		ps.close();
		obj.closeConn();
		if(rs.next())
			r = rs.getInt(1);
		return r;
	}
	
	public boolean checkPhn(long phn) throws SQLException
	{
		int r = 0;
		Connect obj = new Connect();
		PreparedStatement ps = obj.conn.prepareStatement("Select hcid from h_cust where phn = ?");
		ps.setLong(1, phn);
		ResultSet rs = ps.executeQuery();
		if(rs.next())
			r = rs.getInt(1);
		rs.close();
		ps.close();
		obj.closeConn();
		if(r == 0)
			return false;
		else
			return true;
	}
}