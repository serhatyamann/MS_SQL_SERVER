IF OBJECT_ID('view_Customer_Spends_On_Dates','V') IS NOT NULL
	DROP VIEW view_Customer_Spends_On_Dates
GO

CREATE VIEW view_Customer_Spends_On_Dates
AS
SELECT c.customer_id,
	   order_date,
	   first_name,
	   last_name,
	   SUM(quantity * list_price * (1-discount)) as [Total Sale]
FROM customers c
JOIN orders o on o.customer_id = c.customer_id
JOIN order_items oi on oi.order_id = o.order_id
GROUP BY order_date,
		 c.customer_id,
		 first_name,
		 last_name
GO

--TEST

SELECT * 
FROM view_Customer_Spends_On_Dates
ORDER BY customer_id, order_date ASC

GO

--TEST

SELECT * 
FROM view_Customer_Spends_On_Dates
ORDER BY customer_id ASC, [Total Sale] ASC
