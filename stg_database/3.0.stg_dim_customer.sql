USE stg_pc_sales;
GO

------create dim_customer table if it does not exist

IF NOT EXISTS (
    SELECT 1
    FROM sys.tables
    WHERE name = 'dim_customer'
)
BEGIN
    CREATE TABLE stg_pc_sales.dbo.dim_customer
    (
        Customer_Key INT IDENTITY(1,1) PRIMARY KEY,
        Customer_Name VARCHAR(100) NULL,
        Customer_Surname VARCHAR(100) NULL,
        Customer_Contact_Number NVARCHAR(50)NULL,
        Customer_Email_Address VARCHAR(100) NULL,
        created_at DATETIME DEFAULT GETDATE()
    );
END;
GO

-------------load  data into dim_customer table from Raw_Pc_Data table

INSERT INTO stg_pc_sales.dbo.dim_customer
(
    Customer_Name,
    Customer_Surname,
    Customer_Contact_Number,
    Customer_Email_Address
     
)
-------considering only distinct customers to avoid duplicates in the dimension table

SELECT DISTINCT
    Customer_Name,
    Customer_Surname,
    Customer_Contact_Number,
    Customer_Email_Address
FROM stg_pc_sales.dbo.Raw_Pc_Data;


