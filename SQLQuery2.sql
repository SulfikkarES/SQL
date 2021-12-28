
Q-1
CREATE TABLE sms__students 
(std_studentid int primary key,
std_name varchar(100),
std_address varchar(500),
std_city int,
std_email varchar(100),
std_dateofbirth date, 
std_regnNumber char(10) UNIQUE, 
std_gender int, 
std_issuspended int); 

drop table dbo.ems__students

Q-2
INSERT INTO Students VALUES (1,'John','31st street, opp fax home, ludwin',1,'john@gmail.com','1976-07-17','194300',1,0);
INSERT INTO Students VALUES (2,'Abraham','sanfracis ok mall','1','abraham@hotmail.com','1978-08-18','959595', 1,0);
INSERT INTO Students VALUES (3,'Lucy energy','tech, lal mal','2','luchy@gmail.com','1980-07-20',474848,2,0); 
INSERT INTO Students VALUES (4,'Manesh','106, opp mail office', '2','manesh@yahoo.com', '1980-07-20','595959',1,0); 
INSERT INTO Students VALUES (5,'Jerin','Thoundaserry, mathilakam','3','jerin@gmail.com','1976-07-17','4844884',1,1);


Q-3
CREATE TABLE ExamTable (ExamID int primary key,
Name varchar(100), MaxMark Decimal(5,2),MinMarkReqdForPass decimal(5,2),
ExamScheduledTime datetime,Duration decimal(5,2)); 

Q-4
INSERT INTO ExamTable VALUES (1,'Maths', 100, 40, '2012-10-10 10:00', '90.00'); 
INSERT INTO ExamTable VALUES (2 ,'English',75,35,'2012-10-11 10:00','120.00');
INSERT INTO ExamTable VALUES (3 ,'C++ ',100 ,40 ,'2012-10-12 14:00 ','90.00'); 
INSERT INTO ExamTable VALUES(4,'VB',75,35,'2012-10-13 14:00','120.00');

Q-5
CREATE TABLE StudentMarks (StudentID int FOREIGN KEY REFERENCES sms__students(std_studentid) ,
ExamID int foreign key references ExamTable (ExamID) ,
Mark decimal(5,2),
EnteredBy int,EnteredTIME Datetime);

Q-6
INSERT INTO StudentMarks VALUES(1,1,'80',1,current_timestamp);
INSERT INTO StudentMarks VALUES(2 ,1, '90', 1,current_timestamp);
INSERT INTO StudentMarks VALUES(3, 1,' 40', 1,current_timestamp);  
INSERT INTO StudentMarks VALUES(4, 1,' 35', 1,current_timestamp);  
INSERT INTO StudentMarks VALUES(5, 1, '85', 1,current_timestamp);  
INSERT INTO StudentMarks VALUES(1, 2,' 70', 1,current_timestamp);  
INSERT INTO StudentMarks VALUES(2, 2,' 60', 1,current_timestamp); 
INSERT INTO StudentMarks VALUES(3, 2,' 17', 1,current_timestamp);
INSERT INTO StudentMarks VALUES(4 ,2 ,'45', 1,current_timestamp);
INSERT INTO StudentMarks VALUES(5, 2, '20',1,current_timestamp);
INSERT INTO StudentMarks VALUES(1, 3, '95', 1,current_timestamp);  
INSERT INTO StudentMarks VALUES(2 ,3, '90', 1,current_timestamp);  
INSERT INTO StudentMarks VALUES(3, 3, '30', 1,current_timestamp);
INSERT INTO StudentMarks VALUES(4, 3 ,'35 ',2,current_timestamp);
INSERT INTO StudentMarks VALUES(1, 4, '60', 2,current_timestamp);

Q-7
CREATE TABLE UsersTable (UserID int,UserName varchar(15),Password varchar(50), Name varchar(100));

Q-8
INSERT INTO UsersTable VALUES (1,'admin','prob#$124', 'Administrator');
INSERT INTO UsersTable VALUES(2,' mark',' lopus123',' Mark Antony');
INSERT INTO UsersTable VALUES(3, 'smith','qerty5432',' Smith John');

Q-9
CREATE TABLE Cities(CityID int,Name varchar(100));

Q-10
INSERT INTO Cities VALUES (1,'Kochin'); 
INSERT INTO Cities VALUES (2,'Calicut');
INSERT INTO Cities VALUES (3,'Trivandrum');

Q-11
SELECT * FROM dbo.Students; 

Q-12
SELECT * FROM dbo.ExamTable; 

Q-13
SELECT * FROM dbo.StudentMarks;

Q-14
SELECT * FROM dbo.UsersTable;

Q-15
SELECT * FROM dbo.Cities;

Q-16
SELECT * FROM dbo.Students 
WHERE Name LIKE 'J%';

Q-17
SELECT * FROM dbo.Students 
WHERE Name LIKE '%J';

Q-18
SELECT * FROM dbo.Students 
WHERE Email  LIKE '%@gmail%';

Q-19
SELECT A.Name,B.Name FROM dbo.Students A INNER JOIN dbo.Cities B
ON A.City =B.CityID; 

Q-20
SELECT * FROM dbo.UsersTable  
WHERE Name LIKE '%John%';

Q-21
SELECT datediff(year,dateofbirth,getdate())as age FROM dbo.Students 
WHERE datediff(year,dateofbirth,getdate())>33;

Q-22
SELECT * FROM dbo.Students 
WHERE Gender = 1;

