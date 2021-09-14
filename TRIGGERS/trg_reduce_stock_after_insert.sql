IF OBJECT_ID('trg_ReduceStock','TR') IS NOT NULL
	DROP TRIGGER trg_ReduceStock
GO

CREATE TRIGGER trg_ReduceStock
ON order_items
AFTER INSERT
AS
	DECLARE @productID INT
	DECLARE @quantity INT
	SELECT @productID=product_id, 
		     @quantity=quantity 
	FROM INSERTED
	UPDATE stocks 
	SET quantity = quantity - @quantity 
	WHERE product_id = @productID
