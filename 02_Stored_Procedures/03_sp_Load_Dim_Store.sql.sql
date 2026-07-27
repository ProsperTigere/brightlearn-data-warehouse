-- Load Store Dimension




-- STEP 1: DROP THE STORED PROCEDURE (IF IT EXISTS)


DROP PROCEDURE IF EXISTS dbo.sp_Load_Dim_Store;
GO


-- STEP 2: CREATE THE STORED PROCEDURE


CREATE PROCEDURE dbo.sp_Load_Dim_Store
AS
BEGIN

    SET NOCOUNT ON;

    INSERT INTO dbo.Dim_Store
    (
        Store_Name,
        Store_City,
        Store_Province,
        Store_Region,
        Store_Manager
    )

    SELECT DISTINCT

        R.store_name,
        R.store_city,
        R.store_province,
        R.store_region,
        R.store_manager

    FROM dbo.BrightLearn_Raw_Data AS R

    WHERE
        R.store_name IS NOT NULL

        AND NOT EXISTS
        (
            SELECT 1
            FROM dbo.Dim_Store AS D

            WHERE
                D.Store_Name = R.store_name
                AND D.Store_City = R.store_city
                AND D.Store_Province = R.store_province
                AND D.Store_Region = R.store_region
                AND D.Store_Manager = R.store_manager
        );

END;
GO


-- STEP 3: EXECUTE THE STORED PROCEDURE


EXEC dbo.sp_Load_Dim_Store;
GO


-- STEP 4: VERIFY THE RESULTS


SELECT COUNT(*) AS Total_Stores
FROM dbo.Dim_Store;

SELECT *
FROM dbo.Dim_Store
ORDER BY Store_Key;
GO