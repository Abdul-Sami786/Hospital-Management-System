<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="javax.servlet.http.*, javax.servlet.*" session="true" %>
<%
    if (session.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Hospital Management System</title>
    <!-- Bootstrap CSS & Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            transition: background-color 0.4s, color 0.4s;
        }
        .dark-mode {
            background-color: #212529 !important;
            color: #f8f9fa !important;
        }
        .dark-mode .card {
            background-color: #343a40;
            color: white;
        }
        .dark-mode .btn {
            color: white;
        }
        .card {
            border-radius: 12px;
            transition: 0.3s;
        }
        .card:hover {
            transform: scale(1.03);
        }
        .icon-size {
            font-size: 2rem;
        }
        .offcanvas a {
            text-decoration: none;
        }
        .branding {
            font-size: 1.5rem;
            font-weight: bold;
            color: #ffc107;
            text-shadow: 1px 1px 2px black;
        }
    </style>
</head>
<body>

<!-- Navbar with Branding & Theme Toggle -->
<nav class="navbar navbar-dark bg-dark sticky-top">
    <div class="container-fluid d-flex justify-content-between align-items-center">
        <div class="d-flex align-items-center">
            <button class="btn btn-outline-light me-3" type="button" data-bs-toggle="offcanvas" data-bs-target="#sidebar" aria-controls="sidebar">
                <i class="bi bi-list"></i>
            </button>
            <span class="navbar-brand branding">🏥 Hospital Management System</span>
        </div>
        <div>
            <button class="btn btn-outline-warning me-2" onclick="toggleMode()">
                <i class="bi bi-circle-half"></i> Toggle Mode
            </button>
            <a href="logout.jsp" class="btn btn-danger">Logout</a>
        </div>
    </div>
</nav>

<!-- Offcanvas Sidebar - Modern, Hover, Active Highlight -->
<div class="offcanvas offcanvas-start bg-dark text-white" tabindex="-1" id="sidebar" aria-labelledby="sidebarLabel">
    <div class="offcanvas-header border-bottom border-secondary">
        <h5 class="offcanvas-title text-warning" id="sidebarLabel">
            <i class="bi bi-speedometer2 me-2"></i> Admin Menu
        </h5>
        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="offcanvas" aria-label="Close"></button>
    </div>
    <div class="offcanvas-body px-3">
        <div class="list-group list-group-flush" id="sidebarMenu">
            <a href="addPatient.jsp" class="list-group-item list-group-item-action bg-dark text-white border-0">
                <i class="bi bi-person-plus me-2"></i> Add Patient
            </a>
            <a href="viewPatients.jsp" class="list-group-item list-group-item-action bg-dark text-white border-0">
                <i class="bi bi-person-lines-fill me-2"></i> View Patients
            </a>
            <a href="addAppointment.jsp" class="list-group-item list-group-item-action bg-dark text-white border-0">
                <i class="bi bi-calendar-plus me-2"></i> Add Appointment
            </a>
            <a href="viewAppointments.jsp" class="list-group-item list-group-item-action bg-dark text-white border-0">
                <i class="bi bi-calendar-event me-2"></i> View Appointments
            </a>
            <a href="addRecord.jsp" class="list-group-item list-group-item-action bg-dark text-white border-0">
                <i class="bi bi-file-earmark-plus me-2"></i> Add Record
            </a>
            <a href="viewRecords.jsp" class="list-group-item list-group-item-action bg-dark text-white border-0">
                <i class="bi bi-journal-medical me-2"></i> View Records
            </a>
            <a href="addDoctor.jsp" class="list-group-item list-group-item-action bg-dark text-white border-0">
                <i class="bi bi-person-badge me-2"></i> Add Doctor
            </a>
            <a href="viewDoctors.jsp" class="list-group-item list-group-item-action bg-dark text-white border-0">
                <i class="bi bi-people-fill me-2"></i> View Doctors
            </a>
            <a href="addStaff.jsp" class="list-group-item list-group-item-action bg-dark text-white border-0">
                <i class="bi bi-person-vcard me-2"></i> Add Staff
            </a>
            <a href="viewStaff.jsp" class="list-group-item list-group-item-action bg-dark text-white border-0">
                <i class="bi bi-people me-2"></i> View Staff
            </a>
            <a href="addInsurance.jsp" class="list-group-item list-group-item-action bg-dark text-white border-0">
                <i class="bi bi-shield-plus me-2"></i> Add Insurance
            </a>
            <a href="viewInsurance.jsp" class="list-group-item list-group-item-action bg-dark text-white border-0">
                <i class="bi bi-shield-check me-2"></i> View Insurance
            </a>
        </div>
        <hr class="text-secondary">
        <a href="logout.jsp" class="btn btn-outline-danger w-100 mt-3">
            <i class="bi bi-box-arrow-right me-2"></i> Logout
        </a>
    </div>
