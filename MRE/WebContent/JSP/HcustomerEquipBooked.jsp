<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <link rel="stylesheet" href="../CSS/bootstrap.min.4.1.3.css">
    <script src="../JS/slim.min.js"></script>
    <script src="../JS/popper.min.js"></script>
    <script src="../JS/bootstrap.min.4.1.3.js"></script>
    <link href="../CSS/sstyle.css" rel="stylesheet">
    <link rel="stylesheet" href="../CSS/pop.css">
        <script type="text/javascript">
                function PopUp(){ document.getElementById('ac-wrapper').style.display="none"; }
        </script>
</head>
<body>
        <div class="animate" id="ac-wrapper">
            <div id="popup">
                <center>
                    <h2>Equipment Booked Successfully</h2><br>
                    <button onClick="PopUp()" >OK</button>
                </center>
            </div>
        </div>
<%!
	int eid,hid,amnt;
	String sdate,edate,type,name,img;
%>
<%
	HttpSession sn = request.getSession();
	if((sn.getAttribute("pkey")!=null) && (sn.getAttribute("eid"))!=null)
	{
		eid = (Integer)sn.getAttribute("eid");
		hid = (Integer)sn.getAttribute("pkey");
		amnt = (Integer)sn.getAttribute("amnt");
		sdate = (String)sn.getAttribute("sdate");
		edate = (String)sn.getAttribute("edate");
		type = (String)sn.getAttribute("type");
		name = (String)sn.getAttribute("name");
		img = (String)sn.getAttribute("img");
	}
%>
    <ul class="home">    
        <li><a href="HcustomerHome.jsp"> <b>HOME</b> </a></li>
        </ul>
          <div class="row">
              <form>
                <ul class="main-nav">    
                    <input type="submit" value="LOGOUT" name="logout">
                </ul>
              </form>
          </div>
     <form action="HcustomerEquipBooked.jsp">
    <div class="container">
    <div class="row">
        <div class="col-md-5">
        <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
    <div class="carousel-inner">
    <div class="carousel-item active">
      <img class="d-block w-100" src="<%=img %>" alt="First slide">
    </div>
    </div>
    </form>
</div>
        
        </div>
        <div class="col-md-7">
            <h2>Hiring Equipment Details</h2>
            <p><b> Equipment Name: </b><%=name%></p>
            <p><b> Equipment Type: </b><%=type%></p>
            <p><b> Equipment Code: </b><%=eid%></p>
            <p class="price"><b>Rent: </b>Rs:<%=amnt%></p>
            <p><b> Booked From: </b><%=sdate%><b> To </b><%=edate%></p>
        </div>
    </div>
    </div>
<%
	if(request.getParameter("logout")!= null)
	{
		sn.invalidate();
		response.sendRedirect("Landing.jsp");
	}
%>
    
</body>
</html>