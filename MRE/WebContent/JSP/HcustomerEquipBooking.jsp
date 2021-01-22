<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="model.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Product Details</title>
    <link rel="stylesheet" href="../CSS/bootstrap.min.css">
    <script src="../JS/jquery-3.3.1.slim.min.js"></script>
    <script src="../JS/popper.min.js"></script>
    <script src="../JS/bootstrap.min.js"></script>
    <link href="../CSS/style.css" rel="stylesheet">
</head>
<body>
<%!
	int hid,eid,rate;
	String name,img,sdate,edate;
	int amnt;
%>   
<%
	HttpSession sn = request.getSession();
	if((sn.getAttribute("pkey")!=null) && (request.getParameter("eid"))!=null)
	{		
		hid = (Integer)sn.getAttribute("pkey");
		sdate = (String)sn.getAttribute("sdate");
		edate = (String)sn.getAttribute("edate");
		eid = Integer.parseInt(request.getParameter("eid"));
		sn.setAttribute("eid", eid);
		name = request.getParameter("name");
		sn.setAttribute("name", name);
		rate = Integer.parseInt(request.getParameter("rate"));
		img = request.getParameter("img");
		sn.setAttribute("img", img);
		Cust_Equip ce = new Cust_Equip(eid,hid,sdate,edate);
		ce.setter();
		ce.getAmnt();
		amnt = ce.amnt;
		sn.setAttribute("amnt", amnt);
	}
	else
		response.sendRedirect("Landing.jsp");
%>
    <ul class="back">    
            <li><a href="HcustomerBookingDetails.jsp"> Go Back </a></li>
        </ul>
    <div class="container">
    <div class="row">
        <div class="col-md-5">
        <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
    <div class="carousel-inner">
    <div class="carousel-item active">
      <img class="d-block w-100" src="<%=img%>" alt="First slide">
    </div>
    </div>
</div>
        </div>
        <div class="col-md-7">
            <h2><%=name%></h2>
            <p>Equipment Code: <%=eid%></p>
            <p class="price">Rent: Rs.<%=rate%></p>
            <form action="HcustomerEquipBooked.jsp" method="POST">
            <input class="rent" type="submit" value="Book" name="BtnSubmit">
            </form>
        </div>
    </div>
    </div>
</body>
</html>