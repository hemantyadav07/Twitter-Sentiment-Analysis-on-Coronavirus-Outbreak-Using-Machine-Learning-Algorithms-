<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.*"%>
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
<style>
.button {
  padding: 10px 10px;
  font-size: 20px;
  text-align: center;
  cursor: pointer;
  outline: none;
  color: #898988f;
  background-color: yellow;
  border: none;
  border-radius: 15px;
  box-shadow: 0 9px #999;
  width: 50px;
  height: 50px;
}
.button:hover {background-color: #3e8e41}
.button:active {
  background-color: #3eabcd;
  box-shadow: 0 5px #666;
  transform: translateY(4px);
}
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
#s{
	border:none;
	color:#888888;
	background:url("images/searchBox.png") no-repeat;
	float:center;
	font-family:Arial,Helvetica,sans-serif;
	font-size:15px;
	height:36px;
	line-height:36px;
	margin-right:12px;
	outline:medium none;
	padding:0 0 0 35px;
	text-shadow:1px 1px 0 white;
	width:385px;
}
</style>
</head>
<body>
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
					<li><a href="RequestList.jsp">Friend List</a></li>
					<%-- <li><a href="Notification.jsp" class="service">Notification <% out.println("<span style='color:blue'> ("+nofiCount+")</span>"); %></a></li> --%>
          			<li><a href="TextAnalysis.jsp" class="clients">Sentiment Analysis</a></li>
          			<li class="active"><a href="EmotionAnalysis.jsp" class="clients">Emotion Analysis</a></li>
          			<li><a href="https://covid19.who.int/" class="clients">Covid19</a></li>
          			<li><a href="Account.jsp" class="clients">Account</a></li>
          			<li><a href="index.jsp?logout" class="contact">Logout</a></li>
					<!-- <li><a href="support.html">Support</a></li> -->
				</ul>
				<script type="text/javascript" src="js/nav.js"></script>
	          </div>
              <div class="clearfix"> </div>
       		</div>
          </div>
       </div>
     	
     		<%
            	String fname=(String)session.getAttribute("fname");     
            %>	
    
       <div class="clients text-center">
					<div align="center">
	       		<h3 class="m_1" align="left">Welcome <%=session.getAttribute("fname") %>..............!</h3>
	       		<form action="EmotionAnalysis" method="post">
				<table border="5" cellpadding="5" cellspacing="8"> 
				<tr>
					<td><label for="txt_Uname">UserName:</label></td>
				    <td><input type="text" readonly="readonly" class="form-control" name="txt_Uname" value="<%=fname %>" /></td>
			    </tr>
			    <tr>
					<td><label for="txt_Uname">Enter Comments</label></td>
				    <td><textarea id="w3mission" name="comment" rows="4" cols="50" required></textarea></td>
			    </tr>
			    <tr>
					<td colspan="2" align="center" >
					<input class="button" type="submit" value="Submit" style="width:132px;height:52px;color: #000000;"></input></font></td>
				</tr>
			</table>
			</form> 
	       		
     </div>
       </div>
		
	<!-- <div class="services_overview">
        <div class="container"><br>
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
       </div>  -->

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
