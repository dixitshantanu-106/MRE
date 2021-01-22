<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import = "model.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="../JS/jquery-2.1.3.min.js"></script>
<script src="../JS/jquery.validate.js"></script>
<script src="../JS/validate.js"></script>
<link href="../CSS/landing.css" rel="stylesheet" type="text/css">
<link href="../CSS/home.css" rel="stylesheet" type="text/css">
</head>
<body>
<header>
        <div id="con">
            <ul class="main-nav">
                <li><a href="#"><button onclick="document.getElementById('terms').style.display='block'" style="width:auto;">ABOUT</button></a></li>
                <li><a href="#"><button>REGISTER</button></a>
                    <ul><a href="#"><button onclick="document.getElementById('rent1').style.display='block'" style="width:auto;">RENTING</button></a></ul>
                    <ul><a href="#"><button onclick="document.getElementById('hire1').style.display='block'" style="width:auto;">HIRING</button></a></ul>
                </li>
                <li><a href="#"><button>LOGIN</button></a>
                    <ul><a href="#"><button onclick="document.getElementById('rent').style.display='block'" style="width:auto;">RENTING</button></a></ul>
                    <ul><a href="#"><button onclick="document.getElementById('hire').style.display='block'" style="width:auto;">HIRING</button></a></ul>
                </li>
            </ul>
        </div>
         
        <!-- sign up for renting -->   
            
        <div id="rent1" class="modal">
          <form class="modal-content animate" action="" id = "Rregister">
            <div class="imgcontainer">
              <span onclick="document.getElementById('rent1').style.display='none'" class="close" title="Close Modal">&times;</span>
            </div>
            <div class="container">
                <h2>Sign Up</h2>
              <h4>Please fill in this form to create a renting account.</h4>
              <hr>
              <label for="name"><b>Name:</b></label>
              <input type="text" placeholder="Name" name="name" required>
				<br>
              <label for="phn"><b>Mobile No.:</b></label>
              <input type="number" placeholder="Mobile No." name="phn" required>
				<br>
              <label for="addr"><b>Address:</b></label>
              <input type="text" placeholder="Address" name="addr" required>
				<br>
              <label for="bname"><b>Bank Name:</b></label>
              <input type="text" placeholder="Bank Name" name="bname" required>
				<br>
              <label for="branch"><b>Branch:</b></label>
              <input type="text" placeholder="Branch" name="branch" required>
				<br>
              <label for="acno"><b>Account No.:</b></label>
              <input type="number" placeholder="Account No." name="acc" required>
				<br>
              <label for="ifsc"><b>IFSC:</b></label>
              <input type="text" placeholder="IFSC" name="ifsc" required>
				<br>
              <label for="psw"><b>Password</b></label>
              <input type="password" placeholder="Enter Password" name="pass" id="pass"required>
				<br>
              <label for="cnfpsw"><b>Confirm Password</b></label>
              <input type="password" placeholder="Confirm Password" name="cpass" required>
				<br>
              <p>By creating an account you agree to our Terms & Conditions</p>
              <div class="clearfix">
                <button type="button" onclick="document.getElementById('rent1').style.display='none'" class="cancelbtn1">Cancel</button>
                <input type="submit" class="log1" value="Sign Up" name=rcustsign>
              </div>
            </div>
          </form>
        </div>
    
        <!-- sign up for hiring -->
        
        <div id="hire1" class="modal">
          <form class="modal-content animate" action="" id="Hregister">
            <div class="imgcontainer">
              <span onclick="document.getElementById('hire1').style.display='none'" class="close" title="Close Modal">&times;</span>
            </div>
            <div class="container">
              <h2>Sign Up</h2>
              <h4>Please fill in this form to create a hiring account.</h4>
              <hr>
              <label for="name"><b>Name:</b></label>
              <input type="text" placeholder="Name" name="name" required>
				<br>
              <label for="phn"><b>Mobile No.:</b></label>
              <input type="number" placeholder="Mobile No." name="phn" required>
				<br>
               <b>Location :</b>
                  <select class="l" name="loc">
                      <option>Pune</option>
                      <option>Mumbai</option>
                      <option>Nagpur</option>
                      <option>Nashik</option>
					  <option>Thane</option>
                  </select>
			  <label for="addr"><b>Address:</b></label>
              <input type="text" placeholder="Address" name="addr" required>
                <br>
              <label for="psw"><b>Password:</b></label>
              <input type="password" placeholder="Enter Password" name="pass" id="ppass"required>
				<br>
              <label for="cnfpsw"><b>Confirm Password:</b></label>
              <input type="password" placeholder="Confirm Password" name="cpass" required>
				<br>
              <p>By creating an account you agree to our Terms & Conditions</p>
              <div class="clearfix">
                <button type="button" onclick="document.getElementById('hire1').style.display='none'" class="cancelbtn1">Cancel</button>
                <input type="submit" class="log1" value="Sign Up" name=hcustsign>
              </div>
            </div>
          </form>
        </div>

            
        
        <!-- login for renting -->
            
        <div id="rent" class="modal">
          <form class="modal-content animate" action="" method="post">
            <div class="imgcontainer">
              <span onclick="document.getElementById('rent').style.display='none'" class="close" title="Close Modal">&times;</span>
              
            </div>

            <div class="container">
                <h2>Login</h2>
              <label for="phn"><b>Mobile No.</b></label>
              <input type="number" placeholder="Mobile No." name="phn" required>

              <label for="psw"><b>Password</b></label>
              <input type="password" placeholder="Enter Password" name="pass" required>

              <input type="submit" value="Login" class="log" name="rcustlog">
              <label>
                <input type="checkbox" checked="checked" name="remember"> Remember me
              </label>
            </div>

            <div class="container" style="background-color:#f1f1f1">
              <button type="button" onclick="document.getElementById('rent').style.display='none'" class="cancelbtn">Cancel</button>
              <span class="psw">Forgot <a href="#">password?</a></span>
            </div>
          </form>
        </div>

        <!-- login for hiring -->
            
        <div id="hire" class="modal">
          <form class="modal-content animate" action="" method="post">
            <div class="imgcontainer">
              <span onclick="document.getElementById('hire').style.display='none'" class="close" title="Close Modal">&times;</span>
            </div>

            <div class="container">
              <h2>Login</h2>
              <label for="phn"><b>Mobile No.</b></label>
              <input type="number" placeholder="Mobile No." name="phn" required>

              <label for="psw"><b>Password</b></label>
              <input type="password" placeholder="Enter Password" name="pass" required>

              <input type="submit" value="Login" class="log" name="hcustlog">
              <label>
                <input type="checkbox" checked="checked" name="remember"> Remember me
              </label>
            </div>

            <div class="container" style="background-color:#f1f1f1">
              <button type="button" onclick="document.getElementById('hire').style.display='none'" class="cancelbtn">Cancel</button>
              <span class="psw">Forgot <a href="#">password?</a></span>
            </div>
          </form>
        </div>
        
        <!-- Terms and conditions -->
            
        <div id="terms" class="modal">
          <form class="modal-content1 animate">
            <div class="imgcontainer">
              <span onclick="document.getElementById('terms').style.display='none'" class="close" title="Close Modal">&times;</span>
            </div>
            <div class="container">
                <t1><b>Terms & Conditions:</b></t1>
                <p>After hiring any damage caused to the vechile not our responsibility.</p>
            </div>
            
            <div class="container">
                <t1><b>About Us:</b></t1>
                <p><a href="homepage.html">myrentalequipment.in</a> is a website developed for easy hiring and renting of construction equiment.</p>
            </div>
          </form>
        </div> 
        
            
