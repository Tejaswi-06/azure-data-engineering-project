IF NOT EXISTS (SELECT * FROM sys.tables t JOIN sys.schemas s ON t.schema_id = s.schema_id 
WHERE t.name = 'SilverTable' and s.name='silver')
CREATE EXTERNAL TABLE silver.SilverTable
(
    OrderID VARCHAR(100),
    OrderDate VARCHAR(100),
    CustomerID VARCHAR(100),
    CustomerName VARCHAR(100),
    CustomerEmail VARCHAR(100),
    ProductID VARCHAR(100),
    ProductName VARCHAR(100),
    ProductCategory VARCHAR(100),
    RegionID VARCHAR(100),
    RegionName VARCHAR(100),
    Country VARCHAR(100),
    Quantity VARCHAR(100),
    UnitPrice VARCHAR(100),
    TotalAmount VARCHAR(100),
    Domain VARCHAR(100)
)
WITH(
    LOCATION = 'enrichedSales',
    DATA_SOURCE = silver_source,
    FILE_FORMAT = Parquet
)

 
 SELECT * FROM silver.SilverTable
 