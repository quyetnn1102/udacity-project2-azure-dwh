IF OBJECT_ID('dbo.dim_rider') IS NOT NULL
BEGIN
    DROP TABLE dbo.dim_rider
END
-- Create dim_rider table
CREATE TABLE dbo.dim_rider (
	[rider_id] [bigint]  NULL,
	[firstName] [nvarchar](4000)  NULL,
	[lastName] [nvarchar](4000)  NULL,
	[_address] [nvarchar](4000)  NULL,
	[birthday] [varchar](50)  NULL,
	[account_start_date] [varchar](50)  NULL,
	[account_end_date] [varchar](50)  NULL,
	[is_member] [bit]  NULL
);

-- Load data into dim_rider
INSERT INTO dbo.dim_rider (
    [rider_id]
    ,[firstName]
    ,[lastName]
    ,[_address]
    ,[birthday]
    ,[account_start_date]
    ,[account_end_date]
    ,[is_member])
SELECT 
    [rider_id]
    ,[firstName]
    ,[lastName]
    ,[_address]
    ,[birthday]
    ,[account_start_date]
    ,[account_end_date]
    ,[is_member]
FROM staging_riders;

-- Verify the output
SELECT TOP 10 * FROM dbo.dim_rider;