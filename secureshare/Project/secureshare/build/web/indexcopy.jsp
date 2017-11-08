<%-- 
    Document   : index
    Created on : 13 Dec, 2014, 10:41:25 AM
    Author     : Administrator
--%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Bird Store Online, CSS Template, Free Download</title>
    <meta name="keywords" content="Bird Store Online, CSS Template, Free Download" />
    <meta name="description" content="Bird Store Online - Download Free CSS Template" />
    <link href="css/templatemo_style.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="css/reveal.css"/>
    <script type="text/javascript" src="css/jquery-1.6.min.js"></script>
    <script type="text/javascript" src="css/jquery.reveal.js"></script>
    
    <script>
        function loadMenu(opt){
            obj=(window.XMLHttpRequest)? new XMLHttpRequest():((window.ActiveXObject)? new ActiveXObject(Microoft.XMLHTTP):null);
            if(obj!=null){                   
                obj.onreadystatechange=function(){
                    if(obj.readyState==4&obj.status==200){ //alert(obj.responseText);
                        document.getElementById('statusdiv').innerHTML=obj.responseText;
                    }
                };
                if(opt==1){
                    obj.open('post','#',true);
                }else if(opt==2){
                    obj.open('post','#',true);
                }else if(opt==3){
                    obj.open('post','#',true);
                }else if(opt==4){
                    obj.open('post','#',true);
                }
                obj.send(null);
            }                
        }
    </script>    
    <script type="text/javascript">
        function PreviewImage() {
            var oFReader = new FileReader();
            oFReader.readAsDataURL(document.getElementById("uploadImage").files[0]);

            oFReader.onload = function (oFREvent) {
                document.getElementById("uploadPreview").src = oFREvent.target.result;                
            };
        };
    </script>
