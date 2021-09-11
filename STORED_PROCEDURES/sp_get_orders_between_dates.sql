IF OBJECT_ID('Sp_OrdersBetweenDates','P') IS NOT NULL
    DROP PROCEDURE Sp_OrdersBetweenDates
GO

CREATE PROCEDURE Sp_OrdersBetweenDates @beginDate date, @endDate date
AS
BEGIN
	SELECT * FROM orders
	WHERE order_date BETWEEN @beginDate and @@endDate
END

GO

--TEST

EXECUTE Sp_OrdersBetweenDates '2016/01/01','2016/01/09'
