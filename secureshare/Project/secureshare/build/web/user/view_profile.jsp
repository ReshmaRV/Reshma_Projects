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
        function setvalue(uid){
            document.getElementById("uid").value=uid;
        }
        function processRequest(){
            window.location="../process/frndRqstPr.jsp?uid="+document.getElementById("uid");
        }
        function redirect(opt){
            if(opt==1)
                    window.location="home.jsp";  
        }
    </script>
</head>
<body>
    <%
    if (session.getAttribute("uid") == null) {
                response.sendRedirect("../index.jsp");
            }
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
                
            <div class="right_col_section_w420">
           <%
                System.out.println(QueryGenerator.VIEW_PROFILE+session.getAttribute("uid"));
                Iterator it=con.getData(QueryGenerator.VIEW_PROFILE+session.getAttribute("uid")).iterator();
                if(it.hasNext()){
                    Vector v=(Vector)it.next();
           %>
           <center>
           <h4>USER PROFILE</h4>
           <form name="userReg" action="../process/update_profile.jsp" method="post">
            <table>
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="name" id="name" value="<%=v.get(1)%>"/></td>
                </tr>
                <tr>
                    <td>Date of birth</td>
                    <td><input type="date" name="dob" id="dob" value="<%=v.get(6)%>"/></td>
                </tr>
                <tr>
                    <td>Contact</td>
                    <td><input type="text" name="contact" id="contact" value="<%=v.get(4)%>"/></td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><input type="text" name="email" id="mail" value="<%=v.get(5)%>"/></td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td><input type="text" name="address" id="addr" value="<%=v.get(2)%>"/></td>
                </tr>
                <tr>
                    <td>Place</td>
                    <td><input type="text" name="place" id="place" value="<%=v.get(3)%>"/></td>
                </tr>
                <tr>
                    <td></td>
                    <td align="right"><input type="submit" value="Update"/></td>
                </tr>
            </table>
        </form>
                <% } %>
           </center>
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

