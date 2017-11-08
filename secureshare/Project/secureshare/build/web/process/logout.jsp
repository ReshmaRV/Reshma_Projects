<%-- 
    Document   : logout
    Created on : 9 Mar, 2015, 10:47:41 PM
    Author     : Administrator
--%>
<%@page import="dbconnection.QueryGenerator"%>
<jsp:useBean id="con" class="dbconnection.DbConnection"/>
<%
    if(con.putData(QueryGenerator.SET_OFFLINE+"userID="+session.getAttribute("uid")+"")>0){
        session.setAttribute("uid", null);
        response.sendRedirect("../index.jsp");
    }else{
        response.sendRedirect("../index.jsp");
    }
%>
