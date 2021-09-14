IF OBJECT_ID('trg_FiredStaffStatusUpdate','TR') IS NOT NULL
	DROP TRIGGER trg_FiredStaffStatusUpdate
GO

CREATE TRIGGER trg_FiredStaffStatusUpdate
ON staffs
INSTEAD OF DELETE
AS
	DECLARE @staffID INT
	SELECT  @staffID = staff_id FROM DELETED
	UPDATE staffs SET active = 0, manager_id = NULL
	WHERE  staff_id = @staffID
