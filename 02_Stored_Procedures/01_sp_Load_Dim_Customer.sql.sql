-- Load Customer Dimension

-- STEP 1: DROP THE STORED PROCEDURE (IF IT EXISTS)


DROP PROCEDURE IF EXISTS dbo.sp_Load_Dim_Customer;
GO


-- STEP 2: CREATE THE STORED PROCEDURE


CREATE PROCEDURE dbo.sp_Load_Dim_Customer
AS
BEGIN

    SET NOCOUNT ON;

    INSERT INTO dbo.Dim_Customer
    (
        Customer_First_Name,
        Customer_Last_Name,
        Customer_Email,
        Customer_Phone,
        Customer_City,
        Customer_Province,
        Customer_Loyalty_Tier,
        Customer_Since
    )

    SELECT DISTINCT

        R.customer_first_name,
        R.customer_last_name,
        R.customer_email,
        R.customer_phone,
        R.customer_city,
        R.customer_province,
        R.customer_loyalty_tier,
        R.customer_since

    FROM dbo.BrightLearn_Raw_Data AS R

    WHERE
        R.customer_first_name IS NOT NULL
        AND R.customer_last_name IS NOT NULL

        AND NOT EXISTS
        (
            SELECT 1
            FROM dbo.Dim_Customer AS D

            WHERE
                D.Customer_First_Name = R.customer_first_name
                AND D.Customer_Last_Name = R.customer_last_name
                AND ISNULL(D.Customer_Email,'') = ISNULL(R.customer_email,'')
                AND ISNULL(D.Customer_Phone,'') = ISNULL(R.customer_phone,'')
        );

END;
GO


-- STEP 3: EXECUTE THE STORED PROCEDURE


EXEC dbo.sp_Load_Dim_Customer;
GO


-- STEP 4: VERIFY THE RESULTS


SELECT COUNT(*) AS Total_Customers
FROM dbo.Dim_Customer;

SELECT *
FROM dbo.Dim_Customer
ORDER BY Customer_Key;
GO