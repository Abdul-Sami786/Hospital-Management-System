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
    <title>Generate Bill</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2 class="mb-4">Generate Bill</h2>
    <form action="AddBillServlet" method="post" class="card p-4 shadow-sm">
        <div class="mb-3">
            <label class="form-label">Patient ID:</label>
            <input type="number" name="patientId" class="form-control" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Amount:</label>
            <input type="text" name="amount" class="form-control" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Date:</label>
            <input type="date" name="date" class="form-control" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Status:</label>
            <select name="status" class="form-control">
                <option>Paid</option>
                <option>Unpaid</option>
            </select>
        </div>
        <button type="submit" class="btn btn-success">Generate</button>
    </form>
    <a href="dashboard.jsp" class="btn btn-secondary mt-3">Back to Dashboard</a>
</div>
</body>
</html>
