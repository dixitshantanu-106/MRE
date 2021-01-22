<html>
  <head>
    <title></title>
    <link rel="stylesheet" href="../CSS/rbook.css">
    <link rel="stylesheet" href="../CSS/logout.css">
    <link rel="stylesheet" href="../CSS/back.css"> 
  </head>
  <body>
      <header>
        <ul class="back">    
            <li><a href=""> Go Back </a></li>
        </ul>
          <div class="row">
              <form>
                <ul class="main-nav">    
                    <li><a href="RcustomerEdit.jsp"> EDIT </a></li>
                    <input type="submit" value="LOGOUT" name="LOGOUT">
                </ul>
              </form>
          </div>
         
          <div class="button">
              <a href="AddEquipment.jsp" class="btn btn-two"> RENT </a>
              <a href="RcustomerCancelRenting.jsp" class="btn btn-two"> CANCEL</a>
          </div>
      </header>
<%
	HttpSession sn = request.getSession();
	if(sn.getAttribute("pkey") == null)
		response.sendRedirect("Landing.jsp");
    if(request.getParameter("LOGOUT")!= null)
  	{
  		
  		sn.invalidate();
  		response.sendRedirect("Landing.jsp");
  	}    
%>
  </body>
</html>