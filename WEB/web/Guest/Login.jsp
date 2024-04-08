<%-- 
    Document   : Login
    Created on : 1 Feb, 2024, 4:50:02 PM
    Author     : abhis
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title> Login </title>
        <%

            if (request.getParameter("btn_save") != null) {
                String email = request.getParameter("txt_email");
                String password = request.getParameter("txt_password");

                String selAdmin = "select * from tbl_admin  where admin_email='" + email + "' and admin_password='" + password + "'";
                String selUser = "select * from tbl_userfirst where user_email='" + email + "' and user_password='" + password + "'";
                String selstation = "select * from tbl_station where station_email='" + email + "' and station_password ='" + password + "' and station_status='1'";

                ResultSet rsUser = con.selectCommand(selUser);
                ResultSet rsstation = con.selectCommand(selstation);
                ResultSet rsAdmin = con.selectCommand(selAdmin);

                if (rsUser.next()) {
                    session.setAttribute("uid", rsUser.getString("user_id"));
                    session.setAttribute("uname", rsUser.getString("user_name"));
                    response.sendRedirect("../User/HomePage.jsp");
                } else if (rsstation.next()) {
                    session.setAttribute("sid", rsstation.getString("station_id"));
                    session.setAttribute("sname", rsstation.getString("station_name"));
                    response.sendRedirect("../Station/HomePage.jsp");
                } else if (rsAdmin.next()) {
                    session.setAttribute("aid", rsAdmin.getString("admin_id"));
                    session.setAttribute("aname", rsAdmin.getString("admin_name"));
                    response.sendRedirect("../Admin/HomePage.jsp");
                } else {
        %>
        <script>
            alert("Invalid Credentials");
        </script>
        <%
                }

            }

        %>


        <style>
            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                background: linear-gradient(135deg, #667eea, #764ba2);
                margin: 0;
                padding: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }

            .login-container {
                background-color: #ffffff;
                padding: 40px;
                border-radius: 10px;
                box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
                width: 400px;
                max-width: 90%;
                text-align: center;
            }

            .login-container h2 {
                margin-bottom: 20px;
                color: #333;
            }

            .login-container input[type="text"],
            .login-container input[type="password"] {
                width: 100%;
                padding: 15px;
                margin-bottom: 20px;
                border: none;
                border-radius: 25px;
                background-color: #f5f5f5;
                font-size: 16px;
                color: #333;
                outline: none;
                transition: background-color 0.3s ease;
            }

            .login-container input[type="text"]:focus,
            .login-container input[type="password"]:focus {
                background-color: #e1e1e1;
            }

            .login-container input[type="text"]:hover,
            .login-container input[type="password"]:hover {
                transform: translateY(-3px);
                box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            }

            .login-container input[type="submit"] {
                width: 100%;
                padding: 15px;
                border: none;
                background-color: #6c5ce7;
                color: #fff;
                cursor: pointer;
                border-radius: 25px;
                font-size: 16px;
                transition: background-color 0.3s ease;
            }

            .login-container input[type="submit"]:hover {
                background-color: #4834d4;
                animation: bounce 0.6s ease;
            }

            @keyframes bounce {
                0%, 20%, 50%, 80%, 100% {
                    transform: translateY(0);
                }
                40% {
                    transform: translateY(-15px);
                }
                60% {
                    transform: translateY(-10px);
                }
            }

            .login-container .forgot-password {
                text-align: center;
                margin-top: 20px;
            }

            .login-container .forgot-password a {
                color: #6c5ce7;
                text-decoration: none;
            }

            .login-container .forgot-password a:hover {
                text-decoration: underline;
            }
        </style>
    </head>
    <body>
        <div class="login-container">
            <h2>Login</h2>
            <form id="login-form"  method="post">
                <input type="text" name="txt_email" placeholder="Username" required>
                <input type="password" name="txt_password" placeholder="Password" required>
                <input type="submit" value="Login" name="btn_save">
            </form>
            <div class="forgot-password">
                <a href="#">Forgot password?</a>
            </div>
        </div>
    </body>
</html>
