IF OBJECT_ID('Sp_InsertOrder','P') IS NOT NULL
    DROP PROCEDURE Sp_InsertOrder
GO

CREATE PROCEDURE Sp_InsertOrder (
	@customer_id INT,
	@order_status TINYINT,
	@order_date DATE,
	@required_date DATE,
	@shipped_date DATE,
	@store_id INT,
	@staff_id INT,
	@product_id INT,
	@quantity INT,
	@list_price DECIMAL(10,2),
	@discount DECIMAL(4,2)

)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
	INSERT INTO orders 
				(customer_id,
				 order_status,
				 order_date,
			     	 required_date,
				 shipped_date,
				 store_id,
				 staff_id)
	VALUES
				(@customer_id,
				 @order_status,
			    	 @order_date,
			    	 @required_date,
			   	 @shipped_date,
				 @store_id,
				 @staff_id)
				 
	DECLARE @orderID INT
	SELECT @orderID = @@IDENTITY

	INSERT INTO order_details 
				(order_id,
				 product_id,
				 quantity,
				 list_price,
				 discount)
	VALUES
				(@orderID,
				 @product_id,
				 @quantity,
				 @list_price,
				 @discount)

	UPDATE stocks
	SET
				 quantity = quantity - @quantity
	WHERE
				 store_id = @store_id AND
				 product_id = @product_id
				 
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH 
		PRINT 'ERROR WHILE PROCESSING ORDER'
	--  	If needed, you can print the error message with the code below
	--	DECLARE @errMsg NVARCHAR(500)
	--	set @errMsg = (SELECT ERROR_MESSAGE())
	--	print @errMsg;
		ROLLBACK TRANSACTION
	END CATCH	
END
GO

--TEST

EXEC Sp_InsertOrder 1212,4,'2016/01/01','2016/01/06','2016/01/09',1,7,247,7,300,0.05;
