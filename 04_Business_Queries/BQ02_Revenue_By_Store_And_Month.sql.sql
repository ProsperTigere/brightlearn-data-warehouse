
-- BQ02_Revenue_By_Store_And_Month.sql
-- Answer Business Question 2



-- Business Question (BQ-02)

-- How much revenue did each store generate
--for each month between January and June 2024?


-- BQ-02: REVENUE BY STORE AND MONTH


SELECT

       S.Store_Name,

       YEAR(D.Transaction_Date) AS Sales_Year,

       MONTH(D.Transaction_Date) AS Sales_Month,

       SUM(F.Transaction_Amount) AS Total_Revenue,

       SUM(F.Quantity) AS Total_Quantity_Sold,

       COUNT(*) AS Number_Of_Sales

FROM BrightLearnDW.dbo.Fact_Sales AS F

INNER JOIN BrightLearnDW.dbo.Dim_Store AS S
ON F.Store_Key = S.Store_Key

INNER JOIN BrightLearnDW.dbo.Dim_Date AS D
ON F.Date_Key = D.Date_Key

WHERE D.Transaction_Date
BETWEEN '2024-01-01' AND '2024-06-30'

GROUP BY

       S.Store_Name,
       YEAR(D.Transaction_Date),
       MONTH(D.Transaction_Date)

ORDER BY

       Sales_Year,
       Sales_Month,
       Total_Revenue DESC;
GO