<script>
// Get the modal
var modal = document.getElementById('rent','hire');


// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
</script>

            <div>
    <h1>Welcome</h1>
                <i><h3>myrentalequipment.in</h3></i>
            </div>
            <div>
            <h6>Welcome to  myrentalequipment.in join us by registering on our website, before registering please read the terms and conditions.</h6>
                </div>
        </header>
<%
	if(request.getParameter("rcustsign")!=null)
	{
		String name = request.getParameter("name");
    	long phn = Long.parseLong(request.getParameter("phn"));
    	String address = request.getParameter("addr");
    	String bname = request.getParameter("bname");
    	String branch = request.getParameter("branch");
    	long accno = Long.parseLong(request.getParameter("acc"));
    	String ifsc = request.getParameter("ifsc");
    	String password = request.getParameter("pass");
		Rcustomer rc = new Rcustomer(name,address,password,bname,branch,ifsc,phn,accno);
		if(rc.setter())
		{
			System.out.println("Details inserted successfully");
			response.sendRedirect("RcustomerHome.jsp");
		}
	}
	if(request.getParameter("hcustsign")!=null)
	{
		String name = request.getParameter("name");
    	long phn = Long.parseLong(request.getParameter("phn"));
    	String address = request.getParameter("addr");
    	String location = request.getParameter("loc");
    	String password = request.getParameter("pass");
    	Hcustomer hc = new Hcustomer(name, address, location, password, phn);
    	if(hc.setter())
    	{
			System.out.println("Details inserted successfully");
			response.sendRedirect("HcustomerHome.jsp");
    	}
	}
	if(request.getParameter("rcustlog")!=null)
	{
		long phn = Long.parseLong(request.getParameter("phn"));
		String password = request.getParameter("pass");
		Rcustomer rc = new Rcustomer();
		int rcid = rc.getLogin(phn, password);
		System.out.println(rcid);
		if(rcid != 0)
		{			
			HttpSession sn = request.getSession();
			sn.setAttribute("pkey",rcid);
			response.sendRedirect("RcustomerHome.jsp");
		}
	}
	if(request.getParameter("hcustlog")!=null)
	{
		long phn = Long.parseLong(request.getParameter("phn"));
		String password = request.getParameter("pass");
		Hcustomer hc = new Hcustomer();
		int hcid = hc.getLogin(phn, password);
		if(hcid != 0)
		{
			HttpSession sn = request.getSession();
			sn.setAttribute("pkey", hcid);
			response.sendRedirect("HcustomerHome.jsp");
		}
	}
%>
</body>
</html>