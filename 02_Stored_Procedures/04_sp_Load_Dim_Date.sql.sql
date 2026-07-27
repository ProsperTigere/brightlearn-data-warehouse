-- Load Date Dimension



-- STEP 1: DROP THE STORED PROCEDURE (IF IT EXISTS)


DROP PROCEDURE IF EXISTS dbo.sp_Load_Dim_Date;
GO


-- STEP 2: CREATE THE STORED PROCEDURE


CREATE PROCEDURE dbo.sp_Load_Dim_Date
AS
BEGIN

    SET NOCOUNT ON;

    INSERT INTO dbo.Dim_Date
    (
        Transaction_Date,
        Day_Number,
        Month_Number,
        Month_Name,
        Quarter_Number,
        Year_Number
    )

    SELECT DISTINCT

        R.ParsedDate,

        DAY(R.ParsedDate),

        MONTH(R.ParsedDate),

        DATENAME(MONTH, R.ParsedDate),

        DATEPART(QUARTER, R.ParsedDate),

        YEAR(R.ParsedDate)

    FROM
    (
        SELECT

            CASE

                WHEN TRY_CONVERT(DATE, transaction_date, 23) IS NOT NULL
                    THEN TRY_CONVERT(DATE, transaction_date, 23)

                WHEN TRY_CONVERT(DATE, transaction_date, 103) IS NOT NULL
                    THEN TRY_CONVERT(DATE, transaction_date, 103)

                WHEN TRY_CONVERT(DATE, transaction_date, 105) IS NOT NULL
                    THEN TRY_CONVERT(DATE, transaction_date, 105)

                ELSE NULL

            END AS ParsedDate

        FROM dbo.BrightLearn_Raw_Data

    ) AS R

    WHERE
        R.ParsedDate IS NOT NULL

        AND NOT EXISTS
        (
            SELECT 1
            FROM dbo.Dim_Date AS D
            WHERE D.Transaction_Date = R.ParsedDate
        );

END;
GO


-- STEP 3: EXECUTE THE STORED PROCEDURE


EXEC dbo.sp_Load_Dim_Date;
GO


-- STEP 4: VERIFY THE RESULTS


SELECT COUNT(*) AS Total_Dates
FROM dbo.Dim_Date;

SELECT *
FROM dbo.Dim_Date
ORDER BY Date_Key;
GO