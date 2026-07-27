
-- BQ04_Top_10_Loyalty_Customers.sql
-- Answer Business Question 4


SELECT TOP (10)

    C.Customer_First_Name,
    C.Customer_Last_Name,
    C.Customer_Loyalty_Tier,

    SUM(F.Transaction_Amount) AS Total_Spent,

    SUM(F.Quantity) AS Total_Items_Purchased,

    COUNT(*) AS Number_Of_Transactions

FROM dbo.Fact_Sales AS F

INNER JOIN dbo.Dim_Customer AS C
    ON F.Customer_Key = C.Customer_Key

GROUP BY

    C.Customer_First_Name,
    C.Customer_Last_Name,
    C.Customer_Loyalty_Tier

ORDER BY

    Total_Spent DESC;
GO