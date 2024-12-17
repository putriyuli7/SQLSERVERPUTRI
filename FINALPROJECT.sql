
/*TUGAS 1
NO 4*/
SELECT 
CONCAT(FirstName,' ',LastName) 
,CONCAT(DATEDIFF(DAY,HireDate , GETDATE()), ' hari') as lama_kerja
FROM Employees e 

/*TUGAS 2
NO 1*/
SELECT * FROM Employees e WHERE LastName LIKE 'P%'
 
/*NO 2*/
SELECT 
FirstName,  
CASE WHEN Salary > 10000000 THEN 'High'
	WHEN Salary < 5000000 THEN 'Low'
	ELSE 'Medium' END as Statusgaji
FROM Employees e 

/*TUGAS 7 
NO 1*/
CREATE LOGIN LoginSalesuser WITH PASSWORD = 'Password123!';
CREATE USER SalesUser FOR LOGIN LoginSalesuser
CREATE ROLE SalesTeam;
GRANT SELECT ON Sales TO SalesTeam;
EXEC sp_addrolemember 'SalesTeam', 'SalesUser';

/*NO 2*/
GRANT SELECT, UPDATE ON Employees TO Manager;
GRANT SELECT, UPDATE ON Salaries TO Manager;

/*NO 3*/
CREATE LOGIN LoginSalesuser WITH PASSWORD = 'Password123!';
CREATE USER SalesUser FOR LOGIN LoginSalesuser
GRANT SELECT, UPDATE ON Employees TO SalesUser;
REVOKE UPDATE ON Employees TO SalesUser;
DENY DELETE ON Sales TO  SalesUser


/*TUGAS 6*/
CREATE PROCEDURE
EmployeeSalesPutri
@EmployeeID INT,
@NewSalary DECIMAL

AS 
BEGIN
	SELECT 
		EmployeeID
        ,SUM(Salary) Totalsale
	FROM
		Employees e 
    GROUP BY EmployeeID
END;