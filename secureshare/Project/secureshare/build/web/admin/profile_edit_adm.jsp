<%-- 
    Document   : profile_edit
    Created on : 13 Dec, 2014, 11:04:09 AM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <center>
        <h4>ADMIN PROFILE</h4>
        <form name="profedit" action="../process/profile_edit_adm_pr.jsp" method="post">
            <table>
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="name" id="name"/></td>
                </tr>
                <tr>
                    <td>Date of birth</td>
                    <td><input type="date" name="dob" id="dob"/></td>
                </tr>
                <tr>
                    <td>Contact</td>
                    <td><input type="text" name="contact" id="contact"/></td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><input type="text" name="mail" id="mail"/></td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td><input type="text" name="addr" id="addr"/></td>
                </tr>
                <tr>
                    <td>Place</td>
                    <td><input type="text" name="place" id="place"/></td>
                </tr>
                <tr>
                    <td>Working at</td>
                    <td><input type="text" name="wrk" id="wrk"/></td>
                </tr>
                <tr>
                    <td colspan="2" align="right"><input type="submit" value="Update"/></td>
                </tr>
            </table>
        </form>
    </center>
    </body>
</html>
