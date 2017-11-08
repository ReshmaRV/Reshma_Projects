<%-- 
    Document   : search_friends_Pr
    Created on : 3 Feb, 2015, 11:00:42 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% //from search friends/... show list
            out.println(request.getParameter("ids"));
        %>
    </body>
</html>
