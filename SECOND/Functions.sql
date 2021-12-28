
--Q-1
	Create Function dbo.fstudentwithhighestmathsmark()
		RETURNS int
		AS 
		BEGIN
		RETURN
			(
				select A.stm_studentID 
					from sms_studentMarks A 
					WHERE A.stm_examID ='1' and A.stm_mark 
					IN 
					(
						select max(A.stm_mark) 
						FROM sms_studentMarks A 
						where A.stm_examID =1
					)
				GROUP BY A.stm_studentID
			)
		END

	select dbo.fstudentwithhighestmathsmark() as StudentID

--Q-2
	Create Function dbo.fstudentwithlowestenglishmark()
		RETURNS int
		AS
		BEGIN
		RETURN
		(
			SELECT A.stm_studentID 
				FROM sms_studentMarks A
				WHERE A.stm_examID ='2' and A.stm_mark 
				IN
				(
					select min(A.stm_mark ) 
					FROM sms_studentMarks A 
					WHERE A.stm_examID ='2'
				)
			GROUP BY A.stm_studentID 
		)
		END

	select dbo.fstudentwithlowestenglishmark() as StudentID

--Q-3
	Create Function dbo.fstudentwithhighesttotalmark()
		returns table
		as 
		return
			(select top 1 C.std_studentid ,C.std_name ,C.std_address  ,C.std_city ,C.std_email ,C.std_dateofbirth ,C.std_gender ,C.std_regnNumber ,C.std_issuspended 
			from sms_examTable A
			inner join sms_studentMarks B
			on A.exm_examID  = B.stm_examID 
			inner join sms_students C
			on C.std_studentid =B.stm_studentID 
			group by C.std_studentid ,C.std_name ,C.std_address  ,C.std_city ,C.std_email ,C.std_dateofbirth ,C.std_gender ,C.std_regnNumber ,C.std_issuspended 
			order by sum(B.stm_mark) desc)

			select std_studentid ,std_name ,std_address  ,std_city ,std_email ,std_dateofbirth ,std_gender ,std_regnNumber ,std_issuspended 
			from dbo.fstudentwithhighesttotalmark()

--Q-4
	Create Function dbo.fstudentwithlowesttotalmark()
		returns table
		as 
		return
			(select top 1 C.std_studentid ,C.std_name ,C.std_address  ,C.std_city ,C.std_email ,C.std_dateofbirth ,C.std_gender ,C.std_regnNumber ,C.std_issuspended 
			from sms_examTable A
			inner join sms_studentMarks B
			on A.exm_examID  = B.stm_examID 
			inner join sms_students C
			on C.std_studentid =B.stm_studentID 
			group by C.std_studentid ,C.std_name ,C.std_address  ,C.std_city ,C.std_email ,C.std_dateofbirth ,C.std_gender ,C.std_regnNumber ,C.std_issuspended 
			order by sum(B.stm_mark) asc)

			select std_studentid ,std_name ,std_address  ,std_city ,std_email ,std_dateofbirth ,std_gender ,std_regnNumber ,std_issuspended 
			from dbo.fstudentwithlowesttotalmark()

--Q-5
	Create Function dbo.fstudentwithtotalmark()
	returns table
	as 
	return
	(
		select  std_name,sum(b.stm_mark ) AS [Total Marks]
			from sms_examTable A
			inner join sms_studentMarks B
			on A.exm_examID  = B.stm_examID 
			inner join sms_students C
			on C.std_studentid = B.stm_studentID 
			group by std_studentid ,std_name ,std_address  ,std_city ,std_email ,std_dateofbirth ,std_gender ,std_regnNumber ,std_issuspended 
	)

	select std_name ,[Total Marks] 
	from dbo.fstudentwithtotalmark()























