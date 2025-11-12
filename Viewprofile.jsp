<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
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
<link href="style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/arial.js"></script>
<script type="text/javascript" src="js/cuf_run.js"></script>
<script type="text/javascript" src="jquery.dropotron-1.0.js"></script>
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
</style>

</head>
<body>
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
      <%
								int UserProfileID = Integer.parseInt(request.getParameter("userid"));
								
								Connection con =DbConnection.getConnection();
								Statement st2 = con.createStatement();
								
								
									String sql2 = "select * from user_info where id ="+UserProfileID;
									ResultSet rs2 = st2.executeQuery(sql2);
										while(rs2.next()){
											String ProfPic = rs2.getString("ppicture");
								
								%>
        
<img class="img" src="profilepicture/<%= ProfPic %>" width="100" height="100">
<%
//GlobalFunction GF = new GlobalFunction();
int userid=Integer.parseInt((String) session.getAttribute("userid"));
String fname = rs2.getString("fname");
String lname = rs2.getString("lname");
String stat = GF.getStatusField(userid,"status");
%>
<h1 style="margin-top:10px"><%= fname+" "+lname %></h1>
<h3 style="margin-top:10px"><%= stat %></h3>


        
        <%} %>
      </div>
    </div>
  </div>
  <div class="content">
    <div class="content_resize">
      <div class="mainbar">
        <div class="article">
        <div class="menu_nav" style="display:none">
        <ul>
          <li class="active"><a href="photodetails.jsp">photo & details</a></li>
          <li class="active"><a href="editprofile.jsp">edit Profile</a></li>
          <li class="active"><a href="friendlist.jsp">Friend list</a></li>
          <li class="active"><a href="sharedposts.jsp">shared posts</a></li>
  
          
        </ul>
        <div class="clr"></div>
      </div><br><br><br>
      <center>    <h2><span>Profile Page</span></h2><br>
         <table cellspacing="1"  cellpadding="5" style="width:50%; margin-left:auto;margin-right:auto;">
								
								<%
								//int userid = Integer.parseInt(request.getParameter("userid"));
								
								//Connection con =DbConnection.getConnection();
								Statement st = con.createStatement();
								
								
									String sql = "select * from user_info where id ="+UserProfileID;
									ResultSet rs = st.executeQuery(sql);
										while(rs.next()){
								
								%>
								
								<tr class="tablerow">
									<td>Full Name</td>
									<td>:</td>
									<td><%= rs.getString("fname")+" "+rs.getString("lname") %></td>
								</tr>
								<tr class="tablerow">
									<td>Date Of Birth</td>
									<td>:</td>
									<td><%= rs.getString("dob") %></td>
								</tr>
								
								<tr class="tablerow">
									<td>Gender</td>
									<td>:</td>
									<td><%= rs.getString("gender") %></td>
								</tr>
								
								<tr class="tablerow">
									<td>Email</td>
									<td>:</td>
									<td><%= rs.getString("email") %></td>
								</tr>
								
								<tr class="tablerow">
									<td>Mobile</td>
									<td>:</td>
									<td><%= rs.getString("mobile") %></td>
								</tr>
								
								<tr class="tablerow">
									<td>Designation</td>
									<td>:</td>
									<td><%= rs.getString("designation") %></td>
								</tr>
								<tr class="tablerow">
									<td>Education</td>
									<td>:</td>
									<td><%= rs.getString("designation") %></td>
								</tr>
								
								<tr class="tablerow">
									<td>College</td>
									<td>:</td>
									<td><%= rs.getString("college") %></td>
								</tr>
								
								<tr class="tablerow">
									<td>University</td>
									<td>:</td>
									<td><%= rs.getString("university") %></td>
								</tr>
								
								<tr class="tablerow">
									<td>Address</td>
									<td>:</td>
									<td><%= rs.getString("address") %></td>
								</tr>
								
								<tr class="tablerow">
									<td>Registration Date</td>
									<td>:</td>
									<td><%= rs.getString("regDate") %></td>
								</tr>
								
								<%
										}
								%>
								<tr class="tableheader" style="display:none">
									<td colspan="3"><input type="submit" name="Login" value="Register"></input></td>
								</tr>
								</table>
       
         
           
           </center>
           
           
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
</div>
</body>
</html>
