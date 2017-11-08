<%-- 
    Document   : share_settings_pr
    Created on : 29 Jan, 2015, 8:34:19 PM
    Author     : Administrator
--%>
<%@page import="java.util.Vector"%>
<%@page import="java.util.Iterator"%>
<jsp:useBean id="settings" class="beanfiles.Settings"/>
<jsp:setProperty name="settings" property="*"/>

<%
    String category = request.getParameter("cat");
    settings.setUid(session.getAttribute("uid").toString());

    if (category.equals("1")) {
        if (settings.putData(1) > 0) {
%>
<script>              
    alert("Setting has been saved..")
    window.location="../user/home.jsp";
</script>
<%      } else {
%>
<script>              
    alert("Updation failed.. try again later..")
    window.location="../user/home.jsp";
</script>
<%              }
    }

    if (category.equals("2")) {
        Iterator auth = settings.getData(7).iterator();
        if (auth.hasNext()) {
            Vector v_auth = (Vector) auth.next();
            if (v_auth.get(0).toString().equals(settings.getSecQ()) && v_auth.get(1).toString().equals(settings.getAns())) {
                Iterator it = settings.getData(2).iterator();
                if (it.hasNext()) {
                    Vector v = (Vector) it.next();
                    if (v.get(0).toString().equals(settings.getCurpwd()) && settings.getNewpwd().equals(settings.getConpwd())) {

                        if (settings.putData(3) > 0) {
                            %>
                            <script>              
                                alert("Password has been changed..");
                                window.location="../user/home.jsp";
                            </script>
                            <%              } else {
                            %>
                            <script>              
                                alert("Updation failed.. try again later..");
                                window.location="../user/home.jsp";
                            </script>
                            <%                                      
                            }
                    }
                }
            }else{
                %>
                <script>              
                    alert("Authentication failed.. check security question and answer..");
                    window.location="../user/home.jsp";
                </script>
                <% 
            }
        }
    }
%>
