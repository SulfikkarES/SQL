/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [EmployeeID]
      ,[FirstName]
      ,[LastName]
      ,[HireDate]
      ,[City]
  FROM [dbs__EmployeeManagementSystems_Sulfikkar].[dbo].[dbs_Employee]

  USE dbsEmployeeManagementSystemSulfikkarES 

  --change table name
Q-1
--indent the query from the second line like in Q2
	SELECT * FROM dbo.dbs_Employee; 
	--* should not be used in queries as per coding standards. Write column names

Q-2
	SELECT CONCAT(firstname, ' ',LastName ) as FullName
		FROM dbo.dbs_Employee;

Q-3
	SELECT firstname,LastName,City  
		FROM dbo.dbs_Employee
		WHERE City = 'London';

Q-4
	SELECT firstname,LastName,City  
		FROM dbo.dbs_Employee
		WHERE City != 'London';
	
	Q-5
	SELECT firstname,LastName,City,HireDATE  
		FROM dbo.dbs_Employee
		WHERE HireDATE < '1993-07-01'

	Q-6
	SELECT firstname,LastName,City ,HireDATE   
		FROM dbo.dbs_Employee
		WHERE HireDATE BETWEEN '1992-06-01' AND '1993-12-15';

	Q-7
	SELECT firstname,LastName,City ,HireDATE   
		FROM dbo.dbs_Employee
		WHERE NOT HireDATE BETWEEN '1992-06-01' AND '1993-12-15';

	Q-8
	SELECT firstname,LastName,City ,HireDATE   
		FROM dbo.dbs_Employee
		WHERE City IN ('Seattle','Tacoma','Redmond');

	Q-9
	SELECT firstname,LastName   
		FROM dbo.dbs_Employee
		WHERE firstname  NOT LIKE 'A%' AND firstname  NOT LIKE'M%' ;

	--rewrite this query using []

	Q-10
	SELECT City   
		FROM dbo.dbs_Employee
		order by  City;

	Q-11
	SELECT firstname
		FROM dbo.dbs_Employee
		order by firstname DESC;
