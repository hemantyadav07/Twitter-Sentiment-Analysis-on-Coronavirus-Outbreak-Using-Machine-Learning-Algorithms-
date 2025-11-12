<%@page import="java.sql.ResultSet"%>
    <%@page import="java.sql.Statement"%>
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
                        <script type="application/x-javascript">
                            addEventListener("load", function() {
                                setTimeout(hideURLbar, 0);
                            }, false);

                            function hideURLbar() {
                                window.scrollTo(0, 1);
                            }
                        </script>
                        <link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
                        <script src="js/jquery.min.js"></script>
                        <link href="css/style.css" rel='stylesheet' type='text/css' />
                        <link href='http://fonts.googleapis.com/css?family=Slabo+27px' rel='stylesheet' type='text/css'>
                        <link rel="stylesheet" href="fonts/css/font-awesome.min.css">
                        <script type="text/javascript">
                            $(document).ready(function() {
                                $("div.bhoechie-tab-menu>div.list-group>a").click(function(e) {
                                    e.preventDefault();
                                    $(this).siblings('a.active').removeClass("active");
                                    $(this).addClass("active");
                                    var index = $(this).index();
                                    $("div.bhoechie-tab>div.bhoechie-tab-content").removeClass("active");
                                    $("div.bhoechie-tab>div.bhoechie-tab-content").eq(index).addClass("active");
                                });
                            });
                        </script>
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
                                box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
                                padding: 12px 16px;
                                z-index: 1;
                            }
                            
                            .dropdown:hover .dropdown-content {
                                display: block;
                            }
                            /*  bhoechie tab */
                            
                            div.bhoechie-tab-container {
                                z-index: 10;
                                background-color: #ffffff;
                                padding: 0 !important;
                                border-radius: 4px;
                                -moz-border-radius: 4px;
                                border: 1px solid #ddd;
                                margin-top: 20px;
                                -webkit-box-shadow: 0 6px 12px rgba(0, 0, 0, .175);
                                box-shadow: 0 6px 12px rgba(0, 0, 0, .175);
                                -moz-box-shadow: 0 6px 12px rgba(0, 0, 0, .175);
                                background-clip: padding-box;
                                opacity: 0.97;
                                filter: alpha(opacity=97);
                            }
                            
                            div.bhoechie-tab-menu {
                                padding-right: 0;
                                padding-left: 0;
                                padding-bottom: 0;
                            }
                            
                            div.bhoechie-tab-menu div.list-group {
                                margin-bottom: 0;
                            }
                            
                            div.bhoechie-tab-menu div.list-group>a {
                                margin-bottom: 0;
                            }
                            
                            div.bhoechie-tab-menu div.list-group>a .glyphicon,
                            div.bhoechie-tab-menu div.list-group>a .fa {
                                color: #5A55A3;
                            }
                            
                            div.bhoechie-tab-menu div.list-group>a:first-child {
                                border-top-right-radius: 0;
                                -moz-border-top-right-radius: 0;
                            }
                            
                            div.bhoechie-tab-menu div.list-group>a:last-child {
                                border-bottom-right-radius: 0;
                                -moz-border-bottom-right-radius: 0;
                            }
                            
                            div.bhoechie-tab-menu div.list-group>a.active,
                            div.bhoechie-tab-menu div.list-group>a.active .glyphicon,
                            div.bhoechie-tab-menu div.list-group>a.active .fa {
                                background-color: #5A55A3;
                                background-image: #5A55A3;
                                color: #ffffff;
                            }
                            
                            div.bhoechie-tab-menu div.list-group>a.active:after {
                                content: '';
                                position: absolute;
                                left: 100%;
                                top: 50%;
                                margin-top: -13px;
                                border-left: 0;
                                border-bottom: 13px solid transparent;
                                border-top: 13px solid transparent;
                                border-left: 10px solid #5A55A3;
                            }
                            
                            div.bhoechie-tab-content {
                                background-color: #ffffff;
                                /* border: 1px solid #eeeeee; */
                                padding-left: 20px;
                                padding-top: 10px;
                            }
                            
                            div.bhoechie-tab div.bhoechie-tab-content:not(.active) {
                                display: none;
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
                            
                            .button:hover {
                                background-color: #3e8e41
                            }
                            
                            .button:active {
                                background-color: #3e8e41;
                                box-shadow: 0 5px #666;
                                transform: translateY(4px);
                            }
                            
                            table,
                            th,
                            td {
                                border: 1px solid black;
                                border-radius: 10px;
                            }
                            
                            th,
                            td {
                                padding-top: 5px;
                                padding-bottom: 15px;
                                padding-left: 25px;
                                padding-right: 35px;
                                border-style: ridge;
                                font-size: 18px;
                            }
                            
                            tr:nth-child(even) {
                                background-color: rgba(150, 212, 212, 0.4);
                            }
                            
                            th:nth-child(even),
                            td:nth-child(even) {
                                background-color: rgba(150, 212, 212, 0.4);
                            }
                            
                            .dropdown {
                                position: relative;
                                display: inline-block;
                            }
                            
                            .dropdown-content {
                                display: none;
                                position: absolute;
                                background-color: green;
                                min-width: 160px;
                                box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
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

                    </head>

                    <body>
                        <%

if(request.getParameter("status")!=null){
	String stas = request.getParameter("status");
	   out.println("<script>alert('Successfully ..'); </script>"); 
	}
%>

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
                                                        <li><a href="home.jsp">Home</a></li>
                                                        <li><a href="RequestList.jsp">Friend List</a></li>
                                                        <%-- <li><a href="Notification.jsp" class="service">Notification <% out.println("<span style='color:blue'> ("+nofiCount+")</span>"); %>
                                                            </a>
                                                            </li> --%>
                                                            <li><a href="TextAnalysis.jsp" class="clients">Sentiment Analysis</a></li>
                                                            <li><a href="EmotionAnalysis.jsp" class="clients">Emotion Analysis</a></li>
                                                            <li><a href="https://covid19.who.int/" class="clients">Covid19</a></li>
                                                            <li class="active"><a href="Account.jsp" class="clients">Account</a></li>
                                                            <li><a href="index.jsp?logout" class="contact">Logout</a></li>
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
                                                        <i class="fa fa-user"> </i>
                                                        <h3 class="welcome_text">Welcome
                                                            <%=session.getAttribute("fname") %>
                                                        </h3>
                                                        <li class="user_head-right">
                                                            <table cellspacing="4" cellpadding="5" style="width:100%; height:100%; text-align:center; line-height: 30px">
                                                                <tr>
                                                                    <td><a href="Account.jsp">Profile</a></td>
                                                                    <td> <a href="contact.jsp">Contact Details</a></td>
                                                                    <td><a href="password.jsp">Password</a></td>
                                                                    <td> <a href="profilepic.jsp">Profile Photo</a></td>
                                                                    <td><a href="deactivate.jsp">Deactivate Account</a></td>
                                                                </tr>
                                                            </table>
                                                        </li>
                                                        <div class="clearfix"> </div>
                                                    </ul>
                                                    <div class="about_grid">
                                                        <div class="col-md-5 about_grid-left">
                                                            <%@include file="logo.jsp" %>
                                                        </div>
                                                        <div class="col-md-7 about_grid-right"></div>
                                                    </div>
                                                    <%							
								Connection con =DbConnection.getConnection();
								Statement st = con.createStatement();
								String sql = "select * from user_info where id ="+userid;
								ResultSet rs = st.executeQuery(sql);
								while(rs.next()){	
						%>

                                                        <div class="bhoechie-tab-content active" style="height:350px">
                                                            <form action="profilepicture" method="post" enctype="multipart/form-data">
                                                                <table align="center">
                                                                    <tr>
                                                                        <td><input type="file" name="file" id="file" required></input>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="center"><input class="button" type="submit" value="Change"></input>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </form>

                                                        </div>
                                                </div>
                                                <%
				}
			%>
                                                    <div class="col-md-3 about_grid1">
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
                                    </div>
                                    <p align="center">&copy; 2022 Literate. All rights reserved | Design by <a href="#">Student</a></p>

                    </body>

                    </html>