package com.servlet;

import com.dao.EmployeeDAO;
import com.model.Employee;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/reportCriteria")
public class ReportCriteriaServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private EmployeeDAO employeeDAO;

    public void init() {
        employeeDAO = new EmployeeDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String reportType = request.getParameter("reportType");
        List<Employee> employees = null;
        
        try {
            switch (reportType) {
                case "name":
                    String letter = request.getParameter("letter");
                    employees = employeeDAO.searchByNameStartingWith(letter);
                    break;
                case "service":
                    int years = Integer.parseInt(request.getParameter("years"));
                    employees = employeeDAO.searchByYearsOfService(years);
                    break;
                case "salary":
                    double salary = Double.parseDouble(request.getParameter("salary"));
                    employees = employeeDAO.searchBySalary(salary);
                    break;
            }
            
            request.setAttribute("employees", employees);
            request.setAttribute("reportType", reportType);
            request.getRequestDispatcher("report_result.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("reports.jsp?status=error");
        }
    }
}