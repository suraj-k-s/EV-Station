<%-- 
    Document   : EditProfile
    Created on : 1 Feb, 2024, 4:50:33 PM
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
        
        <title>Use Edit Profile</title>
        
    </head>
    <body>
        
        <form method="post">
        <%
            String id = session.getAttribute("sid").toString();
             
            
            if(request.getParameter("btn_save") !=null){
       String rname = request.getParameter("txt_name");
       String contact =request.getParameter("txt_contact");
       String email = request.getParameter("txt_email");
        
        String updt = "update tbl_station set station_name = '"+rname+"',station_contact = '"+contact+"', station_email='"+email+"' where station_id = '"+id+"'";
      
        //out.print(updt);
                con.executeCommand(updt);
        
        
            }
        
        %>
        
        
        
        
        <%
         String sid = session.getAttribute("sid").toString();
        String name = "select * from tbl_station where station_id = '"+sid+"' ";
        ResultSet rs = con.selectCommand(name);
        rs.next();
        
        
        
        %>
        <table border="1">
            <tr>
                <td>
                    Name
                </td>
                <td>
                    <input type="text" name="txt_name" value="<%=rs.getString("station_name")%>">
                </td>
                             
            </tr>
            
            <tr>
                <td>
                    Contact
                </td>
                <td>
                    <input type="text" name="txt_contact" value="<%=rs.getString("station_contact")%>">
                </td>
            </tr>
            <tr>
                <td>
                    email
                </td>
                <td>
                    <input type="text" name="txt_email" value="<%=rs.getString("station_email")%>">
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">`
                    <input type="submit" name="btn_save" value="update">
                </td>
            </tr>
        </table>
        </form>
    </body>
     <%@include file="Foot.jsp" %>
</html>
