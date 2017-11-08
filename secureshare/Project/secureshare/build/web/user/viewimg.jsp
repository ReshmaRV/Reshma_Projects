<%-- 
    Document   : view_security_details
    Created on : 2 Feb, 2015, 11:11:48 PM
    Author     : Administrator
--%>

<%@page import="java.util.Vector"%>
<%@page import="java.util.Iterator"%>
<%@page import="dbconnection.QueryGenerator"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Bird Store Online, CSS Template, Free Download</title>
        <meta name="keywords" content="Bird Store Online, CSS Template, Free Download" />
        <meta name="description" content="Bird Store Online - Download Free CSS Template" />
        <link href="../css/templatemo_style.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" href="../css/reveal.css"/>
        <script type="text/javascript" src="../css/jquery-1.6.min.js"></script>
        <script type="text/javascript" src="../css/jquery.reveal.js"></script>  
        <jsp:useBean id="con" class="dbconnection.DbConnection"/>
        <link rel="stylesheet" href="../js/jquery.mobile-1.2.0.min.css">
            <script src="../js/jqu<ery-1.8.2.min.js"></script>
            <script src="../js/jquery.mobile-1.2.0.min.js"></script>

            <script>        
                function redirect(opt){
                    if(opt==1)
                        window.location="home.jsp";  
                }
            </script>
    </head>
    <body>
        <%
    //    if (session.getAttribute("uid") == null) {
    //                response.sendRedirect("../index.jsp");
    //            }
%>
        <div id="templatemo_container">
            <div id="templatemo_header"><img src="../images/sitebanner.jpg" /></div> 
            <!-- end of header -->

            <div id="templatemo_menu">
                <ul><li><a href="#" class="current" onclick="redirect(1)">Home</a></li></ul> 	
            </div> <!-- end of menu -->

            <div id="templatemo_content" style="color: #000">

                <div id="content_right">
                    <div class="margin_bottom_20">&nbsp;</div>

                    <div class="right_col_section_w420" style="background-color: lemonchiffon; important">

                        <%
                            String img = request.getParameter("img");
                        %>
                        <center>
                            <table>
                                <tr>
                                    <td> <img src="../savedImages/<%=img%>" width="500" height="430"/> </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <a href="savedimg_options.jsp?img=<%=img%>&opt=1">Remove</a>&nbsp;&nbsp;&nbsp;&nbsp;
                                        <a href="../savedImages/<%=img%>" download="image.jpg" id="btnExport" style="color: #cc0505">Download</a>
                                    </td>
                                </tr>
                            </table>
                        </center>
                        <br/><br/>
                        <div class="cleaner">&nbsp;</div>
                    </div> <!-- end of right_col_section_w420 -->


                </div> <!-- end of content right -->

                <div class="cleaner">&nbsp;</div>
            </div> <!-- end of container -->
            <div id="templatemo_content_bottom">&nbsp;</div>
            <!--  Free CSS Templates by www.TemplateMo.com  -->
            <div id="templatemo_footer">
                Copyright 2014 <a href="#">LCC Computer Education</a> 
            </div> <!-- end of footer -->
            <!-- end of container -->
    </body>
</html>

