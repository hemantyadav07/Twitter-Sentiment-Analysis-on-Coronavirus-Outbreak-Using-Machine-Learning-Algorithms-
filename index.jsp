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
	if(request.getParameter("logout")!=null)
	{
		session.invalidate();
		Thread.sleep(2000);
		out.println("<script>alert('Logout Successfully')</script>");
	}
  %>
<%
if(request.getParameter("done")!=null){
	   out.println("<script>alert('Congratulations.......Registration of User Successful.'); </script>"); 
}
if(request.getParameter("delete")!=null){
	   out.println("<script>alert('Account Deactivate of User Successful.'); </script>"); 
}
%>
   <div class="header">
      <div class="container">	 			
		<div class="logo">
		  <h2><a href="index.jsp"><b><u>Social Site</u></b></a></h2>
		</div>	
		<div class="header_bottom_right">			
	        <div class="h_menu4">
				<a class="toggleMenu" href="#">Menu</a>
				<ul class="nav">
					<li class="active"><a href="index.jsp">Home</a></li>
					<li><a href="SignIn.jsp">User SignIn</a></li>
					<li><a href="admin.jsp">Admin</a></li>
					<!-- <li><a href="about.html">About</a></li>
					<li><a href="support.html">Support</a></li> -->
				</ul>
				<script type="text/javascript" src="js/nav.js"></script>
	          </div>
              <div class="clearfix"> </div>
       		</div>
         </div>
      </div>
       		
       		<div class="banner">
       			<div class="banner-box">
							<link href="css/owl.carousel.css" rel="stylesheet">
							    <script src="js/owl.carousel.js"></script>
							        <script>
							    $(document).ready(function() {
							      $("#owl-demo").owlCarousel({
							        items : 1,
							        lazyLoad : true,
							        autoPlay : true,
							        navigation : true,
							        navigationText :  false,
							        pagination : false,
							      });
							    });
							    </script>
						       <div id="owl-demo" class="owl-carousel">
					                <div class="item">
					                	<div class="banner-info">
							       				<div class="b-info-left">
							       					<h1>Dedicated servers</h1>
							       					<h2>Starting from 99usd</h2>
							       					<p>24x7 knowledgeable support</p>
							       					<p>Full Root access</p>
							       					<p class="m_10"> HP included with each server (more on request w/ justification) Your Choice of any OS (CentOS, Windows, Debian, Fedora)FREE Reboots</p>
							       				</div>
							       				<div class="b-info-right">
							       					<p>Call us: <span>(818) 995-1560</span></p>
							       					<p>E-mail us:<a href="#">sales@digitallandscape.com</a></p>
							       					<a href="#" class="btn1 btn-8 btn-8c">Compare our pricing plans</a>
							       				</div>
							       				<div class="clearfix"> </div>
							       			</div>
					                </div>
					                <div class="item">
					                	<div class="banner-info">
							       				<div class="b-info-left">
							       					<h1>Advanced Hosting</h1>
							       					<h2>Starting from 99usd</h2>
							       					<p>unlimited Bandwidth with Messive Storage</p>
							       					<p>Unlimited Databases and Email Addresses</p>
							       					<p class="m_10"> HP included with each server (more on request w/ justification) Your Choice of any OS (CentOS, Windows, Debian, Fedora)FREE Reboots</p>
							       				</div>
							       				<div class="b-info-right">
							       					<p>Call us: <span>(818) 995-1560</span></p>
							       					<p>E-mail us:<a href="#">sales@digitallandscape.com</a></p>
							       					<a href="#" class="btn1 btn-8 btn-8c">Compare our pricing plans</a>
							       				</div>
							       				<div class="clearfix"> </div>
							       			</div>
					                </div>
					                <div class="item">
					                	<div class="banner-info">
							       				<div class="b-info-left">
							       					<h1>Reliable Hosting</h1>
							       					<h2>Starting from 99usd</h2>
							       					<p>Apps including Wordpress, Drupal and Joomla</p>
							       					<p>Full Root access</p>
							       					<p class="m_10"> HP included with each server (more on request w/ justification) Your Choice of any OS (CentOS, Windows, Debian, Fedora)FREE Reboots</p>
							       				</div>
							       				<div class="b-info-right">
							       					<p>Call us: <span>(818) 995-1560</span></p>
							       					<p>E-mail us:<a href="#">sales@digitallandscape.com</a></p>
							       					<a href="#" class="btn1 btn-8 btn-8c">Compare our pricing plans</a>
							       				</div>
							       				<div class="clearfix"> </div>
							       			</div>
					                </div>
				              </div>
				           </div>
						<div class="server-pic">
							<span> </span>
						</div>
       	     </div>
       		<div class="copy">
	       		<p align="center">&copy; 2022 Literate. All rights reserved | Design by <a href="#">Student</a></p>
	       	</div>
</body>
</html>
