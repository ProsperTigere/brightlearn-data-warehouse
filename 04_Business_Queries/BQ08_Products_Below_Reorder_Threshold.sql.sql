-- BQ08_Products_Below_Reorder_Threshold.sql
-- Identify products that need to be reordered



-- Business Question (BQ-08)

-- Which products currently have stock levels
-- at or below the reorder threshold?

-- BQ-08: PRODUCTS BELOW REORDER THRESHOLD


SELECT

    P.Product_Name,

    P.Category,

    F.Stock_On_Hand,

    F.Reorder_Threshold,

    SUM(F.Quantity) AS Total_Quantity_Sold

FROM dbo.Fact_Sales AS F

INNER JOIN dbo.Dim_Product AS P
    ON F.Product_Key = P.Product_Key

WHERE

    F.Stock_On_Hand <= F.Reorder_Threshold

GROUP BY

    P.Product_Name,
    P.Category,
    F.Stock_On_Hand,
    F.Reorder_Threshold

ORDER BY

    F.Stock_On_Hand ASC;
GO