<%-- 
    Document   : signup_pr
    Created on : 25 Dec, 2014, 10:42:10 AM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <jsp:useBean id="reg" class="beanfiles.Profile"/>
        <jsp:setProperty name="reg" property="*"/>
    </head>
    <body>
        <% 
            if(reg.putData(2)>0){
                if(reg.putData(4)>0)
                    response.sendRedirect("../index.jsp");
            }else{
                out.println("Registartion failed.. try again..<a href=\"../index.jsp\">Back</a>");
            }
        %>
    </body>
</html>
