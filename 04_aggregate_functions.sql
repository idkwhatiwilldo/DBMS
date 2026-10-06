-- Practical 4: Aggregate Functions
USE CompanyDB;

SELECT COUNT(*) AS TotalEmployees FROM Employee;
SELECT SUM(TotalAmount) AS TotalRevenue FROM Sales;
SELECT AVG(UnitPrice) AS AvgProductPrice FROM Product;
SELECT MIN(Salary) AS LowestSalary, MAX(Salary) AS HighestSalary FROM Employee;
SELECT DeptID, COUNT(*) AS NumEmployees, AVG(Salary) AS AvgSalary,
       SUM(Salary) AS TotalSalaryPayout
FROM Employee GROUP BY DeptID;
SELECT ProductID, SUM(Quantity) AS TotalUnitsSold FROM Sales
GROUP BY ProductID HAVING SUM(Quantity) >= 2 ORDER BY TotalUnitsSold DESC;

