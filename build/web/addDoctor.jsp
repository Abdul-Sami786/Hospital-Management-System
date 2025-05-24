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
    <title>Add Doctor</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2 class="mb-4">Add Doctor</h2>
    <form action="AddDoctorServlet" method="post" class="card p-4 shadow-sm">
        <div class="mb-3">
            <input name="first_name" class="form-control" placeholder="First Name" required>
        </div>
        <div class="mb-3">
            <input name="last_name" class="form-control" placeholder="Last Name" required>
        </div>
        <div class="mb-3">
            <input name="specialty" class="form-control" placeholder="Specialty" required>
        </div>
        <div class="mb-3">
            <input name="contact_no" class="form-control" placeholder="Contact No" required>
        </div>
        <div class="mb-3">
            <input name="email" class="form-control" placeholder="Email" required>
        </div>
        <div class="mb-3">
            <input name="department" class="form-control" placeholder="Department">
        </div>
        <div class="mb-3">
            <input name="room_no" class="form-control" placeholder="Room No">
        </div>
        <button type="submit" class="btn btn-success">Add Doctor</button>
    </form>
    <a href="dashboard.jsp" class="btn btn-secondary mt-3">Back to Dashboard</a>
</div>
</body>
</html>
