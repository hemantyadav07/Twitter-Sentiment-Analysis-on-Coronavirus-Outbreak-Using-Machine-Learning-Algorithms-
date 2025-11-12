<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.*"%>
<%@page import="com.util.DbConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Social Site</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
</head>
<style>
.dropdown {
    position: relative;
    display: inline-block;
}

.dropdown-content {
    display: none;
    position: absolute;
    background-color: green;
    min-width: 160px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    padding: 12px 16px;
    z-index: 1;
    
    
}

.dropdown:hover .dropdown-content {
    display: block;
}

/* .img {
    border-radius: 50%;
} */
</style>

<script>
function redirect()
{
	$.ajax({
		url:"see",
		method:"get",
		success:function(data){
			$("#data").html(data);	
		}
	});
}

</script>

<div class="main">
  <div class="headerbg">
    <div class="logo_area">
      <p class="logoicon"><a href="#"><img src="images/logoicon.jpg" alt="" border="0" /></a></p>
      <p class="logo"><a href="#"><img src="images/logo.png" alt="" border="0" /></a></p>
    </div>
    <div class="navarea">
      <div class="menu">
        <ul>
           <li><a href="adminhome.jsp" class="homeactive">Home</a></li>
          <li><a href="addapp.jsp" class="service">Add Apps</a></li>
          <li><a href="Allapps.jsp" class="clients">All Apps</a></li>
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
   <div class="container">
		<div align="center">
			<!--  <img  src="images/admin.png" width="150" height="150" style="border-radius: 100%;"> -->
			 </div>
				<div class="col-md-6 col-md-push-6 jumboText">
				
						</div>
				<div class="col-md-6 col-md-pull-6 hidden-xs">
				
      </div>

      </div>
      </div>
    <br></br>
	<table align="center" cellpadding="5" cellspacing="5" border="4" width="400px"> 
 
      <td><h3><center>Sr No.</center></h3></td>
       <td><h3><center>App Name</center></h3></td>
       <td><h3><center>User</center></h3></td>
       <td><h3><center>User Rating</center></h3></td>
       </tr>
       
       
       <%
       String appname = request.getParameter("app");
       String username = (String)session.getAttribute("username");
       Connection con = DbConnection.getConnection();
       String app = ""; String rating = ""; int sr = 0,tot=0; 
       String user = ""; 
       PreparedStatement ps = con.prepareStatement("select * from app_download where appname = '"+appname+"'");
      	ResultSet rs = ps.executeQuery();
      	if(rs.next()){
      		sr++;
      		app = rs.getString("appname");
      		rating = rs.getString("rating");
      		user = rs.getString("username");
      		if(rating==null){
      			rating="0";
      		}
      		else{
      			tot = tot+Integer.parseInt(rating);
      		}
      		%>
      		<tr>
      		<td><center><%=sr %></center></td>
      		<td><center><%=app %></center></td>
      		<td><center><%=user %></center></td>
      		<td><center><%=rating %></center></td>
			</tr>
      		<%
      	}else{
			%>
			<div id="redirect"></div>
			<%
      		sr=1;
      	}
      	
      	
      	
      	PreparedStatement pcat = con.prepareStatement("select category from lite where app_name='"+appname+"'");
      	ResultSet rscat = pcat.executeQuery();
      	String cat = "";
      	while(rscat.next()){
      		cat = rscat.getString("category");
      		if(cat==null){
      			cat = "normal";
      		}
      	}
      	int avg = tot/sr;
       %>
       </table>
      <br></br>
      <div align="center"><h3>Average Rating &nbsp;&nbsp;"<font color="red"><%=avg %></font>"&nbsp;&nbsp;The Category is <font color="Blue"><%=cat %></font></h3></div>
      <% 
      if(avg<2){
    	
      %>
     
      <div align="center"><h3>Change to <a href="Malicious?app=<%=appname%>">Malicious</a> </h3></div>
       <%} %>
        
           </center>
  <br></br>
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

 <!-- Bootstrap core JavaScript
    ==================================================
    Placed at the end of the document so the pages load faster -->
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
