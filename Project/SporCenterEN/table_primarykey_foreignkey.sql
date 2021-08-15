CREATE TABLE userlogin(
	 recordno int IDENTITY(1,1) not null 
	,username varchar(100) not null 
	,userpass varchar(100)		
 CONSTRAINT PK_userlogin PRIMARY KEY CLUSTERED 
(
	recordno
))
GO
CREATE TABLE center( -- spor merkezleri
	 recordno int IDENTITY(1,1) not null 
	,centername varchar(100) not null
	,phone varchar(15)
	,website varchar(100)
	,mail varchar(100)
	,postacode varchar(5)
	,taxnumber varchar(10) -- vergi no
	,centeraddress varchar(500)
	,centerdestricption varchar(500)
	,membercount int -- transaction için	
 CONSTRAINT PK_center PRIMARY KEY CLUSTERED 
(
	recordno
))
GO
CREATE TABLE equipment( -- ekipmanlar
	 recordno int IDENTITY(1,1) not null 
	,centerid int
	,equipmentcode varchar(10) not null
	,equipmentname varchar(100) not null
	,price decimal(28,8)
 CONSTRAINT PK_equipment PRIMARY KEY CLUSTERED 
(
	recordno
)) 
ALTER TABLE equipment WITH NOCHECK ADD CONSTRAINT fkequipment_center FOREIGN KEY(centerid) REFERENCES center(recordno)
ALTER TABLE equipment CHECK CONSTRAINT fkequipment_center
GO
CREATE TABLE member( -- üyeler
	 recordno int IDENTITY(1,1) not null 
	,centerid int
	,membername varchar(50) not null
	,membersurname varchar(50) not null
	,idnumber varchar(11) -- TC
	,phone varchar(15)
	,gender varchar(1)
	,recorddate smalldatetime
	,birthdate smalldatetime
	,memberaddress varchar(500)
	,memberdestricption varchar(500)
	,balance decimal(28,8) -- bakiye trigger için
 CONSTRAINT PK_member PRIMARY KEY CLUSTERED 
(
	recordno
))
ALTER TABLE member WITH NOCHECK ADD CONSTRAINT fkmember_center FOREIGN KEY(centerid) REFERENCES center(recordno)
ALTER TABLE member CHECK CONSTRAINT fkmember_center
GO
CREATE TABLE stafftype( -- personel tipleri
	 recordno int IDENTITY(1,1) not null 
	,professioncode varchar(10) not null -- meslek kodu
	,title varchar(50) not null -- ünvan
 CONSTRAINT PK_stafftype PRIMARY KEY CLUSTERED 
(
	recordno
))
GO
CREATE TABLE staff( -- personel
	 recordno int IDENTITY(1,1) not null 
	,centerid int
	,typeid int
	,staffname varchar(50) not null
	,staffsurname varchar(50) not null
	,idnumber varchar(11) -- TC
	,phone varchar(15)
	,gender varchar(1)
	,recorddate smalldatetime
	,birthdate smalldatetime
	,salart decimal(28,8) -- maaþ
	,staffaddress varchar(500)
	,staffdestricption varchar(500)
 CONSTRAINT PK_staff PRIMARY KEY CLUSTERED 
(
	recordno
))
ALTER TABLE staff WITH NOCHECK ADD CONSTRAINT fkstaff_center FOREIGN KEY(centerid) REFERENCES center(recordno)
ALTER TABLE staff CHECK CONSTRAINT fkstaff_center
ALTER TABLE staff WITH NOCHECK ADD CONSTRAINT fkstaff_stafftype FOREIGN KEY(typeid) REFERENCES stafftype(recordno)
ALTER TABLE staff CHECK CONSTRAINT fkstaff_stafftype
GO
CREATE TABLE diet( -- diyet
	 recordno int IDENTITY(1,1) not null 	
	,dietname varchar(50) not null
	,dietdestricption varchar(500)
 CONSTRAINT PK_diet PRIMARY KEY CLUSTERED 
(
	recordno
))
GO
CREATE TABLE dietdetail( -- diyet günleri detay-yemek
	 recordno int IDENTITY(1,1) not null 	
	,dietid int
	,activeday smallint not null -- hangi gün 1..7
	,activetime smallint not null -- hangi zaman 1..3 sabah,öðle,akþam
	,food varchar(500)
 CONSTRAINT PK_dietdetail PRIMARY KEY CLUSTERED 
(
	recordno
))
ALTER TABLE dietdetail WITH NOCHECK ADD CONSTRAINT fkdietdetail_diet FOREIGN KEY(dietid) REFERENCES diet(recordno)
ALTER TABLE dietdetail CHECK CONSTRAINT fkdietdetail_diet
GO
CREATE TABLE memberdiet( -- çoka çok iliþki üye,diyet
	 recordno int IDENTITY(1,1) not null 	
	,dietid int
	,memberid int
 CONSTRAINT PK_memberdiet PRIMARY KEY CLUSTERED 
(
	recordno
))
ALTER TABLE memberdiet WITH NOCHECK ADD CONSTRAINT fkmemberdiet_diet FOREIGN KEY(dietid) REFERENCES diet(recordno)
ALTER TABLE memberdiet CHECK CONSTRAINT fkmemberdiet_diet
ALTER TABLE memberdiet WITH NOCHECK ADD CONSTRAINT fkmemberdiet_member FOREIGN KEY(memberid) REFERENCES member(recordno)
ALTER TABLE memberdiet CHECK CONSTRAINT fkmemberdiet_member
GO
CREATE TABLE exercisegroup( -- egzersiz gruplarý
	 recordno int IDENTITY(1,1) not null 	
	,exgroupname varchar(50) not null
	,exdays varchar(250) -- egzersiz günleri
	,starttime varchar(5)
	,endtime varchar(5)
 CONSTRAINT PK_exercisegroup PRIMARY KEY CLUSTERED 
(
	recordno
))
GO
CREATE TABLE memberexercise( -- çoka çok iliþki üye,egzersiz
	 recordno int IDENTITY(1,1) not null 	
	,exerciseid int
	,memberid int
 CONSTRAINT PK_memberexercise PRIMARY KEY CLUSTERED 
(
	recordno
))
ALTER TABLE memberexercise WITH NOCHECK ADD CONSTRAINT fkmemberexercise_exercisegroup FOREIGN KEY(exerciseid) REFERENCES exercisegroup(recordno)
ALTER TABLE memberexercise CHECK CONSTRAINT fkmemberexercise_exercisegroup
ALTER TABLE memberexercise WITH NOCHECK ADD CONSTRAINT fkmemberexercise_member FOREIGN KEY(memberid) REFERENCES member(recordno)
ALTER TABLE memberexercise CHECK CONSTRAINT fkmemberexercise_member
GO
CREATE TABLE membermeasure( -- üye boy,kilo ölçümleri
	 recordno int IDENTITY(1,1) not null 	
	,memberid int
	,measuredate smalldatetime not null -- ölçüm tarihi 		
	,membersize decimal(28,8) -- boy
	,memberweight decimal(28,8)-- kilo
	,memberchest decimal(28,8)-- göðüs
	,memberwaist decimal(28,8)-- bel
	,memberleg decimal(28,8)-- bacak
 CONSTRAINT PK_membermeasure PRIMARY KEY CLUSTERED 
(
	recordno
))
ALTER TABLE membermeasure WITH NOCHECK ADD CONSTRAINT fkmembermeasure_member FOREIGN KEY(memberid) REFERENCES member(recordno)
ALTER TABLE membermeasure CHECK CONSTRAINT fkmembermeasure_member
GO
CREATE TABLE memberpayment( -- üye ödeme bilgileri
	 recordno int IDENTITY(1,1) not null 	
	,memberid int
	,recorddate smalldatetime default getdate()	
	,documentnumber varchar(50)
	,paymenttype smallint not null -- 1 nakit 2 pos
	,processtype smallint not null -- -1 borç 1 tahsilat 
	,amount decimal(28,8)
	,paymentdestricption varchar(500)
 CONSTRAINT PK_memberpayment PRIMARY KEY CLUSTERED 
(
	recordno
))
ALTER TABLE memberpayment WITH NOCHECK ADD CONSTRAINT fkmemberpayment_member FOREIGN KEY(memberid) REFERENCES member(recordno)
ALTER TABLE memberpayment CHECK CONSTRAINT fkmemberpayment_member
GO
CREATE TABLE memberstaff( -- çoka çok iliþki üye,antrenör
	 recordno int IDENTITY(1,1) not null 	
	,staffid int
	,memberid int
 CONSTRAINT PK_memberstaff PRIMARY KEY CLUSTERED 
(
	recordno
))
ALTER TABLE memberstaff WITH NOCHECK ADD CONSTRAINT fkmemberstaff_staff FOREIGN KEY(staffid) REFERENCES staff(recordno)
ALTER TABLE memberstaff CHECK CONSTRAINT fkmemberstaff_staff
ALTER TABLE memberstaff WITH NOCHECK ADD CONSTRAINT fkmemberstaff_member FOREIGN KEY(memberid) REFERENCES member(recordno)
ALTER TABLE memberstaff CHECK CONSTRAINT fkmemberstaff_member
GO