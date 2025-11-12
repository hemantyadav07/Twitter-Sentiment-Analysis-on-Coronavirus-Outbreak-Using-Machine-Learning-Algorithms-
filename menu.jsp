 <%@page import="com.unknown.GlobalFunction"%>
<%
 int userids = Integer.parseInt((String)session.getAttribute("userid"));
 GlobalFunction GF = new GlobalFunction();
 int reqCount = GF.getRequestCount(userids);
 int nofiCount = GF.getNotificationCount(userids);
 int groupCount = GF.getGroupCount(userids);
 %>
 <ul>
          <li class="active"><a href="home.jsp">Home</a></li>
         
          <li><a href="RequestList.jsp">Friend Request<% out.println("<span style='color:blue'> ("+reqCount+")</span>"); %></a></li>
          <li><a href="messages.jsp">Messages</a></li>
          <li><a href="myapps.jsp">My App</a></li>
        <%--   <li><a href="group.jsp">Groups <% out.println("<span style='color:blue'> ("+groupCount+")</span>"); %></a></li>
         --%>  <li><a href="Notification.jsp">Notification <% out.println("<span style='color:blue'> ("+nofiCount+")</span>"); %></a></li>
           		<li><a href="Account.jsp">Profile</a></li>   			 
     			 <li><a href="Logout">Logout</a></li>
    		</ul>
         