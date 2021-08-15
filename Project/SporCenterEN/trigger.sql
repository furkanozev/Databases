/*
	Diet silinmeden hemen önce üyelere bu diet atanmýþ ise onlarý sil
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
	Yeni üye eklendiðinde üyeye bonus ödemesi ekle
	INSERT INTO member(centerid,membername,membersurname) VALUES(1,'Necati','AKGÜN')	

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
			VALUES(@memberid,GETDATE(),'BONUS' + CAST(@memberid AS VARCHAR),1,1,10,'Yeni üye bonusu')
	END	
END
GO


/*
	Ödeme eklendiði zaman üyenin tablosunda bakiyesini güncelle
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
	Diet hareketi eklerken gün geçerli bir gün mü kontrol et

	Hatalý 8. gün yok
	INSERT INTO dietdetail(dietid,activeday,activetime,food) VALUES (1,8,1,'TEST') 

	Baþarýlý
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
	Üye silinmeden hemen önce üyelere diet atanmýþ ise onlarý sil
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


