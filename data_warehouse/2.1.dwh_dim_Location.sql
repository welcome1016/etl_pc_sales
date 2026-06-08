USE dwh_pc_sales;
GO

IF NOT EXISTS (
    SELECT 1
    FROM sys.tables
    WHERE name = 'dim_location'
      AND schema_id = SCHEMA_ID('dbo')
)
BEGIN
    CREATE TABLE dwh_pc_sales.dbo.dim_location
    (
        Location_ID INT IDENTITY(1,1) PRIMARY KEY,
        Continent VARCHAR(100) NULL,
        Country_or_State VARCHAR(100) NULL,
        Province_or_City VARCHAR(100) NULL,
          created_at DATETIME DEFAULT GETDATE()
    );
END;
GO

INSERT INTO dwh_pc_sales.dbo.dim_location
(
    Continent,
    Country_or_State,
    Province_or_City
)
SELECT DISTINCT
    Continent,
    Country_or_State,
    Province_or_City
FROM stg_pc_sales.dbo.dim_location;

