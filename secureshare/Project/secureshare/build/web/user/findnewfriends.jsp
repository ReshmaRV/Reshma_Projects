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
            window.location="../process/frndRqstPr.jsp?uid="+document.getElementById("uid").value;
        }
        function moveto(){
            window.location="home.jsp";
        }
    </script>
</head>
<body>
<div id="templatemo_container">
  <div id="templatemo_header"><img src="../images/sitebanner.jpg" /></div> 
	<!-- end of header -->
    
    <div id="templatemo_menu">
        <ul><li><a href="#" class="current" onclick="moveto()">Home</a></li></ul>     	
    </div> <!-- end of menu -->
    
    <div id="templatemo_content" style="color: #000">
       
		<div id="content_right">
		  <div class="margin_bottom_20">&nbsp;</div>
                
            <div class="right_col_section_w420">
            <center><br/><h3>Find your friends </h3>
<!--            <div data-role="page">            -->
            <div data-role="content">
            <div class="outer_new">
                <form name="fndrqst" onsubmit="processRequest();">
                    <input type="hidden" name="uid" id="uid" />
                    <input type="submit" value="Send request"/>
                </form>
            <ul data-role="listview" data-inset="true" data-filter="true">
                <%
                    System.out.println(QueryGenerator.VIEW_ALL_MEMBERS_RQST+"place='"+session.getAttribute("place")+"'");
                    Iterator it=con.getData(QueryGenerator.VIEW_ALL_MEMBERS_RQST+"place='"+session.getAttribute("place")+"'").iterator();
                    while(it.hasNext()){
                        Vector v=(Vector)it.next();
                        if(!session.getAttribute("uid").equals(v.get(0)))
                            out.println("<li><a href=\"#\" onClick=\"setvalue('"+v.get(0) +"');\">"+v.get(1)+"</a></li>");
                    }
                %>
            </ul>
            </div>
            </div>
           
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

