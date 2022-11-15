IF OBJECT_ID('dbo.dim_rider') IS NOT NULL
BEGIN
    DROP TABLE dbo.dim_rider
END
-- Create dim_rider table
CREATE TABLE dbo.dim_rider 
WITH
( 
	DISTRIBUTION = REPLICATE, 
	CLUSTERED COLUMNSTORE INDEX
)
AS
SELECT 
    [rider_id]
    ,[firstName]
    ,[lastName]
    ,[_address]
    ,[birthday]
    ,[account_start_date]
    ,[account_end_date]
    ,[is_member]
FROM staging_rider;

-- Verify the output
SELECT TOP 10 * FROM dbo.dim_rider;