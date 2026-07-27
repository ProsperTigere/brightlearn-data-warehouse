-- Load Product Dimension



-- STEP 1: DROP THE STORED PROCEDURE (IF IT EXISTS)


DROP PROCEDURE IF EXISTS dbo.sp_Load_Dim_Product;
GO


-- STEP 2: CREATE THE STORED PROCEDURE


CREATE PROCEDURE dbo.sp_Load_Dim_Product
AS
BEGIN

    SET NOCOUNT ON;

    INSERT INTO dbo.Dim_Product
    (
        Product_Name,
        Category,
        Sub_Category,
        SKU,
        Unit_Price,
        Cost_Price,
        Supplier
    )

    SELECT DISTINCT

        R.product_name,
        R.category,
        R.sub_category,
        R.sku,
        R.unit_price,
        R.cost_price,
        R.supplier

    FROM dbo.BrightLearn_Raw_Data AS R

    WHERE
        R.product_name IS NOT NULL

        AND NOT EXISTS
        (
            SELECT 1
            FROM dbo.Dim_Product AS D

            WHERE
                D.Product_Name = R.product_name
                AND D.Category = R.category
                AND D.Sub_Category = R.sub_category
                AND D.SKU = R.sku
        );

END;
GO


-- STEP 3: EXECUTE THE STORED PROCEDURE


EXEC dbo.sp_Load_Dim_Product;
GO


-- STEP 4: VERIFY THE RESULTS


SELECT COUNT(*) AS Total_Products
FROM dbo.Dim_Product;

SELECT *
FROM dbo.Dim_Product
ORDER BY Product_Key;
GO