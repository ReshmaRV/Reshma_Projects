
<%-- 
    Document   : index
    Created on : 13 Dec, 2014, 10:41:25 AM
    Author     : Administrator
--%>

<%@page import="java.io.File"%>
<%@page import="security.SteganoInformation"%>
<%@page import="java.util.Vector"%>
<%@page import="java.util.Iterator"%>
<%@page import="dbconnection.QueryGenerator"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Bird Store Online, CSS Template, Free Download</title>
        <meta name="keywords" content="Bird Store Online, CSS Template, Free Download" />
        <meta name="description" content="Bird Store Online - Download Free CSS Template" />
        <link href="../css/templatemo_style.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" href="../css/reveal.css"/>
        <script type="text/javascript" src="../css/jquery-1.6.min.js"></script>
        <script type="text/javascript" src="../css/jquery.reveal.js"></script>  

        <link rel="stylesheet" href="../css/exp_menu.css" type="text/css" media="screen, projection"/>
        <script type="text/javascript" src="../js/jquery-1.4.2.min.js"></script>
        <script type="text/javascript" src="../js/scripts.js"></script>

        <link rel="stylesheet" href="../css/reveal.css"/>
        <script type="text/javascript" src="../css/jquery-1.6.min.js"></script>
        <script type="text/javascript" src="../css/jquery.reveal.js"></script>

        <jsp:useBean id="con" class="dbconnection.DbConnection"/>

        <script>
            function loadPage(opt){//alert(opt);
                obj=(window.XMLHttpRequest)? new XMLHttpRequest():((window.ActiveXObject)? new ActiveXObject(Microoft.XMLHTTP):null);
                if(obj!=null){                   
                    obj.onreadystatechange=function(){
                        if(obj.readyState==4&obj.status==200){ //alert(obj.responsesText);
                            document.getElementById('loadedcontents').innerHTML=obj.responseText;
                        }
                    };
                    if(opt==1){
                        obj.open('post','user/settings_share.jsp',true);
                    }else if(opt==2){
                        obj.open('post','process/share_settings_pr.jsp',true);
                    }else if(opt==3){
                        obj.open('post','#',true);
                    }else if(opt==4){
                        obj.open('post','#',true);
                    }
                    obj.send(null);
                }                
            }
            
            function save(val){//alert(val);
                obj=(window.XMLHttpRequest)? new XMLHttpRequest():((window.ActiveXObject)? new ActiveXObject(Microoft.XMLHTTP):null);
                if(obj!=null){                   
                    obj.onreadystatechange=function(){
                        if(obj.readyState==4&obj.status==200){ //alert(obj.responsesText);
                            document.getElementById('btn').innerHTML=obj.responseText;
                        }
                    };
                    
                    obj.open('post','../process/saveimg.jsp?img='+val,true);
                    obj.send(null);
                }                
            }
        
        </script>    
        <script>
            function redirect(opt){
                if(opt==1)
                    window.location="home.jsp";
                if(opt==2)
                    window.location="../user/settings_share.jsp?cat=1";
                if(opt==3)
                    window.location="../user/settings_share.jsp?cat=2";             
            }
        
            function moveto(opt,val){//alert(val);
                if(opt==1)
                    window.location="../user/shareImage.jsp?src=none";
                if(opt==2)
                    window.location="../process/copyshare.jsp?src="+val;
            }
            
        </script>       

    </head>
    <body>
        <%

