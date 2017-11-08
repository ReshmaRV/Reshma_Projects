<%-- 
    Document   : right_div
    Created on : 10 Jul, 2015, 2:48:16 PM
    Author     : Administrator
--%>

<%@page import="java.util.Vector"%>
<%@page import="java.util.Iterator"%>
<%@page import="dbconnection.QueryGenerator"%>
<jsp:useBean id="con" class="dbconnection.DbConnection"/>
<div class="header_01">
                    <h4 style="color: #FFFFFF">Friends Online</h4>
                        </div>                
                        <div class="news_section">
                            <div class="news_title">
                                <ul>
                                    <%
                                        Vector notific = null;                                                                             
                                        Iterator it1 = con.getData((QueryGenerator.ONLINE_FRIENDS).replaceAll("USER_ID", session.getAttribute("uid").toString())).iterator();
                                        if (!it1.hasNext()) {
                                            %><h5>No Active Friends..</h5><%
                                        }else{
                                        while (it1.hasNext()) {
                                            Vector v = (Vector) it1.next();
                                    %>
                                    <li><a href="#" style="color: indigo"><%=v.get(1)%></a></li>
                                    <% } } %> 
                                </ul>
                            </div>                    
                        </div>

                        <div class="margin_bottom_30">&nbsp;</div><hr/>
                        <div class="news_section">

                            <%
                                Iterator it3 = con.getData(QueryGenerator.LOAD_SEQ_NOTIFICATIONS + session.getAttribute("uid")).iterator();
                                
                            %> <div class="news_title"><h4 style="color: #FFFFFF">Security Messages</h4></div> <%
                                    if (!it3.hasNext()) {
                                            %><h5>No New Messages..</h5><%
                                        }else{    
                                    while (it3.hasNext()) {
                                            notific = (Vector) it3.next();
                            %>                          
                            <p style="font-size: small"><% out.println(notific.get(1).toString().substring(0, 76) + "...");%></p>
                            <a href="../process/remove_notification.jsp?slno=<%=notific.get(2)%>" style="color: red; font-size: small;">Remove</a>&nbsp;&nbsp;&nbsp;
                            <a href="#" class="big-link" data-reveal-id="seq_notification"  style="color: #FFFFFF; font-size: small; ">read more</a>
                        </div>
                             <% } }%> 
                        <div class="margin_bottom_30">&nbsp;</div>
                       