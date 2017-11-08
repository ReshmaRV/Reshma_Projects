<%-- 
    Document   : left_div
    Created on : 10 Jul, 2015, 10:35:50 AM
    Author     : Administrator
--%>

<%@page import="java.io.File"%>
<div id="content_left">

    <div class="content_left_section">
        <div class="content_left_section_title">Control Panel</div>
        <div class="content_left_section_content">
            <ul>
                <li><a href="view_profile.jsp">Profile</a></li>
                <li><a href="findnewfriends.jsp">Find friends</a></li>
                <!--<li><a href="#">Chats</a></li>-->                       
            </ul>
            <div class="cleaner">&nbsp;</div>
        </div>	
        <div class="cleaner">&nbsp;</div>
        <div class="content_left_section_bottom">&nbsp;</div>
    </div>

    <div class="margin_bottom_20">&nbsp;</div>
    <div class="content_left_section">
        <div class="content_left_section_title">Documents</div>
        <div class="content_left_section_content">
            <div id="listContainer">
                <ul id="expList">
                    <li><a href="#">Images</a>
                        <ul>
                            <table>
                            <%
                                try {
                                    File[] images = new File(common.Constants.PROJECT_PATH + "savedImages/").listFiles();
                                    
                                    int len=images.length,i=1;
                                    for (File curFile : images) {
                                        String cf = curFile.getName();
                                        String div_id = cf.substring(0, cf.lastIndexOf("."));
                                        if (cf.substring(0, cf.indexOf("_")).equals(session.getAttribute("uid").toString())) {
                            %>
                                <!--<li><a href=""><label><%=cf%></label></a></li>-->                            
                            <script>
                                function viewimg(){    
                                    var path=document.getElementById("img").value;
                                    window.location="viewimg.jsp?img="+path;
                                }
                            </script>
                            <input type="hidden" id="img" value="<%=cf%>"/>
                            <div id="imgdisp">
                                <% if(i%2!=0 && i<=len){ %>
                                <tr><td>
                                    <div id="img_div"><img src="../savedImages/<%=cf%>" width="70" height="70" onclick="viewimg()"/></div>
                                </td>
                                <% }else{ %>
                                <td>
                                    <div id="img_div"><img src="../savedImages/<%=cf%>" width="70" height="70" onclick="viewimg()"/></div>
                                </td></tr>
                                <% } %>
                            </div>
                                    <% }
                                         i++;   }
                                        } catch (Exception ex) {
                                            System.out.println("files not found:   " + ex);
                                        }
                                    %>
                            </table>
                        </ul>
                    </li>
<!--                    <li><a href="#">Files</a></li>
                    <li><a href="#">Secured Share</a></li>                            -->
                </ul>
            </div>
        </div>	
        <div class="content_left_section_bottom">&nbsp;</div>
    </div>

    <div class="margin_bottom_20">&nbsp;</div>

    <div class="content_left_section">
        <div class="content_left_section_title">Settings</div>
        <div class="content_left_section_content">
            <ul>
                <li><a href="#" onclick="redirect(2);">Share Settings</a></li>
                <li><a href="#" onclick="redirect(3);">Authentication Settings</a></li>                  
            </ul>
        </div>                    
        <div class="cleaner">&nbsp;</div>
        <div class="content_left_section_bottom">&nbsp;</div>
    </div>
    <div class="margin_bottom_20">&nbsp;</div>             
</div> <!-- end of content left -->