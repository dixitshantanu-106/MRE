<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ page import="model.*"  %>
    <%@ page import="java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="../CSS/display.css">
</head>
<body>
<ul class="back">    
            <li><a href="RcustomerHome.jsp"> Go Back </a></li>
        </ul>
<%!
	int rid,count,i,eid;
%>
<%
	HttpSession sn = request.getSession();
	if(sn.getAttribute("pkey") == null)
		response.sendRedirect("Landing.jsp");
	else
	{
		rid = (Integer)sn.getAttribute("pkey");
		Equip eq = new Equip();
		count = eq.getCountId(rid);
		if(count != 0)
		{	
			ArrayList<ArrayList<String>> data = new ArrayList<ArrayList<String>>();
			data = eq.getDetails(rid, count);
			for(i = 0;i < count; i++)
			{
				data.get(i).add(eq.getImg(Integer.parseInt(data.get(i).get(0))));
			}
			%>
				<div class=main>
			<% 
							for(i = 0;i < count;i++)
							{
			%>					
					
								<div class=card>
									<div class=image>
										<img src=<%=data.get(i).get(4)%>>
									</div>
									<div class=title>
						 				<h1><%=data.get(i).get(1)%></h1>
									</div>
									<div class=des>
										<p>Type:<%=data.get(i).get(3)%></p>
						 				<p>Rs:<%=data.get(i).get(2)%></p>
						 				<form method=POST action="RcustomerEquipCancelled.jsp">
						    			<input type="hidden" value="<%=data.get(i).get(0)%>" name="eid">
						    			<input type=submit value="delete" name="delete">
						    			</form>
									</div>
								</div>
							
			<%
							}
		}
	}
%>
</body>
</html>