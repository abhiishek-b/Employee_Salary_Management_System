package com.dao;

import com.model.Employee;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EmployeeDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/employeedb";
    private String jdbcUsername = "root";
    private String jdbcPassword = ""; // Change to your MySQL password
    
    private static final String INSERT_EMP_SQL = "INSERT INTO Employee (Empno, EmpName, DoJ, Gender, Bsalary) VALUES (?, ?, ?, ?, ?)";
    private static final String SELECT_EMP_BY_ID = "SELECT * FROM Employee WHERE Empno = ?";
    private static final String SELECT_ALL_EMP = "SELECT * FROM Employee";
    private static final String DELETE_EMP_SQL = "DELETE FROM Employee WHERE Empno = ?";
    private static final String UPDATE_EMP_SQL = "UPDATE Employee SET EmpName=?, DoJ=?, Gender=?, Bsalary=? WHERE Empno=?";
    
    private static final String SEARCH_BY_NAME_LETTER = "SELECT * FROM Employee WHERE EmpName LIKE ?";
    private static final String SEARCH_BY_YEARS_SERVICE = "SELECT * FROM Employee WHERE DATEDIFF(CURDATE(), DoJ)/365 >= ?";
    private static final String SEARCH_BY_SALARY = "SELECT * FROM Employee WHERE Bsalary > ?";
    
    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }
    
    // CRUD Operations
    public void insertEmployee(Employee employee) throws SQLException {
        try (Connection connection = getConnection();
             PreparedStatement ps = connection.prepareStatement(INSERT_EMP_SQL)) {
            ps.setInt(1, employee.getEmpno());
            ps.setString(2, employee.getEmpName());
            ps.setDate(3, new java.sql.Date(employee.getDoj().getTime()));
            ps.setString(4, employee.getGender());
            ps.setDouble(5, employee.getBsalary());
            ps.executeUpdate();
        }
    }
    
    public Employee selectEmployee(int empno) {
        Employee employee = null;
        try (Connection connection = getConnection();
             PreparedStatement ps = connection.prepareStatement(SELECT_EMP_BY_ID)) {
            ps.setInt(1, empno);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                employee = new Employee();
                employee.setEmpno(rs.getInt("Empno"));
                employee.setEmpName(rs.getString("EmpName"));
                employee.setDoj(rs.getDate("DoJ"));
                employee.setGender(rs.getString("Gender"));
                employee.setBsalary(rs.getDouble("Bsalary"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return employee;
    }
    
    public List<Employee> selectAllEmployees() {
        List<Employee> employees = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement ps = connection.prepareStatement(SELECT_ALL_EMP)) {
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                Employee employee = new Employee();
                employee.setEmpno(rs.getInt("Empno"));
                employee.setEmpName(rs.getString("EmpName"));
                employee.setDoj(rs.getDate("DoJ"));
                employee.setGender(rs.getString("Gender"));
                employee.setBsalary(rs.getDouble("Bsalary"));
                employees.add(employee);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return employees;
    }
    
    public boolean deleteEmployee(int empno) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection();
             PreparedStatement ps = connection.prepareStatement(DELETE_EMP_SQL)) {
            ps.setInt(1, empno);
            rowDeleted = ps.executeUpdate() > 0;
        }
        return rowDeleted;
    }
    
    public boolean updateEmployee(Employee employee) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection();
             PreparedStatement ps = connection.prepareStatement(UPDATE_EMP_SQL)) {
            ps.setString(1, employee.getEmpName());
            ps.setDate(2, new java.sql.Date(employee.getDoj().getTime()));
            ps.setString(3, employee.getGender());
            ps.setDouble(4, employee.getBsalary());
            ps.setInt(5, employee.getEmpno());
            rowUpdated = ps.executeUpdate() > 0;
        }
        return rowUpdated;
    }
    
    // Report Methods
    public List<Employee> searchByNameStartingWith(String letter) {
        List<Employee> employees = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement ps = connection.prepareStatement(SEARCH_BY_NAME_LETTER)) {
            ps.setString(1, letter + "%");
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                Employee employee = new Employee();
                employee.setEmpno(rs.getInt("Empno"));
                employee.setEmpName(rs.getString("EmpName"));
                employee.setDoj(rs.getDate("DoJ"));
                employee.setGender(rs.getString("Gender"));
                employee.setBsalary(rs.getDouble("Bsalary"));
                employees.add(employee);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return employees;
    }
    
    public List<Employee> searchByYearsOfService(int years) {
        List<Employee> employees = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement ps = connection.prepareStatement(SEARCH_BY_YEARS_SERVICE)) {
            ps.setInt(1, years);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                Employee employee = new Employee();
                employee.setEmpno(rs.getInt("Empno"));
                employee.setEmpName(rs.getString("EmpName"));
                employee.setDoj(rs.getDate("DoJ"));
                employee.setGender(rs.getString("Gender"));
                employee.setBsalary(rs.getDouble("Bsalary"));
                employees.add(employee);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return employees;
    }
    
    public List<Employee> searchBySalary(double salary) {
        List<Employee> employees = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement ps = connection.prepareStatement(SEARCH_BY_SALARY)) {
            ps.setDouble(1, salary);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                Employee employee = new Employee();
                employee.setEmpno(rs.getInt("Empno"));
                employee.setEmpName(rs.getString("EmpName"));
                employee.setDoj(rs.getDate("DoJ"));
                employee.setGender(rs.getString("Gender"));
                employee.setBsalary(rs.getDouble("Bsalary"));
                employees.add(employee);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return employees;
    }
}