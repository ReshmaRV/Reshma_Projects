<%-- 
    Document   : search_friends
    Created on : 3 Feb, 2015, 10:02:26 PM
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
    <link rel="stylesheet" href="../js/jquery.mobile-1.2.0.min.css"/>
    <script src="../js/jqu<ery-1.8.2.min.js"></script>
    <script src="../js/jquery.mobile-1.2.0.min.js"></script>
    
    <script>
        function test(id,name){
            document.getElementById('shares').value=name+", "+document.getElementById('shares').value;
            document.getElementById('ids').value=id+" "+document.getElementById('ids').value;
        }
    </script>
</head>
<body>
<div id="templatemo_container">
  <div id="templatemo_header"><img src="../images/sitebanner.jpg" /></div> 
	<!-- end of header -->
    
    <div id="templatemo_menu">
        <ul>
            <li><a href="#" class="current">Home</a></li>
            <li><a href="#">Notifications</a></li>
            <li><a href="#">Messages</a></li>
            <li><a href="#">Friends</a></li>
            <li><a href="#">My Zone</a></li>
            <li><a href="#" class="last">Contact Us</a></li>
        </ul>    	
    </div> <!-- end of menu -->
    <center>
        <div id="templatemo_content"> 
            <div data-role="content">
            <div class="outer_new">            
            <ul data-role="listview" data-inset="true" data-filter="true">
                <%
                    Iterator it=con.getData(QueryGenerator.SELECT_MEMBERS).iterator();
                    while(it.hasNext()){
                        Vector v=(Vector)it.next();
                        out.println("<li><a href=\"#\" onClick=\"test('"+v.get(0) +"','"+v.get(1)+"');\">"+v.get(1)+"</a></li>");
                    }
                %>
            </ul>
            </div>
            </div>
            <div class="outer_new">
            <form action="../process/search_friends_Pr.jsp" method="get">                
                <input type="hidden" name="ids" id="ids"/> 
                <input type="button" onclick="redirect();" value="Send request"/>                
            </form>
            <!--</div>-->
            </div>
        </div> <!-- end of content right -->
    </center>
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

