
-- STEP 1: CREATE DIM_CUSTOMER


DROP TABLE IF EXISTS dbo.Dim_Customer;
GO

CREATE TABLE dbo.Dim_Customer
(
    Customer_Key INT IDENTITY(1,1) PRIMARY KEY,

    Customer_First_Name NVARCHAR(50),
    Customer_Last_Name NVARCHAR(50),
    Customer_Email NVARCHAR(100),
    Customer_Phone NVARCHAR(50),
    Customer_City NVARCHAR(50),
    Customer_Province NVARCHAR(50),
    Customer_Loyalty_Tier NVARCHAR(50),
    Customer_Since DATE
);
GO


-- STEP 2: CREATE DIM_PRODUCT

DROP TABLE IF EXISTS dbo.Dim_Product;
GO

CREATE TABLE dbo.Dim_Product
(
    Product_Key INT IDENTITY(1,1) PRIMARY KEY,

    Product_Name NVARCHAR(100),
    Category NVARCHAR(50),
    Sub_Category NVARCHAR(50),
    SKU NVARCHAR(50),
    Unit_Price DECIMAL(18,2),
    Cost_Price DECIMAL(18,2),
    Supplier NVARCHAR(100)
);
GO



-- STEP 3: CREATE DIM_STORE


DROP TABLE IF EXISTS dbo.Dim_Store;
GO

CREATE TABLE dbo.Dim_Store
(
    Store_Key INT IDENTITY(1,1) PRIMARY KEY,

    Store_Name NVARCHAR(100),
    Store_City NVARCHAR(50),
    Store_Province NVARCHAR(50),
    Store_Region NVARCHAR(50),
    Store_Manager NVARCHAR(100)
);
GO


-- STEP 4: CREATE DIM_DATE


DROP TABLE IF EXISTS dbo.Dim_Date;
GO

CREATE TABLE dbo.Dim_Date
(
    Date_Key INT IDENTITY(1,1) PRIMARY KEY,

    Transaction_Date DATE,
    Day_Number INT,
    Month_Number INT,
    Month_Name NVARCHAR(20),
    Quarter_Number INT,
    Year_Number INT
);
GO