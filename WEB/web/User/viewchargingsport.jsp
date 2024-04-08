<%-- 
    Document   : viewchargingsport
    Created on : 22 Feb, 2024, 3:42:02 PM
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
        <title>VIew Charging Sport</title>
    </head>
    <body>

        <table  align="center">
            <tr>

                <%
                    int i = 0;
                    String selQry = "select * from tbl_chargingsport where station_id='" + request.getParameter("did") + "'";
                    ResultSet rs = con.selectCommand(selQry);
                    while (rs.next()) {
                        i++;

                %>
                <td>      
                    <table border="1"  style="margin: 10px" >
                        <tr>
                            <td>SL.NO</td>
                            <td><%=i%></td>
                        </tr>
                        <tr>
                            <td>Charging Sport name</td>
                            <td><%=rs.getString("port_name")%></td>
                        </tr>
                        <tr>
                            <td><%=rs.getString("port_details")%></td>
                            <td>Charging Sport details</td>
                        </tr>
                        <tr>
                            <td><%=rs.getString("port_watt")%></td>
                            <td> Charging Sport watt</td>
                        </tr>
                        <tr>
                            <td><%=rs.getString("port_status")%></td>
                            <td>Charging Sport status</td>
                        </tr>
                        <tr>
                            <td><%=rs.getString("port_amount")%></td>
                            <td>Charging Sport amount</td>
                        </tr>
                        <tr>
                            <td colspan="2" align="center">
                                <a href="bookingpage.jsp?pid=<%=rs.getString("port_id")%>">Book now</a>
                            </td>
                        </tr>
                    </table>

                </td>
                <%
                    }
                %>



                <%
                    if (i == 3) {
                        i = 0;
                        out.println("</tr><tr>");
                    }


                %>
            </tr>
        </table>


    </body>
     <%@include file="Foot.jsp" %>
</html>



