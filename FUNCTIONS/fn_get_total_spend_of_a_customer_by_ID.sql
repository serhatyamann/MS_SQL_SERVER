--A simple SQL scalar function that calculates a customer's total spend.

IF OBJECT_ID('Fn_GetTotalSpendOfACustomerByID','FN') IS NOT NULL
    DROP FUNCTION Fn_GetTotalSpendOfACustomerByID
GO

CREATE FUNCTION Fn_GetTotalSpendOfACustomerByID (@ID INT)  
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

print dbo.Fn_GetTotalSpendOfACustomerByID (5)
