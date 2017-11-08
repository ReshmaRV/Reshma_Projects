<%-- 
    Document   : create_share_temp_file
    Created on : 18 Dec, 2014, 12:10:03 PM
    Author     : Administrator
--%>

<%@page import="java.util.Date"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Vector"%>
<%@page import="java.util.Iterator"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%--<jsp:useBean id="addPic" class="beanfiles.UploadProfilePic" scope="session"/>
        <jsp:setProperty name="addPic" property="*"/>--%>
        <jsp:useBean id="ibuff" class="common.ImageBuffer"/>
        <jsp:useBean id="con" class="dbconnection.DbConnection"/>
        <jsp:useBean id="sec" class="security.EmbedData"/>
             
    </head>
    <body>
        <%           
            String contentType=request.getContentType();
            int contentLength=request.getContentLength();
            String appPath=application.getRealPath("/");
            String fName=session.getAttribute("uid").toString();
            String webFolder="web/tempfiles";
            String imgFolder="tempfiles";
            if(contentType.indexOf("multipart/form-data")>=0){ 
                ibuff.initRequiredVars(appPath,fName, webFolder, contentType,request.getInputStream(),contentLength,imgFolder);
                File path=new File(ibuff.invokeRequiredFuns());
                //sec.embedMessage(path, path, msg, 3);
                response.sendRedirect("../user/chooseFriends.jsp");
            }
        %>
    </body>
</html>