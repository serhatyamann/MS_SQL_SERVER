CREATE PROCEDURE Sp_OrdersBetweenDates @beginDate date, @@endDate date
AS
BEGIN
	SELECT * FROM tbOrders
	WHERE OrderDate BETWEEN @beginDate and @@endDate
END

GO

--TEST

EXECUTE Sp_OrdersBetweenDates '2016/01/01','2016/01/09'
