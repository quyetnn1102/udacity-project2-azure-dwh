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

-- Create rider table
CREATE EXTERNAL TABLE staging_rider (
	[rider_id] bigint,
	[firstName] nvarchar(4000),
	[lastName] nvarchar(4000),
	[address] nvarchar(4000),
	[birthday] varchar(50),
	[account_start_date] varchar(50),
	[account_end_date] varchar(50),
	[is_Member] bit
	)
	WITH (
	LOCATION = 'publicrider.csv',
	DATA_SOURCE = [data_project2_adls_dfs_core_windows_net],
	FILE_FORMAT = [SynapseDelimitedTextFormat]
	);

-- Verify result
SELECT TOP 10 * FROM dbo.staging_rider;