-- BQ03_Month_Over_Month_Revenue_Growth.sql
-- Answer Business Question 3

-- Business Question (BQ-03)





-- BQ-03: MONTH-OVER-MONTH REVENUE GROWTH


WITH MonthlyRevenue AS
(
    SELECT

        YEAR(D.Transaction_Date) AS Sales_Year,

        MONTH(D.Transaction_Date) AS Sales_Month,

        SUM(F.Transaction_Amount) AS Total_Revenue

    FROM BrightLearnDW.dbo.Fact_Sales AS F

    INNER JOIN BrightLearnDW.dbo.Dim_Date AS D
        ON F.Date_Key = D.Date_Key

    WHERE D.Transaction_Date
    BETWEEN '2024-01-01' AND '2024-06-30'

    GROUP BY

        YEAR(D.Transaction_Date),
        MONTH(D.Transaction_Date)
)

SELECT

    Sales_Year,

    Sales_Month,

    Total_Revenue,

    LAG(Total_Revenue) OVER
    (
        ORDER BY Sales_Year, Sales_Month
    ) AS Previous_Month_Revenue,

    Total_Revenue -
    LAG(Total_Revenue) OVER
    (
        ORDER BY Sales_Year, Sales_Month
    ) AS Revenue_Growth

FROM MonthlyRevenue

ORDER BY

    Sales_Year,
    Sales_Month;
GO