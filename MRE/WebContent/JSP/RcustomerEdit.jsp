<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "model.*" %>
<!DOCTYPE html>
<html>
<head>
	<title>Rent Edit</title>
	<link href="../CSS/rentedit.css" rel="stylesheet">
    <link href="../CSS/back.css" rel="stylesheet">

</head>
<body>
<div class="my">
                <ul class="back">    
                    <li><a href=""> Go Back </a></li>
                </ul>
<div class="form-box">
                    <a1>Edit your profile</a1>
    <div class="button-box">
        <div id="btn"></div>
        <button type="button" class="toggle-btn" onclick="left()">Personal</button>
        <button type="button" class="toggle-btn" onclick="right()">Bank</button>
    </div>
    
    <form id="left" class="input-group">

                <input type="checkbox" name="phnchk"> Phone No.
                <input type="number" class="input-field" placeholder="Phone No." name="phn" >
                <input type="checkbox" name="addchk"> Address
                <input type="text" class="input-field" placeholder="Address" name="addr">
                <input type="checkbox" name="passchk"> Password
                <input type="password" class="input-field" placeholder="Password" name="" >
                <input type="password" class="input-field" placeholder="Confirm Password" name="pass">
                <button type="submit" class="submit-btn" name="PSubmit">Update</button>
    </form>
    <form id="right" class="input-group">
                <input type="checkbox" name="bnchk" > Bank Name
                <input type="text" class="input-field" placeholder="Bank Name" name="bank" >
                <input type="checkbox" name="brchk"> Branch
                <input type="text" class="input-field" placeholder="Branch" name="branch">
                <input type="checkbox" name="accnochk"> Account No.
                <input type="number" class="input-field" placeholder="Account No." name="acc">
                <input type="checkbox" name="ifscchk"> IFSC
                <input type="text" class="input-field" placeholder="IFSC" name="ifs">
                <button type="submit" class="submit-btn" name="BSubmit">Update</button>
    </form>
    </div>
</div>
    
    <script>
        var x = document.getElementById("left");
        var y = document.getElementById("right");
        var z = document.getElementById("btn");
        
        function right(){
            x.style.left="-400px";
            y.style.left="50px";
            z.style.left="110px";
        }
        
        function left(){
            x.style.left="50px";
            y.style.left="450px";
            z.style.left="0px";
        }
    </script>
    <%!
		String bname,address,branch,password,ifsc;
		long phn,accno;
		int rcid;
    %>
    <%
    	if(request.getParameter("PSubmit")!=null)
    	{
    		HttpSession sn = request.getSession();
    		if((Integer)sn.getAttribute("pkey") == null)
    		{
    			response.sendRedirect("Landing.jsp");
    		}
    		else
    		{
    			rcid = (Integer)sn.getAttribute("pkey");
    			Rcustomer rc = new Rcustomer();
    			
    			if(request.getParameter("phnchk")!=null)
    			{
    				phn = Long.parseLong(request.getParameter("phn"));
    				if(rc.updatePhn(rcid,phn))
    					System.out.println("Phone number updated successfully");
    			}
    			if(request.getParameter("addchk")!=null)
    			{
    				address = request.getParameter("addr");
    				if(rc.updateAddr(rcid,address))
    					System.out.println("Address updated successfully");
    			}
    			if(request.getParameter("passchk")!=null)
    			{
    				password = request.getParameter("pass");
    				if(rc.updatePass(rcid,password))
    					System.out.println("Password updated successfully");
    			}
    		}
    	}
    	else if(request.getParameter("BSubmit")!=null)
		{
			HttpSession sn = request.getSession();
			if((Integer)sn.getAttribute("pkey") == null)
			{
				response.sendRedirect("Landing.jsp");
			}
			else
			{
				rcid = (Integer)sn.getAttribute("pkey");
				Rcustomer rc = new Rcustomer();
				
				if(request.getParameter("bnchk")!=null)
				{
					bname = request.getParameter("bank");
					if(rc.updateBank(rcid,bname))
    					System.out.println("Bank Name updated successfully");
				}
				if(request.getParameter("brchk")!=null)
				{
					branch = request.getParameter("branch");
					if(rc.updateBranch(rcid,branch))
    					System.out.println("Branch updated successfully");
				}
				if(request.getParameter("accnochk")!=null)
				{
					accno = Long.parseLong(request.getParameter("acc"));
					if(rc.updateAcc(rcid,accno))
    					System.out.println("Account number updated successfully");
				}
				if(request.getParameter("ifscchk")!=null)
				{
					ifsc = request.getParameter("ifs");
					if(rc.updateIFSC(rcid,ifsc))
    					System.out.println("IFSC code updated successfully");
				}
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
