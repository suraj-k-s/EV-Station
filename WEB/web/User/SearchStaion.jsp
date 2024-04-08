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
         <%@include file="Head.jsp" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Station </title>
    </head>
    <body>
        <form method="post">
            <table border="1">

                <tr>
                    <td>District</td>
                    <td><select name="seldistrict" id="seldistrict" onChange="getPlace(this.value)">
                            <option value="">--select--</option>
                            <%
                                String selQry = "select * from tbl_district";
                                ResultSet rs = con.selectCommand(selQry);
                                while (rs.next()) {
                            %>  
                            <option value="<%=rs.getString("district_id")%>">
                                <%=rs.getString("district_name")%>
                            </option>
                            <%
                                }
                            %>
                        </select>
                    </td>

                </tr>
                <tr>
                    <td>Place</td> 
                    <td><select name="selplace" id="selplace" required="">
                            <option value="">--select--</option>
                        </select>

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
    <%

    %>




    <table  align="center">


        <tr>
            <%                String seQry = "select * from tbl_station ";

                if (request.getParameter("btn_save") != null) {
                    String diid = request.getParameter("seldistrict");
                    String plid = request.getParameter("selplace");

                    seQry += " where place_id='" + plid + "'";

                }
                int i = 0;

                ResultSet rr = con.selectCommand(seQry);
                while (rr.next()) {
                    i++;


            %>

            <td style="border: 1px solid black;padding: 10px" >
                
                <table style="margin: 10px">
                    <tr>
                        <td><img src="../Assets/Files/<%=rr.getString("station_photo")%>" width="120" height="120" style="border-radius: 50%"></td>

                    </tr>
                    <tr>
                        <td align="center"><%=rr.getString("station_name")%></td>
                    </tr>
                    <tr>

                        <td align="center">
                            <a   href="viewchargingsport.jsp?did=<%=rr.getString("station_id")%>">View sport</a>
                        </td>
                    </tr>
                </table>
            </td>
            <%
                    if (i == 3) {
                        i = 0;
                        out.println("</tr><tr>");
                    }

                }
            %>

        </tr>
    </table>
 <%@include file="Foot.jsp" %>






    <script src="../Assets/JQ/jQuery.js"></script>
    <script>
                        function getPlace(did)
                        {
                            $.ajax({
                                url: "../Assets/AjaxPages/AjaxPlace.jsp?did=" + did,
                                success: function(a) {
                                    $("#selplace").html(a);

                                }
                            });
                        }</script>
</html>
