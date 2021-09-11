IF OBJECT_ID('Fn_GetStaffInfoByID','IF') IS NOT NULL
    DROP FUNCTION Fn_GetStaffInfoByID
GO

CREATE FUNCTION Fn_GetStaffInfoByID (@staff_id INT)
RETURNS TABLE 
RETURN 
(
	SELECT* FROM staffs
	WHERE staff_id = @staff_id
)  
GO

--TEST

SELECT * FROM Fn_GetStaffInfoByID(5)
