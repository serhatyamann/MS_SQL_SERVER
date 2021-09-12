IF OBJECT_ID('view_Daily_Sales','V') IS NOT NULL
    DROP VIEW view_Daily_Sales
GO

CREATE VIEW view_Daily_Sales
AS
SELECT order_date,
       product_name,
       quantity * oi.list_price * (1-discount) as [Total Sale]
FROM order_items oi
JOIN products p on p.product_id = oi.product_id
JOIN orders o on o.order_id = oi.order_id
GO

--TEST

SELECT * FROM view_Daily_Sales
