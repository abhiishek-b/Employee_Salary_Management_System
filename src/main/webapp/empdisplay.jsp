<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee Reports</title>
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
            border: none;
            transition: transform 0.3s;
        }
        .card:hover {
            transform: translateY(-5px);
        }
        .report-icon {
            font-size: 2.5rem;
            margin-bottom: 1rem;
            color: #0d6efd;
        }
        .btn-report {
            width: 100%;
            padding: 10px;
            font-weight: 500;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
        <div class="container">
            <a class="navbar-brand" href="index.jsp">EmpManage</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="index.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="display">View Employees</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="reports">Reports</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container my-5">
        <h1 class="text-center mb-5">Employee Reports</h1>
        
        <div class="row g-4">
            <div class="col-md-4">
                <div class="card h-100">
                    <div class="card-body text-center">
                        <i class="fas fa-search report-icon"></i>
                        <h4 class="card-title">Search by Name</h4>
                        <p class="card-text">Find employees whose names start with a specific letter</p>
                        <button type="button" class="btn btn-primary btn-report" data-bs-toggle="modal" data-bs-target="#nameReportModal">
                            <i class="fas fa-file-alt me-2"></i>Generate Report
                        </button>
                    </div>
                </div>
            </div>
            
            <div class="col-md-4">
                <div class="card h-100">
                    <div class="card-body text-center">
                        <i class="fas fa-calendar-alt report-icon"></i>
                        <h4 class="card-title">Years of Service</h4>
                        <p class="card-text">Find employees with N or more years of service</p>
                        <button type="button" class="btn btn-primary btn-report" data-bs-toggle="modal" data-bs-target="#serviceReportModal">
                            <i class="fas fa-file-alt me-2"></i>Generate Report
                        </button>
                    </div>
                </div>
            </div>
            
            <div class="col-md-4">
                <div class="card h-100">
                    <div class="card-body text-center">
                        <i class="fas fa-money-bill-wave report-icon"></i>
                        <h4 class="card-title">Salary Report</h4>
                        <p class="card-text">Find employees earning more than a specified salary</p>
                        <button type="button" class="btn btn-primary btn-report" data-bs-toggle="modal" data-bs-target="#salaryReportModal">
                            <i class="fas fa-file-alt me-2"></i>Generate Report
                        </button>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="text-center mt-4">
            <a href="index.jsp" class="btn btn-outline-primary">
                <i class="fas fa-arrow-left me-2"></i>Back to Home
            </a>
        </div>
    </div>

    <!-- Name Report Modal -->
    <div class="modal fade" id="nameReportModal" tabindex="-1" aria-labelledby="nameReportModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="nameReportModalLabel">Search by Name</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form action="reportCriteria" method="post">
                    <div class="modal-body">
                        <input type="hidden" name="reportType" value="name">
                        <div class="mb-3">
                            <label for="letter" class="form-label">Enter starting letter of employee name:</label>
                            <input type="text" class="form-control" id="letter" name="letter" maxlength="1" required>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Generate Report</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Service Report Modal -->
    <div class="modal fade" id="serviceReportModal" tabindex="-1" aria-labelledby="serviceReportModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="serviceReportModalLabel">Years of Service Report</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form action="reportCriteria" method="post">
                    <div class="modal-body">
                        <input type="hidden" name="reportType" value="service">
                        <div class="mb-3">
                            <label for="years" class="form-label">Minimum years of service:</label>
                            <input type="number" class="form-control" id="years" name="years" min="0" required>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Generate Report</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Salary Report Modal -->
    <div class="modal fade" id="salaryReportModal" tabindex="-1" aria-labelledby="salaryReportModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="salaryReportModalLabel">Salary Report</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form action="reportCriteria" method="post">
                    <div class="modal-body">
                        <input type="hidden" name="reportType" value="salary">
                        <div class="mb-3">
                            <label for="salary" class="form-label">Minimum salary:</label>
                            <input type="number" step="0.01" class="form-control" id="salary" name="salary" min="0" required>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Generate Report</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>