IF OBJECT_ID('Sp_InsertStaff','P') IS NOT NULL
    DROP PROCEDURE Sp_InsertStaff
GO

CREATE PROCEDURE Sp_InsertStaff (
	@first_name NVARCHAR(50),
	@last_name NVARCHAR(50),
	@email NVARCHAR(250),
	@phone NVARCHAR(20),
	@active TINYINT,
	@store_id INT,
	@manager_id INT
)
AS
BEGIN
	INSERT INTO staffs (first_name,last_name,email,phone,active,store_id,manager_id)
	VALUES (@first_name,@last_name,@email,@phone,@active,@store_id,@manager_id)
END

GO

--TEST

EXECUTE Sp_InsertStaff 'Serhat','Yaman','test@gmail.com','(500) 222-3344',1,1,2
