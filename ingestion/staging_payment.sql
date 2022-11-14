-- Create synpase delimieter if not exist
IF NOT EXISTS (SELECT * FROM sys.external_file_formats WHERE name = 'SynapseDelimitedTextFormat') 
	CREATE EXTERNAL FILE FORMAT [SynapseDelimitedTextFormat] 
	WITH ( FORMAT_TYPE = DELIMITEDTEXT ,
	       FORMAT_OPTIONS (
			 FIELD_TERMINATOR = ',',
			 USE_TYPE_DEFAULT = FALSE
			));

-- Create synpase external data source 
IF NOT EXISTS (SELECT * FROM sys.external_data_sources WHERE name = 'data_project2_adls_dfs_core_windows_net') 
	CREATE EXTERNAL DATA SOURCE [data_project2_adls_dfs_core_windows_net] 
	WITH (
		LOCATION = 'abfss://data@project2_adls.dfs.core.windows.net', 
		TYPE = HADOOP 
	);

-- Create payment table
CREATE EXTERNAL TABLE staging_payment (
	[payment_id] bigint,
	[date] varchar(50),
	[amount] float,
	[rider_id] bigint
	)
	WITH (
	LOCATION = 'publicpayment.csv',
	DATA_SOURCE = [data_project2_adls_dfs_core_windows_net],
	FILE_FORMAT = [SynapseDelimitedTextFormat]
	);

-- Verify result
SELECT TOP 10 * FROM dbo.staging_payment;