package com.servlet;

import com.dao.EmployeeDAO;
import com.model.Employee;
import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/update")
public class UpdateEmployeeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private EmployeeDAO employeeDAO;

    public void init() {
        employeeDAO = new EmployeeDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int empno = Integer.parseInt(request.getParameter("empno"));
            String empName = request.getParameter("empName");
            Date doj = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("doj"));
            String gender = request.getParameter("gender");
            double bsalary = Double.parseDouble(request.getParameter("bsalary"));

            Employee employee = new Employee(empno, empName, doj, gender, bsalary);
            employeeDAO.updateEmployee(employee);
            response.sendRedirect("index.jsp?status=success");
        } catch (ParseException | SQLException e) {
            e.printStackTrace();
            response.sendRedirect("empupdate.jsp?status=error");
        }
    }
}