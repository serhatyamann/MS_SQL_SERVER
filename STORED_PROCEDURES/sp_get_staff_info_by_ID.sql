IF OBJECT_ID('Sp_GetStaffInfoByID','P') IS NOT NULL
    DROP PROCEDURE Sp_GetStaffInfoByID
GO

CREATE PROCEDURE Sp_GetStaffInfoByID @ID int
AS
BEGIN
	SELECT (First_Name+' '+Last_Name) AS [Full Name],
		    Phone,
		    Email 
	FROM tbStaffs
	WHERE ID = @ID
END

GO
