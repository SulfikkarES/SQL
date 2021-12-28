
--Q-1
	CREATE TABLE sms_students 
		(std_studentid int primary key,
		std_name varchar(100),
		std_address varchar(500),
		std_city int,
		std_email varchar(100),
		std_dateofbirth date, 
		std_regnNumber char(10) UNIQUE, 
		std_gender int, 
		std_issuspended int); 



--Q-2
INSERT INTO sms_students   VALUES (1,'John','31st street, opp fax home, ludwin',1,'john@gmail.com','1976-07-17','194300',1,0);
INSERT INTO sms_students   VALUES (2,'Abraham','sanfracis ok mall','1','abraham@hotmail.com','1978-08-18','959595', 1,0);
INSERT INTO sms_students   VALUES (3,'Lucy energy','tech, lal mal','2','luchy@gmail.com','1980-07-20',474848,2,0); 
INSERT INTO sms_students   VALUES (4,'Manesh','106, opp mail office', '2','manesh@yahoo.com', '1980-07-20','595959',1,0); 
INSERT INTO sms_students   VALUES (5,'Jerin','Thoundaserry, mathilakam','3','jerin@gmail.com','1976-07-17','4844884',1,1);


--Q-3
	CREATE TABLE sms_examTable (exm_examID int primary key,
		exm_name varchar(100),
		exm_maxMark Decimal(5,2),
		exm_minMarkReqdForPass decimal(5,2),
		exm_examScheduledTime datetime,
		exm_Duration decimal(5,2)); 

--Q-4
INSERT INTO sms_examTable  VALUES (1,'Maths', 100, 40, '2012-10-10 10:00', '90.00'); 
INSERT INTO sms_examTable  VALUES (2 ,'English',75,35,'2012-10-11 10:00','120.00');
INSERT INTO sms_examTable  VALUES (3 ,'C++ ',100 ,40 ,'2012-10-12 14:00 ','90.00'); 
INSERT INTO sms_examTable  VALUES(4,'VB',75,35,'2012-10-13 14:00','120.00');

--Q-5
	CREATE TABLE sms_studentMarks (stm_studentID int FOREIGN KEY REFERENCES sms_students(std_studentid),
		stm_examID int FOREIGN KEY REFERENCES sms_examTable(exm_examID),
		stm_mark decimal(5,2),
		stm_enteredBy int,
		stm_enteredTIME Datetime);

--Q-6
INSERT INTO sms_studentMarks  VALUES(1,1,'80',1,current_timestamp);
INSERT INTO sms_studentMarks VALUES(2 ,1, '90', 1,current_timestamp);
INSERT INTO sms_studentMarks  VALUES(3, 1,' 40', 1,current_timestamp);  
INSERT INTO sms_studentMarks  VALUES(4, 1,' 35', 1,current_timestamp);  
INSERT INTO sms_studentMarks  VALUES(5, 1, '85', 1,current_timestamp);  
INSERT INTO sms_studentMarks  VALUES(1, 2,' 70', 1,current_timestamp);  
INSERT INTO sms_studentMarks  VALUES(2, 2,' 60', 1,current_timestamp); 
INSERT INTO sms_studentMarks  VALUES(3, 2,' 17', 1,current_timestamp);
INSERT INTO sms_studentMarks  VALUES(4 ,2 ,'45', 1,current_timestamp);
INSERT INTO sms_studentMarks  VALUES(5, 2, '20',1,current_timestamp);
INSERT INTO sms_studentMarks  VALUES(1, 3, '95', 1,current_timestamp);  
INSERT INTO sms_studentMarks  VALUES(2 ,3, '90', 1,current_timestamp);  
INSERT INTO sms_studentMarks  VALUES(3, 3, '30', 1,current_timestamp);
INSERT INTO sms_studentMarks  VALUES(4, 3 ,'35 ',2,current_timestamp);
INSERT INTO sms_studentMarks  VALUES(1, 4, '60', 2,current_timestamp);

--Q-7
	CREATE TABLE sms_userstable (ust_userID int,
		ust_userName varchar(15),
		ust_password varchar(50),
		ust_name varchar(100));

--Q-8
INSERT INTO sms_usersTable  VALUES (1,'admin','prob#$124', 'Administrator');
INSERT INTO sms_usersTable  VALUES(2,' mark',' lopus123',' Mark Antony');
INSERT INTO sms_usersTable  VALUES(3, 'smith','qerty5432',' Smith John');

--Q-9
	CREATE TABLE sms_cities(cty_cty_cityID int,
	cty_name varchar(100));