Q-23
SELECT * FROM dbo.Students 
BETWEEN GENDER= 1 AND 'GENDER ';

Q-24
SELECT * FROM Students 
WHERE YEAR(DATEOFBIRTH)=1976;

Q-25
SELECT NAME,DATEOFBIRTH FROM Students 
WHERE DATEOFBIRTH in(SELECT DATEOFBIRTH FROM Students 
GROUP BY DATEOFBIRTH
HAVING COUNT(DATEOFBIRTH) > 1)
ORDER BY DateOfBirth;

Q-26
SELECT * FROM Students
WHERE IsSuspended=1;

Q-27
SELECT A.Name ,C.Name,B.Mark FROM Students A INNER JOIN StudentMarks B 
ON A.StudentID =B.StudentID 
INNER JOIN ExamTable C 
ON B.ExamID =C.ExamID 
WHERE C.Name LIKE 'MATHS';

Q-28
SELECT A.Name ,C.Name,B.Mark FROM Students A INNER JOIN StudentMarks B 
ON A.StudentID =B.StudentID 
INNER JOIN ExamTable C 
ON B.ExamID =C.ExamID 
WHERE C.Name LIKE 'ENGLISH' AND B.Mark < 50;

Q-29
SELECT A.Name ,C.Name,B.Mark FROM Students A INNER JOIN StudentMarks B 
ON A.StudentID =B.StudentID 
INNER JOIN ExamTable C 
ON B.ExamID =C.ExamID 
WHERE C.Name LIKE 'C++' AND B.Mark <35 ;

Q-30
SELECT A.Name ,C.Name,B.Mark FROM Students A INNER JOIN StudentMarks B 
ON A.StudentID =B.StudentID 
INNER JOIN ExamTable C 
ON B.ExamID =C.ExamID 
WHERE C.Name LIKE 'VB', AND B.Mark > 35 ;

Q-31
SELECT A.Name ,C.Name,B.Mark FROM Students A INNER JOIN StudentMarks B 
ON A.StudentID =B.StudentID 
INNER JOIN ExamTable C 
ON B.ExamID =C.ExamID 
WHERE C.Name IN ('English','Maths') AND B.Mark > 35;

Q-32
SELECT A.Name ,C.Name,B.Mark FROM Students A INNER JOIN StudentMarks B 
ON A.StudentID =B.StudentID 
INNER JOIN ExamTable C 
ON B.ExamID =C.ExamID 
WHERE C.Name IN ('C++','VB') AND B.Mark < 35;

Q-33
SELECT A.Name ,C.Name,B.Mark FROM Students A INNER JOIN StudentMarks B 
ON A.StudentID =B.StudentID 
INNER JOIN ExamTable C 
ON B.ExamID =C.ExamID 
WHERE C.Name IN ('English','Maths','C++','VB') AND B.Mark > 35;

Q-34
SELECT A.Name ,C.Name,B.Mark 
FROM Students A INNER JOIN StudentMarks B 
ON A.StudentID =B.StudentID 
INNER JOIN ExamTable C 
ON B.ExamID =C.ExamID 
WHERE C.Name IN ('English','Maths','C++','VB') AND B.Mark < 35;

Q-35

Q-38
	SELECT B.Name ,sum(Mark)
		FROM StudentMarks A inner join Students B 
		ON A.StudentID =B.StudentID 
		GROUP BY B.Name ;

Q-39
	SELECT B.Name ,avg(Mark)
		FROM StudentMarks A inner join Students B 
		ON A.StudentID =B.StudentID 
		WHERE A.ExamID  = 3
		GROUP BY B.Name ;

Q-40
	SELECT B.Name ,avg(Mark)
		FROM StudentMarks A inner join Students B 
		ON A.StudentID =B.StudentID 
		WHERE A.ExamID  = 1 AND B.Gender =1
		GROUP BY B.Name ;

Q-41
	SELECT B.Name ,avg(Mark)
		FROM StudentMarks A inner join Students B 
		ON A.StudentID =B.StudentID 
		WHERE A.ExamID  = 2 AND B.Gender =2
		GROUP BY B.Name ;

Q-42

Q-43
	SELECT A.CityID ,A.Name
		FROM Cities A inner join Students B
		ON A.CityID = B.City 
		GROUP BY A.CityID,A.Name ;

Q-44
	SELECT B.Name ,A.Name 
		FROM Cities A inner join Students B
		ON A.CityID = B.City 
		WHERE A.Name NOT IN ('Kochin');

Q-45
	SELECT A.Name,COUNT(B.EnteredBy) 
		FROM UsersTable A INNER JOIN StudentMarks B 
		ON A.UserID = B.EnteredBy 
		GROUP BY A.Name ;

Q-46
	select B.Name,convert(int,(max(Mark) / C.MaxMark  * 100)) 
		FROM studentmarks A
		inner join Students B
		ON B.StudentID = A.StudentID 
		inner join ExamTable C
		ON A.ExamID =  C.ExamID 
		WHERE A.ExamID = 1
		GROUP by B.StudentID , C.MaxMark ;

Q-47
		SELECT 
		FROM Students A INNER JOIN StudentMarks B 
		ON A.StudentID = B.StudentID 
		INNER JOIN ExamTable C
		ON B.ExamID = C.ExamID 
		WHERE B.ExamID = '2'
		GROUP BY A.Name ,C.MaxMark 
		HAVING CONVERT(INT,MAX(MARK)/C.MaxMark * 100))<60;













