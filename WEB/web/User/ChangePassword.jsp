<%-- 
    Document   : ChangePassword
    Created on : 1 Feb, 2024, 4:50:44 PM
    Author     : abhis
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <%@include file="Head.jsp" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change Password</title>
    </head>
    <%
        if (request.getParameter("btn_save") != null) {
            String uid = session.getAttribute("uid").toString();
            String user = "select * from tbl_userfirst where user_id = '" + uid + "'";
            ResultSet rs = con.selectCommand(user);
            rs.next();
            String dbpassword = rs.getString("user_password");

            String npassword = request.getParameter("txt_newpassword");
            String rpassword = request.getParameter("repassword");

            String cpassword = request.getParameter("txt_currpassword");

            if (dbpassword.equals(cpassword)) {

                if (npassword.equals(rpassword)) {

                    String update = "update tbl_userfirst set user_password = '" + npassword + "' where user_id='" + uid + "'";
                    if (con.executeCommand(update)) {

    %>
    <script>
        alert("Password Changed");
        window.location = 'ChangePassword.jsp';


    </script>
    <%                       }

    } else {
    %>

    <script>
        alert("Check Confirm Password");
        window.location = 'ChangePassword.jsp';

    </script>
    <%
        }
    } else {
    %>

    <script>
        alert("Incorrect Current Password");
        window.location = 'ChangePassword.jsp';


    </script>
    <%
            }
        }
    %>
    <%@include file="Head.jsp" %>
    <body>
        <form method="post">
            <h2>Change Password</h2>
            <table border="1">
                <tr>
                    <td>
                        current password
                    </td>
                    <td>
                        <input type="password" name="txt_currpassword">
                    </td>
                </tr>
                <tr>
                    <td>
                        New Password
                    </td>
                    <td>
                        <input type="password" name="txt_newpassword">
                    </td>
                </tr>
                <tr>
                    <td>
                        Reenter password
                    </td>
                    <td>
                        <input type="password" name="repassword">
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="btn_save" value="update">
                    </td>
                </tr>
            </table>
        </form>
      
    </body>
     <%@include file="Foot.jsp" %>
</html>
