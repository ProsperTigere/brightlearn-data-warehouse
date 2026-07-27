-- SCRIPT  : BQ01_Top_5_Products_By_Revenue.sql
-- PURPOSE : Answer Business Question 1



--Business Question (BQ-01)

--What were the top 5 best-selling products
--by total revenue between January and June 2024?


-- BQ-01: TOP 5 PRODUCTS BY TOTAL REVENUE


SELECT TOP (5)

       P.Product_Name,

       SUM(F.Transaction_Amount) AS Total_Revenue,

       SUM(F.Quantity) AS Total_Quantity_Sold,

       COUNT(*) AS Number_Of_Sales

FROM BrightLearnDW.dbo.Fact_Sales AS F

INNER JOIN BrightLearnDW.dbo.Dim_Product AS P
ON F.Product_Key = P.Product_Key

INNER JOIN BrightLearnDW.dbo.Dim_Date AS D
ON F.Date_Key = D.Date_Key

WHERE D.Transaction_Date
BETWEEN '2024-01-01' AND '2024-06-30'

GROUP BY
       P.Product_Name

ORDER BY
       Total_Revenue DESC;
GO