<%@ page import="java.sql.*, dao.DBConnection" %>
<%@ page session="true" %>
<%
    if (session.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    Connection con = DBConnection.getConnection();
    Statement stmt = con.createStatement();
    ResultSet rs = stmt.executeQuery("SELECT * FROM Doctors");
%>
<!DOCTYPE html>
<html>
<head>
    <title>View Doctors</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2 class="mb-4">Doctors List</h2>
    <div class="card p-3 shadow-sm">
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Specialty</th>
                    <th>Contact</th>
                    <th>Email</th>
                    <th>Department</th>
                    <th>Room</th>
                </tr>
            </thead>
            <tbody>
                <%
                    while (rs.next()) {
                %>
                <tr>
                    <td><%= rs.getInt("doctor_id") %></td>
                    <td><%= rs.getString("first_name") %> <%= rs.getString("last_name") %></td>
                    <td><%= rs.getString("specialty") %></td>
                    <td><%= rs.getString("contact_no") %></td>
                    <td><%= rs.getString("email") %></td>
                    <td><%= rs.getString("department") %></td>
                    <td><%= rs.getString("room_no") %></td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>
    <a href="dashboard.jsp" class="btn btn-secondary mt-3">Back to Dashboard</a>
</div>
</body>
</html>
