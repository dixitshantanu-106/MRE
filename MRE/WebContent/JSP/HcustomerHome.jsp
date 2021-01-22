<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title></title>
    <link rel="stylesheet" href="../CSS/rbook.css">
    <link rel="stylesheet" href="../CSS/logout.css">
    <link rel="stylesheet" href="../CSS/back.css"> 
  </head>
  <body>
      <header>
          <div class="row">
            <form>
                <ul class="main-nav">    
                    <li><a href="HcustomerEdit.jsp"> EDIT </a></li>
                    <input type="submit" value="LOGOUT" name="LOGOUT">
                </ul>
            </form>
          </div>
         
          <div class="button2">
              <a href="HcustomerBookingDetails.jsp" class="btn btn-two"> HIRE</a>
              <a href="HcustomerCancelBooking.jsp" class="btn btn-two"> CANCEL BOOKING</a>
          </div>
      </header>      
<%
	if(request.getParameter("LOGOUT")!= null)
	{
 		HttpSession sn = request.getSession();
		sn.invalidate();
  		response.sendRedirect("Landing.jsp");
  	}
%>
  </body>
</html>
