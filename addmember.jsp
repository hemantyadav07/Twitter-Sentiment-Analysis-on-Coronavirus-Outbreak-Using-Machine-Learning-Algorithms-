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
<%

if(request.getParameter("create")!=null){
	
	   out.println("<script>alert('Group Created Successfully ..'); </script>"); 
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
       <!-- <div style="margin-left: 750px; ">   <a href="creategroup.jsp" style="font-size: 12px" class="button">Create Group</a>
       </div> -->
       
       <%
       	String groupname=(String)session.getAttribute("groupname");
   		String desc=request.getParameter("description");
       
       %>
        <div style="background: #3399ff; margin-left: -7px;"> <h2><span><%=groupname.toUpperCase() %></span></h2> 
        
        </div>
        
        <h2><span>Your Friend List</span></h2><br>
        <table>
     <%
     
    	 Connection con=DbConnection.getConnection();
     	//String userid=(String)session.getAttribute("userid");
     	String groupid=(String)session.getAttribute("groupid");
     	
     	GlobalFunction gf=new GlobalFunction();
     	
     	PreparedStatement ps=con.prepareStatement("select * from friend_list where friend_id=?");
     	ps.setInt(1, userid);
     	ResultSet rs=ps.executeQuery();
     	while(rs.next())
     	{
     		int friend_of=Integer.parseInt(rs.getString("friend_of"));
     		
     		String fullname=gf.getFullName(friend_of);
     		
     		%>
     		<tr style="font-size: 20px;">
     		<td><%=fullname %></td>
     		<td></td>
     		<td><a href="addmember?groupid=<%=groupid %>&memberid=<%=friend_of %>" class="button">Add</a></td>
     		
     		<%
           		}
           
           %>
     </tr>
        </table>
       
        
          
           
           
           
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
  </div>
</div>
</body>
</html>
