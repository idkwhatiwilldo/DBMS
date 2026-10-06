-- Practical 3: SELECT, WHERE, ORDER BY, GROUP BY, HAVING
USE CompanyDB;

SELECT EmpName, Designation, Salary FROM Employee;
SELECT EmpName, Salary FROM Employee WHERE Salary > 50000;
SELECT EmpName, DeptID, Salary FROM Employee WHERE DeptID = 1 AND Salary > 40000;
SELECT EmpName, Designation FROM Employee
WHERE Designation = 'Software Engineer' OR Designation = 'HR Manager';
SELECT EmpName, Salary FROM Employee ORDER BY Salary DESC;
SELECT DeptID, COUNT(*) AS NumEmployees FROM Employee GROUP BY DeptID;
SELECT DeptID, COUNT(*) AS NumEmployees FROM Employee
GROUP BY DeptID HAVING COUNT(*) > 1;

