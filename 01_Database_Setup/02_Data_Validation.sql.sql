
-- STEP 5: CHECK TOTAL NUMBER OF ROWS

SELECT COUNT(*) AS Total_Rows
FROM [BrightLearnDW].[dbo].[BrightLearn_Raw_Data];



-- STEP 6: CHECK FOR NULL VALUES


SELECT
    COUNT(*) AS Total_Rows,
    COUNT(customer_email) AS Email_Not_Null,
    COUNT(customer_phone) AS Phone_Not_Null,
    COUNT(customer_first_name) AS FirstName_Not_Null,
    COUNT(product_name) AS Product_Not_Null
FROM [BrightLearnDW].[dbo].[BrightLearn_Raw_Data];



-- STEP 7: CHECK FOR DUPLICATE RECORDS


SELECT
    transaction_date,
    customer_first_name,
    customer_last_name,
    product_name,
    COUNT(*) AS Duplicate_Count
FROM [BrightLearnDW].[dbo].[BrightLearn_Raw_Data]
GROUP BY
    transaction_date,
    customer_first_name,
    customer_last_name,
    product_name
HAVING COUNT(*) > 1;





