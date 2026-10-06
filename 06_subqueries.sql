-- Practical 6: Subqueries and Nested Queries
USE CompanyDB;

SELECT EmpName, Salary FROM Employee
WHERE Salary > (SELECT AVG(Salary) FROM Employee);

SELECT EmpName, Salary FROM Employee
WHERE Salary = (SELECT MAX(Salary) FROM Employee);

SELECT ProductName FROM Product
WHERE ProductID IN (SELECT ProductID FROM Sales WHERE Quantity >= 3);

SELECT EmpName FROM Employee
WHERE EmpID NOT IN (SELECT DISTINCT EmpID FROM Sales);

SELECT e.EmpName FROM Employee e
WHERE EXISTS (SELECT 1 FROM Sales s WHERE s.EmpID = e.EmpID);

