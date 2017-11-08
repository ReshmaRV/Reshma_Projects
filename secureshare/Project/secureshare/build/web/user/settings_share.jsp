<%-- 
    Document   : settings_share
    Created on : 29 Jan, 2015, 7:57:08 PM
    Author     : Administrator
--%>
<%@page import="java.util.Vector"%>
<%@page import="dbconnection.QueryGenerator"%>
<%@page import="java.util.Iterator"%>
<jsp:useBean id="con" class="dbconnection.DbConnection"/>
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

    <script>
            function redirect(opt){
                if(opt==1)
                    window.location="home.jsp";  
                if(opt==2)
                    window.location="../user/settings_share.jsp?cat=1";
                if(opt==3)
                    window.location="../user/settings_share.jsp?cat=2";
            }
    </script>
</head>
<body>
<div id="templatemo_container">
  <div id="templatemo_header"><img src="../images/sitebanner.jpg" /></div> 
	<!-- end of header -->
    
    <div id="templatemo_menu">
        <ul>
            <li><a href="#" class="current" onclick="redirect(1)">Home</a></li>
            <li><a href="#">Notifications</a></li>
            <li><a href="#">Messages</a></li>
            <li><a href="#">Friends</a></li>
            <li><a href="#">My Zone</a></li>
            <li><a href="#" class="last">Contact Us</a></li>
        </ul>    	
    </div> <!-- end of menu -->
    
    <div id="templatemo_content">
                <jsp:include page="../common/left_div.jsp"/>
		<div id="content_right">
		  <div class="margin_bottom_20">&nbsp;</div>
                <!--upload image pop up window div starts-->
                <div id="myModal" class="reveal-modal" style="color: #000">
                
		</div>
                <!--upload image pop up window div ends-->    
                
            <div class="right_col_section_w420">
                <% String category=request.getParameter("cat"); %>
             <center>    
                 <% if(category.equals("1")){ %>
                <br/><br/><h3>Security Settings Panel</h3><br/>
                <!--<form action="process/share_settings_pr.jsp" method="post" >-->
                <%
                    Iterator it=con.getData(QueryGenerator.GET_ACCOUNT_SETTINGS+"userID='"+session.getAttribute("uid") +"'").iterator();
                    if(it.hasNext()){
                        Vector v=(Vector)it.next();
                %>
                <form action="../process/share_settings_pr.jsp?cat=1" method="post">
                    <table>
                        <tr>
                            <% if(v.get(1).toString().equals("0")){ %>
                                <td><input type="radio" value="1" name="share"/>Enable Share</td>
                                <td><input type="radio" value="0" name="share" checked/>Disable Share</td>
                             <% }else{%>
                             <td><input type="radio" value="1" name="share" checked/>Enable Share</td>
                                <td><input type="radio" value="0" name="share"/>Disable Share</td>
                             <% } %>
                             
                        </tr>
                        <tr> 
                            <% if(v.get(2).toString().equals("0")){ %>
                                <td><input type="radio" value="1" name="download"/>Enable Download</td>
                                <td><input type="radio" value="0" name="download" checked/>Disable Download</td>
                            <% }else{%> 
                                <td><input type="radio" value="1" name="download" checked/>Enable Download</td>
                                <td><input type="radio" value="0" name="download"/>Disable Download</td>
                            <% } %>
                        </tr>
                        <tr> 
                            <% if(v.get(3).toString().equals("0")){ %>
                                <td><input type="radio" value="1" name="save"/>Enable Save</td>
                                <td><input type="radio" value="0" name="save" checked/>Disable Save</td>
                            <% }else{%> 
                                <td><input type="radio" value="1" name="save" checked/>Enable Save</td>
                                <td><input type="radio" value="0" name="save"/>Disable Save</td>
                            <% } %>
                        </tr>
                        <tr> <td colspan="2" align="right"><input type="submit" value="Save"/></td></tr>
                    </table>
                </form>
                <% } %>
                <br/><br/>
                <% } 
                
                if(category.equals("2")){ %>
                <br/><br/><h3>Authentication Settings Panel</h3><br/>
                <!--<form action="process/share_settings_pr.jsp" method="post" >-->
                <form action="../process/share_settings_pr.jsp?cat=2" method="post">
                    <table>
                        <tr><td>Security question</td>  <td><select name="secQ">
                                                    <option value="0" selected="">--select--</option>
                                                    <option value="1">Your first mobile number</option>
                                                    <option value="2">Your most liked moment</option>
                                                    <option value="3">Name of first teacher</option>
                                                    </select></td></tr>
                        <tr> <td>Answer</td>    <td><input type="text" name="ans" id="ans" width="300"/></td> </tr>
                        <tr>
                            <td><label>Enter your current password:</label></td>
                            <td><input type="password" name="curpwd"/></td>
                        </tr>
                        <tr>
                            <td><label>Enter new password:</label></td>
                            <td><input type="password" name="newpwd"/></td>
                        </tr>
                        <tr>
                            <td><label>Confirm new password:</label></td>
                            <td><input type="password" name="conpwd"/></td>
                        </tr>
                        <tr> <td colspan="2" align="right"><input type="submit" value="Save"/></td></tr>
                    </table>
                </form>
                <br/><br/>
                <% } %>
                </center>
                
                <div class="cleaner">&nbsp;</div>
          </div> <!-- end of right_col_section_w420 -->
            
            <div class="right_col_section_w220">

                <div class="header_01">
                    Friends Online
                </div>                
                <div class="news_section">
                    <div class="news_title">
                    <ul>
                        <%
                            Iterator it=con.getData(QueryGenerator.ONLINE_FRIENDS+session.getAttribute("uid")).iterator();
                            while(it.hasNext()){
                                Vector v=(Vector)it.next();
                        %>
                        <li><a href="#" style="color: indigo"><h3><%=v.get(1)%></h3></a></li>
                        <% } %> 
                    </ul>
                    </div>                    
                </div>
                
                <div class="margin_bottom_30">&nbsp;</div>
                
                <div class="news_section">
                    <div class="news_title">
                    	Curabitur euismod scelerisque
                    </div>
                    <p>Vivamus vestibulum condimentum massa. Phasellus id purus. Donec mattis egestas sem. Aliquam posuere. Sed pretium, neque hendrerit rhoncus accumsan, nibh tellus pharetra neque...</p>
                  <div class="rc_btn_03"><a href="#">read more</a></div>
                </div>
                
                <div class="margin_bottom_30">&nbsp;</div>
                
                <div class="news_section">
                    <div class="news_title">
                    	Lorem ipsum dolor sit amet
                    </div>
                    <p>Duis nec viverra justo. Nam consequat mi ut nisl porta interdum. Etiam tempor, dui in tempus fringilla, risus mauris tempor justo, rhoncus feugiat lorem nunc id.</p>
                    <div class="rc_btn_03"><a href="#">read more</a></div>
                </div>
                                                
                <div class="margin_bottom_20">&nbsp;</div>
                
          </div> <!-- end of right_col_section_w220 -->
            
      </div> <!-- end of content right -->
        
        <div class="cleaner">&nbsp;</div>
	</div> <!-- end of container -->
    <div id="templatemo_content_bottom">&nbsp;</div>
<!--  Free CSS Templates by www.TemplateMo.com  -->
    <div id="templatemo_footer">
	    Copyright 2014 <a href="#">LCC Computer Education</a> 
    </div> <!-- end of footer -->
</div> <!-- end of container -->
</body>
</html>

    
 