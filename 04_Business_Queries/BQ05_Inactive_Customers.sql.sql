
-- BQ05_Inactive_Customers.sql
-- Identify customers with no purchases



-- BQ-05: INACTIVE CUSTOMERS


SELECT

    C.Customer_First_Name,
    C.Customer_Last_Name,
    C.Customer_Email,
    C.Customer_Phone,
    C.Customer_Loyalty_Tier

FROM dbo.Dim_Customer AS C

LEFT JOIN dbo.Fact_Sales AS F
    ON C.Customer_Key = F.Customer_Key

WHERE F.Customer_Key IS NULL

ORDER BY

    C.Customer_Last_Name,
    C.Customer_First_Name;
GO