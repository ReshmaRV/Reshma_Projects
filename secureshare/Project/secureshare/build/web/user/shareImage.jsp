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
    <link href="../css/templatemo_style.css" rel="stylesheet" type="text/css" />
    <link rel="../stylesheet" href="css/reveal.css"/>
    <script type="text/javascript" src="../css/jquery-1.6.min.js"></script>
    <script type="text/javascript" src="../css/jquery.reveal.js"></script>  
    
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
  <div id="templatemo_header"><img src="../images/sitebanner.jpg" /></div> 
<div id="templatemo_content_bottom">
        <center>
        <h1>IMAGE UPLOADING </h1>        
        <form action="../process/create_share_temp_file.jsp" method="post" enctype="multipart/form-data">
            <table cellpadding="10" border="3" width="500">
                <tr style="color: maroon">
                    <td>Browse File</td>
                    <td><input type="file" name="file" id="uploadImage" onchange="PreviewImage();"/></td>
                </tr>
                <tr>
                    <td colspan="2"><center><img id="uploadPreview" width="250" height="200"/></center></td>
                </tr>
                <tr>
                    <td colspan="2" align="right"><input type="submit" value="Choose Share"/></td>
                </tr>
            </table>
        </form>
        </center>
</div>

</div> <!-- end of container -->
</body>
</html>
