<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@include file="Head.jsp" %>
                <!-- Sale & Revenue Start -->
                <div class="container-fluid pt-4 px-4">
                    <div class="row g-4">
                        <div class="col-sm-6 col-xl-4">
                            <div class="bg-secondary rounded d-flex align-items-center justify-content-between p-4">
                                <i class="fa fa-chart-line fa-3x text-primary"></i>
                                <div class="ms-3">
                                    <p class="mb-2">Users</p>
                                    <h6 class="mb-0">
                                        <%
                                            String csel = "select count(*) as c from tbl_userfirst ";
                                            ResultSet cc = con.selectCommand(csel);
                                            if (cc.next()) {
                                                out.println(cc.getString("c"));
                                            }
                                        %></h6>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-xl-4">
                            <div class="bg-secondary rounded d-flex align-items-center justify-content-between p-4">
                                <i class="fa fa-chart-bar fa-3x text-primary"></i>
                                <div class="ms-3">
                                    <p class="mb-2">Stations</p>
                                    <h6 class="mb-0"><%
                                        String csel1 = "select count(*) as c from tbl_station ";
                                        ResultSet cc1 = con.selectCommand(csel1);
                                        if (cc1.next()) {
                                            out.println(cc1.getString("c"));
                                        }
                                        %></h6>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-xl-4">
                            <div class="bg-secondary rounded d-flex align-items-center justify-content-between p-4">
                                <i class="fa fa-chart-area fa-3x text-primary"></i>
                                <div class="ms-3">
                                    <p class="mb-2">Slots</p>
                                    <h6 class="mb-0"><%
                                        String csel2 = "select count(*) as c from tbl_chargingsport ";
                                        ResultSet cc2 = con.selectCommand(csel2);
                                        if (cc2.next()) {
                                            out.println(cc2.getString("c"));
                                        }
                                        %></h6>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Sale & Revenue End -->




                <!-- Recent Sales Start -->
                <div class="container-fluid pt-4 px-4">
                    <div class="bg-secondary text-center rounded p-4">
                        <div class="d-flex align-items-center justify-content-between mb-4">
                            <h6 class="mb-0">Stations</h6>
                        </div>
                        <div class="table-responsive">
                            <table class="table text-start align-middle table-bordered table-hover mb-0">
                                <thead>
                                    <tr class="text-white">
                                        <th scope="col">Sl.no</th>
                                        <th scope="col">Name</th>
                                        <th scope="col">Email</th>
                                        <th scope="col">Contact</th>
                                        <th scope="col">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        int i = 0;
                                        String selQry = "select * from tbl_station";
                                        ResultSet rs = con.selectCommand(selQry);
                                        while (rs.next()) {
                                            i++;
                                    %>
                                    <tr>
                                        <td><%=i%></td>
                                        <td><%=rs.getString("station_name")%></td>
                                        <td><%=rs.getString("station_email")%></td>
                                        <td><%=rs.getString("station_contact")%></td>
                                        <td>
                                            <%
                                                if (rs.getString("station_status").equals("0")) {
                                            %>
                                            <a class="btn btn-sm btn-primary" href="HomePage.jsp?id=<%=rs.getString("station_id")%>&sts=1">Accept</a>
                                            | 
                                            <a class="btn btn-sm btn-primary" href="HomePage.jsp?id=<%=rs.getString("station_id")%>&sts=2">Reject</a>
                                            <%
                                            } else if (rs.getString("station_status").equals("1")) {
                                            %>
                                            <a class="btn btn-sm btn-primary" href="HomePage.jsp?id=<%=rs.getString("station_id")%>&sts=2">Reject</a>
                                            <%
                                            } else if (rs.getString("station_status").equals("2")) {
                                            %>
                                            <a class="btn btn-sm btn-primary" href="HomePage.jsp?id=<%=rs.getString("station_id")%>&sts=1">Accept</a>
                                            <%
                                                }
                                            %>
                                        </td>
                                    </tr>
                                    <%
                                        }

                                        if (request.getParameter("sts") != null) {
                                            String upQry = "update tbl_station set station_status='" + request.getParameter("sts") + "' where station_id='" + request.getParameter("id") + "'";
                                            if (con.executeCommand(upQry)) {
                                                response.sendRedirect("HomePage.jsp");
                                            }
                                        }

                                    %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <!-- Recent Sales End -->

                <%@include file="Foot.jsp" %>