# Employee_Salary_Management_System

Develop a Project in Java for Employee database with Employee table ( Empno,EmpName,DoJ, Gender, Bsalary) to generate the modules namely EmpAdd, EmpUpdate, EmpDelete and EmpDisplay along with Main module performing the operations of adding record, updating the record, deleting the record and display the record based on the primary key Empno. Use Dynamic web project to perform these operations with HTML and JSP along with JDBC
connectivity with MySQL as backend. Define complete structure of the project with modules and packages.

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

🚀 Features
Complete CRUD Operations: Add, Update, Delete, and Display Employee Details                                  

Advanced Search: Search employee records by ID

Comprehensive Reports: Generate various reports including:

  *.Employees whose names start with a specific letter
  
  *.Employees with N or more years of service
  
  *.Employees earning more than a specified salary
  
Input Validation: Client-side and server-side validation

Professional UI: Bootstrap-based responsive design

MVC Architecture: Clean separation of concerns

Database Integration: MySQL with JDBC connectivity

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

📋 Prerequisites

Before running this application, make sure you have the following installed:

   *. Java Development Kit (JDK) 8 or higher

   *. Apache Tomcat 9.0 or higher
   
   *. MySQL Server 5.7 or XAMP Server
   
   *. MySQL JDBC Driver (mysql-connector-java)
   
   *. IDE: Eclipse (J2EE), IntelliJ IDEA, or any Java IDE
   
   *. Web Browser: Chrome, Firefox, or Edge

___

Project Specification and its structure                                                                          
CREATE TABLE Employee (                                                                                                             
Empno INT PRIMARY KEY,                                                                                                                                                                                           
EmpName VARCHAR(100),                                                                                                                     
DoJ DATE,                                                                                                                                                                                                        
Gender VARCHAR(10),                                                                      
Bsalary DECIMAL(10,2)                                                                 
);                                                                                                           

______

🛠️ Project Structure

EmployeeWebApp/                                          
├── WebContent/                                             
│ ├── index.jsp                                               
│ ├── empadd.jsp                                                             
│ ├── empupdate.jsp                                                           
│ ├── empdelete.jsp                                                                
│ ├── empdisplay.jsp                                                                 
│ ├── reports.jsp <-- New page for reports                                                            
│ ├── report_form.jsp <-- Form to select report criteria                                                     
│ └── report_result.jsp <-- Display report results                                                               
├── src/                                                               
│ ├── com/                                                                              
│ ├── dao/                                                                           
│ │ └── EmployeeDAO.java                                                                                     
│ ├── model/                                        
│ │ └── Employee.java                                                  
│ └── servlet/                                                                  
│ ├── AddEmployeeServlet.java                                                                  
│ ├── UpdateEmployeeServlet.java                                                                        
│ ├── DeleteEmployeeServlet.java                                                                            
│ ├── DisplayEmployeeServlet.java                                                                               
│ ├── ReportServlet.java <-- servlet for reports                                                                                     
│ └── ReportCriteriaServlet.java <-- To handle report form submissions                                                                                      
└── WEB-INF/                                                                                                               
└── web.xml                                                                                                                     
 
_________


🖼️ Screenshots

![image alt](https://github.com/abhiishek-b/Employee_Salary_Management_System/blob/main/Output_screenshots/Add_Employee.jpg)

