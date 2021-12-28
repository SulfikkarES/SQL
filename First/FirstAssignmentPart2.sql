/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [StoreName]
      ,[Sales]
      ,[Txn_Date]
  FROM [dbs__EmployeeManagementSystems_Sulfikkar].[dbo].[Store_Information]

    Q-1
  SELECT * FROM DBO.Store_Information;
  --dont use * in the query
  Q-2
  SELECT StoreName ,Sales  
	FROM dbo.Store_Information;

  Q-3
  SELECT StoreName ,txn_Date  
	 FROM dbo.Store_Information;

  Q-4
  SELECT StoreName   
	FROM dbo.Store_Information;

  --can use distinct to make it unqiue

  Q-5
	SELECT Sales  
		FROM dbo.Store_Information
		WHERE Sales > '1000';

	Q-6
	SELECT *  
		FROM dbo.Store_Information
		WHERE Sales > '1000' OR Txn_date = '1999-08-01';
	--specify column names
	Q-7
	SELECT Sales   
		FROM dbo.Store_Information
		WHERE Sales > '1000' OR
		Sales BETWEEN 275 AND 500;

	--sales is int. need not be in qotes
	Q-8
	SELECT * 
	FROM dbo.Store_Information
		WHERE StoreName IN ('Los Angeles','San Diego');
	--write column names
	Q-9
	SELECT *  
		FROM dbo.Store_Information
		WHERE Txn_Date BETWEEN '1999-01-06' AND '1999-01-10';
	--write column names
	Q-10
	SELECT Sales   
		FROM dbo.Store_Information
		WHERE Sales BETWEEN '280'AND '1000';

	Q-11
	SELECT StoreName 
		FROM dbo.Store_Information
		WHERE StoreName  
		LIKE '%AN%';

	Q-12
	SELECT Sales,StoreName    
		FROM dbo.Store_Information
		ORDER BY Sales DESC;

	Q-13
	SELECT TOP 2 *
		FROM dbo.Store_Information
		ORDER BY Sales DESC;

	Q-14
	SELECT top 50 percent *
		FROM dbo.Store_Information
		ORDER BY Sales;

	Q-15
	SELECT Sales,StoreName,Txn_Date   
		FROM dbo.Store_Information
		ORDER BY Sales  DESC,Txn_Date;

	--see the ordering condition