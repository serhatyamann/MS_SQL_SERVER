IF OBJECT_ID('Sp_GetTotalSpentOfACustomerByID','P') IS NOT NULL
    DROP PROCEDURE Sp_GetTotalSpentOfACustomerByID
GO

CREATE PROCEDURE Sp_GetTotalSpentOfACustomerByID @ID INT
AS
BEGIN
	SELECT c.first_name +SPACE(1)+ c.last_name as [Full Name],
	       oi.order_id,
	       SUM(quantity * list_price * (1-discount)) as [Total Spent]
	FROM customers c
	JOIN orders o on c.customer_id = o.customer_id
	JOIN order_items oi on o.order_id = oi.order_id
	WHERE c.customer_id = @ID
	GROUP BY oi.order_id, c.first_name +SPACE(1)+ c.last_name
	ORDER BY oi.order_id ASC
END
GO

--TEST

EXEC Sp_GetTotalSpentOfACustomerByID @ID=2
