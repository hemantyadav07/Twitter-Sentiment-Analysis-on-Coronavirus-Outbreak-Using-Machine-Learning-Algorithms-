<%@page import="com.sun.java.swing.plaf.windows.resources.windows"%>
<%@page import="com.unknown.DateDifferentExample"%>
<%@page import="java.sql.Statement"%>
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
</head>
<body>
<%

if(request.getParameter("status")!=null){
	String stas = request.getParameter("status");
	   out.println("<script>alert('Successfully ..'); </script>"); 
	}
%>
 <%@page import="com.unknown.GlobalFunction"%>
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
					<li class="active"><a href="RequestList.jsp">Friend List</a></li>
					<%-- <li><a href="Notification.jsp" class="service">Notification <% out.println("<span style='color:blue'> ("+nofiCount+")</span>"); %></a></li> --%>
          			<li><a href="TextAnalysis.jsp" class="clients">Sentiment Analysis</a></li>
          			<li><a href="EmotionAnalysis.jsp" class="clients">Emotion Analysis</a></li>
          			<li><a href="https://covid19.who.int/" class="clients">Covid19</a></li>
          			<li><a href="Account.jsp" class="clients">Account</a></li>
          			<li><a href="index.jsp?logout" class="contact">Logout</a></li>
		        </ul>
			<script type="text/javascript" src="js/nav.js"></script>
			</div>
            <div class="clearfix"> </div>
       		</div>
          </div>
       </div>	
       
       <div class="about">
          <div class="container">
        	 <div class="about_top">
	            <div class="col-md-12">
	        	  		<!-- <h1>Who We are</h1> -->
	        	  		<div class="about_grid">
	        	  	<div class="col-md-12 about_grid-center">
	        	  	
    <div class="twitter_area">
      <div class="twitter">
      <p style="padding:34px 0 0 0">
      <div class="searchform">
         <%@include file="FriendSearchForm.jsp" %></p>
      </div>
    </div>
  </div>
     
  <div class="bodybg">
    <div class="welcometext_area">
     <%--  <p class="welcome_text">Welcome <%=session.getAttribute("fname") %></p> --%>
      
    </div>
    
    <div>
      
      <div class="selectarea">
         </div>
    </div>
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           <%@include file="logo.jsp" %>
      
      
      <div class="col-xs-12">
						<div align="center">
						<h2 align="center">
						 <span>Friend Request List</span>
						</h2>
						 </div>
						<br>
				
					<%
					//int userid = Integer.parseInt((String)session.getAttribute("userid"));
					
					Connection con =DbConnection.getConnection();
					Statement st = con.createStatement();
					Statement st1 = con.createStatement();
					String sql1 ="select * from friend_request where reqTo="+userid+" and Status='0'";
					ResultSet rs1 = st1.executeQuery(sql1);
					while(rs1.next()){
						int reqFrom = rs1.getInt("reqFrom");
						String sql = "select * from user_info where id ="+reqFrom;
						ResultSet rs = st.executeQuery(sql);
							while(rs.next()){
							
							%>
							<form action="SendFriendRequest" method="post">
							<div class="friendList" style="border-bottom: 1px solid #ccc; width: 100%; margin-top:30px;float:left">
								<div style="width: 10%; height: 100px; border: 0px solid #ccc; float: left">
									<img src="profilepicture/<%= rs.getString("ppicture") %>" style="width: 100%; height: 100%">
								</div>
								<div style="width: 80%; height: 50px; border: 0px solid #ccc; float: left">
									<p style="margin-left: 30px; ">
									<input type="hidden" name="RequestToid" value="<%= rs.getString("id") %>">
										<span style="color:red; font-weight: bold; font-size:18px"><a href="Viewprofile.jsp?userid=<%= rs.getString("id") %>"><%= rs.getString("fname")+" "+rs.getString("lname") %></a></span> <br><span style=" font-weight: bold; font-size:18px"> <%= rs.getString("address") %></span>
									</p>
									<a href="RespondFriendRequest?Status=Accept&reqId=<%= rs1.getString("id") %>" style="margin-left:30px" class="button">Accept</a>
									<a href="RespondFriendRequest?Status=Reject&reqId=<%= rs1.getString("id") %>" style="margin-left:30px" class="buttonReject">Reject</a>
								</div>
		
							</div>
							</form>
					<%
					}
					}
								
					Statement st2 = con.createStatement();
					Statement st3 = con.createStatement();
					String sql2 ="select * from friend_request where reqFrom="+userid+" and Status='0'";
					ResultSet rs2 = st2.executeQuery(sql2);
					while(rs2.next()){
						int reqTo = rs2.getInt("reqTo");
						String sql = "select * from user_info where id ="+reqTo;
						ResultSet rs = st3.executeQuery(sql);
							while(rs.next()){
							
							%>
							<form action="SendFriendRequest" method="post">
							<div class="friendList" style="border-bottom: 1px solid #ccc; width: 100%; margin-top:30px;float:left">
								<div style="width: 10%; height: 100px; border: 0px solid #ccc; float: left">
									<img src="profilepicture/<%= rs.getString("ppicture") %>" style="width: 100%; height: 100%">
								</div>
								<div style="width: 80%; height: 50px; border: 0px solid #ccc; float: left">
									<p style="margin-left: 30px">
									<input type="hidden" name="RequestToid" value="<%= rs.getString("id") %>">
										<span style="color:green; font-weight: bold"><a href="Viewprofile.jsp?userid=<%= rs.getString("id") %>"><%= rs.getString("fname")+" "+rs.getString("lname") %></a></span> <br><span style=" font-weight: bold"> <%= rs.getString("address") %></span>
									</p>
									<%
									String status = rs2.getString("Status");
									if(status.equalsIgnoreCase("0")){
										out.println("<p style='margin-left: 30px; color:red'>Pending</p>");
									}else{
										
									}
									%>
								</div>
		
							</div>
							</form>
					<%
					}
					}
					%>
					<div class="clr"></div>
				</div>
				
				
				<div class="mainbar" style="margin-top:40px">
					<div class="article">
			<div align="center">
						<h2>
							<span>Friend List</span>
						</h2>
						</div>
						<br>
						
					</div>
					<%
					
					Statement stx = con.createStatement();
					Statement sty = con.createStatement();
					
					String sqlx ="select * from friend_list where friend_of="+userid;
					ResultSet rsx = stx.executeQuery(sqlx);
					while(rsx.next()){
						int friend_id = rsx.getInt("friend_id");
						String sql = "select * from user_info where id ="+friend_id;
						ResultSet rsy = sty.executeQuery(sql);
							while(rsy.next()){
							
							%>
							<form action="SendFriendRequest" method="post">
							<div class="friendList" style="border-bottom: 1px solid #ccc; width: 100%; margin-top:30px;float:left">
								<div style="width: 10%; height: 100px; border: 0px solid #ccc; float: left">
									<img src="profilepicture/<%= rsy.getString("ppicture") %>" style="width: 100%; height: 100%">
								</div>
								<div style="width: 80%; height: 50px; border: 0px solid #ccc; float: left">
									<p style="margin-left: 30px">
									<input type="hidden" name="RequestToid" value="<%= rsy.getString("id") %>">
										<span style="color:red; font-weight: bold"><a href="Viewprofile.jsp?userid=<%= rsy.getString("id") %>"><%= rsy.getString("fname")+" "+rsy.getString("lname") %></a></span> <br><span style=" font-weight: bold"> <%= rsy.getString("address") %></span>
									</p>
									
								</div>
		
							</div>
							</form>
					<%
					}
					}
					
					%>
					
					</div>
				<div class="clr"></div>
				</div></div></div></div></div></div>
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
					