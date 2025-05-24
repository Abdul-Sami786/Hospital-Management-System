<%@ page import="java.sql.*" %>
<%@ page import="dao.DBConnection" %>
<%@ page session="true" %>
<%
    if (session.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>All Appointments</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
<div class="container mt-5">
    <h2 class="mb-4">All Appointments</h2>
    <div class="card p-3 shadow-sm">
        <div class="table-responsive">
            <table class="table table-striped table-hover align-middle">
                <thead class="table-light">
                    <tr>
                        <th>ID</th>
                        <th>Patient</th>
                        <th>Doctor</th>
                        <th>Date</th>
                        <th>Time</th>
                        <th>Reason</th>
                    </tr>
                </thead>
                <tbody>
                <%
                    Connection con = null;
                    Statement stmt = null;
                    ResultSet rs = null;
                    try {
                        con = DBConnection.getConnection();

                        String query = "SELECT a.appointment_id, " +
                                       "p.name AS patient, " +
                                       "CONCAT(d.first_name, ' ', d.last_name) AS doctor, " +
                                       "a.appointment_date, a.appointment_time, a.reason " +
                                       "FROM Appointments a " +
                                       "JOIN Patients p ON a.patient_id = p.patient_id " +
                                       "JOIN Doctors d ON a.doctor_id = d.doctor_id";

                        stmt = con.createStatement();
                        rs = stmt.executeQuery(query);

                        while (rs.next()) {
                %>
                    <tr>
                        <td><%= rs.getInt("appointment_id") %></td>
                        <td><%= rs.getString("patient") %></td>
                        <td><%= rs.getString("doctor") %></td>
                        <td><%= rs.getString("appointment_date") %></td>
                        <td><%= rs.getString("appointment_time") %></td>
                        <td><%= rs.getString("reason") %></td>
                    </tr>
                <%
                        }
                    } catch(Exception e) {
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
