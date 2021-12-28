
--Q-1
	CREATE PROCEDURE prcStudentDetailsSelect
		AS
		SELECT std_studentid,std_name,std_address,std_city,std_email,std_dateofbirth,std_regnNumber,std_gender ,std_issuspended
		From sms_students; 
			
	EXEC prcStudentDetailsSelect 

--Q-2
	CREATE PROCEDURE prcStudentDetailsByStudentIDSelect @STDID INT
	AS
	SELECT std_studentid,std_name,std_address,std_city,std_email,std_dateofbirth,std_regnNumber,std_gender ,std_issuspended
		FROM sms_students A
		WHERE A.std_studentid = @STDID 

	EXEC prcStudentDetailsByStudentIDSelect 4

--Q-3
	CREATE PROCEDURE prcStudentMarkDeatilsByStudentISSelect @STDID INT
	AS
		SELECT A.std_name ,C.exm_name ,B.stm_mark  
			FROM sms_students A INNER JOIN sms_studentMarks B 
			ON A.std_studentid  =B.stm_studentID  
			INNER JOIN sms_examTable  C 
			ON B.stm_examID  =C.exm_examID  
			WHERE A.std_studentid = @STDID 
			ORDER BY C.exm_examID 

	EXEC prcStudentMarkDeatilsByStudentISSelect 1

--Q-4
		CREATE PROCEDURE prcStudentMathesMarkByStudentIdSelect @stdid int
	AS
		SELECT A.std_name ,C.exm_name ,B.stm_mark  
			FROM sms_students A INNER JOIN sms_studentMarks B 
			ON A.std_studentid  =B.stm_studentID  
			INNER JOIN sms_examTable  C 
			ON B.stm_examID  =C.exm_examID  
			WHERE c.exm_name like 'Maths' AND B.stm_mark >@stdid
			 
		EXEC prcStudentMathesMarkByStudentIdSelect 35

--Q-5
	CREATE PROC prcExamTableInsertion @id int,@name varchar(100),@maxmark decimal(5,2),
		@minmark decimal(5,2),@examshedule datetime,@duration decimal(5,2)
		AS
		INSERT INTO sms_examTable VALUES (@id,@name,@maxmark,@minmark,@examshedule,@duration)

	EXEC prcExamTableInsertion 5,'Economics',100,40,'2012-10-14 10:00',90
	EXEC prcExamTableInsertion 6,'Politics',75,35,'2012-10-15 10:00',120
	EXEC prcExamTableInsertion 7,'Asp.net',100,40,'2012-10-16 14:00',90
	EXEC prcExamTableInsertion 8,'C#',75,35,'2012-10-17 14:00',120

--Q-6
	CREATE PROC prcExamTableUpdation @id int,@name varchar(100),@maxmark decimal(5,2),
		@minmark decimal(5,2),@examshedule datetime,@duration decimal(5,2)
		AS
		UPDATE sms_examTable  SET exm_examID  = @id,exm_name = @name,exm_maxmark = @maxmark,
		exm_minMarkReqdForPass  = @minmark ,exm_examScheduledTime  = @examshedule ,
		exm_duration = @duration 
		WHERE exm_examid = @id

	EXEC prcExamTableUpdation 5,'Economics',100,50,'2012-10-14 10:00',90
	EXEC prcExamTableUpdation 6,'Politics',100,50,'2012-10-15 10:00',120
	EXEC prcExamTableUpdation 7,'Asp.net',75,40,'2012-10-16 14:00',90
	EXEC prcExamTableUpdation 8,'C#',75,40,'2012-10-17 14:00',120
	
--Q-7
	CREATE PROC StudentMarksTableDeletion @Stmid int ,@exmid int
		AS
		DELETE FROM sms_studentMarks  WHERE stm_studentID =@Stmid  and stm_examID =@exmid 

	EXEC StudentMarksTableDeletion 3,3 

--Q-8
	CREATE PROC prcMarksheetByStudentId @id int
		AS
		select A.std_studentid,A.std_name ,A.std_regnNumber,C.exm_name,B.stm_mark ,
		Case When B.stm_mark  >C.exm_minMarkReqdForPass 
		Then 'Pass' Else 'Fail'  
		End as Result
			from sms_students A
			inner join sms_studentMarks B
			on A.std_studentid =B.stm_studentID 
			inner join sms_examTable C
			on B.stm_examID  = C.exm_examID 
			where A.std_studentid =@id

	EXEC prcMarksheetByStudentId 1

--Q-9
	CREATE PROC prcMathsPassStudenListSelect
		AS
		SELECT A.std_name 
			FROM sms_students A
			INNER JOIN sms_studentMarks B
			ON A.std_studentid  = B.stm_studentID 
			INNER JOIN sms_examTable  C
			ON C.exm_examID  = B.stm_examID 
			WHERE C.exm_name = 'Maths' AND B.stm_mark  >= C.exm_minMarkReqdForPass 

	 EXEC prcMathsPassStudenListSelect

--Q-10
	 CREATE PROC	prcStudentPassListSelect
		AS
		SELECT A.std_name,count(A.std_name)
			FROM sms_students  A
			INNER JOIN sms_studentMarks  B
			ON A.std_studentid  = B.stm_studentID	
			INNER JOIN sms_examTable  C
			ON C.exm_examID =B.stm_examID 
			WHERE B.stm_mark  >= C.exm_minMarkReqdForPass  
			GROUP BY A.std_name 
			HAVING count(A.std_name) > 4

	EXEC prcStudentPassListSelect

--Q-11
	CREATE PROC prcStudentFailInOneSubjectListSelect
		AS
		SELECT A.std_name 
			FROM sms_students A
			INNER JOIN sms_studentMarks B
			ON A.std_studentid  = B.stm_studentID 
			INNER JOIN sms_examTable C
			ON C.exm_examID  = B.stm_examID 
			WHERE B.stm_mark  < C.exm_minMarkReqdForPass 
			GROUP BY A.std_name 
			HAVING count(A.std_name ) = 1

	EXEC prcStudentFailInOneSubjectListSelect

--Q-12
	CREATE PROC prcShowStudentAttendeByExamIdSelect @id int
		AS
		SELECT a.std_name 
			FROM sms_students A
			INNER JOIN sms_studentMarks B
			ON A.std_studentid  = B.stm_studentID 
			INNER JOIN sms_examTable C
			ON C.exm_examID  = B.stm_examID 
			WHERE C.exm_examID  = @id

	EXEC prcShowStudentAttendeByExamIdSelect 1

--Q-13
	CREATE PROC prcGetMatchingEmailId @pattern varchar(30)
		AS
		SELECT A.std_name 
			from sms_students A 
			WHERE A.std_email  LIKE '%'+@pattern+'%'

	EXEC prcGetMatchingEmailId gmail

--Q-14
	CREATE PROC prcGetNonMatchingName @pattern varchar(30)
		AS
		SELECT A.std_name  
		from sms_students A 
		WHERE A.std_name   NOT LIKE '%'+@pattern+'%'

	EXEC prcGetNonMatchingName rin

--Q-15
	CREATE PROC prcGetAvgMarkByStudentId @id int		
		AS
		SELECT B.std_name ,(sum(A.stm_mark )/sum(C.exm_maxMark))*100 as [Average Mark] 
			From sms_studentMarks A
			INNER JOIN sms_students  B
			ON A.stm_studentID  = B.std_studentid 
			INNER JOIN sms_examTable C
			ON A.stm_examID  =C.exm_examID 
			WHERE B.std_studentid  = @id
			GROUP BY B.std_name 

	EXEC prcGetAvgMarkByStudentId 3










