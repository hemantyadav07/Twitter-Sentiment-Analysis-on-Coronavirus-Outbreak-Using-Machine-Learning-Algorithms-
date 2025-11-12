<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.util.DbConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.unknown.GlobalFunction"%>
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
</head>
<body>
<%
if(request.getParameter("status")!=null){
	String stas = request.getParameter("status");
	   out.println("<script>alert('Successfully ..'); </script>"); 
	}
%>

<%
 int userids = Integer.parseInt((String)session.getAttribute("userid"));
 GlobalFunction GF = new GlobalFunction();
 int reqCount = GF.getRequestCount(userids);
 int nofiCount = GF.getNotificationCount(userids);
 int groupCount = GF.getGroupCount(userids);
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
					<li><a href="home.jsp">Home</a></li>
					<li class="active"><a href="Notification.jsp" class="service">Notification <% out.println("<span style='color:blue'> ("+nofiCount+")</span>"); %></a></li>
          			<li><a href="TextAnalysis.jsp" class="clients">Text Analysis</a></li>
          			<li><a href="Account.jsp" class="clients">Account</a></li>
          			<li><a href="index.jsp?logout" class="contact">Logout</a></li>
					<li><a href="support.html">Support</a></li>
				</ul>
				<script type="text/javascript" src="js/nav.js"></script>
	          </div>
              <div class="clearfix"> </div>
       		</div>
          </div>
       </div>		
    
       <div class="clients text-center">
					<div align="center">
      		<h2 class="welcome_text">Welcome <%=session.getAttribute("fname") %></h2>
      		<div align="center" style="margin-center: 50px;">
       		<img  src="profilepicture/<%=session.getAttribute("ppicture") %>" width="150" height="150" style="border-radius: 100%;"> 
			</div>
						<div class="col-xs-12">
						<div align="center">
						<h2>
						 <span>Friend Search List</span>
						</h2>
						</div>
					<%
					Thread.sleep(5000);
					String SearchkeyWord = request.getParameter("friendNameSearch");
					int userid = Integer.parseInt((String)session.getAttribute("userid"));
					Connection con =DbConnection.getConnection();
					Statement st = con.createStatement();
					
					String sql = "select * from user_info where id!="+userid+" and (fname LIKE '%"+SearchkeyWord+"%' or lname LIKE '%"+SearchkeyWord+"%' or concat(fname,' ',lname) LIKE '%"+SearchkeyWord+"%')";
					ResultSet rs = st.executeQuery(sql);
					while(rs.next()){
					
					%>
					<form action="SendFriendRequest" method="post">
					<div class="friendList" style="border-bottom: 1px solid #ccc; width: 100%; margin-top:30px;margin-center:10px;">
						<div style="width: 10%; height: 100px; border: 0px solid #ccc; margin-center:10px;">
							<img src="profilepicture/<%= rs.getString("ppicture") %>" style="width: 100%; height: 100%">
						</div>
						<div style="width: 80%; height: 50px; border: 0px solid #ccc; margin-center:10px;">
							<p style="margin-center: 10px">
							<input type="hidden" name="RequestToid" value="<%= rs.getString("id") %>">
								<span style="color:red; font-weight: bold"><%= rs.getString("fname")+" "+rs.getString("lname") %></span> <br><span style=" font-weight: bold"> <%= rs.getString("address") %></span>
							</p>
							<%
							boolean isFriend = GF.isFriend(userid, rs.getInt("id"));
							boolean isRequestSend=GF.isRequestSend(userid, rs.getInt("id"));
							if(isFriend==true){
							%>
							<span style="margin-center:10px" class="button">Already Friend</span>
							
							<a href="SendFriendRequest?friendid=<%= rs.getString("id") %>" class="buttonReject" style="width: 80px; text-align: center;">Unfriend</a>
							<%}else if(isRequestSend==true){
								%>
								<span style="margin-center:10px" >Already Send Friend Request</span>
								<%}else{
								%>
								<input style="margin-center:10px; background: #ffcccc;" type="submit" value="Send Friend Request">
							<%} %>
						</div>

					</div>
					</form>
					
					<%
					}
					%>
			
				</div>
				<div class="clr"></div>
				</div>
			</div><br></br><br></br><hr>
  
  
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
