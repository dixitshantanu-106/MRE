<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ page import="model.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Upload</title>
	<script src="../JS/imageurl.js"></script>
    <link rel="stylesheet" href="../CSS/upload.css">
    <link rel="stylesheet" href="../CSS.back.css">
    </head>
    <body>
        <header>
        <div class="up">
            <form action="AddEquipmentPhoto.jsp" method="POST">
            <h1>Upload equipment image</h1>
            <input class="no" type="file" id="file" name="image"  onchange="encodeImagetoBase64(this)">
            <label for="file">Select image</label>
			<input type=text hidden name=img id = img value="">
            <input type="submit" class="upload-btn" value="UPLOAD">
            </form>
        </div>
        </header>
        <script type="text/javascript">
   			function encodeImagetoBase64(element) 
   			{
	  			var file = element.files[0];
				var reader = new FileReader();
	  			reader.onloadend = function() 
	  			{
	    			$("#img").attr("value",reader.result);
				};		
	  			reader.readAsDataURL(file);
			}
		</script>
		<%!
	String fname;
	int id = 0;
%>
<%
	if(request.getMethod().equals("POST"))
		
	{
		HttpSession sn = request.getSession();
		if(sn.getAttribute("pkey")!=null)
			id = (Integer)(sn.getAttribute("eid"));
		if(id == 0)
		{
			response.sendRedirect("AddEquipment.jsp");
		}
		else
		{
			System.out.println(id);
			Equip eq = new Equip();
			fname = request.getParameter("img");
			if(eq.setImg(id, fname))
			{
				System.out.println("IMG URL inserted Successfully");
				response.sendRedirect("RcustomerHome.jsp");
			}
		}	
	}
%>
    </body>
</html>