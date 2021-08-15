/*
	Ekipman ekleme procedure ve transaction

	Baþarýlý 
		EXEC procEquipmentAdd 1,'TESTCODE','TESTNAME',22
	Hatalý olmayan merkeze ekipman ekleme
		EXEC procEquipmentAdd 199,'TESTCODE','TESTNAME',22	
*/
CREATE PROCEDURE procEquipmentAdd
(
	 @centerid int
	,@equipmentcode varchar(10)
	,@equipmentname varchar(100)
	,@price decimal(28,8)
)
AS
BEGIN
	BEGIN TRANSACTION
	BEGIN TRY
		INSERT INTO equipment(centerid,equipmentcode,equipmentname,price) VALUES(@centerid,@equipmentcode,@equipmentname,@price)
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
	  IF (@@TRANCOUNT > 0)
	   BEGIN
		  ROLLBACK TRANSACTION 
		  PRINT 'EquipmentAdd Error'
	   END 
		SELECT
			ERROR_NUMBER() AS ErrorNumber,
			ERROR_SEVERITY() AS ErrorSeverity,
			ERROR_STATE() AS ErrorState,
			ERROR_PROCEDURE() AS ErrorProcedure,
			ERROR_LINE() AS ErrorLine,
			ERROR_MESSAGE() AS ErrorMessage
	END CATCH
END
GO

/*
	Üye silme procedure ve transaction

	Baþarýlý 
		EXEC procMemberDelete 999
	Hatalý hareketi olam üye silme
		EXEC procMemberDelete 3
*/
CREATE PROCEDURE procMemberDelete
(
	 @memberid int
)
AS
BEGIN
	BEGIN TRANSACTION
	BEGIN TRY
		DELETE FROM member WHERE recordno=@memberid		
		SELECT '' AS ErrorMessage
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
	  IF (@@TRANCOUNT > 0)
	   BEGIN
		  ROLLBACK TRANSACTION 
		  PRINT 'MemberDelete Error'
	   END 
		SELECT
			ERROR_NUMBER() AS ErrorNumber,
			ERROR_SEVERITY() AS ErrorSeverity,
			ERROR_STATE() AS ErrorState,
			ERROR_PROCEDURE() AS ErrorProcedure,
			ERROR_LINE() AS ErrorLine,
			ERROR_MESSAGE() AS ErrorMessage
	END CATCH
END
GO

/*
	Spor merkezlerine ait kullanýcý sayýlarýný güncelle

	EXEC procCenterMemberCountFind
	SELECT membercount,* FROM center
*/
CREATE PROCEDURE procCenterMemberCountFind
AS
BEGIN
	BEGIN TRANSACTION
	BEGIN TRY
		UPDATE center set membercount=COALESCE((SELECT COUNT(recordno) FROM member WHERE centerid=center.recordno),0) 
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
	  IF (@@TRANCOUNT > 0)
	   BEGIN
		  ROLLBACK TRANSACTION 
		  PRINT 'MemberCountFind Error'
	   END 
		SELECT
			ERROR_NUMBER() AS ErrorNumber,
			ERROR_SEVERITY() AS ErrorSeverity,
			ERROR_STATE() AS ErrorState,
			ERROR_PROCEDURE() AS ErrorProcedure,
			ERROR_LINE() AS ErrorLine,
			ERROR_MESSAGE() AS ErrorMessage
	END CATCH
END
GO