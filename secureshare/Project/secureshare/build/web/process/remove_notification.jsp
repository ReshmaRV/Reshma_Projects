<%-- 
    Document   : remove_notification
    Created on : 10 Jul, 2015, 5:24:17 PM
    Author     : Administrator
--%>
<%@page import="dbconnection.QueryGenerator"%>
<jsp:useBean id="con" class="dbconnection.DbConnection"/>
<%
    String slno=request.getParameter("slno");
    if(con.putData(QueryGenerator.REMOVE_NOTIFICATION+slno)>0){
        %>
        <script>
            alert("Notification has been removed");
            window.location="../user/home.jsp";
        </script>
        <%
    }else{
        %>
        <script>
            alert("Failed to remove notification");
            window.location="../user/home.jsp";
        </script>
        <%
    }
%>