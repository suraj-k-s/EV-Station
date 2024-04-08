<%-- 
    Document   : MyProfile
    Created on : 1 Feb, 2024, 4:50:25 PM
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
        <title>My profile</title>
    </head>
    <body>
        <form method="post">



            <%
               
                String uid = session.getAttribute("uid").toString();
                String name = "select * from tbl_userfirst where user_id = '" + uid + "'";
                ResultSet rs = con.selectCommand(name);
                rs.next();

            %>



            <table border="1">
                <tr>
                    <td>
                        Name
                    </td>
                    <td>
                        <%=rs.getString("user_name")%>
                    </td>
                </tr>
                <tr>
                    <td>
                        Contact
                    </td>
                    <td>
                        <%=rs.getString("user_contact")%>
                    </td>
                </tr>
                <tr>
                    <td>
                        email
                    </td>
                    <td>
                        <%=rs.getString("user_email")%>
                    </td>
                </tr>
                <tr>
                    <td>
                        <a href="EditProfile.jsp">Edit Profile</a>
                    </td>
                    <td>
                        <a href="ChangePassword.jsp">Change Password</a>
                    </td>
                </tr>

            </table>
        </form>
    </body>
     <%@include file="Foot.jsp" %>
</html>
