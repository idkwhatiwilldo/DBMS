-- Practical 5: INNER JOIN, LEFT JOIN, RIGHT JOIN
USE CompanyDB;

SELECT e.EmpName, e.Designation, d.DeptName, d.Location
FROM Employee e INNER JOIN Department d ON e.DeptID = d.DeptID;

SELECT s.SaleID, p.ProductName, e.EmpName, s.Quantity, s.SaleDate, s.TotalAmount
FROM Sales s INNER JOIN Product p ON s.ProductID = p.ProductID
INNER JOIN Employee e ON s.EmpID = e.EmpID;

SELECT d.DeptID, d.DeptName, e.EmpName
FROM Department d LEFT JOIN Employee e ON d.DeptID = e.DeptID;

SELECT e.EmpName, s.SaleID, s.TotalAmount
FROM Sales s RIGHT JOIN Employee e ON s.EmpID = e.EmpID;