--Q-10
	INSERT INTO sms_cities  VALUES (1,'Kochin'); 
	INSERT INTO sms_cities  VALUES (2,'Calicut');
	INSERT INTO sms_cities  VALUES (3,'Trivandrum');

--Q-11
	SELECT std_studentid as number,std_name as name,std_address as address,std_city as city,std_email as email,std_dateofbirth as dateofbirth,std_regnNumber as reg_number,std_gender as gender ,std_issuspended as issuspended 
		FROM sms_students; 

--Q-12
	SELECT exm_examID as number,exm_name as exam ,exm_maxMark as mark ,exm_minMarkReqdForPass as minimum_mark,exm_examScheduledTime as date_and_time,exm_Duration as duration
		FROM sms_examTable; 

--Q-13
	SELECT stm_studentID as studentID ,stm_examID as examID,stm_mark as mark ,stm_enteredBy as enteredBy ,stm_enteredTIME as entered_time 
		FROM sms_studentMarks ;

--Q-14
	SELECT ust_userID as user_id,ust_userName as user_name ,ust_password as password,ust_name as name 
		FROM sms_usersTable ;

--Q-15
	SELECT cty_cty_cityID as city_id ,cty_name as city 
		FROM sms_cities ;

--Q-16
	SELECT std_studentid as student_id,std_name as name,std_address as address,std_city as city,std_email as email,std_dateofbirth as date_of_birth,std_regnNumber as reg_no,std_gender as gender,std_issuspended as issuspended 
		FROM sms_students  
		WHERE std_name  LIKE 'J%';

--Q-17
	SELECT std_studentid as id,std_name as name,std_address as address,std_city as city,std_email as email,std_dateofbirth as date_of_birth,std_regnNumber as reg_no,std_gender as gender,std_issuspended  as is_suspended
		FROM sms_students  
		WHERE std_name  LIKE '%J';

--Q-18
	SELECT std_studentid as student_id,std_name as name,std_address as address,std_city as city,std_email as email,std_dateofbirth as date_of_birth,std_regnNumber as reg_number,std_gender as gender,std_issuspended as is_suspended 
		FROM sms_students  
		WHERE std_email   LIKE '%@gmail%';

--Q-19
	SELECT A.std_name as name,B.cty_name as city 
		FROM sms_students  A INNER JOIN sms_cities  B
		ON A.std_city  = B.cty_cty_cityID  ; 

--Q-20
	SELECT ust_userID as id,ust_userName as user_namename,ust_password as password,ust_name as name
		FROM sms_usersTable   
		WHERE ust_name  LIKE '%John%';

--Q-21
	SELECT std_name as name ,datediff(year,std_dateofbirth ,getdate()) as age
		FROM sms_students  
		WHERE datediff(year,std_dateofbirth ,getdate())>33;

--Q-22
	SELECT std_studentid as student_id,std_name as name,std_address as address,std_city as city,std_email as email,std_dateofbirth as date_of_birth,std_regnNumber as reg_number,std_gender as gender,std_issuspended as is_suspended
		FROM sms_students  
		WHERE std_gender  = 1;

--Q-23
	SELECT ABS((SELECT COUNT(std_gender)
	FROM sms_students  
		WHERE std_gender = 1));

--Q-24
	SELECT std_studentid as student_id,std_name as name,std_address as address,std_city as city,std_email as email,std_dateofbirth as date_of_birth,std_regnNumber as reg_number,std_gender as gender,std_issuspended as is_suspended 
		FROM sms_students  
		WHERE YEAR(std_dateofbirth )=1976;

--Q-25
	SELECT std_name as name,std_dateofbirth as date_of_birth
		FROM sms_students  
		WHERE std_dateofbirth  in(SELECT std_dateofbirth  
			FROM sms_students  
			GROUP BY std_dateofbirth 
			HAVING COUNT(std_dateofbirth ) > 1)
			ORDER BY std_dateofbirth ;

--Q-26
	SELECT std_studentid as student_id,std_name as name,std_address as address,std_city as city,std_email as email,std_dateofbirth as date_of_birth,std_regnNumber as reg_number,std_gender as gender,std_issuspended as is_suspended
		FROM sms_students 
		WHERE std_issuspended =1;

--Q-27
	SELECT A.std_name as name,C.exm_name as exam_name,B.stm_mark as mark 
		FROM sms_students A INNER JOIN sms_studentMarks B 
		ON A.std_studentid  =B.stm_studentID  
		INNER JOIN sms_examTable  C 
		ON B.stm_examID  =C.exm_examID  
		WHERE C.exm_name = 'MATHS';

