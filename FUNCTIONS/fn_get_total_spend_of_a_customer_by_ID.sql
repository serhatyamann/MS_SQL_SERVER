--A simple function that calculates a customer's total spend.

IF OBJECT_ID('Fun_GetTotalSpentOfACustomerByID','FN') IS NOT NULL
    DROP FUNCTION Fun_GetTotalSpentOfACustomerByID
GO

CREATE FUNCTION Fun_GetTotalSpentOfACustomerByID (@ID INT)  
RETURNS FLOAT  
AS  
BEGIN 
	RETURN 
(
	SELECT SUM(quantity * list_price * (1-discount)) FROM order_items
	WHERE order_id = @ID
)  
END
GO

--TEST

print dbo.Fun_GetTotalSpentOfACustomerByID (5)
