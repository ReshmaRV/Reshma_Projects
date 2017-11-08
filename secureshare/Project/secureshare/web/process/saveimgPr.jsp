<%-- 
    Document   : saveimgPr
    Created on : 3 Jul, 2015, 11:13:29 PM
    Author     : Administrator
--%>
<%@page import="java.util.Date"%>
<%@page import="common.Constants"%>
<%@page import="java.io.File"%>
<jsp:useBean id="copy" class="common.copyfile"/>


<%
        String savefile="";
        String imgname=request.getParameter("img");
        savefile=imgname.replace(imgname.substring(0, imgname.lastIndexOf("_")), session.getAttribute("uid").toString());
        File source=new File(Constants.PROJECT_PATH+imgname);
        File dest=new File(Constants.PROJECT_PATH+"savedImages/"+savefile);
        copy.copyFile(source, dest);
        %><script>
        alert("Image have been saved.. see Images link at Documents..");
        window.location="../user/home.jsp";
        </script><%
%>