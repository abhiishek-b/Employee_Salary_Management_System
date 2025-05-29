<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Report Results</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .table-container {
            background-color: white;
            border-radius: 15px;
            box-shadow: 0 6px 10px rgba(0,0,0,0.08);
            padding: 20px;
        }
        .table thead th {
            background-color: #0d6efd;
            color: white;
        }
        .report-header {
            background-color: #e9ecef;
            border-radius: 10px;
            padding: 15px;
            margin-bottom: 20px;
        }
        .male-badge {
            background-color: #d1e7ff;
            color: #0a58ca;
            padding: 3px 8px;
            border-radius: 10px;
            font-size: 0.8rem;
        }
        .female-badge {
            background-color: #f8d7da;
            color: #b02a37;
            padding: 3px 8px;
            border-radius: 10px;
            font-size: 0.8rem;
        }
        .other-badge {
            background-color: #e2e3e5;
            color: #41464b;
            padding: 3px 8px;
            border-radius: 10px;
            font-size: 0.8rem;
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
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h1>Report Results</h1>
            <a href="reports.jsp" class="btn btn-primary">
                <i class="fas fa-arrow-left me-2"></i>Back to Reports
            </a>
        </div>
        
        <div class="report-header">
            <c:choose>
                <c:when test="${reportType == 'name'}">
                    <h4><i class="fas fa-search me-2"></i>Employees whose names start with '${param.letter}'</h4>
                </c:when>
                <c:when test="${reportType == 'service'}">
                    <h4><i class="fas fa-calendar-alt me-2"></i>Employees with ${param.years} or more years of service</h4>
                </c:when>
                <c:when test="${reportType == 'salary'}">
                    <h4><i class="fas fa-money-bill-wave me-2"></i>Employees earning more than $<fmt:formatNumber value="${param.salary}" type="number" minFractionDigits="2"/></h4>
                </c:when>
            </c:choose>
            <p class="mb-0"><strong>Total Records:</strong> ${employees.size()}</p>
        </div>
        
        <div class="table-container">
            <div class="table-responsive">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>Emp No</th>
                            <th>Name</th>
                            <th>Date of Joining</th>
                            <th>Gender</th>
                            <th>Basic Salary</th>
                            <th>Years of Service</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="employee" items="${employees}">
                            <tr>
                                <td>${employee.empno}</td>
                                <td>${employee.empName}</td>
                                <td>${employee.doj}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${employee.gender == 'Male'}">
                                            <span class="male-badge">${employee.gender}</span>
                                        </c:when>
                                        <c:when test="${employee.gender == 'Female'}">
                                            <span class="female-badge">${employee.gender}</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="other-badge">${employee.gender}</span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td>$<fmt:formatNumber value="${employee.bsalary}" type="number" minFractionDigits="2"/></td>
                                <td>
                                    <c:set var="now" value="<%=new java.util.Date()%>" />
                                    <c:set var="diff" value="${now.time - employee.doj.time}" />
                                    <c:set var="years" value="${diff / (1000 * 60 * 60 * 24 * 365)}" />
                                    <fmt:formatNumber value="${years}" maxFractionDigits="1" /> years
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        
        <div class="text-center mt-4">
            <button class="btn btn-outline-primary" onclick="window.print()">
                <i class="fas fa-print me-2"></i>Print Report
            </button>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>