</div>


<!-- Main Content Grid -->
<div class="container mt-4">
    <div class="row row-cols-1 row-cols-md-3 g-4">

        <div class="col">
            <div class="card text-center p-3">
                <i class="bi bi-person-plus icon-size"></i>
                <div class="card-body">
                    <h5 class="card-title">Patients</h5>
                    <a href="addPatient.jsp" class="btn btn-primary m-1">Add Patient</a>
                    <a href="viewPatients.jsp" class="btn btn-outline-primary m-1">View Patients</a>
                </div>
            </div>
        </div>

        <div class="col">
            <div class="card text-center p-3">
                <i class="bi bi-calendar-event icon-size"></i>
                <div class="card-body">
                    <h5 class="card-title">Appointments</h5>
                    <a href="addAppointment.jsp" class="btn btn-primary m-1">Add Appointment</a>
                    <a href="viewAppointments.jsp" class="btn btn-outline-primary m-1">View Appointments</a>
                </div>
            </div>
        </div>

        <div class="col">
            <div class="card text-center p-3">
                <i class="bi bi-journal-medical icon-size"></i>
                <div class="card-body">
                    <h5 class="card-title">Medical Records</h5>
                    <a href="addRecord.jsp" class="btn btn-primary m-1">Add Record</a>
                    <a href="viewRecords.jsp" class="btn btn-outline-primary m-1">View Records</a>
                </div>
            </div>
        </div>

        <div class="col">
            <div class="card text-center p-3">
                <i class="bi bi-receipt icon-size"></i>
                <div class="card-body">
                    <h5 class="card-title">Billing</h5>
                    <a href="addBill.jsp" class="btn btn-primary m-1">Generate Bill</a>
                    <a href="viewBills.jsp" class="btn btn-outline-primary m-1">View Bills</a>
                </div>
            </div>
        </div>

        <div class="col">
            <div class="card text-center p-3">
                <i class="bi bi-capsule icon-size"></i>
                <div class="card-body">
                    <h5 class="card-title">Pharmacy</h5>
                    <a href="addMedicine.jsp" class="btn btn-primary m-1">Add Medicine</a>
                    <a href="viewMedicines.jsp" class="btn btn-outline-primary m-1">View Inventory</a>
                </div>
            </div>
        </div>

        <div class="col">
            <div class="card text-center p-3">
                <i class="bi bi-person-vcard icon-size"></i>
                <div class="card-body">
                    <h5 class="card-title">Staff</h5>
                    <a href="addStaff.jsp" class="btn btn-primary m-1">Add Staff</a>
                    <a href="viewStaff.jsp" class="btn btn-outline-primary m-1">View Staff</a>
                </div>
            </div>
        </div>

        <div class="col">
            <div class="card text-center p-3">
                <i class="bi bi-person-badge icon-size"></i>
                <div class="card-body">
                    <h5 class="card-title">Doctors</h5>
                    <a href="addDoctor.jsp" class="btn btn-primary m-1">Add Doctor</a>
                    <a href="viewDoctors.jsp" class="btn btn-outline-primary m-1">View Doctors</a>
                </div>
            </div>
        </div>

        <div class="col">
            <div class="card text-center p-3">
                <i class="bi bi-shield-plus icon-size"></i>
                <div class="card-body">
                    <h5 class="card-title">Insurance</h5>
                    <a href="addInsurance.jsp" class="btn btn-primary m-1">Add Insurance</a>
                    <a href="viewInsurance.jsp" class="btn btn-outline-primary m-1">View Insurance</a>
                </div>
            </div>
        </div>

        <!-- Extra Placeholder -->
        <div class="col">
            <div class="card text-center p-3 bg-light">
                <i class="bi bi-tools icon-size text-muted"></i>
                <div class="card-body">
                    <h5 class="card-title text-muted">Coming Soon</h5>
                    <button class="btn btn-secondary m-1" disabled>Feature</button>
                    <button class="btn btn-outline-secondary m-1" disabled>View</button>
                </div>
            </div>
        </div>

    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- Toggle Dark/Light Mode -->
<script>
    function toggleMode() {
        document.body.classList.toggle("dark-mode");
    }
</script>

<script>
    // Highlight current sidebar link
    const currentPage = window.location.pathname.split("/").pop();
    const links = document.querySelectorAll("#sidebarMenu a");

    links.forEach(link => {
        const href = link.getAttribute("href");
        if (href === currentPage) {
            link.classList.add("active", "bg-primary", "text-white");
        } else {
            link.classList.remove("active");
        }
    });
</script>

</body>
</html>
