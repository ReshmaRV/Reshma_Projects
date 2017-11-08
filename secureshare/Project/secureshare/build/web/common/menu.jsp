<%-- 
    Document   : menu
    Created on : 10 Jul, 2015, 11:36:01 AM
    Author     : Administrator
--%>

<%@page import="dbconnection.QueryGenerator"%>
<%@page import="java.util.Vector"%>
<%@page import="java.util.Iterator"%>
<jsp:useBean id="con" class="dbconnection.DbConnection"/>
<label style="color: maroon; font-size: medium;">
                    <%
                        Vector notific = null;
                        Iterator it_notifi = con.getData(QueryGenerator.GET_NOTIFICATION_COUNT).iterator();
                        if (it_notifi.hasNext()) {
                            notific = (Vector) it_notifi.next();
                        }
                    
                        String username = "select name from user_details where userID=" + session.getAttribute("uid") + "";
                        Iterator it_name = con.getData(username).iterator();
                        if (it_name.hasNext()) {
                            Vector v = (Vector) it_name.next();
                            out.println("welcome " + v.get(0) + "..");
                        }
                    %>
                </label>
                <ul>
                    <li><a href="#" class="current" onclick="redirect(1)">Home</a></li>
                    <!--<li><a href="#" class="big-link" data-reveal-id="notification"><%=notific.get(0)%>&nbsp;&nbsp;Notifications</a></li>-->
                    <!--<li><a href="#">Messages</a></li>-->

                    <%

                        String qry = "select count(uid) from friends_list where req_status=0 and req_id=" + session.getAttribute("uid");
                        Iterator it_req = con.getData(qry).iterator();
                        if (it_req.hasNext()) {
                            Vector v = (Vector) it_req.next();
                            if (!v.get(0).toString().equals("0")) {
                                out.println("<li><a href=\"#\" class=\"big-link\" data-reveal-id=\"frndrqst\">" + v.get(0) + " Friend requests</a></li>");
                            } else {
        //                        out.println("<li><a href=\"#\">Friends</a></li>");
                            }
                        }
                    %> 
                    <li><a href="../process/logout.jsp" class="last">Sign out</a></li>
                </ul>
