<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ page import="model.*"  %>
    <%@ page import="java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
     <link rel="stylesheet" href="../CSS/cancel.css">
 
</head>
<body>
<ul class="back">    
        <form action="HcustomerBookingCancelled.jsp">
                <ul class="main-nav">    
                    <input type="submit" value="LOGOUT" name="Lbutton">
                </ul>
              </form>
              <div class="box">
                <div class="button animate">

                  <h1>Your Equipment is cancelled successfully</h1>
                  <h2>Hire another equipment.</h2>
                   <a href="HcustomerHome.jsp"> HOME </a>

                </div>
            </div>
<%!
int eid,hid;
%>
<%
HttpSession sn = request.getSession();
if(request.getParameter("delete")!=null)
{
	Cust_Equip ce = new Cust_Equip();
	hid = (Integer)sn.getAttribute("pkey");
	eid = Integer.parseInt(request.getParameter("eid"));
	if(ce.deleteBooking(hid, eid))
	{
		System.out.println(hid+" and "+eid+" data deleted Successfully");
	}
}
if(request.getParameter("Lbutton")!=null)
{
	sn.invalidate();
	response.sendRedirect("Landing.jsp");
}

%>
