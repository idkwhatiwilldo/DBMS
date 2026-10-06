-- Practical 9: COMMIT, ROLLBACK and SAVEPOINT
USE CompanyDB;

-- COMMIT: make a change permanent.
START TRANSACTION;
INSERT INTO Department (DeptID, DeptName, Location)
VALUES (6, 'Logistics', 'Hyderabad');
SELECT * FROM Department;
COMMIT;
SELECT * FROM Department;

-- ROLLBACK: undo an entire transaction.
START TRANSACTION;
DELETE FROM Sales WHERE SaleID = 305;
SELECT * FROM Sales;
ROLLBACK;
SELECT * FROM Sales;

-- SAVEPOINT: undo only the work after the savepoint.
START TRANSACTION;
UPDATE Employee SET Salary = Salary + 5000 WHERE EmpID = 101;
SAVEPOINT before_delete;
DELETE FROM Sales WHERE SaleID = 302;
SELECT * FROM Sales;
SELECT * FROM Employee WHERE EmpID = 101;
ROLLBACK TO SAVEPOINT before_delete;
SELECT * FROM Sales;
SELECT * FROM Employee WHERE EmpID = 101;
ROLLBACK;
SELECT * FROM Employee WHERE EmpID = 101;

