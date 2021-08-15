----------*********************** JOIN *********************-----------------------

/*
	LEFT OUTER JOIN SPOR MERKEZLER� VE EK�PMANLARI

	SELECT c.recordno,c.centername,eq.equipmentname,price FROM center c
		LEFT OUTER JOIN equipment eq ON c.recordno = eq.centerid
		ORDER BY c.recordno ASC,eq.equipmentname ASC

*/

	
/*
	RIGHT OUTER JOIN PERSONEL VE PERSONEL T�PLER�

	SELECT sf.staffname,sf.staffsurname,st.title FROM staff sf
		RIGHT OUTER JOIN stafftype st on st.recordno = sf.typeid
		ORDER BY sf.staffname asc,sf.staffsurname asc,st.title asc
*/


/*
	FULL OUTER JOIN D�YETLER VE D�YET DETAYLARI

	SELECT d.dietname,d.dietdestricption,dd.food FROM diet d
		FULL OUTER JOIN dietdetail dd on d.recordno = dd.dietid
		ORDER BY d.dietname asc,d.dietdestricption asc,dd.food asc
*/


----------*********************** VIEW *********************-----------------------

/*
	�yelerin diyet listesi

	SELECT * FROM memberdietlist
		ORDER BY membername asc,membersurname asc,dietname asc,activeday asc,activetime asc
*/
CREATE VIEW memberdietlist 
AS 
SELECT 
	m.membername,m.membersurname,d.dietname,d.dietdestricption
	,CASE 
		dd.activeday WHEN 1 THEN 'Monday' 
		WHEN 2 THEN 'Tuesday' 
		WHEN 3 THEN 'Wednesday' 
		WHEN 4 THEN 'Thursday' 
		WHEN 5 THEN 'Friday' 
		WHEN 6 THEN 'Saturday' 
		WHEN 7 THEN 'Sunday' 
	 END AS activeday
	,CASE 
		dd.activetime WHEN 1 THEN 'Morning'
		WHEN 2 THEN 'Noon'
		WHEN 3 THEN 'Evening'
	 END as activetime
	,dd.food
	FROM memberdiet md
	INNER JOIN diet d on d.recordno = md.dietid
	INNER JOIN member m on m.recordno = md.memberid
	INNER JOIN dietdetail dd on d.recordno = dd.dietid
GO


/*
	�yeler ve �demeleri

	SELECT * FROM memberpaymentlist
		ORDER BY membername asc,membersurname asc,recorddate asc,documentnumber asc
*/	
CREATE VIEW memberpaymentlist 
AS 
SELECT 
	m.membername,m.membersurname,mp.recorddate,mp.documentnumber
	,CASE mp.paymenttype WHEN 1 THEN 'Case' WHEN 2 THEN 'Bank' END AS paymenttype
	,CASE mp.processtype WHEN -1 THEN 'Debt' WHEN 1 THEN 'Payment' END AS processtype
	,mp.amount,mp.paymentdestricption
	FROM  memberpayment mp
	LEFT JOIN member m on mp.memberid = m.recordno
GO
	

/*
	�yelerin egzersiz g�n listesi

	SELECT * FROM memberexerciselist
		ORDER BY membername asc,membersurname asc,exgroupname asc,exdays asc,starttime asc
*/
CREATE VIEW memberexerciselist 
AS 
SELECT 
	m.membername,m.membersurname,eg.exgroupname,eg.exdays,eg.starttime,eg.endtime
	FROM memberexercise me
	INNER JOIN exercisegroup eg on me.exerciseid = eg.recordno
	INNER JOIN member m on m.recordno = me.memberid
GO


/*
	�yeler ve antren�rleri

	SELECT * FROM memberstafflist
		ORDER BY membername asc,membersurname asc,staffname asc,staffsurname asc
*/
CREATE VIEW memberstafflist 
AS 
SELECT 
	m.membername,m.membersurname,sf.staffname,sf.staffsurname
	FROM memberstaff ms
	INNER JOIN staff sf on ms.staffid = sf.recordno
	INNER JOIN member m on m.recordno = ms.memberid
GO
	

/*
	�yeler ve �l��mleri

	SELECT * FROM membermeasurelist
		ORDER BY membername asc,membersurname asc,measuredate asc
*/
CREATE VIEW membermeasurelist 
AS 
SELECT 
	m.membername,m.membersurname,mm.measuredate,membersize,memberweight,memberchest,memberwaist,memberleg
	FROM  membermeasure mm
	LEFT JOIN member m on mm.memberid = m.recordno
GO