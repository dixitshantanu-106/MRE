package model;

import java.sql.Date;
import java.util.ArrayList;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.postgresql.util.PSQLException;

public class Cust_Equip 
{
	int eid,hcid;
	public Date sdate,edate;
	public int amnt = 0;
	String p_status = "paid";
	
	public Cust_Equip()
	{
		
	}
	
	public Cust_Equip(int eid,int hcid,String sdate,String edate)
	{
		this.eid = eid;
		this.hcid = hcid;
		this.sdate = Date.valueOf(sdate);
		this.edate = Date.valueOf(edate);
	}
	
	public void getAmnt() throws SQLException
	{
		int d = -1;
		int r = 0;
		Connect obj = new Connect();
		PreparedStatement ps = obj.conn.prepareStatement("select edate-sdate from cust_equip where eid =? and hcid =?");
		ps.setInt(1,eid);
		ps.setInt(2,hcid);
		ResultSet rs = ps.executeQuery();
		if(rs.next())
			d = rs.getInt(1);
		else
		{
			return;
		}
		ps.close();
		rs.close();
		if(d>0)
		{
			PreparedStatement pa = obj.conn.prepareStatement("Select rate from equip where eid =?");
			pa.setInt(1,eid);
			ResultSet ra = pa.executeQuery();
			if(ra.next())
				r = ra.getInt(1);
			else
				return;
			amnt = d * r;
			pa.close();
			ra.close();
			obj.closeConn();
			System.out.println("Amount for "+d+" days at "+r+"rate is:" +amnt);
			setAmnt();
		}
	}
	
	public void setAmnt() throws SQLException
	{
		int r = 0;
		Connect obj = new Connect();
		PreparedStatement ps = obj.conn.prepareStatement("update cust_equip set amnt=? where eid=? and hcid=?");
		ps.setInt(1,amnt);
		ps.setInt(2,eid);
		ps.setInt(3,hcid);
		r = ps.executeUpdate();
		ps.close();
		obj.closeConn();
		if(r == 0)
		{
			System.out.println("Amount updation Failed");
		}
		else
		{
			System.out.println("Amount updation Successfull");
		}
	}
	
	public boolean setter() throws SQLException
	{
		int r = 0;
		Connect obj = new Connect();
		PreparedStatement ps = obj.conn.prepareStatement("Insert into cust_equip values(?,?,?,?,?,?)");
		ps.setInt(1 , hcid);
		ps.setInt(2, eid);
		ps.setString(3, p_status);
		ps.setDate(4, sdate);
		ps.setDate(5, edate);
		ps.setInt(6, amnt);
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
		updateStatus();
		if(r>0)
			return true;
		else
			return false;
	}
	
	public void updateStatus() throws SQLException
	{
		int r = 0;
		Connect obj = new Connect();
		PreparedStatement ps = obj.conn.prepareStatement("update equip set status='booked' where eid=?");
		ps.setInt(1,eid);
		r = ps.executeUpdate();
		ps.close();
		obj.closeConn();
		if(r == 0)
		{
			System.out.println("Status updation Failed");
		}
		else
		{
			System.out.println("Status updation Successfull");
		}
	}
	
	public int searchHcid(int id) throws SQLException
	{
		int count = 0;
		Connect obj = new Connect();
		PreparedStatement ps = obj.conn.prepareStatement("select count(hcid) from cust_equip where hcid=?");
		ps.setInt(1,id);
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
		int i = 0;
		int j = 0;
		Connect obj = new Connect();
		ArrayList<ArrayList<String>> rsv = new ArrayList<ArrayList<String>>();
		for(j=0;j<count;j++)
		{
			rsv.add(new ArrayList<String>());
		}
		PreparedStatement ps = obj.conn.prepareStatement("Select eid,sdate,edate,amnt from cust_equip where hcid = ?");
		ps.setInt(1, id);
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
	
	public boolean deleteBooking(int hid,int eid) throws SQLException
	{
		int r = 0;
		int ru = 0;
		Connect obj = new Connect();
		PreparedStatement ps = obj.conn.prepareStatement("delete from cust_equip where eid =? and hcid=?");
		ps.setInt(1, eid);
		ps.setInt(2, hid);
		r = ps.executeUpdate();
		ps.close();
		PreparedStatement psu = obj.conn.prepareStatement("update equip set status ='available' where eid =?");
		psu.setInt(1, eid);
		ru = psu.executeUpdate();
		psu.close();
		obj.closeConn();
		if(r == 0 && ru == 0)
			return false;
		else
		{	
			System.out.println(eid+" status updated successfully");
			return true;
		}
	}
}