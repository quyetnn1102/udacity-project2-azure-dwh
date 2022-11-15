--Create fact_trip table
IF OBJECT_ID('dbo.fact_trip') IS NOT NULL
BEGIN
    DROP TABLE dbo.fact_trip;
END

CREATE TABLE dbo.fact_trip 
WITH
( 
	DISTRIBUTION = HASH(trip_id), 
	CLUSTERED COLUMNSTORE INDEX
)
AS
SELECT 
    st.trip_id,
    st.rider_id,
    st.start_station_id, 
    st.end_station_id, 
    st.start_at AS start_time_id,    
    st.ended_at AS end_time_id,
    st.rideable_type,
    DATEDIFF(hour, st.start_at, st.ended_at) AS duration,
    DATEDIFF(year, sr.birthday, st.start_at) AS rider_age
FROM 
    staging_trip st
JOIN staging_rider sr ON sr.rider_id = st.rider_id;

SELECT TOP 10 * FROM dbo.fact_trip;