<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "model.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"><html>
  <head>
    <title></title>
    <link rel="stylesheet" href="../CSS/equip.css">
    <link rel="stylesheet" href="../CSS/logout.css">
    <link rel="stylesheet" href="../CSS/back.css"> 
  </head>
  <body>
      <header>
          <ul class="back">    
            <li><a href="RcustomerHome.jsp"> Go Back </a></li>
        </ul>
             
    <div class="equipd">
      <form class="" action="AddEquipment.jsp" method="post">
        <h1>Enter equipment details</h1>
        <input type="text" placeholder="Equipment Name" class="txtb" name="name">
          <a1>Equipment type:</a1> <select class="l" name="type">
              <option>Excavator</option>
              <option>Bulldozer</option>
              <option>Backhoe</option>
              <option>Trencher</option>
              <option>Loader</option>
          </select>
           <a1>Location :</a1>
          <select class="l" name="loc">
              <option>Pune</option>
              <option>Mumbai</option>
              <option>Nagpur</option>
              <option>Solapur</option>
          </select>
        <input type="number" min="1" placeholder="Rent rate" class="txtb" name="rate">
        <input type="submit" value="Continue" class="signup-btn" name="btnSubmit">
      </form>
    </div>
          </div>
          </header>
<%!
	String name,type,location;
	int rate,rcid = 0;
%>
<%
	if(request.getParameter("btnSubmit")!= null)
	{
		name = request.getParameter("name");
		type = request.getParameter("type");
		location = request.getParameter("loc");
		rate = Integer.parseInt(request.getParameter("rate"));
		HttpSession sn = request.getSession();
		if(sn.getAttribute("pkey")!=null)	
			rcid = (Integer)(sn.getAttribute("pkey"));
		if(rcid == 0)
		{
			response.sendRedirect("Landing.jsp");
		}
		else
		{
			Equip eq = new Equip(rcid,name,type,location,rate);
			if(eq.setter())
			{
				int eid = eq.getId();
				System.out.println("Equipment details inserted successfully");
				sn.setAttribute("eid",eid);
				response.sendRedirect("AddEquipmentPhoto.jsp");
			}
		}
	}
%> 
  </body>
</html>
