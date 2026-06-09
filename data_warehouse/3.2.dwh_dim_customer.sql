USE dwh_pc_sales
GO

IF NOT EXISTS (
    SELECT 1
    FROM sys.tables
    WHERE name = 'dim_customer'
      AND schema_id = SCHEMA_ID('dbo')
)
BEGIN
    CREATE TABLE dwh_pc_sales.dbo.dim_customer
    (
        Customer_Key INT IDENTITY(1,1) PRIMARY KEY,
        Customer_Name VARCHAR(100) NULL,
        Customer_Surname VARCHAR(100) NULL,
        Customer_Contact_Number NVARCHAR(50) NULL,
        Customer_Email_Address VARCHAR(100) NULL,
        created_at DATETIME DEFAULT GETDATE()
    );
END;
GO

INSERT INTO dwh_pc_sales.dbo.dim_customer
(
    Customer_Name,
    Customer_Surname,
    Customer_Contact_Number,
    Customer_Email_Address
)
SELECT DISTINCT
    Customer_Name,
    Customer_Surname,
    Customer_Contact_Number,
    Customer_Email_Address
FROM stg_pc_sales.dbo.dim_customer;


