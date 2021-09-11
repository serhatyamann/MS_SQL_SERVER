IF OBJECT_ID('Sp_GetStaffInfoByID','P') IS NOT NULL
    DROP PROCEDURE Sp_GetStaffInfoByID
GO

CREATE PROCEDURE Sp_GetStaffInfoByID @ID INT
AS
BEGIN
	SELECT first_name+' '+last_name AS [Full Name],
	       phone,
	       email 
	FROM staffs
	WHERE staff_id = @ID
END

GO

--TEST

EXECUTE Sp_GetStaffInfoByID @ID=16
