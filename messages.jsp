<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Social Site</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<%@page import="com.unknown.GlobalFunction"%>
<%
 int userids = Integer.parseInt((String)session.getAttribute("userid"));
 GlobalFunction GF = new GlobalFunction();
 int reqCount = GF.getRequestCount(userids);
 int nofiCount = GF.getNotificationCount(userids);
 int groupCount = GF.getGroupCount(userids);
 %>
<div class="main">
  <div class="headerbg">
    <div class="logo_area">
      <p class="logoicon"><a href="#"><img src="images/logoicon.jpg" alt="" border="0" /></a></p>
      <p class="logo"><a href="#"><img src="images/logo.png" alt="" border="0" /></a></p>
    </div>
    <div class="navarea">
      <div class="menu">
        <ul>
          <li><a href="home.jsp" class="homeactive"></a></li>
          <li><a href="RequestList.jsp" class="friendReq">Friend Request<% out.println("<span style='color:blue'> ("+reqCount+")</span>"); %></a></li>
          <li><a href="messages.jsp" class="message">(0)</a></li>
          <li><a href="myapps.jsp" class="app">Apps</a></li>
          <li><a href="Notification.jsp" class="service">Notification <% out.println("<span style='color:blue'> ("+nofiCount+")</span>"); %></a></li>
          <li><a href="Account.jsp" class="clients">Account</a></li>
          <li><a href="Logout" class="contact">Logout</a></li>
        </ul>
      </div>
    </div>
   <!--  <div class="improve_text">FRAppE: Detecting Malicious<span class="white_text"> Facebook</span> App
       </div> -->
       
    <div class="twitter_area">
      <div class="twitter">
      <p style="padding:34px 0 0 0">
      <div class="searchform">
         <%@include file="FriendSearchForm.jsp" %></p>
      </div>
    </div>
  </div>
</div>
     
  <div class="bodybg">
    <div class="welcometext_area">
      <p class="welcome_text">Welcome <%=session.getAttribute("fname") %></p>
      
    </div>
    
    <div> <!-- class="stategies_area"> 
      <p class="stategy_icon"><img src="#" alt="" width="140" height="140" /></p>-->
      
      <div class="selectarea">
         </div>
    </div>
    
    <%@include file="logo.jsp" %>
      
      
      <div class="col-xs-12">
						<div align="center">
						<h2>
						 <span>Messages</span>
						</h2>
						 </div>
						<br><br><br><br>
			</div>  
  </div>
  
    <div class="testimonial_area">
      <p class="testitext">Testimonials</p>
      <div class="clienttesti_area">
        <div class="testimonials1">
          <p class="testicontent">Contrary to popular belief, Lorem Ipsum is not simply random textf classical making it over 2000 years old.</p>
          <div class="clent_area">
            <p class="clientname">Richard McClintock</p>
          </div>
        </div>
        <div class="testimonials2">
          <p class="testicontent">Contrary to popular belief, Lorem Ipsum is not simply random textf classical making it over 2000 years old.</p>
          <div class="clent_area">
            <p class="clientname">H. Rackham, Cicero</p>
          </div>
        </div>
      </div>
      <div class="more_area">
        <p class="morebutton"><a href="#"><img src="images/morebtn.jpg" alt="" border="0" /></a></p>
        <p class="testimonialtext">Testimonials</p>
      </div>
    </div>
    <div class="footerback">
      <div class="footermain">
        <p><a href="#" class="navfactive">Home</a> | <a href="#" class="navf">Services</a> | <a href="#" class="navf">Clients</a> | <a href="#" class="navf">Solutions</a> | <a href="#" class="navf">About Us</a> | <a href="#" class="navf">Contact Us</a></p>
      </div>
      <div class="copyright">Copyright &copy; <a href="#">Domain Name</a>, All rights reserved | Design by <a target="_blank" href="http://www.wordpressthemeshock.com/">ThemeShock</a></div>
      <div class="twitterbtn_area">
        <p><a href="#" class="twitterbtn">Follow Us on Twitter!</a></p>
      </div>
    </div>
  </div>
  <br  class="spacer"/>
</div>
<div align=center>This template  downloaded form <a href='http://all-free-download.com/free-website-templates/'>free website templates</a></div>

 Bootstrap core JavaScript
    ==================================================
    Placed at the end of the document so the pages load faster
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/flexslider.js"></script>
	
<script type="text/javascript">
$(document).ready(function() {

	$('.mobileSlider').flexslider({
		animation: "slide",
		slideshowSpeed: 3000,
		controlNav: false,
		directionNav: true,
		prevText: "&#171;",
		nextText: "&#187;"
	});
	$('.flexslider').flexslider({
		animation: "slide",
		directionNav: false
	});
		
	$('a[href*=#]:not([href=#])').click(function() {
		if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') || location.hostname == this.hostname) {
			var target = $(this.hash);
			target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
			if ($(window).width() < 768) {
				if (target.length) {
					$('html,body').animate({
						scrollTop: target.offset().top - $('.navbar-header').outerHeight(true) + 1
					}, 1000);
					return false;
				}
			}
			else {
				if (target.length) {
					$('html,body').animate({
						scrollTop: target.offset().top - $('.navbar').outerHeight(true) + 1
					}, 1000);
					return false;
				}
			}

		}
	});
	
	$('#toTop').click(function() {
		$('html,body').animate({
			scrollTop: 0
		}, 1000);
	});
	
	var timer;
    $(window).bind('scroll',function () {
        clearTimeout(timer);
        timer = setTimeout( refresh , 50 );
    });
    var refresh = function () {
		if ($(window).scrollTop()>100) {
			$(".tagline").fadeTo( "slow", 0 );
		}
		else {
			$(".tagline").fadeTo( "slow", 1 );
		}
    };
		
});
</script>
</body>
</html>
