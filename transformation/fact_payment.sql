
--Create dim_payment table
IF OBJECT_ID('dbo.fact_payment') IS NOT NULL
BEGIN
    DROP TABLE dbo.fact_payment;
END


CREATE TABLE fact_payment (
	[payment_id] [bigint]  NULL,
	[amount] [float]  NULL,
	[rider_id] [bigint]  NULL,
	[time_id] [uniqueidentifier]  NULL
);

INSERT INTO fact_payment (
	[payment_id],
	[amount],
	[rider_id] ,
	[time_id])
SELECT
    [payment_id],
    [staging_payments].[amount],
    [staging_payments].[rider_id],
    [dim_time].[time_id]
FROM [dbo].[staging_payments]
JOIN dim_time ON dim_time._date = staging_payments._date;

SELECT TOP 10 * FROM [dbo].[fact_payment];