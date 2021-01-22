package model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import org.postgresql.util.PSQLException;

public class Equip 
{
	public String name,type,location,status,fname;
	int eid,rcid;
	public int rate;
	
	public Equip()
	{
		
	}
	
	public Equip(int rcid,String name,String type,String location,int rate)
	{
		this.rcid = rcid;
		this.name = name;
		this.type = type;
		this.location = location;
		this.rate = rate;
	}
	
	public void geteid() throws SQLException
	{
		int count = 0;
		Connect obj = new Connect();
		Statement stmt = obj.conn.createStatement();
		ResultSet rs = stmt.executeQuery("Select max(eid) from equip");
		rs.next();
		count = rs.getInt(1);
		if(count == 0)
			eid = 1001;
		else
			eid = count + 1;
		stmt.close();
		rs.close();
		obj.closeConn();
	}
	
	public boolean setter() throws SQLException
	{
		int r = 0;
		geteid();
		Connect obj = new Connect();
		PreparedStatement ps = obj.conn.prepareStatement("Insert into equip(eid,ename,etype,location,status,rate,rcid) values(?,?,?,?,?,?,?)");
		ps.setInt(1 , eid);
		ps.setString(2, name);
		ps.setString(3, type);
		ps.setString(4, location);
		ps.setString(5, "available");
		ps.setInt(6, rate);
		ps.setInt(7, rcid);
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
	
	public boolean setImg(int id,String img) throws SQLException
	{
		int r = 0;
		Connect obj = new Connect();
		PreparedStatement ps = obj.conn.prepareStatement("insert into image values(?,?)");
		ps.setString(1, img);
		ps.setInt(2, id);
		r = ps.executeUpdate();
		ps.close();
		obj.closeConn();
		if(r == 0)
			return false;
		else
			return true;
	}
	
	public int getId() 
	{
		return this.eid;
	}
	
	public String getImg(int id) throws SQLException
	{
		String imgurl="NO string";
		Connect obj = new Connect();
		PreparedStatement ps = obj.conn.prepareStatement("Select iname from image where eid=?");
		ps.setInt(1, id);
		ResultSet rs = ps.executeQuery();
		if(rs.next())
		{
			imgurl = rs.getString(1);
			System.out.println("true");
		}
		rs.close();
		ps.close();
		obj.closeConn();
		return imgurl;
	}
	
	public int getCount(String loc,String type) throws SQLException
	{
		int count = 0;
		Connect obj = new Connect();
		PreparedStatement ps = obj.conn.prepareStatement("Select count(eid) from equip where location=? and status=? and etype=?");
		ps.setString(1, loc);
		ps.setString(2, "available");
		ps.setString(3, type);
		ResultSet rs = ps.executeQuery();
		if(rs.next())
			count = rs.getInt(1);
		rs.close();
		ps.close();
		obj.closeConn();
		return count;
	}
	
	public ArrayList<ArrayList<String>> getter(String loc ,String type) throws SQLException
	{
		int i = 0,a = 0;
		int count = getCount(loc,type);
		System.out.println("count = "+count);
		ArrayList<ArrayList<String>> rsv = new ArrayList<ArrayList<String>>();
		for(a = 0;a < count;a++)
		{
			rsv.add(new ArrayList<String>());
		}
		Connect obj = new Connect();
		PreparedStatement ps = obj.conn.prepareStatement("Select eid,ename,rate from equip where location=? and status=? and etype=?");
		ps.setString(1, loc);
		ps.setString(2, "available");
		ps.setString(3, type);
		ResultSet rs = ps.executeQuery();
		while(rs.next())
		{
			rsv.get(i).add(0,rs.getString(1));
			rsv.get(i).add(1,rs.getString(2));
			rsv.get(i).add(2,rs.getString(3));
			i++;
		}
		rs.close();
		ps.close();
		obj.closeConn();
		return rsv;
	}
	
	public boolean deleteEquip(int id) throws SQLException
	{
		int r = 0;
		int ri = 0;
		Connect obj = new Connect();
		PreparedStatement ps = obj.conn.prepareStatement("delete from equip where eid =?");
		ps.setInt(1, id);
		r = ps.executeUpdate();
		ps.close();
		PreparedStatement psi = obj.conn.prepareStatement("delete from image where eid =?");
		psi.setInt(1, eid);
		ri = psi.executeUpdate();
		psi.close();
		obj.closeConn();
		if(r == 0 && ri == 0)
			return false;
		else
		{
			System.out.println(id+" img url deleted successfully");
			return true;
		}
	}
	
	public int getCountId(int id) throws SQLException
	{
		int count = 0;
		Connect obj = new Connect();
		PreparedStatement ps = obj.conn.prepareStatement("Select count(eid) from equip where rcid=? and status=?");
		ps.setInt(1, id);
		ps.setString(2, "available");
		ResultSet rs = ps.executeQuery();
		if(rs.next())
			count = rs.getInt(1);
		rs.close();
		ps.close();
		obj.closeConn();
		return count;
	}
	
	public ArrayList<ArrayList<String>> getDetails(int id,int count) throws SQLException
	{
		int i = 0,a = 0;
		System.out.println("count = "+count);
		ArrayList<ArrayList<String>> rsv = new ArrayList<ArrayList<String>>();
		for(a = 0;a < count;a++)
		{
			rsv.add(new ArrayList<String>());
		}
		Connect obj = new Connect();
		PreparedStatement ps = obj.conn.prepareStatement("Select eid,ename,rate,etype from equip where rcid=? and status=?");
		ps.setInt(1, id);
		ps.setString(2, "available");
		ResultSet rs = ps.executeQuery();
		while(rs.next())
		{
			rsv.get(i).add(0,rs.getString(1));
			rsv.get(i).add(1,rs.getString(2));
			rsv.get(i).add(2,rs.getString(3));
			rsv.get(i).add(3,rs.getString(4));
			i++;
		}
		rs.close();
		ps.close();
		obj.closeConn();
		return rsv;
	}
}
