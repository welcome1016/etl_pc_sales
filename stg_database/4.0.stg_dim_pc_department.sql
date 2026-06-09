USE stg_pc_sales;
GO
 IF NOT EXISTS (
                select 1
                from INFORMATION_SCHEMA.Tables
                where TABLE_SCHEMA = 'dbo' and TABLE_NAME = 'dim_pc_department'
                )
                BEGIN
        create table [stg_pc_sales].dbo.[dim_pc_department](
       pc_department_id int identity(1,1) primary key
      ,[PC_Make] [nvarchar](255) null
      ,[PC_Model] [nvarchar](255) null
      ,[Storage_Type] [nvarchar](255) null
      ,[RAM] [nvarchar](255) null
      ,[Storage_Capacity] [NVARCHAR](255) null  
     
  );
  insert into [stg_pc_sales].dbo.[dim_pc_department] (PC_Make,PC_Model,Storage_Type,RAM,Storage_Capacity)
    select distinct 
    PC_Make,
    PC_Model,
    Storage_Type,
    RAM,
    Storage_Capacity
    from [stg_pc_sales].dbo.[Raw_Pc_Data]
 
    select * from [stg_pc_sales].dbo.[dim_pc_department]


  print 'table created succesfully'
  end 
  else 
  begin
  print 'table  already exists'
  end
          