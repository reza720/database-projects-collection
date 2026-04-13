/*
Payroll Management Database Subsystem 
The payroll management database system handles the payroll processing system in an organization. The database system for payroll management includes information about employee details, salary details, employee working days, tax information, and payment history.

The main objective of this database design project ideas for payroll management system includes 
- Automating the process of managing employee salaries.
- Maintaining correct data about the employee’s details along with their attendance.
- Recording the tax fillings of the employees with their payment history.

For the payroll management database system, you can create the entities and attributes as follows.
- Employee: Employee ID, Name, Address, Phone, Joining date, Department, Position, Salary.
- Payroll: Payroll ID, Employee ID, Department, Gross pay, Net pay, Deductions.
- Tax: Tax Id, Employee Id, Year, Amount.
- Payment: Pay ID, Employee ID, Pay date, Amount.
*/

create database Payroll_Management;
use Payroll_Management;

CREATE TABLE Departments (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Positions (
    position_id INT AUTO_INCREMENT PRIMARY KEY,
    position_name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Employees (
    employee_id VARCHAR(20) PRIMARY KEY,
    emplyee_first_name VARCHAR(50) NOT NULL,
    employee_last_name VARCHAR(50) NOT NULL,
    employee_province VARCHAR(50) NOT NULL,
    employee_district VARCHAR(50) NOT NULL,
    employee_stree VARCHAR(50) NOT NULL,
    employee_phone VARCHAR(15) NOT NULL,
    employee_joining_date DATE NOT NULL,
    employee_department_id INT NOT NULL,
    employee_position_id INT NOT NULL,
    employee_salary DECIMAL(10 , 2 ) NOT NULL CHECK (employee_salary >= 0),
    FOREIGN KEY (employee_department_id)
        REFERENCES Departments (department_id),
    FOREIGN KEY (employee_position_id)
        REFERENCES Positions (position_id)
);

CREATE TABLE payroll (
    payroll_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id VARCHAR(20) NOT NULL,
    gross_pay DECIMAL(10,2) NOT NULL CHECK (gross_pay > 0),
    deductions DECIMAL(10,2) NOT NULL CHECK (deductions >= 0),
    net_pay DECIMAL(10,2) GENERATED ALWAYS AS (gross_pay - deductions) STORED,
    FOREIGN KEY (employee_id)
        REFERENCES Employees(employee_id)
);

CREATE TABLE Taxes (
    tax_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id VARCHAR(20) NOT NULL,
    year YEAR NOT NULL,
    amount DECIMAL(10 , 2 ) NOT NULL CHECK (amount >= 0),
    FOREIGN KEY (employee_id)
        REFERENCES Employees (employee_id)
);

CREATE TABLE Payments (
    pay_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id VARCHAR(20) NOT NULL,
    pay_date DATE NOT NULL,
    amount DECIMAL(10 , 2 ) NOT NULL check (amount >= 0),
    FOREIGN KEY (employee_id)
        REFERENCES Employees (employee_id)
);

