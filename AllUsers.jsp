<%@page import="com.unknown.GlobalFunction"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.util.DbConnection"%>
<%@page import="java.sql.Connection"%> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE HTML>
<html>
<head>
<title>Social Site</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Digital_Host Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<script src="js/jquery.min.js"></script>
<link href="css/style.css" rel='stylesheet' type='text/css' />
<link href='http://fonts.googleapis.com/css?family=Slabo+27px' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="fonts/css/font-awesome.min.css">
<style>
table, th, td {
  border: 1px solid black;
  border-radius: 10px;
}
th, td {
  padding-top: 5px;
  padding-bottom: 15px;
  padding-left: 25px;
  padding-right: 35px;
  border-style: ridge;
  font-size: 18px;
}
tr:nth-child(even) {
  background-color: rgba(150, 212, 212, 0.4);
}

th:nth-child(even),td:nth-child(even) {
  background-color: rgba(150, 212, 212, 0.4);
}
</style> 
</head>
<body>
<%
if(request.getParameter("done")!=null){
	   out.println("<script>alert('Congratulations.......Logged In of Admin Successful.'); </script>"); 
	}
%>
   <div class="header">
      <div class="container">	 			
		<div class="logo">
		  <h2><a href="adminhome.jsp"><b><u>Social Site</u></b></a></h2>
		</div>	
		<div class="header_bottom_right">			
	        <div class="h_menu4">
				<a class="toggleMenu" href="#">Menu</a>
				<ul class="nav">
					<li><a href="adminhome.jsp">Home</a></li>
					<li class="active"><a href="AllUsers.html">Our Clients</a></li>
					<li><a href="addapp.jsp">Add Data</a></li>
					<li><a href="#">About</a></li>
					<li><a href="index.jsp?logout">Logout</a></li>
				</ul>
				<script type="text/javascript" src="js/nav.js"></script>
	          </div>
              <div class="clearfix"> </div>
       		</div>
          </div>
       </div>
      
       <div class="services_overview">
        <div class="container"><br>
       		<h3 class="m_1">Welcome Admin........!</h3>
       		<div class="col-md-4 service_grid">
       			<img src="imgs/twitter2.png" class="img-responsive" style="height:230px;" alt=""/>
       			<h4>On the other hand, we denounce</h4>
       		</div>
       		<div class="col-md-4 service_grid">
       			<img src="imgs/twitter1.png" class="img-responsive" style="height:230px;" alt=""/>
       			<h4>On the other hand, we denounce</h4>
       		</div>
       		<div class="col-md-4 service_grid">
       			<img src="imgs/social3.jpg" class="img-responsive" style="height:230px;" alt=""/>
       			<h4>On the other hand, we denounce</h4>
       		</div>
       	</div>
       </div> 		
    
       <div class="clients text-center">
					<div align="center">
	       		<h2><i class="fa fa-users">Users Information...!</i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	       		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	       		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	       		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	       		&nbsp;&nbsp; Some of our satisfied clients include...!</h2>
	       		<table border="5" cellpadding="5" cellspacing="8">
					<tr align="center">
						<th>Sr.No.</th>
						<th>First Name</th>
						<th>Last Name</th>
						<th>Gender</th>
						<th>Email</th>
						<th>Mobile</th>
						<th>address</th>
						<th>Fields</th>
					</tr>
					<%
					int srno=1;
					Connection con = DbConnection.getConnection();
					PreparedStatement ps = con.prepareStatement("select * from user_info");
					ResultSet rs = ps.executeQuery();
					while(rs.next())
					{
						//String flag = rs.getString("flag");
						%>
						<tr align="center">
							<td><%=srno++ %></td>
							<td><%=rs.getString("fname") %></td>
							<td><%=rs.getString("lname") %></td>
							<td><%=rs.getString("gender") %></td>
							<td><%=rs.getString("email") %></td>
							<td><%=rs.getString("mobile") %></td>
							<td><%=rs.getString("address") %></td>
							<td><%=rs.getString("studyingfields") %></td>
							
					<%
						}
					%>
					</tr>
					</table>
	       	</div>
       </div>

       <div class="footer">
       		<div class="container">
       		<!-- footer-grids -->
       		<div class="footer-grids">
	       		<div class="col-md-3 footer-grid">
	       			<h3>Plans and Services</h3>
	       			<ul>
	       				<li><a href="#">Dedicated Servers</a></li>
	       				<li><a href="#">VPS Servers</a></li>
	       				<li><a href="#">Shared Hosting</a></li>
	       				<li><a href="#">Colocation</a></li>
	       			</ul>
	       		</div>
	       		<div class="col-md-3 footer-grid">
	       			<h3>Customer Services</h3>
	       			<ul>
	       				<li><a href="#">Contact Us</a></li>
	       				<li><a href="#">Returns</a></li>
	       				<li><a href="#">Site Map</a></li>
	       			</ul>
	       		</div>
	       		<div class="col-md-3 footer-grid">
	       			<h3>Extras</h3>
	       			<ul>
	       				<li><a href="#">Brands</a></li>
	       				<li><a href="#">Specials</a></li>
	       				<li><a href="#">Vouchers</a></li>
	       			</ul>
	       		</div>
	       		<div class="col-md-3 footer-grid">
	       			<h3>My Account</h3>
	       			<ul>
	       				<li><a href="#">Wish List</a></li>
	       				<li><a href="#">Newsletter</a></li>
	       			</ul>
	       			<ul class="socials">
	                 <li><a href="#"><i class="fa fb fa-facebook"></i></a></li>
	                 <li><a href="#"><i class="fa tw fa-twitter"></i></a></li>
	                 <li><a href="#"><i class="fa tw fa-google-plus"></i></a></li>
              		</ul>
	       		</div>
	       		<div class="clearfix"> </div>
       		</div>
       		<div class="copy">
	       			<p align="center">&copy; 2022 Literate. All rights reserved | Design by <a href="#">Student</a></p>
	       		</div>
       		</div>
       </div>
</body>
</html>
