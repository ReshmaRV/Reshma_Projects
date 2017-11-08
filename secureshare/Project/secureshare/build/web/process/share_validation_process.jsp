<%-- 
    Document   : share_validation_process
    Created on : 14 Dec, 2014, 6:14:47 PM
    Author     : Administrator
--%>

<%@page import="common.Constants"%>
<%@page import="security.SteganoInformation"%>
<%@page import="java.io.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <jsp:useBean id="validpro" class="security.RetrieveData"/>
    </head>
    <body>
        <% 
            //out.println(request.getRealPath("/"));
            SteganoInformation steg;
            steg= new SteganoInformation(new File(Constants.PROJECT_PATH+"img/test.jpg"));
            String hiddenData=validpro.retrieveMessage(steg);
            out.println(hiddenData);
        %>
    </body>
</html>
