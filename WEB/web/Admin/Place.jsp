<%-- 
    Document   : Place
    Created on : 1 Feb, 2024, 4:49:15 PM
    Author     : abhis
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Place </title>
    </head>
    <body>
        <%
            if (request.getParameter("btn_save") != null);
            {
                String place = request.getParameter("txt_place");
                String id = request.getParameter("seldistrict");
                String insQry = "insert into tbl_place (place_name,district_id) value('" + place + "','" + id + "')";
                //out.print(insQry);

                con.executeCommand(insQry);
            }

            if (request.getParameter("did") != null) {
                String id = request.getParameter("did");
                String delQry = "delete from tbl_place where place_id='" + id + "'";
                con.executeCommand(delQry);

            }

        %> 
        <%@include file="Head.jsp" %>
        <form method="post">
            <div id="tab" align='center'>
                <br><br><br><br><br>
                <h2>Place</h2>
                <br><br><br>
                <table BORDER="1">
                    <tr>
                        <td>
                            District
                        </td>
                        <td>
                            <select name="seldistrict">
                                <option value="">  -----SELECT----</option>
                                <%                                String slQry = "select * from tbl_district";
                                    ResultSet rrs = con.selectCommand(slQry);
                                    while (rrs.next()) {
                                %>
                                <option value="<%=rrs.getString("district_id")%>"><%=rrs.getString("district_name")%> </option> 
                                <%
                                    }
                                %>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Place
                        </td>
                        <td>
                            <input type="text" name="txt_place">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <input type="submit" name="btn_save" value="submit">
                        </td>
                    </tr>
                </table>
        </form>
                            <br><br>
        <table border="1" align="center">
            <tr>
                <td>Sl.NO</td>
                <td>Place</td>
                <td>Action</td>
            </tr>
            <%
                int i = 0;
                String selQry = "select * from tbl_place";
                ResultSet rs = con.selectCommand(selQry);
                while (rs.next()) {
                    i++;


            %>
            <tr>
                <td><%=i%></td>
                <td><%=rs.getString("place_name")%></td>
                <td>
                    <a href="Place.jsp?did=<%=rs.getString("place_id")%>">Delete</a>
                </td>
            </tr>
            <%
                }
            %>

        </table>
    </div>
</body>
<%@include file="Foot.jsp" %>
</html>
