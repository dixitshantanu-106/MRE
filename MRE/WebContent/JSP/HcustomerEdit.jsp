<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "model.*" %>
<html>
<head>
	<title>Hire Edit</title>
	<script src="../JS/validate.js"></script>
	<link href="../CSS/rentedit.css" rel="stylesheet">
    <link href="../CSS/back.css" rel="stylesheet">

</head>
<body>
    <div class="my">
                <ul class="back">    
                    <li><a href="HcustomerHome.jsp"> Go Back </a></li>
                </ul>
        <div class="form-box1" >
                    <a2>Edit your profile</a2>
                <form  class="input-group1" id = "HcustomerEdit" action="HcustomerEdit.jsp">
                <input type="checkbox" name="phnchk"> Phone No.
                <input type="number" class="input-field" placeholder="Phone No." name="phn" >
                <input type="checkbox" name="addchk"> Address
                <input type="text" class="input-field" placeholder="Address" name="addr">
                <input type="checkbox" name="locchk"> Location:
                <select class="l" name="loc">
                    <option>Pune</option>
                    <option>Mumbai</option>
                    <option>Nagpur</option>
                    <option>Nashik</option>
					<option>Thane</option>
                </select><br>
                <input type="checkbox" name="passchk"> Password
                <input type="password" class="input-field" placeholder="Password" name="pass" id="hpass">
                <input type="password" class="input-field" placeholder="Confirm Password" name="cpass">
                <button type="submit" class="submit-btn" name="BtnSubmit">Update</button>
        </form>
        </div>
    </div>
     <%!
		String name,address,location,password;
		long phn;
		int hcid;
    %>
    <%
    	if(request.getParameter("BtnSubmit")!=null)
    	{
    		HttpSession sn = request.getSession();
    		if(sn.getAttribute("pkey") == null)
    		{
    			response.sendRedirect("Landing.jsp");
    		}
    		else
    		{
    			hcid = (Integer)sn.getAttribute("pkey");
    			Hcustomer hc = new Hcustomer();
    			
    			if(request.getParameter("phnchk")!=null)
    			{
    				phn = Long.parseLong(request.getParameter("phn"));
    				if(hc.updatePhn(hcid,phn))
    					System.out.println("Phone number updated successfully");
    			}
    			if(request.getParameter("addchk")!=null)
    			{
    				address = request.getParameter("addr");
    				if(hc.updateAddr(hcid,address))
    					System.out.println("Address updated successfully");
    			}
    			if(request.getParameter("locchk")!=null)
    			{
    				location = request.getParameter("loc");
    				if(hc.updateLoc(hcid,location))
    					System.out.println("Location updated successfully");
    			}
    			if(request.getParameter("passchk")!=null)
    			{
    				password = request.getParameter("pass");
    				if(hc.updatePass(hcid,password))
    					System.out.println("Password updated successfully");
    			}
    			response.sendRedirect("HcustomerHome.jsp");
    		}
    	}
    if(request.getParameter("LOGOUT")!= null)
  	{
  		HttpSession sn = request.getSession();
  		sn.invalidate();
  		response.sendRedirect("Landing.jsp");
  	}
    
    %>
</body>
</html>
