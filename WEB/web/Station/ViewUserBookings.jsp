<%-- 
    Document   : ViewBookings
    Created on : 4 Mar, 2024, 3:07:57 PM
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
       
        <title>View Bookings</title>
    </head>
    <body>
     
        <table border="2" align="center">
            <tr>
                <td>SL.NO</td>
                <td>Date</td>
                <td>for date</td>
                <td>Booking Time</td>
                <td>booking type</td>
                <td>Action</td>
            </tr>
            <%
                  if(request.getParameter("did")!=null){
                       String id = request.getParameter("did");
                       String delQry = "delete from tbl_booking where booking_id = '"+id+"'";
                       con.executeCommand(delQry);
                   }
              int i = 0;
               String selQry = "Select * from tbl_booking b inner join tbl_chargingsport cp on cp.port_id=b.port_id where cp.station_id='"+session.getAttribute("sid")+"'";
               ResultSet rs = con.selectCommand(selQry);
               while (rs.next()){
                   i++;
               
                 
                   
               
            %>
            <tr>
                <td><%=i%></td>
                <td><%=rs.getString("booking_date")%></td>
                <td><%=rs.getString("booking_fordate")%></td>
                <td><%=rs.getString("booking_time")%></td>
                <td><%=rs.getString("booking_type")%></td>
                <td><a href="ViewUserBookings.jsp?did=<%=rs.getString("booking_id")%>">Delete</a></td>
            </tr>
            <%
            }
            %>
        </table>
    </body>
     <%@include file="Foot.jsp" %>
</html>
