<%-- 
    Document   : bookingpage
    Created on : 29 Feb, 2024, 5:42:32 PM
    Author     : abhis
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
         <%@include file="Head.jsp" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Booking Page</title>
    </head>
    <%
        if(request.getParameter("btn_save")!=null){
            String Fdate = request.getParameter("txtfordate");
            String time = request.getParameter("txttime");
            String type = request.getParameter("txttype");
            
            String uid = session.getAttribute("uid").toString();
            String pid = request.getParameter("pid"); 
                    
            
            String insQry = "insert into tbl_booking (booking_date,booking_fordate,booking_time,booking_type,port_id,user_id) values (curdate(),'"+Fdate+"','"+time+"','"+type+"','"+pid+"','"+uid+"')";
            if(con.executeCommand(insQry))
            {
                String sel = "select max(booking_id) as id from tbl_booking";
                ResultSet rs = con.selectCommand(sel);
                rs.next();
                response.sendRedirect("Payment.jsp?id="+rs.getString("id"));
            }
           
        }

    
    
    
    
    
    %>
    <body>
        <form method="post">
        <table border="1">
            
            <tr>
                <td>for date</td>
                <td>
                    <input type="date" name="txtfordate">
                </td>
            </tr>
            <tr>
                <td>booking time</td>
                <td>
                    <input type="time" name="txttime">
                </td>
            </tr>
            <tr>
                <td>booking type</td>
                <td>
                    <input type="text" name="txttype">
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" name="btn_save">
                </td>
            </tr>
          
           
            
        </table>
        </form>
       
    </body>
     <%@include file="Foot.jsp" %>
</html>
