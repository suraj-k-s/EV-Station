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
        
        <title>Station My profile</title>
    </head>
    <body>
      
        <form method="post">



            <%
               
                String sid = session.getAttribute("sid").toString();
                String name = "select * from tbl_station where station_id = '" + sid + "'";
                ResultSet rs = con.selectCommand(name);
                rs.next();

            %>



            <table border="1">
                <tr>
                    <td>
                        Name
                    </td>
                    <td>
                        <%=rs.getString("station_name")%>
                    </td>
                </tr>
                <tr>
                    <td>
                        Contact
                    </td>
                    <td>
                        <%=rs.getString("station_contact")%>
                    </td>
                </tr>
                <tr>
                    <td>
                        email
                    </td>
                    <td>
                        <%=rs.getString("station_email")%>
                    </td>
                </tr>

            </table>
        </form>
    </body>
     <%@include file="Foot.jsp" %>
</html>
