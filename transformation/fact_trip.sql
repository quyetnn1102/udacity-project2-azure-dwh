--Create fact_trip table
IF OBJECT_ID('dbo.fact_trip') IS NOT NULL
BEGIN
    DROP TABLE dbo.fact_trip;
END

CREATE TABLE dbo.fact_trip (
    [trip_id] VARCHAR(50) NOT NULL,
    [rider_id] INTEGER,
    [start_station_id] VARCHAR(50), 
    [end_station_id] VARCHAR(50), 
    [start_time_id] VARCHAR(50), 
    [end_time_id] VARCHAR(50), 
    [rideable_type] VARCHAR(75),
    [duration] VARCHAR(75),
    [rider_age] VARCHAR(75)
);

-- Add constraint
ALTER TABLE dbo.fact_trip ADD CONSTRAINT PK_fact_trip_trip_id PRIMARY KEY NONCLUSTERED (trip_id) NOT ENFORCED;


INSERT INTO dbo.fact_trip (
    [trip_id],
    [rider_id],
    [start_station_id], 
    [end_station_id], 
    [start_time_id], 
    [end_time_id], 
    [rideable_type],
    [duration],
    [rider_age])
SELECT 
    st.trip_id,
    sr.rider_id,
    st.start_station_id, 
    st.end_station_id, 
    dt1.time_id,    
    dt2.time_id,
    st.rideable_type,
    DATEDIFF(hour, st.start_at, st.ended_at),
    DATEDIFF(year, sr.birthday, st.start_at)
FROM 
    staging_trips st
JOIN staging_riders sr ON sr.rider_id = st.rider_id
JOIN dim_time AS dt1 ON dt1._date = st.start_at
JOIN dim_time AS dt2  ON DATEDIFF(dd, 0, dt2._date) = DATEDIFF(dd, 0, st.ended_at);

SELECT TOP 10 * FROM dbo.fact_trip;



