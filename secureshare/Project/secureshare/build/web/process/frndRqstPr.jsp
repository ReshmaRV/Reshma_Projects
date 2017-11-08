<%-- 
    Document   : frndRqstPr
    Created on : 4 Feb, 2015, 7:26:04 PM
    Author     : Administrator
--%>
<jsp:useBean id="con" class="dbconnection.DbConnection"/>
<%
    String qry="insert into friends_list(uid,req_id) "
                + "values("+session.getAttribute("uid")+","+request.getParameter("uid")+")";
    System.out.println(qry);
    if(con.putData(qry)>0){
        %>
        <script>
            alert("Friend request send");
        </script>
        <%
        response.sendRedirect("../user/view_friends.jsp");
    }else{
        %>
        <script>
            alert("Error..Rrequest not send..");
        </script>
        <%
        response.sendRedirect("../user/view_friends.jsp");
    }
%>