--Q-28
	SELECT A.std_name as name,C.exm_name as exam_name,B.stm_mark as mark  
		FROM sms_students A INNER JOIN sms_studentMarks B 
		ON A.std_studentid  =B.stm_studentID  
		INNER JOIN sms_examTable  C 
		ON B.stm_examID  =C.exm_examID  
		WHERE C.exm_name ='ENGLISH' AND B.stm_mark  < 50;

--Q-29
	SELECT A.std_name as name,C.exm_name as exam_name,B.stm_mark  as mark
		FROM sms_students A INNER JOIN sms_studentMarks B 
		ON A.std_studentid  =B.stm_studentID  
		INNER JOIN sms_examTable  C 
		ON B.stm_examID  =C.exm_examID  
		WHERE C.exm_name = 'C++' AND B.stm_mark  <35 ;

--Q-30
	SELECT A.std_name as name,C.exm_name as exam,B.stm_mark as mark  
		FROM sms_students A INNER JOIN sms_studentMarks B 
		ON A.std_studentid  =B.stm_studentID  
		INNER JOIN sms_examTable  C 
		ON B.stm_examID  =C.exm_examID  
		WHERE C.exm_name = 'VB' AND B.stm_mark  > 35 ;

--Q-31
	SELECT A.std_name as name,C.exm_name as exam_name,B.stm_mark  as mark
		FROM sms_students A INNER JOIN sms_studentMarks B 
		ON A.std_studentid  =B.stm_studentID  
		INNER JOIN sms_examTable  C 
		ON B.stm_examID  =C.exm_examID  
		WHERE C.exm_name  IN ('English','Maths') AND B.stm_mark  > 35;

--Q-32
	SELECT A.std_name as name,C.exm_name as exam_name,B.stm_mark as mark  
		FROM sms_students A INNER JOIN sms_studentMarks B 
		ON A.std_studentid  =B.stm_studentID  
		INNER JOIN sms_examTable  C 
		ON B.stm_examID  =C.exm_examID  
		WHERE C.exm_name IN ('C++','VB') AND B.stm_mark < 35;

--Q-33
	SELECT A.std_name as name,C.exm_name as exam_name ,B.stm_mark  as mark
		FROM sms_students A INNER JOIN sms_studentMarks B 
		ON A.std_studentid  =B.stm_studentID  
		INNER JOIN sms_examTable  C 
		ON B.stm_examID  =C.exm_examID  
		WHERE C.exm_name IN ('English','Maths','C++','VB') AND B.stm_mark > 35;

--Q-34
	SELECT A.std_name as name,C.exm_name as exam,B.stm_mark as mark  
		FROM sms_students A INNER JOIN sms_studentMarks B 
		ON A.std_studentid  =B.stm_studentID  
		INNER JOIN sms_examTable  C 
		ON B.stm_examID  =C.exm_examID  
		WHERE C.exm_name IN ('English','Maths','C++','VB') AND B.stm_mark < 35;

--Q-35
	SELECT C.exm_name as exam ,COUNT(B.stm_examID) as count
		FROM sms_students A INNER JOIN sms_studentMarks B
		ON A.std_studentid =B.stm_studentID 
		INNER JOIN sms_examTable C
		ON C.exm_examID = B.stm_examID 
		GROUP BY C.exm_name ;

--Q-36
	SELECT A.std_name as  name
		FROM sms_students A INNER JOIN sms_studentMarks B
		ON A.std_studentid =B.stm_studentID 
		GROUP BY A.std_name 
		HAVING COUNT(B.stm_examID) = count(a.std_studentid) ; 

--Q-37
		SELECT A.std_name  as name 
		FROM sms_students A INNER JOIN sms_studentMarks B
		ON A.std_studentid =B.stm_studentID 
		join sms_examTable c
		on c.exm_examid =B.stm_examID  
		GROUP BY A.std_name 
		HAVING COUNT(C.exm_examid)<>4;

--Q-38
	SELECT B.std_name as name,sum(stm_mark) as sum
		FROM sms_studentMarks A inner join sms_students B 
		ON A.stm_studentID  =B.std_studentid  
		GROUP BY B.std_name ;

--Q-39
	SELECT B.std_name as name ,avg(stm_mark) as average
		FROM sms_studentMarks A inner join sms_students B 
		ON A.stm_studentID = B.std_studentid  
		join sms_examTable c
		on c.exm_examid =a.stm_examID 
		WHERE c.exm_name   ='C++'
		GROUP BY B.std_name  ;

