IF OBJECT_ID('Sp_GetTotalSpentOfACustomerByID','P') IS NOT NULL
    DROP PROCEDURE Sp_GetTotalSpentOfACustomerByID
GO

CREATE PROCEDURE Sp_GetTotalSpentOfACustomerByID @ID INT
AS
BEGIN
	SELECT c.First_Name +SPACE(1)+ c.Last_Name as [Full Name],
		   oi.OrderID,
		   SUM(quantity * list_price * (1-discount)) as [Total Spent]
	FROM tbCustomers c
	JOIN tbOrders o ON c.CustomerID = o.CustomerID
	JOIN tbOrderItems oi on o.OrderID = oi.OrderID
	WHERE c.customer_id = @ID
	GROUP BY oi.OrderID, c.First_Name +SPACE(1)+ c.Last_Name
	ORDER BY oi.OrderID ASC
END
