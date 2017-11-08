<%-- 
    Document   : adminprofedit
    Created on : 13 Dec, 2014, 11:06:48 AM
    Author     : Administrator
--%>
<jsp:useBean id="profEdt" class="beanfiles.Profile"/>
<jsp:setProperty name="profEdt" property="*"/>
<%
    profEdt.setUid(session.getAttribute("uid").toString());
    if(profEdt.putData(1)>0){
        response.sendRedirect("profile_edit_adm.jsp");
    }
%>
