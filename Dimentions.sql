--------------
-- DimCustomer
--------------

IF NOT EXISTS (SELECT * FROM sys.tables t join sys.schemas s on t.schema_id = s.schema_id
         where t.name = 'DimCustomer' and s.name = 'gold')
CREATE EXTERNAL TABLE gold.DimCustomer
WITH
 (
    LOCATION = 'DimCustomer',
    DATA_SOURCE = gold_source,
    FILE_FORMAT = parquet
 )
 
AS
SELECT 
    *,
    ROW_NUMBER() OVER (ORDER BY T.CustomerID) AS DimCustomerKey
FROM
(
    SELECT DISTINCT
        CustomerID,
        CustomerName,
        CustomerEmail,
        Domain
    FROM silver.SilverTable
) T;


--------------
-- DimProduct
--------------
IF NOT EXISTS (
    SELECT * 
    FROM sys.tables t 
    JOIN sys.schemas s 
        ON t.schema_id = s.schema_id
    WHERE t.name = 'DimProduct' 
      AND s.name = 'gold'
)

CREATE EXTERNAL TABLE gold.DimProduct
WITH
(
    LOCATION = 'DimProduct',
    DATA_SOURCE = gold_source,
    FILE_FORMAT = parquet
)

AS
SELECT 
    *,
    ROW_NUMBER() OVER (ORDER BY T.ProductID) AS DimProductKey
FROM
(
    SELECT DISTINCT
        ProductID,
        ProductName,
        ProductCategory
    FROM silver.SilverTable
) T;


 --------------
-- DimGeography
--------------

IF NOT EXISTS (
    SELECT * 
    FROM sys.tables t 
    JOIN sys.schemas s 
        ON t.schema_id = s.schema_id
    WHERE t.name = 'DimGeography' 
      AND s.name = 'gold'
)

CREATE EXTERNAL TABLE gold.DimGeography
WITH
(
    LOCATION = 'DimGeography',
    DATA_SOURCE = gold_source,
    FILE_FORMAT = parquet
)

AS
SELECT 
    *,
    ROW_NUMBER() OVER (ORDER BY T.RegionID) AS DimGeographyKey
FROM
(
    SELECT DISTINCT
        RegionID,
        Country
    FROM silver.SilverTable
) T;


--------------
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
 
 