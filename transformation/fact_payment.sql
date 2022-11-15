--Create dim_payment table
IF OBJECT_ID('dbo.fact_payment') IS NOT NULL
BEGIN
    DROP TABLE dbo.fact_payment;
END

CREATE TABLE dbo.fact_payment WITH
( 
	DISTRIBUTION = REPLICATE, 
	CLUSTERED COLUMNSTORE INDEX
)
AS
SELECT
    sp.[payment_id],    
    sp.[rider_id],
	sp.[amount],
    sp.[date]
FROM 
	[dbo].[staging_payment] sp;

SELECT TOP 10 * FROM [dbo].[fact_payment];