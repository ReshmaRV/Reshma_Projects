<%-- 
    Document   : copyshare
    Created on : 15 Jul, 2015, 10:09:07 AM
    Author     : Administrator
--%>

<%@page import="common.Constants"%>
<%@page import="java.io.File"%>
<%@page import="common.copyfile"%>
<jsp:useBean id="copy" class="common.copyfile"/>

<%
    File source=new File(Constants.PROJECT_PATH+request.getParameter("src"));
    File dest=new File(Constants.PROJECT_PATH+"tempfiles/"+session.getAttribute("uid")+".jpg");
    copyfile.copyFile(source, dest);    
%>
<script>
    window.location="../user/chooseFriends.jsp";
</script>