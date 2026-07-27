
-- BQ06_Average_Transaction_By_Loyalty_Tier.sql
-- Calculate average transaction value by loyalty tier



-- BQ-06: AVERAGE TRANSACTION BY LOYALTY TIER


SELECT

    C.Customer_Loyalty_Tier,

    AVG(F.Transaction_Amount) AS Average_Transaction_Value,

    COUNT(*) AS Number_Of_Transactions,

    SUM(F.Transaction_Amount) AS Total_Revenue

FROM dbo.Fact_Sales AS F

INNER JOIN dbo.Dim_Customer AS C
    ON F.Customer_Key = C.Customer_Key

GROUP BY

    C.Customer_Loyalty_Tier

ORDER BY

    Average_Transaction_Value DESC;
GO