<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../CSS/date.css">
<link rel="stylesheet" href="../CSS/back.css">
<title>Insert title here</title>
</head>
<body>
 <header>
        <ul class="back">    
            <li><a href="HcustomerHome.jsp"> Go Back </a></li>
        </ul>
    <div class="date">
      <form method="POST" action="HcustomerBookingDetails.jsp" >
        <h1>Hiring date</h1>
          <a1>Equipment type:</a1>
          <select class="l" name="type">
              <option>Excavator</option>
              <option>Trencher</option>
              <option>Bulldozer</option>
              <option>Backhoe</option>
              <option>Rollers</option>
          </select><br>
          <a1>Start Date: </a1>
          <input type="date" placeholder="dd/mm/yyyy" class="txtb" name="sdate" required>
          <a1>End Date:</a1>  
          <input type="date" placeholder="dd/mm/yyyy" class="txtb" name="edate" required>
          <input type="submit" value="Continue" class="btn" name="BtnSubmit">
      </form>
    </div>
  </header>
<%!
	int id = 0;
	String sdate,edate,type;
%>
<%
	if(request.getParameter("BtnSubmit")!=null)
	{
		HttpSession sn = request.getSession();
		if(sn.getAttribute("pkey")!=null)
			id = (Integer)sn.getAttribute("pkey");
		if(id == 0)
		{
			response.sendRedirect("Landing.jsp");
		}
		else
		{
			type = request.getParameter("type");
			sdate = request.getParameter("sdate");
			edate = request.getParameter("edate");
			sn.setAttribute("type", type);
			sn.setAttribute("sdate", sdate);
			sn.setAttribute("edate", edate);
			response.sendRedirect("HcustomerEquipDisplay.jsp");
		}
	}
%>
</body>
</html>