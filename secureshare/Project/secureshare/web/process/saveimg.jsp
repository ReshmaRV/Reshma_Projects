<%-- 
    Document   : saveimg
    Created on : 27 Mar, 2015, 7:40:11 AM
    Author     : Administrator
--%>

<%@page import="java.io.File"%>
<center>
    <form action="../process/saveimgPr.jsp" method="post">
        <input type="text" name="newName" id="newName" value="<% out.print(new File(request.getParameter("img")).getName()); %>"/>
        <input type="submit" name="rename" value="Rename"/>
    </form>
</center>
