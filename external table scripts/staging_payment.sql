IF NOT EXISTS (SELECT * FROM sys.external_file_formats WHERE name = 'SynapseDelimitedTextFormat') 
	CREATE EXTERNAL FILE FORMAT [SynapseDelimitedTextFormat] 
	WITH ( FORMAT_TYPE = DELIMITEDTEXT ,
	       FORMAT_OPTIONS (
			 FIELD_TERMINATOR = ',',
			 STRING_DELIMITER = '"',
			 USE_TYPE_DEFAULT = FALSE
			))
GO

IF NOT EXISTS (SELECT * FROM sys.external_data_sources WHERE name = 'data_udacitybikeshareadls_dfs_core_windows_net') 
	CREATE EXTERNAL DATA SOURCE [data_udacitybikeshareadls_dfs_core_windows_net] 
	WITH (
		LOCATION = 'abfss://data@udacitybikeshareadls.dfs.core.windows.net', 
		TYPE = HADOOP 
	)
GO

CREATE EXTERNAL TABLE staging_payment (
	[payment_id] bigint,
	[date] varchar(50),
	[amount] float,
	[rider_id] bigint
	)
	WITH (
	LOCATION = 'publicpayment.csv',
	DATA_SOURCE = [data_udacitybikeshareadls_dfs_core_windows_net],
	FILE_FORMAT = [SynapseDelimitedTextFormat]
	)
GO

SELECT TOP 100 * FROM dbo.staging_payment
GO