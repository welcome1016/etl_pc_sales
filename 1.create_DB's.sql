-- Create Staging Database
IF NOT EXISTS (
    SELECT *
    FROM sys.databases
    WHERE name = 'stg_pc_sales'
)
BEGIN
    CREATE DATABASE stg_pc_sales;
END
GO

-- Create Data Warehouse Database
IF NOT EXISTS (
    SELECT *
    FROM sys.databases
    WHERE name = 'dwh_pc_sales'
)
BEGIN
    CREATE DATABASE dwh_pc_sales;
END
GO