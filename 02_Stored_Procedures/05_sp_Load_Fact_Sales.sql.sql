-- Load Fact Sales Table



-- STEP 1: DROP THE STORED PROCEDURE (IF IT EXISTS)


DROP PROCEDURE IF EXISTS dbo.sp_Load_Fact_Sales;
GO


-- STEP 2: CREATE THE STORED PROCEDURE


CREATE PROCEDURE dbo.sp_Load_Fact_Sales
AS
BEGIN

    SET NOCOUNT ON;

    INSERT INTO dbo.Fact_Sales
    (
        Customer_Key,
        Product_Key,
        Store_Key,
        Date_Key,
        Payment_Method,
        Cashier_Name,
        Quantity,
        Unit_Price,
        Cost_Price,
        Transaction_Amount,
        Transaction_Discount,
        Line_Amount,
        Stock_On_Hand,
        Reorder_Threshold
    )

    SELECT

        C.Customer_Key,
        P.Product_Key,
        S.Store_Key,
        D.Date_Key,

        R.payment_method,
        R.cashier_name,
        R.qty,
        R.unit_price,
        R.cost_price,
        R.transaction_amount,
        R.transaction_discount,
        R.line_amount,
        R.stock_on_hand,
        R.reorder_threshold

    FROM dbo.BrightLearn_Raw_Data AS R

    \
    -- CUSTOMER DIMENSION
    

    INNER JOIN dbo.Dim_Customer AS C
        ON C.Customer_First_Name = R.customer_first_name
       AND C.Customer_Last_Name = R.customer_last_name
       AND ISNULL(C.Customer_Email,'') = ISNULL(R.customer_email,'')
       AND ISNULL(C.Customer_Phone,'') = ISNULL(R.customer_phone,'')

    
    -- PRODUCT DIMENSION
    

    INNER JOIN dbo.Dim_Product AS P
        ON P.Product_Name = R.product_name
       AND P.Category = R.category
       AND P.Sub_Category = R.sub_category
       AND P.SKU = R.sku

    
    -- STORE DIMENSION


    INNER JOIN dbo.Dim_Store AS S
        ON S.Store_Name = R.store_name
       AND S.Store_City = R.store_city
       AND S.Store_Province = R.store_province
       AND S.Store_Region = R.store_region
       AND S.Store_Manager = R.store_manager

   
    -- DATE DIMENSION
   

    INNER JOIN dbo.Dim_Date AS D
        ON D.Transaction_Date =
           CASE
                WHEN TRY_CONVERT(DATE,R.transaction_date,23) IS NOT NULL
                    THEN TRY_CONVERT(DATE,R.transaction_date,23)

                WHEN TRY_CONVERT(DATE,R.transaction_date,103) IS NOT NULL
                    THEN TRY_CONVERT(DATE,R.transaction_date,103)

                WHEN TRY_CONVERT(DATE,R.transaction_date,105) IS NOT NULL
                    THEN TRY_CONVERT(DATE,R.transaction_date,105)

                ELSE NULL
           END


    -- PREVENT DUPLICATE FACT RECORDS
    

    WHERE NOT EXISTS
    (
        SELECT 1
        FROM dbo.Fact_Sales F

        WHERE
            F.Customer_Key = C.Customer_Key
        AND F.Product_Key = P.Product_Key
        AND F.Store_Key = S.Store_Key
        AND F.Date_Key = D.Date_Key
        AND F.Transaction_Amount = R.transaction_amount
    );

END;
GO


-- STEP 3: EXECUTE THE STORED PROCEDURE


EXEC dbo.sp_Load_Fact_Sales;
GO


-- STEP 4: VERIFY THE RESULTS


SELECT COUNT(*) AS Total_Fact_Rows
FROM dbo.Fact_Sales;

SELECT TOP (100) *
FROM dbo.Fact_Sales
ORDER BY Sales_Key;
GO