--Q-40
	SELECT B.std_name as name ,avg(stm_mark ) as average
		FROM sms_studentMarks A inner join sms_students  B 
		ON A.stm_studentID  =B.std_studentid  
		join sms_examTable c
		on c.exm_examid =a.stm_examID 
		WHERE c.exm_name   ='Maths'  AND B.std_gender  =1
		GROUP BY B.std_name ;

--Q-41
	SELECT B.std_name ,avg(stm_mark ) as average
		FROM sms_studentMarks  A inner join sms_students  B 
		ON A.stm_studentID =B.std_studentid  
		join sms_examTable c
		on c.exm_examid =a.stm_examID 
		WHERE c.exm_name   ='English'  AND B.std_gender  =2
		GROUP BY B.std_name  ;

--Q-42
	SELECT DISTINCT A.exm_name as exam_name
		FROM sms_examTable A
		INNER JOIN  sms_studentMarks B
		ON A.exm_examID = B.stm_examID 
		INNER JOIN sms_students C 
		ON C.std_studentid =  B.stm_studentID 
		GROUP BY A.exm_name 
		HAVING COUNT(B.stm_examID) = 5

--Q-43
	SELECT A.cty_cty_cityID as id ,A.cty_name as city
		FROM sms_cities  A inner join sms_students  B
		ON A.cty_cty_cityID  = B.std_city  
		GROUP BY A.cty_cty_cityID ,A.cty_name  ;

--Q-44
	SELECT B.std_name as name,A.cty_name as city  
		FROM sms_cities A inner join sms_students B
		ON A.cty_cty_cityID  = B.std_city  
		WHERE A.cty_name NOT IN ('Kochin');

--Q-45
	SELECT A.ust_name as name,COUNT(B.stm_enteredBy) as count 
		FROM sms_usersTable A INNER JOIN sms_studentMarks  B 
		ON A.ust_userID  = B.stm_enteredBy  
		GROUP BY A.ust_name  ;

--Q-46
	select B.std_name as name,convert(int,(max(stm_mark) / C.exm_maxMark * 100)) as percentage
		FROM sms_studentMarks  A 
		inner join sms_students  B
		ON B.std_studentid  = A.stm_studentID  
		join sms_examTable C
		ON A.stm_examID =  C.exm_examID  
		WHERE C.exm_name  = 'Maths'
		GROUP by B.std_studentid  , C.exm_maxMark  ;


--Q-47
		SELECT std_name as name,CONVERT(INT, (MAX(stm_mark ) / C.exm_maxMark * 100)) as percentage
		FROM sms_students A INNER JOIN sms_studentMarks B 
		ON A.std_studentid = B.stm_studentID  
		INNER JOIN sms_examTable  C
		ON B.stm_examID = C.exm_examID  
		WHERE B.stm_examID  = 2
		GROUP BY A.std_name  ,C.exm_maxMark  
		HAVING CONVERT(INT, (MAX(stm_mark ) / C.exm_maxMark * 100))<60;

--Q-48
	SELECT B.std_name AS name ,SUM(stm_mark) AS total_mark
		FROM sms_studentMarks A 
		INNER JOIN sms_students B 
		ON B.std_studentid =A.stm_studentID 
		GROUP BY B.std_name;

--Q-49
	SELECT q1.std_name AS name, q1.stm_mark AS english_mark, q2.stm_mark AS maths_mark, 
	ABS(q1.stm_mark - q2.stm_mark) AS mark_difference
		FROM 
		(
			SELECT std_name, stm_mark
				FROM sms_students A 
				JOIN sms_studentMarks B
				ON A.std_studentid  = B.stm_studentID 
				JOIN sms_examTable c 
				ON c.exm_examID  = b.stm_examID 
				WHERE exm_name = 'English'
		) AS q1
			JOIN
			(
				SELECT std_name, stm_mark
				FROM sms_students S 
				JOIN sms_studentMarks M 
				ON S.std_studentid = M.stm_studentID 
				JOIN sms_examTable E
				ON M.stm_examID  = E.exm_examID 
				WHERE exm_name = 'Maths'
			) AS q2
	ON q1.std_name = q2.std_name

--Q-50
	SELECT A.ust_userName as username , D.std_name AS name,C.exm_name as exam ,B.stm_mark as mark,A.ust_name as name ,B.stm_enteredTIME as entered_time
		FROM sms_userstable  A JOIN sms_studentMarks B
		ON A.ust_userID = B.stm_enteredBy 
		INNER JOIN sms_examTable C
		ON B.stm_examID  = C.exm_examID 
		INNER JOIN sms_students D
		ON D.std_studentid = B.stm_studentID 
		--WHERE A.ust_userName  ='mark';





