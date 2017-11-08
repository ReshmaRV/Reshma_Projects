<!DOCTYPE html>
<html lang="en">
<head>
<title>SECshare</title>
<meta charset="utf-8">
<link rel="stylesheet" href="css/reset.css" type="text/css" media="all">
<link rel="stylesheet" href="css/layout.css" type="text/css" media="all">
<link rel="stylesheet" href="css/style.css" type="text/css" media="all">
<script type="text/javascript" src="css/jquery-1.6.js"></script>
<script type="text/javascript" src="css/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="css/tms-0.3.js"></script>
<script type="text/javascript" src="css/tms_presets.js"></script>
<script type="text/javascript" src="css/script.js"></script>

<link rel="stylesheet" href="css/reveal.css"/>
<script type="text/javascript" src="css/jquery-1.6.min.js"></script>
<script type="text/javascript" src="css/jquery.reveal.js"></script>
<script>
    function message(){
        alert("Contact number will be your default authentication password..");
    }
</script>
</head>
<body id="page1">
<div class="body1">
  <div class="main">
    <!--header -->
    <!--<a href="#" class="big-link" data-reveal-id="signup">-->
    <header>
      <div class="wrapper">
        <h1><a href="#">Firepop Secure your shares</a></h1>
        <nav>
          <ul id="menu">
            <li><a href="#" class="big-link" data-reveal-id="myModal">Login</a></li>
            <li><a href="#" class="big-link" data-reveal-id="signup">Sign up</a></li>
          </ul>
        </nav>
      </div>
      <div class="slider_bg">
        <div class="slider">
            <img src="images/homeimg.png"/>
          <ul class="items">
            <li><img src="images/homeimg.png" alt=""/></li>
          </ul>
        </div>
      </div>
    </header>
    <!-- / header -->
    <!-- content -->
    <article id="content">
      <div class="wrapper">
        
      </div>
    </article>
  </div>
</div>
    <!--pop up window login div starts-->
    <div id="myModal" class="reveal-modal" style="color: #000">
        <center>
        <h4>MEMBER LOGIN </h4><br/>
        <form name="login" action="process/loginpr.jsp" method="post">
            <table cellpadding="20" columnpadding="10">
                <tr>
                    <td>Username</td>
                    <td>&nbsp;&nbsp;<input type="text" name="username" id="username"/></td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td>&nbsp;&nbsp;<input type="password" name="upassword" id="password"/></td>
                </tr>
                <tr>
                    <td colspan="2" align="right"><input type="submit" value="Login"/></td>
                </tr>                            
            </table>
        </form>
        </center>
    </div>
    <!--pop up window login div ends-->
    <!--pop up window signup div starts-->
    <div id="signup" class="reveal-modal" style="color: #000">
        <center>
        <h4>SIGN UP HERE </h4><br/>
        <form name="signup" action="process/signup_pr.jsp" method="post">
            <table>
                <tr> <td>Name</td>           <td><input type="text" name="name" id="name"/></td> </tr>
                <tr> <td>Birth day</td>  <td><input type="date" name="dob" id="dob"/></td> </tr>
                <tr> <td>Email</td>         <td><input type="email" name="email" id="email"/></td></tr>
                <tr> <td>Contact</td>           <td><input type="text" name="contact" id="contact" onclick="message()"/></td> </tr>
                <tr> <td>Address</td>           <td><textarea name="address" id="address" rows="5" cols="21"></textarea></td> </tr>
                <tr> <td>Place</td>           <td><input type="text" name="place" id="place"/></td> </tr>
                <tr> <td>Username</td>           <td><input type="text" name="username" id="username"/></td> </tr>
                <tr> <td>Password</td>           <td><input type="password" name="upassword" id="password"/></td> </tr>
                <tr><td>Security question</td>  <td><select name="secQ">
                                                    <option value="0" selected="">--select--</option>
                                                    <option value="1">Your first mobile number</option>
                                                    <option value="2">Your most liked moment</option>
                                                    <option value="3">Name of first teacher</option>
                                                    </select></td></tr>
                <tr> <td>Answer</td>    <td><input type="text" name="ans" id="ans" width="300"/></td> </tr>
                <tr> <td colspan="2" align="right"><input type="submit" value="Sign up"</td>   </tr>
            </table>
        </form>
        </center>
    </div>
    <!--pop up window signup div ends-->
<div class="body2">
  <div class="main">
   
    <!-- / content -->
  </div>
</div>
<div class="main">
  <!-- footer -->
  
</div>
<!--<div align=center> <a href='#'>LCC Computer Education, Marine drive, Kochi</a></div></body>-->
</html>