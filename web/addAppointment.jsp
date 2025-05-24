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
    <title>Schedule Appointment</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2 class="mb-4">Schedule Appointment</h2>

    <form action="AddAppointmentServlet" method="post" class="card p-4 shadow-sm">
        <div class="mb-3">
            <label class="form-label">Patient ID:</label>
            <input type="number" name="patient_id" class="form-control" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Doctor ID:</label>
            <input type="number" name="doctor_id" class="form-control" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Appointment Date:</label>
            <input type="date" name="appointment_date" class="form-control" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Appointment Time:</label>
            <input type="time" name="appointment_time" class="form-control" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Reason:</label>
            <textarea name="reason" class="form-control" required></textarea>
        </div>
        <button type="submit" class="btn btn-success">Schedule</button>
    </form>

    <a href="dashboard.jsp" class="btn btn-secondary mt-3">Back to Dashboard</a>
</div>
</body>
</html>
