<%@page import="com.unknown.DateDifferentExample"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
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
<script type="text/javascript">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<script type="text/javascript" src="js/arial.js"></script>
<script type="text/javascript" src="js/cuf_run.js"></script>
<script type="text/javascript" src="jquery.dropotron-1.0.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.3.min.js"></script>
<script type="text/javascript" src="randomAds.js"></script>
<script type="text/javascript">
function changeLikeDislike(type,id){
      var dataString = 'id='+ id + '&type=' + type;
      $("#post_flash_"+id).show();
      $("#post_flash_"+id).fadeIn(400).html('<img src="images/Loading.gif" style="border:0px;margin-bottom:0px;margin-left: -10px; margin-right: 5px;"/>');
      $.ajax({
      type: "POST",
      url: "LikeDislikeServlet",
      data: dataString,
      cache: false,
      success: function(result){
               //if(result){
                  
                    $("#post_flash_"+id).hide();
              //}
               
      }
      });
}
function comment_button(event){
	
	var postid = event.id;
	//var posC = $("#")
	//var postid = document.getElementById("postid").value;
	var loggedinID = document.getElementById("loggedinID_"+postid).value;
	var postContent = $("#postContent_"+postid).val();
	
	var dataString = 'loggedinID='+ loggedinID + '&postid=' + postid +'&postContent='+postContent;
	
	//alert(dataString);
	if(postContent==''){
		alert("Please some comment.");
	}else{
		 $("#post_flash_"+postid).show();
	     $("#post_flash_"+postid).fadeIn(400).html('<img src="images/Loading.gif" style="border:0px;margin-bottom:0px;margin-left: -10px; margin-right: 5px;"/>');
		
	      $.ajax({
	    	  type: "POST",
	    	  url: "CommentPost",
	    	  data: dataString,
	    	  cache: false,
	    	  success: function(html){
	    	  $("#display").after(html);
	    	  document.getElementById('postContent_'+postid).value='';
	    	  document.getElementById('postContent_'+postid).focus();
	    	  $("#post_flash_"+postid).hide();
	    	  }
	    	  });
	    	  } return false;
	      }

</script>
</head>
<body onload="myad()">
<%@page import="com.unknown.GlobalFunction"%>
<%
 int userids = Integer.parseInt((String)session.getAttribute("userid"));
 GlobalFunction GF = new GlobalFunction();
 int reqCount = GF.getRequestCount(userids);
 int nofiCount = GF.getNotificationCount(userids);
 int groupCount = GF.getGroupCount(userids);
 %>
<script> 
function myad() { 
    var txt; 
    var r = confirm("This App may be malicious Do you Want to Continue download");
    if (r == true) { 
    	    window.location.href="DownloadApp"; 
    	     
     } else { 
     	window.location.href="home.jsp"; 
     } 
     document.getElementById("demo").innerHTML = txt; 
 } 
</script>


<%

if(request.getParameter("friendRequestSent")!=null){
	   out.println("<script>alert('Friend Request sent...'); </script>"); 
	}
if(request.getParameter("success")!=null){
	   out.println("<script>alert('Posted successfully...'); </script>"); 
	}
