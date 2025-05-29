<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Reports Criteria</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h2 class="text-center mb-4">Report Criteria</h2>
        <form action="reportCriteria" method="post" class="card p-4 shadow-sm">
            <div class="mb-3">
                <label class="form-label">Filter By</label>
                <select class="form-select" name="criteria">
                    <option value="name">Name Starting Letter</option>
                    <option value="service">Years of Service</option>
                    <option value="salary">Minimum Salary</option>
                </select>
            </div>
            <div class="mb-3">
                <label class="form-label">Value</label>
                <input type="text" name="value" class="form-control" required>
            </div>
            <button type="submit" class="btn btn-info w-100">Generate Report</button>
        </form>
    </div>
</body>
</html>
