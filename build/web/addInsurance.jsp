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
    <title>Add Insurance</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2 class="mb-4">Add Insurance</h2>
    <form action="AddInsuranceServlet" method="post" class="card p-4 shadow-sm">
        <div class="mb-3">
            <label class="form-label">Patient ID:</label>
            <input type="number" name="patientId" class="form-control" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Provider Name:</label>
            <input type="text" name="provider" class="form-control" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Policy Number:</label>
            <input type="text" name="policy" class="form-control" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Coverage Amount:</label>
            <input type="text" name="coverage" class="form-control" required>
        </div>
        <button type="submit" class="btn btn-primary">Add Insurance</button>
    </form>
    <a href="dashboard.jsp" class="btn btn-secondary mt-3">Back to Dashboard</a>
</div>
</body>
</html>
