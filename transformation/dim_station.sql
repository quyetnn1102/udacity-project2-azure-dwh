--Create dim_station table
IF OBJECT_ID('dbo.dim_station') IS NOT NULL
BEGIN
    DROP TABLE dbo.dim_station;
END

CREATE TABLE dbo.dim_station (
	[station_id] [nvarchar](4000)  NULL,
	[name] [nvarchar](4000)  NULL,
	[latitude] [float]  NULL,
	[longitude] [float]  NULL
);

INSERT INTO dbo.dim_station 
(
	[station_id],
	[name],
	[latitude],
	[longitude]
)
SELECT 
	[station_id],
	[name],
	[latitude],
	[longitude]
FROM 
	staging_stations;

SELECT TOP 10 * FROM dbo.dim_station;