if(request.getParameter("Unfriend")!=null){
	   out.println("<script>alert('Unfriend successfully...'); </script>"); 
	}
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
           
           
           <form action="uploadServlet" method="post" enctype="multipart/form-data">
          <h3>Post :- (Text,Image,Video,Documents)</h3>
          <table cellpadding="5" cellspacing="5" style="width:100%">
          <tr>
          	<td><textarea style="width:100%; height:100px" name="postContent" id="alltext"></textarea>
          	<input type="hidden" name="postPrivacy" value="0">
          	</td>
          </tr>
          <tr>
          	<td>
				 Select file:  <input type="file" name="file" id="file" >
         Select Category: <select name="category" id="category">
         <option value="">---Select---</option>
         <option value="image">Image</option>
         <option value="document">Document</option>
         <option value="video">Video</option>
         </select>
			</td>
          </tr>
          <tr>
          <td><span style="color: red;">*</span>
           Add #Tag: <input type="text" name="searchtag" id="tag" style="width: 50%; height: 50px" title="Please Enter Status/Image/Video Related Information" required></td>
          </tr>
          <tr>
          	<td><input type="submit" value="Post"></td>
          </tr>
         </table>
           </form>
           
               	
	           	  	<div id="sidebar">
					<h2>Ads</h2>
					<script type="text/javascript">
  					randomorder(adblock, '<br><br>')
					</script>
					</div> 
           
           <%String ad = request.getParameter("abc"); 
           System.out.println("ad : "+ad);
           
           session.setAttribute("ad", ad);
		
    	   out.println("<script>alert('You have selected "+ad+"...'); </script>");
		   String user = (String)session.getAttribute("username"); 
    	   Connection con1 = DbConnection.getConnection();
    	   %>
    	   <div id="myad"></div>
    	   <%
    	   PreparedStatement ps = con1.prepareStatement("insert into user_app_use (user,appname) values(?,?)");
    	   ps.setString(1,user);
    	   ps.setString(2, ad);
    	   ps.executeUpdate();
    	   
    	   
    	   
    			   
           
           %>
           <h2>Timeline</h2>
           <%
           String studyingfield=  GF.getstydyingField(userid);
           Connection con=DbConnection.getConnection();
           DateDifferentExample DT = new DateDifferentExample();
           Statement st = con.createStatement();
           String sql = "select * from status where privacy='0' ORDER BY id DESC";
           ResultSet rs = st.executeQuery(sql);
           while(rs.next()){
        	   int postID = rs.getInt("id");
           String FullName = GF.getFullName(rs.getInt("userid"));
           String UsstyF=  GF.getstydyingField(rs.getInt("userid"));
           String ProfilePic = GF.getProfilePhotoName(rs.getInt("userid"));
           String category = rs.getString("category");
           
           boolean isFriend = GF.isFriend(userid, rs.getInt("userid"));
           boolean isStydiedField = GF.VerifyStudyingfield(userid, rs.getInt("userid"));
           if(isFriend==true || isStydiedField==true){
        	   int PostLikeCount = GF.getPostLikeCount(postID);
        	   
        	   String dbDate = rs.getString("postDate");
        	   String postedDate = DT.getDateDifference(dbDate);
           %>
           <div style="width:100%;">
	           <div style="width:70%; float:left; height:auto; border:1px solid #F7F5F5;  margin-bottom: 20px">
	           <div  class="postHead" style="width:100%;float:left; height: 80px;">
		           <div  style="width:10%;  float:left; padding:10px">
		           		<img  style="margin-bottom:0px" src="profilepicture/<%= ProfilePic %>" width="50" height="50">
		           	</div>
		           	<div style="width:80%; float:left; padding: 10px;font-weight: bold; font-size: 16px;">
		           		<%= FullName %> <br>
		           		<span style="font-size: 12px"><%= UsstyF %></span><br>
		           		<span style="font-size: 8px"><%= postedDate %></span>
		           	</div>
	           	</div>
	           	
	           	<div  class="postContent" style="width:100%; float:left; height: auto;">
		           <div  style="width:10%;  float:left; padding:10px">
		           		&nbsp;
		           	</div>
		           	<div style="width:80%; float:left; padding: 10px;font-weight: bold; font-size: 16px;">
		           		<div style="width:100%; margin-bottom: 10px;">
		           		
		           		<%
		           		
		           		String postC = rs.getString("postContent");
		           		if(postC==null){
		           			out.println(" ");
		           		}else{
		           			%>
		           			<%= postC %>
		           			
		           			<%
		           		}
		           		
		           		%>
		           		</div>
		           		<%
		           		
		           		if(category.equalsIgnoreCase("status"))
		            	{
		           			out.println("Status : "+rs.getString("poststatus"));
		           			
		            	}else if(category.equalsIgnoreCase("image"))
		            	{
		            		%>
		            		<img src="uploadfiles/<%=rs.getString("filename")%>" width="150" height="150" onClick='window.open(src="uploadfiles/<%=rs.getString("filename")%>")' title="Click to Open"> </a>
		            		<%
		            		
		            	}else if(category.equalsIgnoreCase("document"))
		            	{
		            		%>
		            		<a href=""><img src="images/TextFile.png" width="50" height="50" onClick='window.open(src="uploadfiles/<%= rs.getString("filename") %>")' title="Click to Open"> </a>
		            		<%
		            		
		            	}else if(category.equalsIgnoreCase("video"))
		            	{
		            		%>
		            		<video width="400" controls>
		  					<source src="uploadfiles\<%=rs.getString("filename") %>" type="<%=rs.getString("type")%>"></source>  
							</video> 
							<%
		            	}else{
		            		
		            	}
		           		%>
		           	</div>
	           	</div>
	           	
	           	<div  class="postMenu" style="width:100%;float:left; margin-top:20px; height: auto;">
		           <div  style="padding:10px">
		           		<div class="product_like" id="product_like">
		           			<img src="images/like.png" onclick=changeLikeDislike("like",<%= postID %>) title="Like post" style="margin-bottom:0px; float:left; border:0px">
		           			 <span id="product_like_<%= postID %>"> </span>
		           			</div>
		           		<div style="margin-top: 10px; width: 300px; float: left; margin-left: 5px;">
		           		<div class="post_flash" id="post_flash_<%= postID %>" style="float:left">&nbsp;</div>
		           		 <%= PostLikeCount %>
		           		
		           		 &nbsp;&nbsp;&nbsp;&nbsp; Comment &nbsp;&nbsp;&nbsp;&nbsp; Share</div>
		           	</div>
		           	
	           	</div>
	           	
	           	<div id="display" style="width:90%;float:left; background-color:#F3F3F3; margin-top:20px; margin-left:20px; height: auto;">
	           	<%
	           	Statement st3 = con.createStatement();
	           	String sql3 = "select * from postcommenttbl where post_id="+postID+" ORDER BY id DESC";
	           	ResultSet rs3 = st3.executeQuery(sql3);
	           	while(rs3.next()){
	           		String fullname = GF.getFullName(rs3.getInt("comment_by"));
	           		String Comment = rs3.getString("pcomment");
	           		String CommentDate = rs3.getString("commentDate");
	           	%>
	           	<table cellpadding="3" cellspacing="3" style="width:100%" height: auto;">
	           		<tr>
	           			<td><%= "<span style='font-weight:bold'>"+fullname +"</span> : "+Comment %></td>
	           		</tr>
	           	</table>
	           	
	           	<%} %>
	           	
	           	</div>
	           	
	           	<div  class="CommentBox" style="width:100%;float:left; margin-top:20px; margin-left:20px; height: auto;">
	           	<form method="post" name="form_<%= postID %>" action="">
	           	
	           	<table cellpadding="3" cellspacing="3" style="width:100%">
	           <tr><td>
	           <input type="hidden" name="loggedinID" id="loggedinID_<%= postID %>" value="<%= userid %>">
	            <input type="hidden" name="postid" id="postid" value="<%= postID %>">
	           	<textarea style="width:70%; height:50px;" name="postContent_<%= postID %>" id="postContent_<%= postID %>"></textarea>
	           	</td>
	           	</tr>
	           	<tr><td>
	           	<input type="button" value="POST" onclick="comment_button(this)" name="submit" id="<%=postID%>" class="comment_button"/>
	           
	           	</td></tr>
	           	</table>
	           	</form>
	           	</div>
	      
	           </div>
	           
           </div>
           <%
           }
           }
           %>
           
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