//            System.out.println(session.getAttribute("uid"));
            if (session.getAttribute("uid") == null) {
                response.sendRedirect("../index.jsp");
            }

            Vector notific = null;
            Iterator it_notifi = con.getData(QueryGenerator.GET_NOTIFICATION_COUNT).iterator();
            if (it_notifi.hasNext()) {
                notific = (Vector) it_notifi.next();
            }
        %>
        <div id="templatemo_container">
            <div id="templatemo_header"><img src="../images/sitebanner.jpg" /></div> 
            <!-- end of header -->

            <div id="templatemo_menu">
                <jsp:include page="../common/menu.jsp"/>
            </div> <!-- end of menu -->
            <!--_______________________________________________________________________________________________-->
            <% 
            Iterator it_pass = con.getData(QueryGenerator.GET_SEQ_PASS + session.getAttribute("uid")).iterator();
            if (it_pass.hasNext()) {
                Vector pass = (Vector) it_pass.next();System.out.println(pass.get(0));
                if (pass.get(0).toString().equals("00000")) {
                    %><marquee style="color: red"><b>Hi..Your security password is found to be default! your default password is 00000.. please change your password immediately to secure your shares.. go to setting>>Authentication Settings to change security password...</b></marquee><%                       
                }
            } %>
            <!--______________________________________________________________________________________________-->
            <div id="templatemo_content">
                <div id="notification" class="reveal-modal" style="color: #000">
                    <%
                        Vector show_notific = null;
                        Iterator get_notific = con.getData(QueryGenerator.LOAD_NOTIFICATIONS + session.getAttribute("uid")).iterator();
                        if (!get_notific.hasNext()) {
                            out.println("No new notifications right..");
                        }
                        while (get_notific.hasNext()) {
                            show_notific = (Vector) get_notific.next();
                    %>
                    <h3>Date:&nbsp;&nbsp;<%=show_notific.get(0)%></h3><br/>
                    <i><%=show_notific.get(1)%></i><br/><br/><hr/>
                    <%
                        }
                    %>
                </div>
                <div id="seq_notification" class="reveal-modal" style="color: #000">
                    <%
                        Vector seq_notific = null; //out.println(QueryGenerator.LOAD_NOTIFICATIONS+session.getAttribute("uid"));                    
                        Iterator get_seq_notific = con.getData(QueryGenerator.LOAD_SEQ_NOTIFICATIONS + session.getAttribute("uid")).iterator();
                        while (get_seq_notific.hasNext()) {
                            seq_notific = (Vector) get_seq_notific.next();
                    %>
                    <h3><%=seq_notific.get(1)%></h3><br/>
                    <%
                        }
                    %>
                </div>
                <jsp:include page="../common/left_div.jsp"/>


                <div id="content_right">
                    <div class="right_col_section_w650">    
                        <!--<label>Upload Status</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-->
                        <a href="#" class="big-link" onclick="moveto(1,0);">Upload Image</a>

                        <div id="statusdiv"></div>
                    </div>

                    <div class="margin_bottom_20">&nbsp;</div>
                    <!--upload image pop up window div starts-->
                    <div id="myModal" class="reveal-modal" style="color: #000">
                        <!--popup code-->
                    </div>
                    <!--upload image pop up window div ends-->    

                    <div class="right_col_section_w420">
                        <div id="loadedcontents">
                            <span></span>
                            <%
                                //loading shares id
                                Iterator it = con.getData(QueryGenerator.SELECT_SHARES + session.getAttribute("uid") + " and view_status=0").iterator();
                                while (it.hasNext()) {
                                    Vector v = (Vector) it.next();
                                    if (v.get(1).toString().equals("NORM")) {
                                        //loading shares with neccessary data
                                        Iterator it1 = con.getData(QueryGenerator.GET_SHARE + v.get(0)).iterator();
                                        if (it1.hasNext()) {
                                            Vector sharedata = (Vector) it1.next();
                            %>
                            <div class="product_box">
                                <%
                                    Iterator it2 = con.getData(QueryGenerator.GET_USER + sharedata.get(5)).iterator();
                                    if (it2.hasNext()) {
                                        Vector shby = (Vector) it2.next();
                                %>
                                <div class="product_box_title" style="color: white">Shared by:<% out.println(shby.get(0));%></div>
                                <%
                                    }
                                %>

                                <div class="product_box_content">
                                    <center><a href="#" target="_parent"><img src="../<%=sharedata.get(1)%>" width="350" height="230"/></a></center>
                                    <div class="buttom_section">
                                        <div id="btn">
                                            <!--                                                    <div class="rc_btn_01"><a href="#">Comment</a></div>-->
                                            <% if (sharedata.get(3).toString().equals("0")) {%>
                                            <!--<div class="rc_btn_01"><a href="#">Share Protected</a></div>-->
                                            <% } else {%>
                                            <div class="rc_btn_01"><a href="#" onclick="moveto(2,'<% out.print(sharedata.get(1));%>')">Share</a></div>
                                            <% }%>

                                            <% if (sharedata.get(2).toString().equals("0")) {%>
                                            <!--<div class="rc_btn_02"><a href="#">Download</a></div>-->
                                            <% } else {%>
                                            <div class="rc_btn_02"><a href="../<%=sharedata.get(1)%>" download="secureimg.jpg" id="btnExport" style="color: #cc0505">Download</a></div>
                                            <% }%>

                                            <% if (sharedata.get(2).toString().equals("0")) {%>
                                            <!--<div class="rc_btn_02"><a href="#">Save</a></div>-->
                                            <% } else {%>
                                            <!--<div class="rc_btn_02"><a href="#" class="big-link" data-reveal-id="rename">Save </a></div>-->
                                            <!--<div class="rc_btn_02"><a href="#"><label onclick="save(<%=sharedata.get(1)%>)">Save</label> </a></div>-->
                                            <div class="rc_btn_02"><a href="../process/saveimgPr.jsp?img=<%=sharedata.get(1)%>">Save</a></div>
                                            <% }%>  
                                        </div>
                                    </div>                                     
                                </div>
                            </div>
                            <%
                                }
                            } else {
                                Iterator it1 = con.getData(QueryGenerator.GET_SHARE + v.get(0)).iterator();
                                if (it1.hasNext()) {
                                    Vector sharedata = (Vector) it1.next();
                            %>
                            <div class="product_box">
                                <%
                                    Iterator it2 = con.getData(QueryGenerator.GET_USER + sharedata.get(5)).iterator();
                                    if (it2.hasNext()) {
                                        Vector shby = (Vector) it2.next();
                                %>
                                <div class="product_box_title">Shared by:<% out.println(shby.get(0));%></div>
                                <%
                                    }
                                %>
                                <div class="product_box_content">
                                    <center><a href="#" class="big-link" data-reveal-id="seq"><img src="../images/grey.png" width="350" height="230"/></a></center>
                                    <div class="buttom_section">
                                        <!--                                                    <div class="rc_btn_01"><a href="#">Comment</a></div>-->
                                        <% if (sharedata.get(3).toString().equals("0")) {%>
                                        <!--<div class="rc_btn_01"><a href="#">Share Protected</a></div>-->
                                        <% } else {%>
                                            <!--<div class="rc_btn_01"><a href="../process/directshare.jsp?img=<%=sharedata.get(1)%>">Share</a></div>-->
                                        <% }%>

                                        <% if (sharedata.get(2).toString().equals("0")) {%>
                                        <!--<div class="rc_btn_02"><a href="#">Download</a></div>-->
                                        <% } else {%>
                                        <div class="rc_btn_02"><a href="../<%=sharedata.get(1)%>" download="secureimg.jpg" id="btnExport" style="color: #cc0505">Download</a></div>
                                        <% }%>

                                        <% if (sharedata.get(2).toString().equals("0")) {%>
                                        <!--<div class="rc_btn_02"><a href="#">Save</a></div>-->
                                        <% } else {%>
                                        <div class="rc_btn_02"><a href="../process/saveimg.jsp?img=<%=sharedata.get(1)%>">Save </a></div>
                                        <% }%>
                                    </div>    
                                </div>
                            </div>
                            <%
                                        }
                                    }
                                }
                            %>
                        </div>

                        <!--POP UP-->
                        <div id="seq" class="reveal-modal" style="color: #000">
                            <center>
                                <h4>Security Validation </h4><br/>
                                <form name="validation" action="../process/seqvalid.jsp" method="post">
                                    <table cellpadding="20" columnpadding="10">
                                        <tr>
                                            <td>Enter Security Password</td>                                            
                                            <td>&nbsp;&nbsp;<input type="password" name="upassword" id="password"/></td>
                                        </tr>
                                        <tr>
                                            <td colspan="2" align="right"><input type="submit" value="Login"/></td>
                                        </tr>                            
                                    </table>
                                </form>
                            </center>
                            <!--POP UP-->
                        </div>
                        <div class="cleaner">&nbsp;</div>
                    </div> <!-- end of right_col_section_w420 -->

                    <div class="right_col_section_w220">
                        <jsp:include page="../common/right_div.jsp"/>
                    </div> <!-- end of right_col_section_w220 -->

                </div> <!-- end of content right -->

                <div class="cleaner">&nbsp;</div>
            </div> <!-- end of container -->

            <!--POPUP-FRIEND REQUEST--> 
            <div id="frndrqst" class="reveal-modal" style="color: #000">
                <center>
                    <h4>Friend Requests </h4><br/>
                    <%
                        Iterator it_listrqst = con.getData(QueryGenerator.LIST_FRIEND_REQUEST + session.getAttribute("uid")).iterator();
                        while (it_listrqst.hasNext()) {
                            Vector v = (Vector) it_listrqst.next();

                            Iterator it_rqstdetail = con.getData(QueryGenerator.LIST_REQUEST_DETAILS + v.get(0)).iterator();
                            while (it_rqstdetail.hasNext()) {
                                Vector v2 = (Vector) it_rqstdetail.next();
                    %>                    
                    <form action= method="post">
                        <table>
                            <tr>
                                <td>Name :</td>
                                <td><label><%=v2.get(1)%></label></td>
                            </tr>
                            <tr>
                                <td>Place :</td>
                                <td><label><%=v2.get(3)%></label></td>
                            </tr>
                            <tr>
                                <td><a href="../process/reqPr.jsp?uid=<% out.println(v.get(0));%>&opt=REJ" style="color: darkred">Reject</a></td>
                                <td><a href="../process/reqPr.jsp?uid=<% out.println(v.get(0));%>&opt=ACP" style="color: springgreen">Accept</a></td>
                            </tr>
                        </table>
                    </form>
                    <%
                            }
                        }
                    %>
                </center>
            </div>

            <div id="templatemo_content_bottom">&nbsp;</div>
            <!--  Free CSS Templates by www.TemplateMo.com  -->
            <div id="templatemo_footer">
                <!--Copyright 2014 <a href="#">LCC Computer Education</a>--> 
            </div> <!-- end of footer -->
        </div> <!-- end of container -->
    </body>
</html>
