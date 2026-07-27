-- BQ07_Quantity_Sold_By_Category_And_Store.sql
-- Answer Business Question 7


-- BQ-07: QUANTITY SOLD BY CATEGORY AND STORE


SELECT

    P.Category,
    S.Store_Name,

    SUM(F.Quantity) AS Total_Quantity_Sold,

    SUM(F.Transaction_Amount) AS Total_Revenue,

    COUNT(*) AS Number_Of_Sales

FROM dbo.Fact_Sales AS F

INNER JOIN dbo.Dim_Product AS P
    ON F.Product_Key = P.Product_Key

INNER JOIN dbo.Dim_Store AS S
    ON F.Store_Key = S.Store_Key

GROUP BY

    P.Category,
    S.Store_Name

ORDER BY

    P.Category,
    Total_Quantity_Sold DESC;
GO