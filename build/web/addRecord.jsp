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
    <title>Add Medical Record</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2 class="mb-4">Add Medical Record</h2>
    <form action="AddRecordServlet" method="post" class="card p-4 shadow-sm">
        <div class="mb-3">
            <label class="form-label">Patient ID:</label>
            <input type="number" name="patientId" class="form-control" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Diagnosis:</label>
            <textarea name="diagnosis" class="form-control" required></textarea>
        </div>
        <div class="mb-3">
            <label class="form-label">Treatment:</label>
            <textarea name="treatment" class="form-control" required></textarea>
        </div>
        <div class="mb-3">
            <label class="form-label">Date:</label>
            <input type="date" name="date" class="form-control" required>
        </div>
        <button type="submit" class="btn btn-success">Add Record</button>
    </form>
    <a href="dashboard.jsp" class="btn btn-secondary mt-3">Back to Dashboard</a>
</div>
</body>
</html>
