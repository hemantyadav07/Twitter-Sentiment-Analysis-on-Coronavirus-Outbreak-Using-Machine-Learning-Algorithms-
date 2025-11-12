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
  display: inline-block;
  padding: 15px 25px;
  font-size: 24px;
  cursor: pointer;
  text-align: center;
  text-decoration: none;
  outline: none;
  color: #fff;
  background-color: #4CAF50;
  border: none;
  border-radius: 15px;
  box-shadow: 0 9px #999;
}

.button:hover {background-color: #3e8e41}

.button:active {
  background-color: #3e8e41;
  box-shadow: 0 5px #666;
  transform: translateY(4px);
}
</style>
</head>
<body>
<%
if(request.getParameter("fail")!=null){
	   out.println("<script>alert('Logged In of User Fail.....Please try again'); </script>"); 
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
					<li><a href="index.jsp">Home</a></li>
					<li><a href="register.jsp">User SignUp</a></li>
					<li class="active"><a href="admin.jsp">Admin</a></li>
					<!-- <li><a href="about.html">About</a></li>
					<li><a href="support.html">Support</a></li> -->
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
	            <div class="col-md-8">
	        	  <ul class="user_head">
	        	  	<i class="fa fa-users"> </i>
	        	  	<li class="user_head-right">
	        	  		<h1>Who You are? <b>ADMIN</b></h1>
	        	  	</li>
	        	  	<div class="clearfix"> </div>
	        	  </ul>
	        	  <div class="about_grid">
	        	  	<div class="col-md-5 about_grid-left">
	        	  		<img src="images/p10.jpg" class="img-responsive" alt=""/>
	        	  	</div>
	        	  	<div class="col-md-7 about_grid-right">
	        	  <form class="post_section" action="adminlogin" method="post">
                  <table class="table table-hover">
                    <tbody>
                      <tr>
						<td colspan="2"><h2 style="height: 20%">Login Here.......!</h2></td>
					  </tr>
                       <tr>
                        <th><b>UserName:</b></th>
                        <td><input type="text" name="username" style="color: #000000;" required></td>
                      </tr>
                      <tr>
                        <td><b>Password:</b></td>
                        <td><input type="password" name="password" style="color: #000000;" required></td>
                      </tr>
                      <tr>
                      	<td colspan="2" align="center"><input class="button" type="submit" value="Sign In" style="width:132px;height:52px;color: #000000;"/></td>
                      </tr>
                    </tbody>
                  </table>
                  </form>
	        	  	</div>
	        	  </div>
	        	</div>
	        	<div class="col-md-4 about_grid1">
	        	  <ul class="user_head">
	        	  	<i class="fa fa-trophy"> </i>
	        	  	<li class="user_head-right">
	        	  		<h2>Our Awards</h2>
	        	  	</li>
	        	  	<div class="clearfix"> </div>
	        	  </ul>
	        	  <h3><a href="#">Consectetuer adipiscing elit</a></h3>
	        	  <p>Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum.</p>
	        	  <div class="sm_hr"></div>
	        	   <h3><a href="#">Lorem ipsum dolor sit amet</a></h3>
	        	  <p>Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum.</p>
	        	</div>
	        	<div class="clearfix"> </div>
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
	       		<p align="center">&copy; 2022 Literate. All rights reserved | Design by <a href="#">Student</a></p>
	       	</div>

</body>
</html>