<%-- <%@page import="com.unknown.DateDifferentExample"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.util.DbConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@include file="feviconImage.jsp" %>
<title><%@include file="title.jsp" %></title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="Refresh" content="20;url=home.jsp">
<link href="style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/arial.js"></script>
<script type="text/javascript" src="js/cuf_run.js"></script>
<script type="text/javascript" src="jquery.dropotron-1.0.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.3.min.js"></script>
<script type="text/javascript" src="randomAds.js"></script>
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
<script type="text/javascript">
function changeLikeDislike(type,id){
      var dataString = 'id='+ id + '&type=' + type;
      $("#post_flash_"+id).show();
      $("#post_flash_"+id).fadeIn(400).html('<img src="images/Loading.gif" style="border:0px;margin-bottom:0px;margin-left: -10px; margin-right: 5px;"/>');
      $.ajax({
      type: "POST",
      url: "LikeDislikeServlet",
      data: dataString,
      cache: false,
      success: function(result){
               //if(result){
                  
                    $("#post_flash_"+id).hide();
              //}
               
      }
      });
}
function comment_button(event){
	
	var postid = event.id;
	//var posC = $("#")
	//var postid = document.getElementById("postid").value;
	var loggedinID = document.getElementById("loggedinID_"+postid).value;
	var postContent = $("#postContent_"+postid).val();
	
	var dataString = 'loggedinID='+ loggedinID + '&postid=' + postid +'&postContent='+postContent;
	
	//alert(dataString);
	if(postContent==''){
		alert("Please some comment.");
	}else{
		 $("#post_flash_"+postid).show();
	     $("#post_flash_"+postid).fadeIn(400).html('<img src="images/Loading.gif" style="border:0px;margin-bottom:0px;margin-left: -10px; margin-right: 5px;"/>');
		
	      $.ajax({
	    	  type: "POST",
	    	  url: "CommentPost",
	    	  data: dataString,
	    	  cache: false,
	    	  success: function(html){
	    	  $("#display").after(html);
	    	  document.getElementById('postContent_'+postid).value='';
	    	  document.getElementById('postContent_'+postid).focus();
	    	  $("#post_flash_"+postid).hide();
	    	  }
	    	  });
	    	  } return false;
	      }




