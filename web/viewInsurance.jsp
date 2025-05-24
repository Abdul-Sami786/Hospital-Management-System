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
    <title>All Insurance Policies</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2 class="mb-4">All Insurance Policies</h2>
    <div class="card p-3 shadow-sm">
        <div class="table-responsive">
            <table class="table table-bordered table-striped table-hover align-middle">
                <thead class="table-light">
                    <tr>
                        <th>ID</th>
                        <th>Patient</th>
                        <th>Provider</th>
                        <th>Policy Number</th>
                        <th>Coverage Amount</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        Connection con = null;
                        Statement stmt = null;
                        ResultSet rs = null;

                        try {
                            con = DBConnection.getConnection();
                            String query = "SELECT i.insurance_id, p.name, i.provider_name, i.policy_number, i.coverage_amount " +
                                           "FROM Insurance i JOIN Patients p ON i.patient_id = p.patient_id";
                            stmt = con.createStatement();
                            rs = stmt.executeQuery(query);

                            while (rs.next()) {
                    %>
                    <tr>
                        <td><%= rs.getInt("insurance_id") %></td>
                        <td><%= rs.getString("name") %></td>
                        <td><%= rs.getString("provider_name") %></td>
                        <td><%= rs.getString("policy_number") %></td>
                        <td>$<%= rs.getDouble("coverage_amount") %></td>
                    </tr>
                    <%
                            }
                        } catch (Exception e) {
                    %>
                    <tr>
                        <td colspan="5" class="text-danger text-center">Error loading data: <%= e.getMessage() %></td>
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
