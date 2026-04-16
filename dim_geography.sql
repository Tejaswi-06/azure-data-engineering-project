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
