-------------
-- DimOrders
--------------

IF NOT EXISTS (
    SELECT * 
    FROM sys.tables t 
    JOIN sys.schemas s 
        ON t.schema_id = s.schema_id
    WHERE t.name = 'DimOrders' 
      AND s.name = 'gold'
)

CREATE EXTERNAL TABLE gold.DimOrders
WITH
(
    LOCATION = 'DimOrders',
    DATA_SOURCE = gold_source,
    FILE_FORMAT = parquet
)

AS
SELECT 
    *,
    ROW_NUMBER() OVER (ORDER BY T.OrderID) AS DimOrdersKey
FROM
(
    SELECT DISTINCT
        OrderID,
        CustomerID,
        CustomerName,
        CustomerEmail,
        ProductID,
        ProductName,
        ProductCategory,
        RegionID,
        Country,
        Domain
    FROM silver.SilverTable
) T;

 SELECT * FROM silver.silverTable
 
 