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
                    if(obj.readyState==4&obj.status==200){ //alert(obj.responsesText);
                        document.getElementById('statusdiv').innerHTML=obj.responseText;
                    }
                };
                if(opt==1){
                    obj.open('post','user/shareImage.jsp',true);
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
                        
                        <h4>IMAGE UPLOADING </h4>
                        <table border="2">
                            <tr>
                                <td>Send to:<br/><input type="text" name="share" id="share"/>
                                    <input type="button" value=">>" onclick="move(this.value);"</td>
                                
                                <td><textarea name="shareto" id="shareto" rows="10"></textarea>
                                    <br/><input type="button" value="Continue"/></td>
                            </tr>
                        </table> <br/>
                        <form name="uploadimage" action="share_image.jsp" method="post">
                            <table border="3">
                                <tr>
                                    <td>Browse File</td>
                                    <td><input type="file" name="file" id="uploadImage" onchange="PreviewImage();"/></td>
                                </tr>
                                <tr>
                                    <td colspan="2"><center><img id="uploadPreview" width="220" height="180"/></center></td>
                                </tr>
                                <tr>
                                    <td colspan="2"><input type="submit" name="uploadimg" value="Share Image"</td>
                                </tr>
                           </table>
                       </form>
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
