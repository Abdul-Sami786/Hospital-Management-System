<%@ page session="true" %>
<%@ page import="java.sql.*" %>
<%@ page import="dao.DBConnection" %>
<%
    if (session.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>All Staff Members</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2 class="mb-4">All Staff Members</h2>
    <div class="card p-3 shadow-sm">
        <div class="table-responsive">
            <table class="table table-bordered table-striped table-hover align-middle">
                <thead class="table-light">
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Position</th>
                        <th>Contact Number</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        Connection con = null;
                        Statement stmt = null;
                        ResultSet rs = null;

                        try {
                            con = DBConnection.getConnection();
                            stmt = con.createStatement();
                            rs = stmt.executeQuery("SELECT * FROM Staff");

                            while (rs.next()) {
                    %>
                    <tr>
                        <td><%= rs.getInt("staff_id") %></td>
                        <td><%= rs.getString("name") %></td>
                        <td><%= rs.getString("position") %></td>
                        <td><%= rs.getString("contact_number") %></td>
                    </tr>
                    <%
                            }
                        } catch (Exception e) {
                    %>
                    <tr>
                        <td colspan="4" class="text-danger text-center">Error loading staff data: <%= e.getMessage() %></td>
                    </tr>
                    <%
                        } finally {
                            if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
                            if (stmt != null) try { stmt.close(); } catch (SQLException ignore) {}
                            if (con != null) try { con.close(); } catch (SQLException ignore) {}
                        }
                    %>
                </tbody>
            </table>
        </div>
    </div>
    <a href="dashboard.jsp" class="btn btn-secondary mt-3">Back to Dashboard</a>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
