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
    <title>All Medical Records</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
<div class="container mt-5">
    <h2 class="mb-4">All Medical Records</h2>
    <div class="card p-3 shadow-sm">
        <div class="table-responsive">
            <table class="table table-bordered table-hover table-striped align-middle">
                <thead class="table-light">
                    <tr>
                        <th>Record ID</th>
                        <th>Patient</th>
                        <th>Diagnosis</th>
                        <th>Treatment</th>
                        <th>Date</th>
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
                        String query = "SELECT r.record_id, p.name, r.diagnosis, r.treatment, r.date " +
                                       "FROM Medical_Records r JOIN Patients p ON r.patient_id = p.patient_id";
                        rs = stmt.executeQuery(query);
                        while (rs.next()) {
                %>
                    <tr>
                        <td><%= rs.getInt("record_id") %></td>
                        <td><%= rs.getString("name") %></td>
                        <td><%= rs.getString("diagnosis") %></td>
                        <td><%= rs.getString("treatment") %></td>
                        <td><%= rs.getString("date") %></td>
                    </tr>
                <%
                        }
                    } catch (Exception e) {
                %>
                    <tr>
                        <td colspan="5" class="text-danger text-center">Error loading records: <%= e.getMessage() %></td>
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
