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
    <title>View Patients</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
<div class="container mt-5">
    <h2 class="mb-4">Patient List</h2>
    <div class="card p-3 shadow-sm">
        <div class="table-responsive">
            <table class="table table-striped table-hover align-middle">
                <thead class="table-light">
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>DOB</th>
                        <th>Gender</th>
                        <th>Contact</th>
                        <th>Address</th>
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
                        rs = stmt.executeQuery("SELECT * FROM Patients");
                        while (rs.next()) {
                %>
                    <tr>
                        <td><%= rs.getInt("patient_id") %></td>
                        <td><%= rs.getString("name") %></td>
                        <td><%= rs.getDate("dob") %></td>
                        <td><%= rs.getString("gender") %></td>
                        <td><%= rs.getString("contact_number") %></td>
                        <td><%= rs.getString("address") %></td>
                    </tr>
                <%
                        }
                    } catch (Exception e) {
                %>
                    <tr>
                        <td colspan="6" class="text-danger text-center">Error loading data: <%= e.getMessage() %></td>
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
