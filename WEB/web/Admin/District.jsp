<%-- 
    Document   : District
    Created on : 1 Feb, 2024, 4:49:09 PM
    Author     : abhis
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>District</title>
        <!--<link href="../Assets/Template/form.css" rel="stylesheet">-->
       <%@include file="Head.jsp" %>
         <style>
            td{
                color: white;
            }
        </style>
    </head>
    <body>
        <%
            if (request.getParameter("btn_save") != null) {
                String district = request.getParameter("txt_district");
                String insQry = " insert into tbl_district (district_name) values ('" + district + "')";
                con.executeCommand(insQry);

            }

            if (request.getParameter("did") != null) {
                String id = request.getParameter("did");
                String delQry = "delete from tbl_district where district_id='" + id + "'";
                con.executeCommand(delQry);

            }

        %>
        
        <div id="tab" align='center'>
            <form method="post">
                <br><br><br><br><br>
                <h2>Dstrict</h2>
                <br><br><br>
                <table border="1">

                    <tr> 
                        <td>
                            District
                        </td>
                        <td> 
                            <input type="text" name="txt_district"> 

                        </td>
                    </tr>
                    <tr>
                        <td colspan="2"   align="center"> 
                            <input type="submit" name="btn_save" value="save">
                        </td>
                    </tr>
                </table>
            </form>
            <br><br>
            <table border="1" align="center">
                <tr>
                    <td>Sl.No</td>
                    <td>District</td>
                    <td>Action</td>
                </tr>
                <%                int i = 0;
                    String selQry = "select * from tbl_district";
                    ResultSet rs = con.selectCommand(selQry);
                    while (rs.next()) {
                        i++;
                %>
                <tr>
                    <td><%=i%></td>
                    <td><%=rs.getString("district_name")%></td>
                    <td>
                        <a href="District.jsp?did=<%=rs.getString("district_id")%>">Delete</a>
                    </td>
                </tr>
                <%
                    }

                %>
            </table>
        </div>
        <%@include file="Foot.jsp" %>
    </body>
</html>
