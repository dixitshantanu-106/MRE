<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
          <%@ page import="model.*"  %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="../CSS/cancel.css">
<title>Insert title here</title>
</head>
<body>
  <form action="RcustomerEquipCancelled.jsp">
                <ul class="main-nav">    
                    <input type="submit" value="LOGOUT" name="Lbutton">
                </ul>
              </form>
        
            <div class="box">
                <div class="button animate">

                  <h1>Your Equipment is cancelled successfully</h1>
                  <h2>Hire another equipment.</h2>
                   <a href="RcustomerHome.jsp"> HOME </a>

                </div>
            </div>
<%!
int eid;
%>
<%
HttpSession sn = request.getSession();
if(request.getParameter("Lbutton")!=null)
{
	sn.invalidate();
	response.sendRedirect("Landing.jsp");
}
if(request.getParameter("delete")!=null)
{
	eid = Integer.parseInt(request.getParameter("eid"));
	Equip eq = new Equip();
	if(eq.deleteEquip(eid))
	{
		System.out.println(+eid+" data deleted Successfully");
		response.sendRedirect("RcustomerEquipCancelled.jsp");
	}
}
%>
</body>
</html>