<%-- 
    Document   : seqvalid
    Created on : 29 Mar, 2015, 2:58:43 PM
    Author     : Administrator
--%>
<%@page import="java.util.Vector"%>
<%@page import="java.util.Iterator"%>
<jsp:useBean id="con" class="dbconnection.DbConnection"/>
<%
    String pass=request.getParameter("upassword");
    
    String qry="select secretkey from account_property where userID="+session.getAttribute("uid")+"";
    Iterator it=con.getData(qry).iterator();
    if(it.hasNext()){
        Vector v=(Vector)it.next();
        if(v.get(0).toString().equals(pass)){
            String qry1="update share_id_record set type='NORM' where userID="+session.getAttribute("uid")+""; 
            System.out.println(qry1);
            con.putData(qry1);
            %>
            <script>
                alert("Image retrieved..");
                window.location="../user/home.jsp";
            </script>
            <%
        }else{
            %>
            <script>
                alert("Invalid secure password..");
                window.location="../user/home.jsp";
            </script>
            <%
        }
    }
    
%>
