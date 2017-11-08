<%-- 
    Document   : index
    Created on : 13 Dec, 2014, 10:41:25 AM
    Author     : Administrator
--%>

<%@page import="java.util.Vector"%>
<%@page import="dbconnection.QueryGenerator"%>
<%@page import="java.util.Iterator"%>
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
        function test(id,name){
            document.getElementById('shares').value=name+", "+document.getElementById('shares').value;
            document.getElementById('ids').value=id+" "+document.getElementById('ids').value;
        }
        function redirect(){
            var shares=document.getElementById('shares').value;
            var ids=document.getElementById('ids').value;
            window.location="../process/shareprocessing.jsp?shares="+shares+"&ids="+ids;
        }
    </script>
</head>
<body>
<div id="templatemo_container">
  <div id="templatemo_header"><img src="../images/sitebanner.jpg" /></div> 
<div id="templatemo_content_bottom">
    <center><br/><h3>Select friends share to be send</h3>
<!--            <div data-role="page">            -->
            <div data-role="content">
            <div class="outer_new">
            
            <ul data-role="listview" data-inset="true" data-filter="true">
                <%                
                    String uid=session.getAttribute("uid").toString();
                    String qry="SELECT * FROM user_details WHERE userId IN (SELECT uid FROM friends_list WHERE req_id="+uid+" AND req_status=1) "
                                                        + "OR userID IN (SELECT req_id FROM friends_list WHERE uid="+uid+" AND req_status =1)";
                    Iterator it=con.getData(qry).iterator();
                    while(it.hasNext()){
                        Vector v=(Vector)it.next();
                        out.println("<li><a href=\"#\" onClick=\"test('"+v.get(0) +"','"+v.get(1)+"');\">"+v.get(1)+"</a></li>");
                    }
                %>
            </ul>
            </div>
            </div>
            <div class="outer_new">
            <form action="../process/shareprocessing1.jsp" method="get">
                
                <input type="hidden" name="ids" id="ids"/> 
                <textarea name="shares" id="shares"></textarea>
                <input type="button" onclick="redirect();" value="Continue"/>
                
            </form>
            <!--</div>-->
            </div>
        </center>
</div>
</div> <!-- end of container -->
</body>
</html>
