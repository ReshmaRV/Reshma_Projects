<%-- 
    Document   : loginpr
    Created on : 22 Dec, 2014, 5:56:30 PM
    Author     : Administrator
--%>
<%@page import="dbconnection.QueryGenerator"%>
<%@page import="java.util.Vector"%>
<%@page import="java.util.Iterator"%>
<jsp:useBean id="prof" class="beanfiles.Profile"/>
<jsp:useBean id="con" class="dbconnection.DbConnection"/>
<jsp:setProperty name="prof" property="*"/>

<%
    Iterator it=prof.getData(3).iterator();
    if(it.hasNext()){
        Vector v=(Vector)it.next();
        if(v.get(2).toString().equals(prof.getUsername()) && v.get(3).toString().equals(prof.getUpassword())){
            session.setAttribute("uid", v.get(0));
            session.setAttribute("place", v.get(4));
            if(con.putData(QueryGenerator.SET_ONLINE+"userID="+v.get(0)+"")>0){
                response.sendRedirect("../user/home.jsp?loop=0");
            }else{
                %>
                <script>
                    alert("Connection failure.. try again");
                    window.location="../index.jsp";
                </script>
                <%
            }
        }else{
            response.sendRedirect("../index.jsp");            
        }
    }else{
        response.sendRedirect("../index.jsp");            
    }
%>