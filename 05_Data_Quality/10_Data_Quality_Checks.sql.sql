-- Data Quality Validation

-- STEP 1: CHECK RAW DATA ROW COUNT


SELECT
    COUNT(*) AS Raw_Data_Rows
FROM dbo.BrightLearn_Raw_Data;
GO


-- STEP 2: CHECK FACT TABLE ROW COUNT


SELECT
    COUNT(*) AS Fact_Table_Rows
FROM dbo.Fact_Sales;
GO


-- STEP 3: ROWS NOT LOADED INTO FACT TABLE


SELECT
(
    SELECT COUNT(*)
    FROM dbo.BrightLearn_Raw_Data
)
-
(
    SELECT COUNT(*)
    FROM dbo.Fact_Sales
)
AS Rows_Not_Loaded;
GO


-- STEP 4: CHECK CUSTOMER DATA QUALITY


SELECT
    COUNT(*) AS Missing_Customer_Name
FROM dbo.BrightLearn_Raw_Data
WHERE customer_first_name IS NULL
   OR customer_last_name IS NULL;
GO


-- STEP 5: CHECK PRODUCT DATA QUALITY


SELECT
    COUNT(*) AS Missing_Product_Name
FROM dbo.BrightLearn_Raw_Data
WHERE product_name IS NULL;
GO


-- STEP 6: CHECK STORE DATA QUALITY


SELECT
    COUNT(*) AS Missing_Store_Name
FROM dbo.BrightLearn_Raw_Data
WHERE store_name IS NULL;
GO


-- STEP 7: CHECK INVALID DATES


SELECT
    COUNT(*) AS Invalid_Dates
FROM dbo.BrightLearn_Raw_Data
WHERE
    TRY_CONVERT(DATE, transaction_date, 23) IS NULL
AND TRY_CONVERT(DATE, transaction_date, 103) IS NULL
AND TRY_CONVERT(DATE, transaction_date, 105) IS NULL;
GO


-- STEP 8: CHECK NULL EMAILS


SELECT
    COUNT(*) AS Missing_Email
FROM dbo.BrightLearn_Raw_Data
WHERE customer_email IS NULL;
GO


-- STEP 9: CHECK NULL PHONE NUMBERS


SELECT
    COUNT(*) AS Missing_Phone
FROM dbo.BrightLearn_Raw_Data
WHERE customer_phone IS NULL;
GO