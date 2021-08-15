/*
	Diet silinmeden hemen �nce �yelere bu diet atanm�� ise onlar� sil
	DELETE FROM diet where recordno=3
*/
CREATE TRIGGER trgDietDeleteToMemberDiet ON diet
INSTEAD OF DELETE
AS
BEGIN	
	set nocount on
	IF EXISTS(SELECT recordno FROM deleted)
	BEGIN
		DELETE FROM memberdiet WHERE dietid IN(SELECT recordno FROM deleted)
		DELETE FROM dietdetail WHERE dietid IN(SELECT recordno FROM deleted)
	END
	DELETE FROM diet WHERE recordno IN(SELECT recordno FROM deleted)
	set nocount off
END
GO


/*
	Yeni �ye eklendi�inde �yeye bonus �demesi ekle
	INSERT INTO member(centerid,membername,membersurname) VALUES(1,'Necati','AKG�N')	

	SELECT * FROM member
	SELECT * FROM memberpaymentlist
*/
CREATE TRIGGER trgNewMemberBonusAdd ON member
AFTER INSERT
AS
BEGIN
	DECLARE @memberid int
	if EXISTS(select * from inserted)
	BEGIN
		SET @memberid = (SELECT recordno FROM inserted)
		INSERT INTO memberpayment(memberid,recorddate,documentnumber,paymenttype,processtype,amount,paymentdestricption)
			VALUES(@memberid,GETDATE(),'BONUS' + CAST(@memberid AS VARCHAR),1,1,10,'Yeni �ye bonusu')
	END	
END
GO


/*
	�deme eklendi�i zaman �yenin tablosunda bakiyesini g�ncelle
	UPDATE memberpayment SET amount=100 WHERE recordno=1

	SELECT * FROM member 
*/
CREATE TRIGGER trgMemberBalanceUpdate ON memberpayment
AFTER INSERT,UPDATE,DELETE
AS
BEGIN
	DECLARE @memberid int
	if EXISTS(select * from inserted)
	BEGIN
		SET @memberid = (SELECT memberid FROM inserted)
	END
	else if EXISTS(select * from deleted)
	BEGIN
		SET @memberid = (SELECT memberid FROM deleted)
	END

	if @memberid IS NOT NULL
		UPDATE member SET balance=(SELECT SUM(processtype * amount) FROM memberpayment where memberid=@memberid) where recordno=@memberid	
END
GO


/*
	Diet hareketi eklerken g�n ge�erli bir g�n m� kontrol et

	Hatal� 8. g�n yok
	INSERT INTO dietdetail(dietid,activeday,activetime,food) VALUES (1,8,1,'TEST') 

	Ba�ar�l�
	INSERT INTO dietdetail(dietid,activeday,activetime,food) VALUES (1,2,1,'TEST2') 	
*/
CREATE TRIGGER trgDietDetailDayControl ON dietdetail
INSTEAD OF INSERT
AS
BEGIN
	DECLARE @dietday int
	SET @dietday = COALESCE((SELECT activeday FROM inserted),0)
	if (@dietday < 1) OR (@dietday > 7)
	BEGIN
		RAISERROR('Activeday must be a valid value!',1,1)		
	END
	ELSE
	BEGIN
		INSERT INTO dietdetail(dietid,activeday,activetime,food) SELECT dietid,activeday,activetime,food FROM inserted
	END
END
GO


/*
	�ye silinmeden hemen �nce �yelere diet atanm�� ise onlar� sil
	DELETE FROM member where recordno=9
*/
CREATE TRIGGER trgMemberDeleteToMemberDiet ON member
INSTEAD OF DELETE
AS
BEGIN
	set nocount on
	IF EXISTS(SELECT recordno FROM deleted)
	BEGIN
		DELETE FROM memberdiet WHERE memberid IN(SELECT recordno FROM deleted)
		DELETE FROM memberpayment WHERE memberid IN(SELECT recordno FROM deleted)
	END
	DELETE FROM member WHERE recordno IN(SELECT recordno FROM deleted)
	set nocount off
END
GO


