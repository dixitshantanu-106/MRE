package model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Rating
{
	int rid,rno,eid,hcid;
	
	public Rating(int eid,int hcid,int rno)
	{
		this.eid = eid;
		this.hcid = hcid;
		this.rno = rno;
	}
	
	public void getrid() throws SQLException
	{
		int r = 0;
		Connect obj = new Connect();
		PreparedStatement ps = obj.conn.prepareStatement("Select max(rid) from ratings");
		ResultSet rs = ps.executeQuery();
		if(rs.next())
		{
			r = rs.getInt(1);
			rid = r + 1;
		}
		else
		{
			rid = 1001;
		}
		ps.close();
		rs.close();
		obj.closeConn();
	}
	
	public boolean setter() throws SQLException
	{
		int r = 0;
		getrid();
		Connect obj = new Connect();
		PreparedStatement ps = obj.conn.prepareStatement("insert into rating values(?,?,?,?)");
		ps.setInt(1,rid);
		ps.setInt(2,rno);
		ps.setInt(3,hcid);
		ps.setInt(4,eid);
		r = ps.executeUpdate();
		ps.close();
		obj.closeConn();
		if(r == 0)
		{
			return false;
		}
		else
		{
			return true;
		}
	}
}

