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
<script>
$(function() {
	$('#popupDatepicker').datepick();
	$('#inlineDatepicker').datepick({onSelect: showDate});
});

function showDate(date) {
	alert('The date chosen is ' + date);
}
</script>
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


/* tr:nth-child(even) {
  background-color: rgba(150, 212, 212, 0.4);
}

th:nth-child(even),td:nth-child(even) {
  background-color: rgba(150, 212, 212, 0.4);
} */
</style>
</head>
<body>
<%
if(request.getParameter("exists")!=null){
	   out.println("<script>alert('Email already exists...'); document.uRegister.email.focus();</script>"); 
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
					<li class="active"><a href="SignIn.jsp">User SignIn</a></li>
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
    
     <%--  <p style="padding:34px 0 0 0">
      <div class="searchform">
         <%@include file="FriendSearchForm.jsp" %></p> --%>
        
   <div class="about">
          <div class="container">
        	 <div class="about_top">
	            <div class="col-md-8">
	        	<h3>User SignUp.............!</h3>
	        	  	<div class="col-md-10 about_grid-right">

  
	<div class="col-xs-12">
		<form action="userregister" method="post">	
		  <table class="table table-hover">
            <tr>
            	<td><b>First Name</b></td>
            	<td><input type="text" name="fname" style="height:32px; font-size: 18px;" required></input></td>
           <!--  </tr>
         	<tr> -->  
         		<td><b>Last Name</b></td>
         		<td><input type="text"  name="lname" style="height:32px; font-size: 18px;" required></input></td>
            </tr>
            <tr>
            	<td><b>Date of Birth</b></td>
            	<td><input type="date" name="dob" id="popupDatepicker" style="height:32px; font-size: 18px;" required></input></td>
            <!-- </tr>
            <tr> -->
            	<td><b>Gender</h2></b>
            	<td style="height:32px; font-size: 18px;">&nbsp;Male&nbsp;<input type="radio" name="gender" id="gender" value="male" ></input> 
            	&nbsp;Female&nbsp;<input type="radio" name="gender" id="gender" value="female"></input></td>
            </tr>
            <tr>
            	<td><b>Email Id</b></td>
            	<td><input type="text" name="email" id="email" style="height:32px; font-size: 18px;" required></input></td>
           <!--  </tr>
          	<tr> -->  
          		<td><b>Mobile No.</b></td>
          		<td><input type="text" name="mobile"  maxlength="10" pattern="\d{10}" style="height:32px; font-size: 18px;" required></input></td>
            </tr> 
            <tr> 
            	<td><b>Studying Fields</b></td> 
            	<td><select name="studyingfields" id="studyingfields" style="height:32px; font-size: 18px;" required>
            		<option value="">---Select---</option>
            		<option value="computer">Computer</option>
            		<option value="electronics">Electronics</option>
            		<option value="civil">Civil</option>
            		<option value="mechanical">Mechanical</option>
            		</select></td>
           <!--  </tr>           
            <tr>  -->
            	<td><b>Address</b></td>
            	<td><input type="text" name="address" style="height:32px; font-size: 18px;" required></input></td>
            </tr>
            <tr> 
            	<td><b>UserName</b></td>
            	<td><input type="text" name="username" style="height:32px; font-size: 18px;" required></input></td>
            <!-- </tr>
            <tr> --> 
            	<td><b>Password</b></td>
            	<td><input type="password" name="password" style="height:32px; font-size: 18px;" required></input></td>
            </tr>
            <tr>
            	<td colspan="2" align="center"><input class="button" type="submit" value="Sign Up" style="width:132px;height:52px;color: #000000;"/></td>
            	<td colspan="2" align="center"><input class="button" type="reset" value="Reset" style="width:132px;height:52px;color: #000000;"/></td>
            </tr>
			</table>
			</form>
			</div>
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
