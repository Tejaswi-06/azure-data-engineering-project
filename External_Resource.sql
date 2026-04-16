
-- DATABASE SCOPED CREDENTIAL
--------------------------------
CREATE DATABASE SCOPED CREDENTIAL tej_creds
WITH IDENTITY = 'Managed Identity'

-------------------------------------
--EXTERNAL DATA SOURCE 
--------------------------------------

CREATE EXTERNAL DATA SOURCE silver_source
WITH
(
    LOCATION = 'https://azuredwhlaketej.dfs.core.windows.net/silver/',
    CREDENTIAL = tej_creds
)

CREATE EXTERNAL DATA SOURCE gold_source
WITH
(
    LOCATION = 'https://azuredwhlaketej.dfs.core.windows.net/gold/',
    CREDENTIAL = tej_creds
)

CREATE EXTERNAL FILE FORMAT parquet
WITH
(  
    FORMAT_TYPE = PARQUET,
    DATA_COMPRESSION = 'org.apache.hadoop.io.compress.SnappyCodec'
)

CREATE EXTERNAL FILE FORMAT delta
WITH
(  
    FORMAT_TYPE = DELTA,
)
