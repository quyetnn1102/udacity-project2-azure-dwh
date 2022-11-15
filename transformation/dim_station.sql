--Create dim_station table
IF OBJECT_ID('dbo.dim_station') IS NOT NULL
BEGIN
    DROP TABLE dbo.dim_station;
END

CREATE TABLE dbo.dim_station 
WITH
( 
	DISTRIBUTION = REPLICATE, 
	CLUSTERED COLUMNSTORE INDEX
)
AS
SELECT 
	[station_id],
	[name],
	[latitude],
	[longitude]
FROM 
	staging_station;

SELECT TOP 10 * FROM dbo.dim_station;