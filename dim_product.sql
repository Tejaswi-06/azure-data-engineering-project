
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
