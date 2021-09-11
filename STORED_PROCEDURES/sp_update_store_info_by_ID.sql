IF OBJECT_ID('Sp_UpdateStoreInfoByStoreID','P') IS NOT NULL
    DROP PROCEDURE Sp_UpdateStoreInfoByStoreID
GO

CREATE PROCEDURE Sp_UpdateStoreInfoByStoreID (
	@store_id INT,
	@store_name NVARCHAR(255),
	@phone NVARCHAR(25),
	@email NVARCHAR(255),
	@street NVARCHAR(255),
	@city NVARCHAR(255),
	@cState NVARCHAR(10),
	@zip_code NVARCHAR(5)
)
AS
BEGIN
	UPDATE stores
	SET 
	store_name = @store_name,
	phone = @phone,
	email = @email,
	street = @street,
	city = @city,
	cState = @cState,
	zip_code = @zip_code
	WHERE store_id = @store_id
END
GO

--TEST

EXEC Sp_UpdateStoreInfoByStoreID 3,'test','4545455','TEST@gmail.com','test','test','test','test'
