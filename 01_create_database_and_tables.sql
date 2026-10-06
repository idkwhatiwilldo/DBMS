-- Practical 1: Creating and Managing Databases and Tables
CREATE DATABASE IF NOT EXISTS CompanyDB;
USE CompanyDB;

CREATE TABLE IF NOT EXISTS Department (
  DeptID INT,
  DeptName VARCHAR(50),
  Location VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS Employee (
  EmpID INT,
  EmpName VARCHAR(50),
  DeptID INT,
  Designation VARCHAR(30),
  Salary DECIMAL(10,2),
  DOJ DATE
);

CREATE TABLE IF NOT EXISTS Product (
  ProductID INT,
  ProductName VARCHAR(50),
  Category VARCHAR(30),
  UnitPrice DECIMAL(10,2)
);

CREATE TABLE IF NOT EXISTS Sales (
  SaleID INT,
  ProductID INT,
  EmpID INT,
  Quantity INT,
  SaleDate DATE,
  TotalAmount DECIMAL(10,2)
);

INSERT INTO Department (DeptID, DeptName, Location) VALUES
(1, 'Sales', 'Mumbai'), (2, 'IT', 'Pune'), (3, 'HR', 'Delhi'),
(4, 'Finance', 'Bengaluru'), (5, 'Marketing', 'Chennai');

INSERT INTO Employee (EmpID, EmpName, DeptID, Designation, Salary, DOJ) VALUES
(101, 'Aditi Sharma', 1, 'Sales Executive', 45000.00, '2021-06-14'),
(102, 'Rohan Mehta', 2, 'Software Engineer', 65000.00, '2020-03-01'),
(103, 'Kavya Iyer', 3, 'HR Manager', 58000.00, '2019-11-20'),
(104, 'Sameer Khan', 4, 'Accountant', 50000.00, '2022-01-10'),
(105, 'Neha Verma', 1, 'Sales Executive', 47000.00, '2021-08-05'),
(106, 'Arjun Nair', 2, 'Software Engineer', 70000.00, '2018-07-23');

INSERT INTO Product (ProductID, ProductName, Category, UnitPrice) VALUES
(201, 'Laptop', 'Electronics', 55000.00), (202, 'Office Chair', 'Furniture', 4500.00),
(203, 'Printer', 'Electronics', 12000.00), (204, 'Desk', 'Furniture', 7000.00),
(205, 'Monitor', 'Electronics', 9000.00);

INSERT INTO Sales (SaleID, ProductID, EmpID, Quantity, SaleDate, TotalAmount) VALUES
(301, 201, 101, 2, '2023-01-15', 110000.00),
(302, 203, 105, 1, '2023-02-10', 12000.00),
(303, 202, 101, 3, '2023-02-18', 13500.00),
(304, 205, 105, 4, '2023-03-05', 36000.00),
(305, 204, 101, 1, '2023-03-20', 7000.00);

DESCRIBE Department;
DESCRIBE Employee;
DESCRIBE Product;
DESCRIBE Sales;
SELECT * FROM Department;
SELECT * FROM Employee;
SELECT * FROM Product;
SELECT * FROM Sales;

