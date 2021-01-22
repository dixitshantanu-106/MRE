package model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import org.postgresql.util.PSQLException;

public class Rcustomer 
{
	String name,address,password,bname,branch,ifsc;
	int rcid;
	long phn,accno;
	
	public Rcustomer()
	{
		
	}
	
	public Rcustomer(String name,String address,String password,String bname,String branch,String ifsc,long phn,long accno)
	{
		this.name = name;
		this.address = address;
		this.password = password;
		this.bname = bname;
		this.branch = branch;
		this.ifsc = ifsc;
		this.phn = phn;
		this.accno = accno;
	}
	
	public void getrcid() throws SQLException
	{
		int count = 0;
		Connect obj = new Connect();
		Statement stmt = obj.conn.createStatement();
		ResultSet rs = stmt.executeQuery("Select max(rcid) from r_cust");
		rs.next();
		count = rs.getInt(1);
		if(count == 0)
			rcid = 1001;
		else
			rcid = count + 1;
		stmt.close();
		rs.close();
		obj.closeConn();
	}
	
	public boolean setter() throws SQLException
	{
		int r = 0;
		getrcid();
		Connect obj = new Connect();
		PreparedStatement ps = obj.conn.prepareStatement("Insert into r_cust values(?,?,?,?,?,?,?,?,?)");
		ps.setInt(1 , rcid);
		ps.setString(2, name);
		ps.setLong(3, phn);
		ps.setString(4, address);
		ps.setString(5, bname);
		ps.setLong(6, accno);
		ps.setString(7, branch);
		ps.setString(8, ifsc);
		ps.setString(9, password);
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
	
	public int getLogin(long phn,String password) throws SQLException 
	{
		int r = 0;
		ResultSet rs;
		Connect obj = new Connect();
		PreparedStatement ps = obj.conn.prepareStatement("Select rcid from r_cust where phn=? and password=?");
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
		PreparedStatement ps = obj.conn.prepareStatement("update r_cust set phn = ? where rcid = ?");
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
		PreparedStatement ps = obj.conn.prepareStatement("update r_cust set address = ? where rcid = ?");
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
	
	public boolean updatePass(int id,String pass) throws SQLException
	{
		
		int r = 0;
		Connect obj = new Connect();
		PreparedStatement ps = obj.conn.prepareStatement("update r_cust set password = ? where rcid = ?");
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
	
	public boolean updateBank(int id,String bank) throws SQLException
	{
		
		int r = 0;
		Connect obj = new Connect();
		PreparedStatement ps = obj.conn.prepareStatement("update r_cust set bank = ? where rcid = ?");
		ps.setString(1 , bank);
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
	
	public boolean updateBranch(int id,String branch) throws SQLException
	{
		
		int r = 0;
		Connect obj = new Connect();
		PreparedStatement ps = obj.conn.prepareStatement("update r_cust set branch = ? where rcid = ?");
		ps.setString(1 , branch);
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
	
	public boolean updateAcc(int id,long acc) throws SQLException
	{
		
		int r = 0;
		Connect obj = new Connect();
		PreparedStatement ps = obj.conn.prepareStatement("update r_cust set accno = ? where rcid = ?");
		ps.setLong(1 , acc);
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
	
	public boolean updateIFSC(int id,String ifs) throws SQLException
	{
		
		int r = 0;
		Connect obj = new Connect();
		PreparedStatement ps = obj.conn.prepareStatement("update r_cust set ifsc = ? where rcid = ?");
		ps.setString(1 , ifs);
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
	
	public boolean checkPhn(long phn) throws SQLException
	{
		int r = 0;
		Connect obj = new Connect();
		PreparedStatement ps = obj.conn.prepareStatement("Select rcid from r_cust where phn = ?");
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