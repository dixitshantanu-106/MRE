<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="model.*"  %>
    <%@ page import="java.util.ArrayList" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <title>Display</title>
 <link rel="stylesheet" href="../CSS/display.css">
</head>
<body>
    <ul class="back">    
            <li><a href="HcustomerHome.jsp"> Go Back </a></li>
        </ul>
          <div class="row">
              <form action="HcustomerEquipDisplay.jsp" method="POST">
                <ul class="main-nav">    
                    <input type="submit" value="LOGOUT" name = "Lbutton">
                </ul>
              </form>
          </div>
    

<%!
int i;
int hid,ecount = 0;
String edate,sdate;
String type,hlocation;
%>
<%
	HttpSession sn = request.getSession();
	if(request.getParameter("Lbutton")!= null)
	{
		sn.invalidate();
		response.sendRedirect("Landing.jsp");
	}
	else if(sn.getAttribute("pkey")!=null)
	{
		hid = (Integer)sn.getAttribute("pkey");	
		type = (String)sn.getAttribute("type");
		sdate = (String)sn.getAttribute("sdate");
		edate = (String)sn.getAttribute("edate");
		Equip eq = new Equip();
		Hcustomer hc = new Hcustomer();
		ArrayList<ArrayList<String>> data = new ArrayList<ArrayList<String>>();
		try
		{
			hc.getter(hid);
			hlocation = hc.location;
			ecount = eq.getCount(hlocation,type);
			//erate = eq.rate;
			data = eq.getter(hlocation,type);
			for(i = 0;i < ecount; i++)
			{
				data.get(i).add(eq.getImg(Integer.parseInt(data.get(i).get(0))));
			}
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
			if(ecount != 0)
			{
%>
<div class=top>
<h1><%out.print(type); %></h1>
</div>
			<div class=main>
<% 
				for(i = 0;i < ecount;i++)
				{
%>
		
					<div class=card>
						<div class=image>
							<img src=<%=data.get(i).get(3)%>>
						</div>
						<div class=title>
			 				<h1><%=data.get(i).get(1)%></h1>
						</div>
						<div class=des>
			 				<p>Rs:<%=data.get(i).get(2)%></p>
			 				<form action=HcustomerEquipBooking.jsp method=POST>
			    			<input type="hidden" value="<%=data.get(i).get(0)%>" name="eid">
			    			<input type="hidden" value="<%=data.get(i).get(1)%>" name="name">
			    			<input type="hidden" value="<%=data.get(i).get(2)%>" name="rate">
			    			<input type="hidden" value="<%=data.get(i).get(3)%>" name="img">
			    			<input type=submit value="select">
			    			</form>
						</div>
					</div>
				
<%
				}
			}
		}
		else
		{
			response.sendRedirect("Landing.jsp");
		}
%>
</div>
</body>
</html>
