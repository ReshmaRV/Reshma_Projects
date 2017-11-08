<%-- 
    Document   : reqPr
    Created on : 10 Mar, 2015, 10:21:51 AM
    Author     : Administrator
--%>
<%@page import="dbconnection.QueryGenerator"%>
<jsp:useBean id="con" class="dbconnection.DbConnection"/>
<%
    String opt=request.getParameter("opt"); //out.println(opt);
    String uid=request.getParameter("uid");
    
    if(opt.equals("REJ")){
        if(con.putData(QueryGenerator.REJECT_REQUEST+uid)>0){
            %>
            <script>
                alert("Friend request rejected..");
                window.location="../user/home.jsp";
            </script>
            <%
        }else{
            %>
            <script>
                alert("Friend request rejection failed..");
                window.location="../user/home.jsp";
            </script>
            <%
        }
    }
    
    if(opt.equals("ACP")){
        if(con.putData(QueryGenerator.ACCEPT_REQUEST+uid)>0){
            %>
            <script>
                alert("Friend request Accepted..");
                window.location="../user/home.jsp";
            </script>
            <%
        }else{
            %>
            <script>
                alert("Action failed..");
                window.location="../user/home.jsp";
            </script>
            <%
        }
    }
%>