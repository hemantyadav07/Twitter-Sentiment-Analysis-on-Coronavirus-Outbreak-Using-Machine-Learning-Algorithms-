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
.content .sidebar {
	padding:0;
	float:right;
	width:260px;
	align:right;
}
.content .sidebar .gadget {
	margin:0 0 12px;
	padding:8px 20px 24px;
}
.content .sidebar h2 {
	color:#fff;
	text-transform:none;
}
.rcorners3 { 
  border-radius: 15px 50px 30px;
  background: url(./images/Paper11.jpg);
  padding: 20px; 
  width: 200px;
  height: 150px;
}
.button {
  display: inline-block;
  padding: 1px 25px;
  font-size: 20px;
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

table1, th1, td1 {
  border: 1px solid black;
  border-radius: 10px;
  
}
th1, td1 {
  padding-top: 5px;
  padding-bottom: 15px;
  padding-left: 25px;
  padding-right: 35px;
  border-style: ridge;
  font-size: 18px;
}
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
          $("#post_flash_"+id).hide();  
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
if(request.getParameter("login")!=null){
	   out.println("<script>alert('Congratulations.......Logged In of User Successful.'); </script>"); 
	}
%>  
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
<div class="header">
      <div class="container">	 			
		<div class="logo">
		   <h2><a href="index.jsp"><b><u>Social Site</u></b></a></h2>
		</div>	
		<div class="header_bottom_right">			
	        <div class="h_menu4">
				<a class="toggleMenu" href="#">Menu</a>
				<ul class="nav">
					<li class="active"><a href="home.jsp">Home</a></li>
					<li><a href="RequestList.jsp">Friend List</a></li>
					<%-- <li><a href="Notification.jsp" class="service">Notification <% out.println("<span style='color:blue'> ("+nofiCount+")</span>"); %></a></li> --%>
          			<li><a href="TextAnalysis.jsp" class="clients">Sentiment Analysis</a></li>
          			<li><a href="EmotionAnalysis.jsp" class="clients">Emotion Analysis</a></li>
          			<li><a href="https://covid19.who.int/" class="clients">Covid19</a></li>
          			<li><a href="Account.jsp" class="clients">Account</a></li>
          			<li><a href="index.jsp?logout" class="contact">Logout</a></li>
					<!-- <li><a href="RequestList.jsp">Support</a></li> -->
				</ul>
				<script type="text/javascript" src="js/nav.js"></script>
	          </div>
              <div class="clearfix"> </div>
       		</div>
         </div>
      </div>

	 <div class="about">
          <div class="container" style="background-color:LightGrey;">
        	 <div class="about_top">
	            <div class="col-md-12">
	        	  		<!-- <h1>Who We are</h1> -->
	        	  		<div class="about_grid">
	        	  	<div class="col-md-12 about_grid-center">
			
	<div class="twitter_area">
      <div class="twitter">
      <p style="padding:34px 0px 0px 0px;">
      <div class="searchform" style="font-size: 18px;">
         <%@include file="FriendSearchForm.jsp" %></p>
      </div>
    </div>
  </div>
   </div>
   
   <div class="bodybg">
   <div>
      <p class="welcome_text">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     <%--  Welcome <%=session.getAttribute("fname") %> --%></p>
  
				<div class="row">
				 <div class="clr"></div>
      </div>
      <br>
      
				<div class="col-md-6 col-md-push-6 jumboText">
					
						</div>
				<div class="col-md-6 col-md-pull-6 hidden-xs">
				<div align="left"></div>
					 
      </div>
      <div class="clr"></div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           &nbsp;&nbsp;&nbsp;&nbsp;
           <%@include file="logo.jsp" %>
    </div>
			
		<div>
		<form action="uploadServlet" method="post" enctype="multipart/form-data"><br>
          <h2>Post :- (Text,Image,Video,Documents)</h2>
          <table cellspacing="4" class="rcorners3" cellpadding="5" border="2" style="width:100%; height:100%; text-align:center; line-height: 30px">
          <tr class="tr1">
          	<td class="td1"><textarea style="width:100%; height:100px" name="postContent" required id="alltext"></textarea>
          	<input type="hidden" name="postPrivacy" value="0">
          	</td>
          </tr>
          <tr>
          	<td class="td1">
				 <b style="font-size: 18px;">Select File: </b><br> <input type="file" name="file" id="file" >
				 <br>
		         <b style="font-size: 18px;">Select Category: </b><select name="category" id="category">
		         <option value="">---Select---</option>
		         <option value="image">Image</option>
		         <option value="document">Document</option>
		         <option value="video">Video</option>
		         </select>
			</td>
          </tr>
          <tr>
              <td class="td1"><span style="color: red;"><br>*</span> <b style="font-size: 18px;">Add #Tag: </b><input type="text" name="searchtag" id="tag" style="width: 50%; height: 50px" title="Please Enter Status/Image/Video Related Information" required></td>
          </tr>
          <tr>
          	<td class="td1"><input type="submit" class="button" value="Post"></td>
          </tr>
         </table>
           </form>
            
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
	           <div style="width:99%; height:60px; float:left; height:auto; border:1px solid #F7F5F5;  margin-bottom: 20px">
	           <div  class="postHead" style="width:70%;float:left; height: 450px;">
		           <div  style="width:10%;  float:left; padding:10px">&nbsp;
		           		<img  style="margin-bottom:0px" align="right" src="profilepicture/<%= ProfilePic %>" width="50" height="50">
		           	</div>
		         
		           	<div style="width:80%; float:left; padding: 10px;font-weight: bold; font-size: 16px;" align="left">
		           		<div>
		           		<%= FullName %> <br>
		           		<span style="font-size: 12px"><%= UsstyF %></span><br>
		           		<span style="font-size: 8px"><%= postedDate %></span>
		           	</div>
	           	</div>
	           	
	           	<div  class="postContent" style="width:100%; float:left; height: auto;">
		           <div style="width:10%; float:left; padding:10px">
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
//		           			String postt = 
		           			if(rs.getString("poststatus").contains("http"))
		           			{
// 							out.println("Status:<a target=_blank href="+rs.getString("poststatus")+">"+rs.getString("poststatus")+ "</a>");
							%>
							<h4>Status:<a target="<%=rs.getString("poststatus")%>" href="Verify?url=<%=rs.getString("poststatus")%>"><%=rs.getString("poststatus") %></a></h4>
							<%
		           			}
		           			else
		           			{
		           				System.out.println("got status ");
		           				out.println("Status : "+rs.getString("poststatus"));
		           			}
		           			
		            	}else if(category.equalsIgnoreCase("image"))
		            	{
		            		%>
		            		<img src="uploadfiles/<%=rs.getString("filename")%>" width="100" height="100" onClick='window.open(src="uploadfiles/<%=rs.getString("filename")%>")' title="Click to Open"> </a>
		            		<%
		            		
		            	}else if(category.equalsIgnoreCase("document"))
		            	{
		            		%>
		            		<a href=""><img src="imgs/TextFile.png" width="50" height="50" onClick='window.open(src="uploadfiles/<%= rs.getString("filename") %>")' title="Click to Open"> </a>
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
		           			<img src="imgs/like.png" onclick=changeLikeDislike("like",<%= postID %>) title="Like post" style="margin-bottom:0px; float:left; border:0px">
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
	           	<input type="button" value="Post" class="button" onclick="comment_button(this)" name="submit" id="<%=postID%>" class="comment_button"/>
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
 		</div></div></div>
      </div>
      
   </div></div></div>
	
	<div class="clearfix"> </div>
   <div class="copy"><br></br>
	    <p align="center">&copy; 2022 Literate. All rights reserved | Design by <a href="#">Student</a></p>
	</div>
	
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/flexslider.js"></script>
	
  </body>
</html>