</script>


</head>
<body onload="myad()">
<script> 
function myad() { 
    var txt; 
    var r = confirm("This App may be malicious Do you Want to Continue download");
    if (r == true) { 
    	    window.location.href="DownloadApp"; 
    	     
     } else { 
     	window.location.href="home.jsp"; 
     } 
     document.getElementById("demo").innerHTML = txt; 
 } 
</script>


<%

if(request.getParameter("friendRequestSent")!=null){
	   out.println("<script>alert('Friend Request sent...'); </script>"); 
	}
if(request.getParameter("success")!=null){
	   out.println("<script>alert('Posted successfully...'); </script>"); 
	}
if(request.getParameter("Unfriend")!=null){
	   out.println("<script>alert('Unfriend successfully...'); </script>"); 
	}
%>
<div class="main">
  <div class="header">
    <div class="header_resize">
      <div class="menu_nav">
       
       
          <%@include file="menu.jsp" %>
       
        <div class="clr"></div>
      </div>
      <div class="searchform">
        <%@include file="FriendSearchForm.jsp" %>
      </div>
      <div class="clr"></div>
      <div class="logo">
    
       <%@include file="logo.jsp" %>
      </div>
    </div>
  </div>
  <div class="content">
    <div class="content_resize">
      <div class="mainbar">
        <div class="article">
      
           
           <form action="uploadServlet" method="post" enctype="multipart/form-data">
          <h3>Post :- (Text,Image,Video,Documents)</h3>
          <table cellpadding="5" cellspacing="5" style="width:100%">
          <tr>
          	<td><textarea style="width:100%; height:100px" name="postContent" id="alltext"></textarea>
          	<input type="hidden" name="postPrivacy" value="0">
          	</td>
          </tr>
          <tr>
          	<td>
				 Select file:  <input type="file" name="file" id="file" >
         Select Category: <select name="category" id="category">
         <option value="">---Select---</option>
         <option value="image">Image</option>
         <option value="document">Document</option>
         <option value="video">Video</option>
         </select>
			</td>
          </tr>
          <tr>
          <td><span style="color: red;">*</span>
           Add #Tag: <input type="text" name="searchtag" id="tag" style="width: 50%; height: 50px" title="Please Enter Status/Image/Video Related Information" required></td>
          </tr>
          <tr>
          	<td><input type="submit" value="Post"></td>
          </tr>
         </table>
           </form>
           
               	
	           	  	<div id="sidebar">
					<h2>Ads</h2>
					<script type="text/javascript">
  					randomorder(adblock, '<br><br>')
					</script>
					</div> 
           
           <%String ad = request.getParameter("abc"); 
           System.out.println("ad : "+ad);
           
           session.setAttribute("ad", ad);
		
    	   out.println("<script>alert('You have selected "+ad+"...'); </script>");
		   String user = (String)session.getAttribute("username"); 
    	   Connection con1 = DbConnection.getConnection();
    	   %>
    	   <div id="myad"></div>
    	   <%
    	   PreparedStatement ps = con1.prepareStatement("insert into user_app_use (user,appname) values(?,?)");
    	   ps.setString(1,user);
    	   ps.setString(2, ad);
    	   ps.executeUpdate();
    	   
    	   
    	   
    			   
           
           %>
           <h2>Timeline</h2>
           <%
           String studyingfield=  GF.getstydyingField(userid);
           Connection con=DbConnection.getConnection();
           DateDifferentExample DT = new DateDifferentExample();
           Statement st = con.createStatement();
           String sql = "select * from status where privacy='0' ORDER BY id DESC";
           ResultSet rs = st.executeQuery(sql);
           while(rs.next()){
        	   int postID = rs.getInt("id");
           String FullName = GF.getFullName(rs.getInt("userid"));
           String UsstyF=  GF.getstydyingField(rs.getInt("userid"));
           String ProfilePic = GF.getProfilePhotoName(rs.getInt("userid"));
           String category = rs.getString("category");
           
           boolean isFriend = GF.isFriend(userid, rs.getInt("userid"));
           boolean isStydiedField = GF.VerifyStudyingfield(userid, rs.getInt("userid"));
           if(isFriend==true || isStydiedField==true){
        	   int PostLikeCount = GF.getPostLikeCount(postID);
        	   
        	   String dbDate = rs.getString("postDate");
        	   String postedDate = DT.getDateDifference(dbDate);
           %>
           <div style="width:100%;">
	           <div style="width:70%; float:left; height:auto; border:1px solid #F7F5F5;  margin-bottom: 20px">
	           <div  class="postHead" style="width:100%;float:left; height: 80px;">
		           <div  style="width:10%;  float:left; padding:10px">
		           		<img  style="margin-bottom:0px" src="profilepicture/<%= ProfilePic %>" width="50" height="50">
		           	</div>
		           	<div style="width:80%; float:left; padding: 10px;font-weight: bold; font-size: 16px;">
		           		<%= FullName %> <br>
		           		<span style="font-size: 12px"><%= UsstyF %></span><br>
		           		<span style="font-size: 8px"><%= postedDate %></span>
		           	</div>
	           	</div>
	           	
	           	<div  class="postContent" style="width:100%; float:left; height: auto;">
		           <div  style="width:10%;  float:left; padding:10px">
		           		&nbsp;
		           	</div>
		           	<div style="width:80%; float:left; padding: 10px;font-weight: bold; font-size: 16px;">
		           		<div style="width:100%; margin-bottom: 10px;">
		           		
		           		<%
		           		
		           		String postC = rs.getString("postContent");
		           		if(postC==null){
		           			out.println(" ");
		           		}else{
		           			%>
		           			<%= postC %>
		           			
		           			<%
		           		}
		           		
		           		%>
		           		</div>
		           		<%
		           		
		           		if(category.equalsIgnoreCase("status"))
		            	{
		           			out.println("Status : "+rs.getString("poststatus"));
		           			
		            	}else if(category.equalsIgnoreCase("image"))
		            	{
		            		%>
		            		<img src="uploadfiles/<%=rs.getString("filename")%>" width="150" height="150" onClick='window.open(src="uploadfiles/<%=rs.getString("filename")%>")' title="Click to Open"> </a>
		            		<%
		            		
		            	}else if(category.equalsIgnoreCase("document"))
		            	{
		            		%>
		            		<a href=""><img src="images/TextFile.png" width="50" height="50" onClick='window.open(src="uploadfiles/<%= rs.getString("filename") %>")' title="Click to Open"> </a>
		            		<%
		            		
		            	}else if(category.equalsIgnoreCase("video"))
		            	{
		            		%>
		            		<video width="400" controls>
		  					<source src="uploadfiles\<%=rs.getString("filename") %>" type="<%=rs.getString("type")%>"></source>  
							</video> 
							<%
		            	}else{
		            		
		            	}
		           		%>
		           	</div>
	           	</div>
	           	
	           	<div  class="postMenu" style="width:100%;float:left; margin-top:20px; height: auto;">
		           <div  style="padding:10px">
		           		<div class="product_like" id="product_like">
		           			<img src="images/like.png" onclick=changeLikeDislike("like",<%= postID %>) title="Like post" style="margin-bottom:0px; float:left; border:0px">
		           			 <span id="product_like_<%= postID %>"> </span>
		           			</div>
		           		<div style="margin-top: 10px; width: 300px; float: left; margin-left: 5px;">
		           		<div class="post_flash" id="post_flash_<%= postID %>" style="float:left">&nbsp;</div>
		           		 <%= PostLikeCount %>
		           		
		           		 &nbsp;&nbsp;&nbsp;&nbsp; Comment &nbsp;&nbsp;&nbsp;&nbsp; Share</div>
		           	</div>
		           	
	           	</div>
	           	
	           	<div id="display" style="width:90%;float:left; background-color:#F3F3F3; margin-top:20px; margin-left:20px; height: auto;">
	           	<%
	           	Statement st3 = con.createStatement();
	           	String sql3 = "select * from postcommenttbl where post_id="+postID+" ORDER BY id DESC";
	           	ResultSet rs3 = st3.executeQuery(sql3);
	           	while(rs3.next()){
	           		String fullname = GF.getFullName(rs3.getInt("comment_by"));
	           		String Comment = rs3.getString("pcomment");
	           		String CommentDate = rs3.getString("commentDate");
	           	%>
	           	<table cellpadding="3" cellspacing="3" style="width:100%" height: auto;">
	           		<tr>
	           			<td><%= "<span style='font-weight:bold'>"+fullname +"</span> : "+Comment %></td>
	           		</tr>
	           	</table>
	           	
	           	<%} %>
	           	
	           	</div>
	           	
	           	<div  class="CommentBox" style="width:100%;float:left; margin-top:20px; margin-left:20px; height: auto;">
	           	<form method="post" name="form_<%= postID %>" action="">
	           	
	           	<table cellpadding="3" cellspacing="3" style="width:100%">
	           <tr><td>
	           <input type="hidden" name="loggedinID" id="loggedinID_<%= postID %>" value="<%= userid %>">
	            <input type="hidden" name="postid" id="postid" value="<%= postID %>">
	           	<textarea style="width:70%; height:50px;" name="postContent_<%= postID %>" id="postContent_<%= postID %>"></textarea>
	           	</td>
	           	</tr>
	           	<tr><td>
	           	<input type="button" value="POST" onclick="comment_button(this)" name="submit" id="<%=postID%>" class="comment_button"/>
	           
	           	</td></tr>
	           	</table>
	           	</form>
	           	</div>
	      
	           </div>
	           
           </div>
           <%
           }
           }
           %>
           
           
           
        </div>
        
     
	 
        <div class="article">
           </div>
      </div>
      
      <div class="clr"></div>
    </div>
  </div>
  <div class="fbg">
    <div class="fbg_resize">
      <div class="col c1">
       <!--  <h2>About</h2>
        <img src="images/white.jpg" width="66" height="66" alt="" />
        <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec libero. Suspendisse bibendum. Cras id urna. Morbi tincidunt, orci ac convallis aliquam, lectus turpis varius lorem, eu posuere nunc justo tempus leo. llorem, eu posuere nunc justo tempus leo. Donec mattis, purus nec placerat bibendum. <a href="#">Learn more...</a></p>
      -->
       </div>
      <div class="col c2">
       <!--  <h2>Lorem Ipsum</h2>
        <ul class="sb_menu">
          <li><a href="#">consequat molestie</a></li>
          <li><a href="#">sem justo</a></li>
          <li><a href="#">semper</a></li>
          <li><a href="#">magna sed purus</a></li>
          <li><a href="#">tincidunt</a></li>
        </ul> -->
      </div>
      <div class="col c3">
       <!--  <h2>Contact</h2>
        <p>Praesent dapibus, neque id cursus faucibus, tortor neque egestas augue, eu vulputate magna eros eu erat.</p>
        <p><strong>Phone:</strong> +1234567<br />
          <strong>Address:</strong> 123 TemplateAccess Rd<br />
          <strong>E-mail:</strong> <a href="#">info@example.com</a></p> -->
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="footer">
   <%@include file="footer.jsp" %>
      
      <div class="clr"></div>
    </div>
  </div>

</body>
</html>
 --%>