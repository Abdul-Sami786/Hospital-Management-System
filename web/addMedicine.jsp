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
    <title>Add Medicine</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2 class="mb-4">Add Medicine</h2>
    <form action="AddMedicineServlet" method="post" class="card p-4 shadow-sm">
        <div class="mb-3">
            <label class="form-label">Item Name:</label>
            <input type="text" name="itemName" class="form-control" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Quantity:</label>
            <input type="number" name="quantity" class="form-control" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Price:</label>
            <input type="text" name="price" class="form-control" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Expiry Date:</label>
            <input type="date" name="expiryDate" class="form-control" required>
        </div>
        <button type="submit" class="btn btn-primary">Add Medicine</button>
    </form>
    <a href="dashboard.jsp" class="btn btn-secondary mt-3">Back to Dashboard</a>
</div>
</body>
</html>
