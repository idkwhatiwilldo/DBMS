-- Practical 2: Applying Constraints
USE CompanyDB;

DROP TABLE IF EXISTS Sales;
DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Product;
DROP TABLE IF EXISTS Department;

CREATE TABLE Department (
  DeptID INT PRIMARY KEY,
  DeptName VARCHAR(50) NOT NULL UNIQUE,
  Location VARCHAR(50)
);

CREATE TABLE Employee (
  EmpID INT PRIMARY KEY,
  EmpName VARCHAR(50) NOT NULL,
  DeptID INT,
  Designation VARCHAR(30),
  Salary DECIMAL(10,2) CHECK (Salary > 0),
  DOJ DATE,
  CONSTRAINT fk_emp_dept FOREIGN KEY (DeptID)
    REFERENCES Department(DeptID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Product (
  ProductID INT PRIMARY KEY,
  ProductName VARCHAR(50) NOT NULL,
  Category VARCHAR(30),
  UnitPrice DECIMAL(10,2) CHECK (UnitPrice > 0)
);

CREATE TABLE Sales (
  SaleID INT PRIMARY KEY,
  ProductID INT,
  EmpID INT,
  Quantity INT CHECK (Quantity > 0),
  SaleDate DATE,
  TotalAmount DECIMAL(10,2),
  CONSTRAINT fk_sales_product FOREIGN KEY (ProductID) REFERENCES Product(ProductID),
  CONSTRAINT fk_sales_emp FOREIGN KEY (EmpID) REFERENCES Employee(EmpID)
);

INSERT INTO Department VALUES
(1, 'Sales', 'Mumbai'), (2, 'IT', 'Pune'), (3, 'HR', 'Delhi'),
(4, 'Finance', 'Bengaluru'), (5, 'Marketing', 'Chennai');
INSERT INTO Product VALUES
(201, 'Laptop', 'Electronics', 55000.00), (202, 'Office Chair', 'Furniture', 4500.00),
(203, 'Printer', 'Electronics', 12000.00), (204, 'Desk', 'Furniture', 7000.00),
(205, 'Monitor', 'Electronics', 9000.00);
INSERT INTO Employee VALUES
(101, 'Aditi Sharma', 1, 'Sales Executive', 45000.00, '2021-06-14'),
(102, 'Rohan Mehta', 2, 'Software Engineer', 65000.00, '2020-03-01'),
(103, 'Kavya Iyer', 3, 'HR Manager', 58000.00, '2019-11-20'),
(104, 'Sameer Khan', 4, 'Accountant', 50000.00, '2022-01-10'),
(105, 'Neha Verma', 1, 'Sales Executive', 47000.00, '2021-08-05'),
(106, 'Arjun Nair', 2, 'Software Engineer', 70000.00, '2018-07-23');
INSERT INTO Sales VALUES
(301, 201, 101, 2, '2023-01-15', 110000.00), (302, 203, 105, 1, '2023-02-10', 12000.00),
(303, 202, 101, 3, '2023-02-18', 13500.00), (304, 205, 105, 4, '2023-03-05', 36000.00),
(305, 204, 101, 1, '2023-03-20', 7000.00);

DESCRIBE Department;
DESCRIBE Employee;
DESCRIBE Product;
DESCRIBE Sales;

-- Uncomment one at a time to observe constraint errors.
-- INSERT INTO Department VALUES (1, 'Duplicate Sales', 'Mumbai');
-- INSERT INTO Employee VALUES (107, NULL, 1, 'Intern', 20000, '2026-01-01');
-- INSERT INTO Employee VALUES (108, 'Invalid Dept', 99, 'Intern', 20000, '2026-01-01');
-- INSERT INTO Product VALUES (206, 'Invalid Price', 'Test', -1);