</head>
<body>
<div id="templatemo_container">
  <div id="templatemo_header"><img src="images/sitebanner.jpg" /></div> 
	<!-- end of header -->
    
    <div id="templatemo_menu">
        <ul>
            <li><a href="#" class="current">Home</a></li>
            <li><a href="#">Notifications</a></li>
            <li><a href="#">Messages</a></li>
            <li><a href="#">Friends</a></li>
            <li><a href="#">My Zone</a></li>
            <li><a href="#" class="last">Contact Us</a></li>
        </ul>    	
    </div> <!-- end of menu -->
    
    <div id="templatemo_content">
        
        <div id="content_left">
        
            <div class="content_left_section">
            	<div class="content_left_section_title">Control Panel</div>
		<div class="content_left_section_content">
                    <ul>
                    	<li><a href="#">Profile</a></li>
                        <li><a href="#">Friends</a></li>
                        <li><a href="#">Chats</a></li>                       
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
                	<ul>
                            <li><a href="#">Images</a></li>
                            <li><a href="#">Files</a></li>
                            <li><a href="#">Secured Share</a></li>                            
                        </ul>
                    </div>	
            	<div class="content_left_section_bottom">&nbsp;</div>
            </div>
            
            <div class="margin_bottom_20">&nbsp;</div>
            
            <div class="content_left_section">
            	<div class="content_left_section_title">Settings</div>
                <div class="content_left_section_content">
                    <ul>
                        <li><a href="#">Share Settings</a></li>
                        <li><a href="#">Authentication Settings</a></li>
                        <li><a href="#">Profile Settings</a></li>                            
                    </ul>
                </div>                    
                <div class="cleaner">&nbsp;</div>
                <div class="content_left_section_bottom">&nbsp;</div>
            </div>
            <div class="margin_bottom_20">&nbsp;</div>             
        </div> <!-- end of content left -->
        
		<div id="content_right">
        
            <div class="right_col_section_w650">    
                <label>Upload Status</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="#" class="big-link" data-reveal-id="myModal">Upload Image</a>
              
                <div id="statusdiv"></div>
            </div>
                    
		<div class="margin_bottom_20">&nbsp;</div>
                <!--pop up window div starts-->
                <div id="myModal" class="reveal-modal" style="color: #000">
                    <center>
                    <h4>IMAGE UPLOADING </h4>
                    <form name="uploadimage" action="process/test.jsp" method="post" enctype="multipart/form-data">
                        <table cellpadding="10">
                            <tr>
                                <td>Browse File</td>
                                <td><input type="file" name="file" id="uploadImage" onchange="PreviewImage();"/></td>
                            </tr>
                            <tr>
                                <td colspan="2"><center><img id="uploadPreview" width="220" height="180"/></center></td>
                            </tr>
                            <tr>
                                <td>File Security Options</td>                                                          
                                <td>
                                    <input type="checkbox" name="share" value="1"/>Enable Sharing
                                    <input type="checkbox" name="share" value="1"/>Enable Download<br/>
                                    <input type="checkbox" name="share" value="1"/>Enable Save
                                </td>
                            </tr>
                            <tr>
                                <td>Share to</td>
                                <td><input type="text" name="ids" id="ids" width="600"/></td>
                            </tr>
                            <tr>
                                <td colspan="2" align="right"><input type="submit" value="Upload Image"/></td>
                            </tr>
                        </table>
                    </form>
                    </center>
		</div>
                <!--pop up window div ends-->        
            <div class="right_col_section_w420">
                
                
                <div class="product_box">
	                <span></span>
                  <div class="product_box_title">Shared by:</div>
                  
                    <div class="product_box_content">
                        <a href="#" target="_parent"><img src="images/templatemo_image_03.jpg" width="370" height="200" alt="Parrot Three" /></a>
                      <p>Mauris ut ipsum et felis fringilla adipiscing vel quis nulla.</p>
                        <div class="buttom_section">
	                    <div class="rc_btn_01"><a href="#">Comment</a></div>
                            <div class="rc_btn_01"><a href="#">Share</a></div>
                            <div class="rc_btn_02"><a href="#">Download</a></div>
                            <div class="rc_btn_02"><a href="#">Save</a></div>
                        </div>    
                    </div>
                </div>
                
                <div class="product_box">
	                <span></span>
                  <div class="product_box_title">Shared by:</div>
                  
                    <div class="product_box_content">
                        <a href="#" target="_parent"><img src="images/templatemo_image_03.jpg" width="370" height="200" alt="Parrot Three" /></a>
                      <p>Mauris ut ipsum et felis fringilla adipiscing vel quis nulla.</p>
                        <div class="buttom_section">
	                    <div class="rc_btn_01"><a href="#">Comment</a></div>
                            <div class="rc_btn_01"><a href="#">Share</a></div>
                            <div class="rc_btn_02"><a href="#">Download</a></div>
                            <div class="rc_btn_02"><a href="#">Save</a></div>
                        </div>    
                    </div>
                </div>
                
                <div class="product_box">
	                <span></span>
                  <div class="product_box_title">Shared by:</div>
                  
                    <div class="product_box_content">
                        <a href="#"><img src="images/templatemo_image_05.jpg" width="370" height="200" alt="Parrot Four" /></a>
                      <p>Sed velit metus, iaculis non porttitor lobortis, mollis sed neque.</p>
                        <div class="buttom_section">
                            <div class="rc_btn_01"><a href="#">Comment</a></div>
                            <div class="rc_btn_01"><a href="#">Share</a></div>
                            <div class="rc_btn_02"><a href="#">Download</a></div>
                            <div class="rc_btn_02"><a href="#">Save</a></div>
                        </div>
                    </div>
              </div>
                
                <div class="cleaner">&nbsp;</div>
            </div> <!-- end of right_col_section_w420 -->
            
            <div class="right_col_section_w220">

                <div class="header_01">
                    Friends Online
                </div>                
                <div class="news_section">
                    <div class="news_title">
                    	<ul>
                        <li><a href="#">Friend1</a></li>
                        <li><a href="#">Friend2</a></li>
                        <li><a href="#">Friend3</a></li>  
                        <li><a href="#">Friend4</a></li>
                        <li><a href="#">Friend5</a></li>
                        <li><a href="#">Friend6</a></li> 
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
	    Copyright � 2048 <a href="#">Your Company Name</a> | <a href="http://www.iwebsitetemplate.com" target="_parent">Website Templates</a> by <a href="http://www.templatemo.com" target="_parent">Free CSS Templates</a>
    </div> <!-- end of footer -->
</div> <!-- end of container -->
<div align=center>This template  downloaded form <a href='http://all-free-download.com/free-website-templates/'>free website templates</a></div></body>
</html>
