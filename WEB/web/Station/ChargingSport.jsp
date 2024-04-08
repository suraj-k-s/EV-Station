<%-- 
    Document   : ChargingSport
    Created on : 15 Feb, 2024, 4:29:46 PM
    Author     : abhis
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
    <!DOCTYPE html>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Charging Sport</title>
            
        </head>
        <body>
             <%@include file="Head.jsp" %>
        <%
            if (request.getParameter("btn_save") != null) {
                String name = request.getParameter("csname");
                String details = request.getParameter("csdetails");
                String watt = request.getParameter("cswatt");
                String status = request.getParameter("csstatus");
                String amount = request.getParameter("csamount");
                String sid = session.getAttribute("sid").toString();
                String insQry = "insert into tbl_chargingsport  (port_name,port_details,port_watt,port_amount,station_id) values ('" + name + "','" + details + "','" + watt + "','" + amount + "','" + sid + "')";
                con.executeCommand(insQry);
            }

            if (request.getParameter("did") != null) {
                String id = request.getParameter("did");
                String delQry = "delete from tbl_chargingsport where port_id = '" + id + "'";
                con.executeCommand(delQry);
            }
        %>

        <form method="post">
            <table border="1">
                <tr>
                    <td>
                        Charging Sport name
                    </td>
                    <td>
                        <input type="text" name="csname">
                    </td>
                </tr>
                <tr>
                    <td>
                        Charging Sport Details
                    </td>
                    <td>
                        <textarea name="csdetails"></textarea>


                    </td>
                </tr>
                <tr>
                    <td>
                        Charging Sport Watt
                    </td>
                    <td>
                        <input type="text" name="cswatt">
                    </td>
                </tr>
                <tr>
                    <td>
                        Charging Sport Amount
                    </td>
                    <td>
                        <input type="text" name="csamount">
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="btn_save">
                    </td>
                </tr>

            </table>
        </form>
        <table border="1" align="center">
            <tr>
                <td>SL.NO</td>
                <td>Charging Sport name</td>
                <td>Charging Sport details</td>
                <td> Charging Sport watt</td>
                <td>Charging Sport amount</td>
                <td>Action</td>
            </tr>
            <%
            String sid = session.getAttribute("sid").toString();
                int i = 0;
                String selQry = "select * from tbl_chargingsport where station_id='"+sid+"'";
                ResultSet rs = con.selectCommand(selQry);
                while (rs.next()) {
                    i++;

            %>
            <tr>
                <td><%=i%></td>
                <td><%=rs.getString("port_name")%></td>
                <td><%=rs.getString("port_details")%></td>
                <td><%=rs.getString("port_watt")%></td>
                <td><%=rs.getString("port_amount")%></td>
                <td>
                    <a href="ChargingSport.jsp?did=<%=rs.getString("port_id")%>">Delete</a>
                </td>
            </tr>
            <%
                }
            %>
        </table>
    </body>
     <%@include file="Foot.jsp" %>
</html>
