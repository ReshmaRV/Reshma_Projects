<%-- 
    Document   : share_image_process
    Created on : 14 Dec, 2014, 4:34:38 PM
    Author     : Administrator
--%>

<%@page import="java.io.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <jsp:useBean id="sharepro" class="security.EmbedData" />
    </head>
    <body>
        <%
            String dataToHide="testinggg";
            File orig=new File("web/img/20140618_090008.jpg");
            File copy=new File("web/img/copy1.jpg");
            sharepro.embedMessage(orig, copy, dataToHide, 3); 
        %>
    </body>
</html>
