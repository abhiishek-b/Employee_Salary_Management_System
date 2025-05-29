<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee Management System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .card {
            border-radius: 15px;
            box-shadow: 0 6px 10px rgba(0,0,0,0.08);
            transition: transform 0.3s;
        }
        .card:hover {
            transform: translateY(-5px);
        }
        .btn-action {
            width: 100%;
            padding: 10px;
            font-weight: 500;
        }
        .navbar-brand {
            font-weight: 700;
            font-size: 1.8rem;
        }
        .status-message {
            position: fixed;
            top: 20px;
            right: 20px;
            z-index: 1000;
            animation: fadeInOut 3s ease-in-out;
        }
        @keyframes fadeInOut {
            0% {opacity: 0;}
            10% {opacity: 1;}
            90% {opacity: 1;}
            100% {opacity: 0;}
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
        <div class="container">
            <a class="navbar-brand" href="#">EmpManage</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link active" href="index.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="display">View Employees</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="reports">Reports</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container my-5">
        <h1 class="text-center mb-5">Employee Management System</h1>
        
        <div class="row g-4">
            <div class="col-md-6 col-lg-3">
                <div class="card h-100">
                    <div class="card-body text-center">
                        <i class="fas fa-user-plus fa-3x text-primary mb-3"></i>
                        <h5 class="card-title">Add Employee</h5>
                        <p class="card-text">Add a new employee to the database</p>
                        <a href="empadd.jsp" class="btn btn-primary btn-action">
                            <i class="fas fa-plus me-2"></i>Add
                        </a>
                    </div>
                </div>
            </div>
            
            <div class="col-md-6 col-lg-3">
                <div class="card h-100">
                    <div class="card-body text-center">
                        <i class="fas fa-edit fa-3x text-warning mb-3"></i>
                        <h5 class="card-title">Update Employee</h5>
                        <p class="card-text">Update existing employee details</p>
                        <a href="empupdate.jsp" class="btn btn-warning btn-action text-white">
                            <i class="fas fa-pen me-2"></i>Update
                        </a>
                    </div>
                </div>
            </div>
            
            <div class="col-md-6 col-lg-3">
                <div class="card h-100">
                    <div class="card-body text-center">
                        <i class="fas fa-trash-alt fa-3x text-danger mb-3"></i>
                        <h5 class="card-title">Delete Employee</h5>
                        <p class="card-text">Remove an employee from the database</p>
                        <a href="empdelete.jsp" class="btn btn-danger btn-action">
                            <i class="fas fa-trash me-2"></i>Delete
                        </a>
                    </div>
                </div>
            </div>
            
            <div class="col-md-6 col-lg-3">
                <div class="card h-100">
                    <div class="card-body text-center">
                        <i class="fas fa-users fa-3x text-success mb-3"></i>
                        <h5 class="card-title">View Employees</h5>
                        <p class="card-text">View all employee records</p>
                        <a href="display" class="btn btn-success btn-action">
                            <i class="fas fa-list me-2"></i>View All
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <c:if test="${param.status == 'success'}">
        <div class="status-message alert alert-success alert-dismissible fade show" role="alert">
            <strong>Success!</strong> Operation completed successfully.
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    </c:if>
    
    <c:if test="${param.status == 'error'}">
        <div class="status-message alert alert-danger alert-dismissible fade show" role="alert">
            <strong>Error!</strong> Something went wrong. Please try again.
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    </c:if>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Auto-close alerts after 3 seconds
        setTimeout(() => {
            const alerts = document.querySelectorAll('.alert');
            alerts.forEach(alert => {
                new bootstrap.Alert(alert).close();
            });
        }, 3000);
    </script>
</body>
</html>