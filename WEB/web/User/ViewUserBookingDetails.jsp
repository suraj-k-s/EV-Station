<%-- 
    Document   : ViewUserBookingDetails
    Created on : 4 Mar, 2024, 2:14:33 PM
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
        <title>User Booking Details</title>
    </head>
   
    <body>
        <table border="3" align="center">
            
            <tr>
                <td>SL.NO</td>
                <td>Date</td>
                <td>for date</td>
                <td>Booking Time</td>
                <td>booking type</td>
                <td>Action</td>
            </tr>
             <%
        int i = 0;
    String selQry = "select * from tbl_booking ";
    ResultSet rs = con.selectCommand(selQry);
    while (rs.next()){
        i++;
        
        if (request.getParameter("did")!=null){
            String id = request.getParameter("did");
            String delQry = "delete from tbl_booking where booking_id = '"+id+"'";
            //out.print(delQry);
            con.executeCommand(delQry);
        }
     
    %>
            
            <tr>
                <td><%=i%></td>
                <td><%=rs.getString("booking_date")%></td>
                <td><%=rs.getString("booking_fordate")%></td>
                <td><%=rs.getString("booking_time")%></td>
                <td><%=rs.getString("booking_type")%></td>
                <td><a href="ViewUserBookingDetails.jsp?did=<%=rs.getString("booking_id")%>">Delete</a></td>
            </tr>
            <%
    }
            %>
            
        </table>
    </body>
     <%@include file="Foot.jsp" %>
</html>
