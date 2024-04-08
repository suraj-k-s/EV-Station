<%-- 
    Document   : Logout
    Created on : 4 Apr, 2024, 2:59:22 PM
    Author     : abhis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--        <title>JSP Page</title>-->
    </head>
    <body>
      <%
    response.setHeader("Cache-Control", "no-cache, no-store");
    session.invalidate();
    response.sendRedirect("index.html");
%>
    </body>
</html>
